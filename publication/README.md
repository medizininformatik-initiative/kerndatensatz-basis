# Publishing a release

Formal releases use the manual
[`go-publish.yml`](../.github/workflows/go-publish.yml) workflow. A run with
`publish: false` performs a complete dry run. A run with `publish: true`
rebuilds the candidate, commits it to `gh-pages`, and deploys it through GitHub
Pages.

Each run resolves the latest published IG Publisher, SUSHI, and Jekyll, plus
the current default branches of the HL7 publication templates and FHIR IG
Registry and the MII terminology-proxy configuration. The exact versions and
commit revisions used by the run are recorded in the job summary and
`publication-review` artifact; no workflow pins need to be refreshed for a
release.

This setup follows the
[IG Publisher publication guide](https://www.argentixinfo.com/ig/howtopub/publication.html).

## Fixed URLs

- Publication website:
  `https://medizininformatik-initiative.github.io/kerndatensatz-basis`
- FHIR canonical:
  `https://www.medizininformatik-initiative.de/fhir/modul-base`
- Development build:
  `https://medizininformatik-initiative.github.io/kerndatensatz-basis/branches/develop/`

The website and canonical intentionally differ. Keep the MII canonical in the
IG and package metadata. `publication/webroot/publish-setup.json` uses the Pages
URL with `"server": "cloud"` and `"canonical-mismatch": true`.

The formal workflow owns the root and version directories on `gh-pages`.
Continuous builds own only `branches/<branch-name>/`. Do not copy the complete
`publication/webroot` directory to `gh-pages`; it is workflow input.

## One-time setup

Skip items that are already complete.

1. In **Settings → Pages → Build and deployment**, select **GitHub Actions**.
2. Set the Actions variable `PAGES_ACTIONS_ENABLED=true`.
3. Create or protect the `publication` environment and configure any required
   reviewers.
4. Configure the repository secrets `CDS_DEV_CLIENT_CERT`,
   `CDS_DEV_CLIENT_KEY`, and `CDS_DEV_CLIENT_CERT_PASSWORD`.
5. Ensure the `develop` preview exists at `gh-pages/branches/develop/`.

### First formal release only: 2026.0.1

`2026.0.0` was already published through Simplifier and must not be
republished. Keep `"first": false` in `publication-request.json`. If the Pages
root does not yet contain `package-list.json`, the workflow automatically
imports the pinned `2026.0.0` site and package and creates its history entry.
Only those historical artifact hashes stay fixed: they prove that the imported
release is the one already published and are not build-tool pins.

Before running `2026.0.1` with `publish: true`:

1. Ensure `publication/webroot/package-feed.xml` is committed as
   `/package-feed.xml` on `gh-pages`.
2. Submit and merge the one-time
   [`package-feeds.json`](https://github.com/FHIR/ig-registry/blob/master/package-feeds.json)
   change using this feed URL:

   `https://raw.githubusercontent.com/medizininformatik-initiative/kerndatensatz-basis/gh-pages/package-feed.xml`

3. Add an exact package restriction for
   `de.medizininformatikinitiative.kerndatensatz.base`.

This package-feed registration is separate from the new-IG or new-edition
`fhir-ig-list.json` change generated during publication.

## Steps for every release

### 1. Prepare `develop`

1. Update the release version, date, status, release label, changelog, package
   metadata, and FHIR package dependencies.
2. Update `publication-request.json` with the same version and the permanent
   Pages version URL. Keep the MII canonical in `sushi-config.yaml` and
   `package.json`.
3. Keep `fhir2.base.template#current`; it is required for the multilingual
   pages. Pin other FHIR package dependencies.
4. Commit and push `develop`, then wait for its Pages preview workflow to
   finish successfully.

The publication date in `sushi-config.yaml` is authoritative.

### 2. Merge and tag

1. Merge `develop` into `main`.
2. Create and push an immutable `v<version>` tag on the release commit.
3. Wait for the tag workflow to create the draft GitHub Release.

### 3. Run the publication dry run

From the `main` version of **Publish release with IG Publisher**, enter:

- `release_ref`: the immutable release tag;
- `publication_date`: blank only when the tagged commit date equals the date in
  `sushi-config.yaml`;
- `publish`: `false`.

Download and review the `publication-review` and `github-pages` artifacts:

- `qa.html`, `qa.json`, and `publication-process.log`;
- `source-publication.patch` and `ig-registry.patch`;
- `publication-toolchain.txt`, containing the resolved tool versions and
  publication-support repository commits;
- the staged Pages site and reported size; and
- the versioned `package.tgz`.

QA errors are allowed. The workflow requires valid `qa.json` and a nonempty
`package.tgz`, reports the QA counts, and lets Publisher `-go-publish` perform
its publication comparison. Expected messages are documented in
`input/ignoreWarnings.txt`.

Do not continue if the candidate, metadata, history, feeds, package, registry
patch, or deployment size is not acceptable.

### 4. Publish

Rerun **Publish release with IG Publisher** from `main` with the same tag and
publication date, and set `publish: true`.

The workflow rebuilds the candidate, preserves branch previews and existing
releases, commits it to `gh-pages`, deploys it, and verifies the history page,
version pages, and package downloads.

Confirm:

- `https://medizininformatik-initiative.github.io/kerndatensatz-basis/<version>/`
- `https://medizininformatik-initiative.github.io/kerndatensatz-basis/history.html`

### 5. Update the FHIR IG Registry

After the Pages deployment is live:

1. Download `ig-registry.patch` from the successful production run's
   `publication-review` artifact.
2. Apply it to the latest `FHIR/ig-registry` `fhir-ig-list.json`.
3. Review the resulting IG entry and open an upstream pull request.

Publisher supplies the entry metadata from `publication-request.json`. Before
creating the patch, the workflow corrects the generated `history` and
`language` values and validates:

- description, authority, and country;
- `history` as
  `https://medizininformatik-initiative.github.io/kerndatensatz-basis/history.html`;
- `language` as `["en", "de"]`;
- canonical, CI-build URL, edition version, package, and publication URL; and
- absence of `??` placeholders.

The workflow never commits or opens the upstream registry pull request.

### 6. Finish the release

1. Optionally attach the generated `package.tgz` to the draft GitHub Release.
   It is a convenience asset; the Pages package feed is the formal package
   channel.
2. Complete the release notes and publish the GitHub Release.
3. Synchronize `develop` with `main` and prepare the next development version.

`publish-fsh-generated.yml` remains independent. It sends generated resources
to Simplifier for inspection and does not publish an NPM package.

## Rollback

1. Revert the publication commit on `gh-pages` with a normal revert commit and
   push it. Do not force-push.
2. Record the full SHA of the resulting `gh-pages` head.
3. Run **Deploy current gh-pages tree** with that SHA as `expected_sha`.
