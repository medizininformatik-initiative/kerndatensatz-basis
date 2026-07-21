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
