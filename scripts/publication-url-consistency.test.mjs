import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import test from "node:test";

const repository = fileURLToPath(new URL("../", import.meta.url));
const canonical =
  "https://www.medizininformatik-initiative.de/fhir/modul-base";
const publicationBase =
  "https://medizininformatik-initiative.github.io/kerndatensatz-basis";

function read(relativePath) {
  return readFileSync(new URL(relativePath, `file://${repository}/`), "utf8");
}

function readJson(relativePath) {
  return JSON.parse(read(relativePath));
}

test("keeps publication locations separate from the FHIR canonical", () => {
  const packageManifest = readJson("package.json");
  const publicationRequest = readJson("publication-request.json");
  const setup = readJson("publication/webroot/publish-setup.json");
  const packageList = readJson("publication/webroot/package-list.json");
  const packageRegistry = readJson(
    "publication/webroot/package-registry.json",
  );

  assert.equal(packageManifest.canonical, canonical);
  assert.match(read("sushi-config.yaml"), new RegExp(`^canonical: ${canonical}$`, "m"));

  assert.equal(setup["canonical-mismatch"], true);
  assert.equal(setup.website.url, publicationBase);
  assert.equal(setup.website.server, "cloud");
  assert.deepEqual(setup["layout-rules"], [
    {
      npm: "de.medizininformatikinitiative.kerndatensatz.base",
      canonical,
      destination: "/",
    },
  ]);

  assert.equal(
    publicationRequest.path,
    `${publicationBase}/${publicationRequest.version}`,
  );
  assert.ok(publicationRequest["ci-build"].startsWith(`${publicationBase}/`));

  assert.equal(packageList.canonical, canonical);
  for (const entry of packageList.list) {
    assert.ok(entry.path.startsWith(`${publicationBase}/`));
  }

  assert.equal(packageRegistry.packages[0].canonical, canonical);
  assert.ok(
    packageRegistry.packages[0]["ci-build"].startsWith(`${publicationBase}/`),
  );
  assert.ok(
    packageRegistry.packages[0].latest.path.startsWith(`${publicationBase}/`),
  );
  assert.ok(
    packageRegistry.packages[0].milestone.path.startsWith(
      `${publicationBase}/`,
    ),
  );
});

test("uses Pages URLs in feed and history website links", () => {
  const packageFeed = read("publication/webroot/package-feed.xml");
  const publicationFeed = read("publication/webroot/publication-feed.xml");
  const historicalHistory = read("publication/2026.0.0-history.html");

  assert.match(packageFeed, new RegExp(`<link>${publicationBase}</link>`));
  assert.match(
    packageFeed,
    new RegExp(`href="${publicationBase}/package-feed\\.xml"`),
  );
  assert.match(publicationFeed, new RegExp(`<link>${publicationBase}</link>`));
  assert.match(
    publicationFeed,
    new RegExp(`href="${publicationBase}/publication-feed\\.xml"`),
  );
  assert.match(
    historicalHistory,
    new RegExp(`href="${publicationBase}/history\\.html"`),
  );
});

test("does not require a canonical-to-Pages mapping in the workflow", () => {
  const workflow = read(".github/workflows/go-publish.yml");

  assert.match(workflow, new RegExp(`EXPECTED_CANONICAL: "${canonical}"`));
  assert.match(
    workflow,
    new RegExp(`EXPECTED_PUBLICATION_BASE: "${publicationBase}"`),
  );
  assert.doesNotMatch(workflow, /canonical_mapping_confirmed/);
  assert.doesNotMatch(workflow, /canonical mapping/i);
});

test("resolves current publication tools and support repositories at runtime", () => {
  const workflow = read(".github/workflows/go-publish.yml");
  const generatedResourcesWorkflow = read(
    ".github/workflows/publish-fsh-generated.yml",
  );

  assert.match(
    workflow,
    /fhir-ig-publisher\/releases\/latest\/download\/publisher\.jar/,
  );
  assert.match(workflow, /fsh-sushi@latest/);
  assert.match(workflow, /gem install jekyll --no-document/);
  assert.match(
    workflow,
    /repository: medizininformatik-initiative\/kerndatensatz-meta/,
  );
  assert.match(workflow, /publication-toolchain\.txt/);
  assert.match(generatedResourcesWorkflow, /fsh-sushi@latest/);

  assert.doesNotMatch(workflow, /PUBLISHER_VERSION|PUBLISHER_SHA256/);
  assert.doesNotMatch(workflow, /SUSHI_VERSION|JEKYLL_VERSION/);
  assert.doesNotMatch(
    workflow,
    /HISTORY_REF|WEB_TEMPLATES_REF|IG_REGISTRY_REF|NGINX_CONFIG_REF/,
  );
});

test("corrects and validates the generated FHIR IG Registry handoff", () => {
  const workflow = read(".github/workflows/go-publish.yml");

  assert.match(
    workflow,
    /node automation\/scripts\/fix-ig-registry-entry\.mjs/,
  );
  assert.match(workflow, /source\/publication-request\.json/);
  assert.match(workflow, /source\/package\.json/);
  assert.match(workflow, /"\$\{PUBLICATION_BASE\}\/history\.html"/);
  assert.match(workflow, /diff --check -- fhir-ig-list\.json/);
  assert.match(workflow, /test -s "\$\{RUNNER_TEMP\}\/ig-registry\.patch"/);
});

test("keeps history links on the Pages publication", () => {
  const workflow = read(".github/workflows/go-publish.yml");
  const previewWorkflow = read(".github/workflows/ig-publisher.yml");
  const goPublish = workflow.indexOf("- name: Run Publisher -go-publish");
  const historyFix = workflow.indexOf(
    "- name: Point publication history links to GitHub Pages",
  );

  assert.ok(goPublish >= 0);
  assert.ok(historyFix > goPublish);
  assert.match(
    workflow,
    /node automation\/scripts\/fix-publication-history-links\.mjs/,
  );
  assert.doesNotMatch(workflow, /fix-publication-history-links\.mjs \\\n\s+--headers-only/);
  assert.match(
    previewWorkflow,
    /fix-publication-history-links\.mjs \\\n\s+--headers-only \\\n\s+output/,
  );
  assert.match(workflow, /\.altloc == \$publication_path/);
  assert.match(
    workflow,
    /grep -Fq "\\"altloc\\":\\"\$\{PUBLICATION_PATH\}\\"" site\/history\.html/,
  );
  assert.match(
    workflow,
    /grep -Fq "\\"altloc\\":\\"\$\{publication_path\}\\"" <<< "\$\{history\}"/,
  );
});

test("restores localized table backgrounds after go-publish", () => {
  const workflow = read(".github/workflows/go-publish.yml");
  const goPublish = workflow.indexOf("- name: Run Publisher -go-publish");
  const stagedRestore = workflow.indexOf(
    "Restore and verify localized table backgrounds in the staged publication",
  );

  assert.ok(goPublish >= 0);
  assert.ok(stagedRestore > goPublish);

  const stagedRestoreBlock = workflow.slice(
    stagedRestore,
    workflow.indexOf("- name:", stagedRestore),
  );
  assert.match(
    stagedRestoreBlock,
    /for publication_directory in site "site\/\$\{LABEL\}"/,
  );
  assert.match(
    stagedRestoreBlock,
    /"\$\{publication_directory\}"\n\s+bash[\s\S]*"\$\{publication_directory\}" \\\n\s+--check/,
  );
});

test("does not pass publication URLs through cross-job outputs", () => {
  const workflow = read(".github/workflows/go-publish.yml");

  assert.doesNotMatch(
    workflow,
    /needs\.prepare\.outputs\.publication_(?:base|path)/,
  );
  assert.doesNotMatch(workflow, /^\s{6}publication_(?:base|path):/m);
  assert.match(workflow, /publication_base="\$\{EXPECTED_PUBLICATION_BASE%\/\}"/);
  assert.match(
    workflow,
    /publication_path="\$\{publication_base\}\/\$\{LABEL\}"/,
  );
});

test("reports public links from jobs that do not receive terminology secrets", () => {
  const goPublish = read(".github/workflows/go-publish.yml");
  const preview = read(".github/workflows/ig-publisher.yml");
  const redeploy = read(".github/workflows/deploy-gh-pages.yml");

  const prepareStart = goPublish.indexOf("\n  prepare:\n") + 1;
  const reportStart = goPublish.indexOf("\n  report:\n") + 1;
  const publishStart = goPublish.indexOf("\n  publish:\n") + 1;
  const productionDeployStart = goPublish.indexOf("\n  deploy:\n") + 1;
  const prepareJob = goPublish.slice(prepareStart, reportStart);
  const reportJob = goPublish.slice(reportStart, publishStart);
  const productionDeployJob = goPublish.slice(productionDeployStart);

  assert.ok(prepareStart > 0);
  assert.ok(reportStart > prepareStart);
  assert.ok(publishStart > reportStart);
  assert.ok(productionDeployStart > publishStart);
  assert.match(prepareJob, /CDS_DEV_CLIENT_CERT_PASSWORD/);
  assert.doesNotMatch(prepareJob, /### Publication input/);
  assert.doesNotMatch(prepareJob, /### FHIR IG Registry handoff/);
  assert.doesNotMatch(reportJob, /secrets\.|CDS_DEV_CLIENT_/);
  assert.match(reportJob, /### Publication input/);
  assert.match(reportJob, /\[\$\{publication_path\}\]\(\$\{publication_path\}\)/);
  assert.match(reportJob, /### FHIR IG Registry handoff/);
  assert.match(reportJob, /\[\$\{history_url\}\]\(\$\{history_url\}\)/);
  assert.doesNotMatch(productionDeployJob, /secrets\.CDS_|CDS_DEV_CLIENT_/);
  assert.match(productionDeployJob, /### Publication deployed/);

  const buildStart = preview.indexOf("\n  build:\n") + 1;
  const deployStart = preview.indexOf("\n  deploy:\n") + 1;
  const announceStart = preview.indexOf("\n  announce:\n") + 1;
  const buildJob = preview.slice(buildStart, deployStart);
  const announceJob = preview.slice(announceStart);

  assert.ok(buildStart > 0);
  assert.ok(deployStart > buildStart);
  assert.ok(announceStart > deployStart);
  assert.match(buildJob, /CDS_DEV_CLIENT_CERT_PASSWORD/);
  assert.doesNotMatch(buildJob, /### Deployment/);
  assert.doesNotMatch(announceJob, /secrets\.|CDS_DEV_CLIENT_/);
  assert.match(announceJob, /### Deployment/);
  assert.match(announceJob, /issues: write/);
  assert.match(announceJob, /pull-requests: write/);
  assert.match(announceJob, /id: preview_comment/);
  assert.match(announceJob, /continue-on-error: true/);
  assert.match(
    announceJob,
    /if: steps\.preview_comment\.outcome == 'failure'/,
  );
  assert.match(
    announceJob,
    /::warning::The preview was deployed successfully/,
  );
  assert.match(
    announceJob,
    /https:\/\/\$\{repo_owner\}\.github\.io\/\$\{repo_name\}\/branches\/\$\{branch\}\//,
  );

  const redeployPrepareStart = redeploy.indexOf("\n  prepare:\n") + 1;
  const redeployDeployStart = redeploy.indexOf("\n  deploy:\n") + 1;
  const redeployPrepareJob = redeploy.slice(
    redeployPrepareStart,
    redeployDeployStart,
  );
  const redeployDeployJob = redeploy.slice(redeployDeployStart);

  assert.ok(redeployPrepareStart > 0);
  assert.ok(redeployDeployStart > redeployPrepareStart);
  assert.doesNotMatch(redeployPrepareJob, /### Pages deployment completed/);
  assert.doesNotMatch(redeployDeployJob, /secrets\.|CDS_DEV_CLIENT_/);
  assert.match(redeployDeployJob, /### Pages deployment completed/);
});

test("documents the reproducible GitHub Pages repository settings", () => {
  const documentation = read("publication/README.md");

  assert.match(
    documentation,
    /Settings → Pages → Build and deployment → Source/,
  );
  assert.match(
    documentation,
    /select \*\*GitHub\s+Actions\*\*, not \*\*Deploy from a branch\*\*/,
  );
  assert.match(
    documentation,
    /Settings → Environments →\n\s+github-pages/,
  );
  assert.match(documentation, /Deployment branches and tags/);
  assert.match(documentation, /No\n\s+restriction/);
  assert.match(documentation, /PAGES_ACTIONS_ENABLED=true/);
  assert.match(documentation, /not the Pages publishing source/);
});
