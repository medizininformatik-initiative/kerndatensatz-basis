import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import {
  existsSync,
  mkdtempSync,
  mkdirSync,
  readFileSync,
  writeFileSync,
} from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";
import { runInNewContext } from "node:vm";

import { fixPublicationHistoryLinks } from "./fix-publication-history-links.mjs";

const canonical =
  "https://www.medizininformatik-initiative.de/fhir/modul-base";
const publicationBase =
  "https://medizininformatik-initiative.github.io/kerndatensatz-basis";
const scriptFilename = fileURLToPath(
  new URL("./fix-publication-history-links.mjs", import.meta.url),
);

function write(path, content) {
  mkdirSync(join(path, ".."), { recursive: true });
  writeFileSync(path, content);
}

function releasePage(historyUrl, extra = "") {
  return `<!doctype html>
<!--ReleaseHeader--><p id="publish-box">See the <a href="${historyUrl}">Directory of published versions</a>.</p><!--EndReleaseHeader-->
${extra}
`;
}

function publicationData(currentPath = `${publicationBase}/2026.0.1`) {
  return {
    "package-id": "de.medizininformatikinitiative.kerndatensatz.base",
    canonical,
    title: "Test publication",
    list: [
      {
        version: "current",
        path: `${publicationBase}/branches/develop/`,
        status: "ci-build",
      },
      {
        version: "2026.0.1",
        path: currentPath,
        status: "release",
        date: "2026-07-20",
        current: true,
      },
    ],
  };
}

function writePublicationData(root, data = publicationData()) {
  write(join(root, "package-list.json"), `${JSON.stringify(data, null, 2)}\n`);
  write(
    join(root, "history.html"),
    `<script>\nvar pageJSON = '${JSON.stringify(data)}';\nload(pageJSON);\n</script>\n`,
  );
}

test("rewrites only canonical history links in publication headers", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-links-"));
  const rootPage = join(root, "index.html");
  const versionPage = join(root, "2026.0.1", "profile.html");
  const unrelated = `<a href="${canonical}/history.html">Canonical reference outside the publish box</a>`;
  const data = publicationData();
  data.title = "Owner's \\ guide </script> \u2028";
  writePublicationData(root, data);
  write(rootPage, releasePage(`${canonical}/history.html`, unrelated));
  write(versionPage, releasePage(`${canonical}/history.html`));

  assert.deepEqual(
    fixPublicationHistoryLinks(root, canonical, publicationBase),
    {
      files: 2,
      replacements: 2,
      currentReleasePath: `${publicationBase}/2026.0.1`,
    },
  );
  assert.match(
    readFileSync(rootPage, "utf8"),
    new RegExp(`${publicationBase}/history\\.html`),
  );
  assert.match(readFileSync(rootPage, "utf8"), new RegExp(unrelated));
  assert.match(
    readFileSync(versionPage, "utf8"),
    new RegExp(`${publicationBase}/history\\.html`),
  );

  const packageList = JSON.parse(
    readFileSync(join(root, "package-list.json"), "utf8"),
  );
  assert.equal(packageList.canonical, canonical);
  assert.equal(packageList.list[1].altloc, `${publicationBase}/2026.0.1`);
  const history = readFileSync(join(root, "history.html"), "utf8");
  assert.match(
    history,
    new RegExp(`"altloc":"${publicationBase}/2026\\.0\\.1"`),
  );
  assert.match(history, new RegExp(`"canonical":"${canonical}"`));
  const assignment = history.match(/^var pageJSON = [^\r\n]+;$/m);
  assert.ok(assignment);
  const embedded = JSON.parse(
    runInNewContext(`${assignment[0]}\npageJSON;`, Object.create(null)),
  );
  assert.equal(embedded.title, data.title);
  assert.equal(
    embedded.list.find((entry) => entry.current === true).altloc,
    `${publicationBase}/2026.0.1`,
  );
  assert.match(assignment[0], /Owner\\'s/);
  assert.match(assignment[0], /\\\\\\\\ guide/);
  assert.match(assignment[0], /\\u003c\/script>/);
  assert.match(assignment[0], /\\u2028/);

  assert.deepEqual(
    fixPublicationHistoryLinks(root, canonical, publicationBase),
    {
      files: 0,
      replacements: 0,
      currentReleasePath: `${publicationBase}/2026.0.1`,
    },
  );
  assert.equal(readFileSync(join(root, "history.html"), "utf8"), history);
});

test("preserves marker-backed preview deployments", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-preview-"));
  const preview = join(root, "branches", "develop");
  const page = join(preview, "index.html");
  const source = releasePage(`${canonical}/history.html`);
  writePublicationData(root);
  write(join(preview, ".branch-name"), "develop\n");
  write(page, source);

  assert.deepEqual(
    fixPublicationHistoryLinks(root, canonical, publicationBase),
    {
      files: 0,
      replacements: 0,
      currentReleasePath: `${publicationBase}/2026.0.1`,
    },
  );
  assert.equal(readFileSync(page, "utf8"), source);
});

test("rewrites standalone build headers without a publication index", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-standalone-"));
  const page = join(root, "index.html");
  write(page, releasePage(`${canonical}/history.html`));

  assert.deepEqual(
    fixPublicationHistoryLinks(root, canonical, publicationBase, {
      headersOnly: true,
    }),
    {
      files: 1,
      replacements: 1,
      currentReleasePath: null,
    },
  );
  assert.match(
    readFileSync(page, "utf8"),
    new RegExp(`${publicationBase}/history\\.html`),
  );
  assert.equal(existsSync(join(root, "package-list.json")), false);
  assert.equal(existsSync(join(root, "history.html")), false);
});

test("requires a publication index unless headers-only mode is explicit", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-strict-"));
  const page = join(root, "index.html");
  const source = releasePage(`${canonical}/history.html`);
  write(page, source);

  assert.throws(
    () => fixPublicationHistoryLinks(root, canonical, publicationBase),
    /Publication package list does not exist/,
  );
  assert.equal(readFileSync(page, "utf8"), source);
});

test("rejects a current release outside the publication website", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-location-"));
  writePublicationData(root, publicationData(`${canonical}/2026.0.1`));

  assert.throws(
    () => fixPublicationHistoryLinks(root, canonical, publicationBase),
    /outside the publication website/,
  );
});

test("accepts only the explicit headers-only CLI mode", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-cli-"));
  const page = join(root, "index.html");
  write(page, releasePage(`${canonical}/history.html`));

  const result = spawnSync(
    process.execPath,
    [scriptFilename, "--headers-only", root, canonical, publicationBase],
    { encoding: "utf8" },
  );
  assert.equal(result.status, 0, result.stderr);
  assert.match(result.stdout, /publication index was not modified/);
  assert.match(
    readFileSync(page, "utf8"),
    new RegExp(`${publicationBase}/history\\.html`),
  );

  const unknownMode = spawnSync(
    process.execPath,
    [
      scriptFilename,
      "--skip-publication-index",
      root,
      canonical,
      publicationBase,
    ],
    { encoding: "utf8" },
  );
  assert.equal(unknownMode.status, 2);
  assert.match(unknownMode.stderr, /^Usage:/);
});

test("rejects invalid or identical website URLs", () => {
  const root = mkdtempSync(join(tmpdir(), "publication-history-invalid-"));
  assert.throws(
    () => fixPublicationHistoryLinks(root, "not-a-url", publicationBase),
    /not an absolute URL/,
  );
  assert.throws(
    () => fixPublicationHistoryLinks(root, canonical, `${canonical}/`),
    /must be different/,
  );
});
