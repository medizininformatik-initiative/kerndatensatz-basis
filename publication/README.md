# IG publication environment

This directory is the checked-in seed for the Core Dataset Base publication
website. The `Publish release with IG Publisher` workflow performs a clean build
and runs IG Publisher `-go-publish`; it is manual and is a full dry run unless
`publish` is explicitly selected.

The design follows the publication workspace and command described in:

- [Setting up the Publication Environment](https://www.argentixinfo.com/ig/howtopub/setup.html)
- [Using IG Publisher -go-publish](https://www.argentixinfo.com/ig/howtopub/publication.html)
- [Maintaining a FHIR IG Publication](https://confluence.hl7.org/spaces/FHIR/pages/81027536/Maintaining+a+FHIR+IG+Publication)

## Directory ownership

The formal Publisher-managed tree owns the root of `gh-pages`, including
`package-list.json`, `history.html`, the feeds, canonical redirect directories,
and permanent version directories such as `2026.0.0/`.

Continuous builds own only `branches/<branch-name>/`. Older preview directories
that predate this namespace are preserved while their source branch exists. The
cleanup workflow deletes a directory only when it contains a `.branch-name`
marker and that exact branch no longer exists; it does not infer previews from
directory names. Root-level semantic-version paths are additionally retained
because they may already be permanent release URLs.

## Importing the existing 2026.0.0 release

`2026.0.0` is existing history, not a `-go-publish` target. The July 2026
migration baseline was:

- the package was published on Simplifier on 2025-12-13 and is already indexed
  by the FHIR package registry;
- the public website exists at
  `https://www.medizininformatik-initiative.de/Kerndatensatz/KDS_Basis_2026/`;
- neither that site nor the current Pages root contains `package-list.json` or
  `history.html`, and both still identify themselves as local-development
  builds.

The first formal workflow run is therefore `2026.0.1` with `"first": false`.
When no formal `package-list.json` exists yet, the workflow performs a one-time
bootstrap before invoking Publisher:

1. it uses the existing `gh-pages/2026.0.0` deployment after verifying its
   embedded public full-site archive, or downloads that pinned archive as a
   fallback;
2. it keeps that site at the permanent `2026.0.0/` path without rebuilding it,
   including the existing QA pages when they are present;
3. it replaces the archive's direct `package.tgz` with the byte-identical,
   pinned Simplifier package, so the website and registry expose one package
   identity;
4. it seeds `package-list.json` and `package-registry.json` with the existing
   release and a CI-build entry;
5. it installs the root history support files according to the manifest in the
   pinned HL7 history template, reproducing the initial-history setup that
   Publisher skips for a `first: false` publication;
6. it preserves every marker-backed Pages preview except a preview occupying the
   permanent `2026.0.0/` path, which the verified historical release replaces; and
7. it runs `-go-publish` only for `2026.0.1`.

Publisher then makes `2026.0.1` current and generates the root history page from
both version entries. A checked-in `2026.0.0/history.html` redirect ensures the
old site's “Directory of published versions” link reaches the new root history
even before or independently of Publisher rewriting its publication banner.
Once the first publication is committed, later runs use the established formal
tree directly and never repeat the import.

The history page is a static Pages artifact: `.nojekyll` keeps GitHub Pages from
transforming the Publisher output, `history.html` embeds the generated
`package-list.json` data, and its supporting files are copied from the pinned
HL7 history template. Before committing, the workflow requires both
`2026.0.0` and `2026.0.1` in the generated history and verifies the relative
redirect at `2026.0.0/history.html`. After deployment it fetches and checks the
root and historical history URLs through the GitHub Pages mirror as well as the
root history through the canonical mapping. Before the one-time `2026.0.1`
publication is deployed, those history URLs are expected to return 404.

## One-time prerequisites

The multilingual build requires `fhir2.base.template#current`; the formal
workflow therefore permits `#current` while continuing to reject `#dev` and
`#cibuild` template references. Before tagging, set the top-level
`sushi-config.yaml` date to the intended publication date.

Then tag the prepared `2026.0.1` source and run the formal workflow with
`publish: false`. This does not change the live branch. It imports the pinned
historical site in its temporary checkout, performs the full publication, and
reports the size of the exact merged candidate. The workflow uses the explicit
`publication_date` input when supplied and otherwise the tagged commit date; in
either case it requires that date to match `sushi-config.yaml`.

GitHub documents 1 GB as the officially supported maximum for a published Pages
site. When this migration was prepared in July 2026, the pre-migration tree with
all preview deployments was already larger than that. The Pages artifact format
accepts a tar file below 10 GB, but GitHub does not guarantee that a deployment
above 1 GB will succeed, particularly within the 10-minute deployment timeout.
The formal dry run always reports the exact candidate size and emits a warning
above 1,000,000,000 bytes without blocking publication. Preview and cleanup
workflows emit the same warning when Actions deployment is enabled and the tree
is above that threshold. Use the dry run to review the candidate size and retire
or archive-move old previews where practical.

After reviewing the dry-run candidate and accepting any deployment-size risk:

1. In repository **Settings → Pages → Build and deployment**, select
   **GitHub Actions** as the source. Every workflow that mutates `gh-pages`
   uploads and deploys the complete tree when `PAGES_ACTIONS_ENABLED=true`, so
   preview, cleanup, and formal publication changes continue to reach the same
   Pages site.
2. Set the repository Actions variable `PAGES_ACTIONS_ENABLED` to `true`.
   Preview and cleanup workflows continue to update `gh-pages` before this
   switch, but deliberately do not invoke an Actions Pages deployment. This
   separates the source migration from ordinary branch builds and keeps the
   current deployment intact if the candidate is too large.
3. Create or protect the `publication` environment and add required reviewers
   if publication needs a second-person approval.
4. Configure the web infrastructure for
   `https://www.medizininformatik-initiative.de/fhir/modul-base/` to reverse
   proxy or equivalently map, with every suffix preserved, to
   `https://medizininformatik-initiative.github.io/kerndatensatz-basis/`.
   GitHub Pages custom domains operate at hostname level and do not create this
   path mapping. `publish-setup.json` controls generated files; it does not
   configure DNS or the MII web server. The workflow checks the canonical root
   before committing and verifies canonical `package-list.json` and
   `package.tgz` after deployment.
5. Keep the existing `CDS_DEV_CLIENT_CERT`,
   `CDS_DEV_CLIENT_KEY`, and `CDS_DEV_CLIENT_CERT_PASSWORD` repository secrets.
   The workflow creates the terminology proxy material only in the runner's
   temporary directory.
6. Before the first production publication, commit the seed
   `publication/webroot/package-feed.xml` as `/package-feed.xml` on `gh-pages`
   and complete the upstream package-feed registration described below. Do not
   copy the entire `publication/webroot` directory to `gh-pages`: the formal
   workflow consumes its other files as bootstrap inputs and commits the
   Publisher-managed result.

The workflow uses the custom GitHub Pages artifact/deployment path, rejects
symbolic links, reports the exact size, and warns when the candidate is above
GitHub Pages' officially supported 1 GB maximum.

## Running a publication

1. Prepare and tag the exact `2026.0.1` release source. Its version, package id,
   canonical, status, release label, date, dependencies, and
   `publication-request.json` must describe the intended release, and the
   request must have `"first": false`. Keep
   `fhir2.base.template#current` for the multilingual build. Do not run the
   formal workflow for `2026.0.0`.
2. Run **Publish release with IG Publisher** with the immutable tag and
   `publish: false`. Supply `publication_date` when the intended date differs
   from the tagged commit date; the selected date must match
   `sushi-config.yaml`.
3. Review the QA report, `-go-publish` log, source patch, registry patch, and
   exact staged-site artifact. The workflow requires zero QA errors.
4. Confirm that the main-branch preview workflow has populated
   `gh-pages/branches/main/index.html`. Production publication deliberately
   fails when the advertised CI build is absent.
5. After reviewing the candidate size, completing the package-feed prerequisite,
   configuring the canonical mapping, switching
   the Pages source, set `PAGES_ACTIONS_ENABLED=true`, and rerun the same tag
   with `publish: true` and `canonical_mapping_confirmed: true`. A candidate
   above 1 GB produces a warning because GitHub does not guarantee that it will
   deploy successfully. The `publication` environment is the approval gate.
6. Review and submit the generated `ig-registry.patch` separately to
   [FHIR/ig-registry](https://github.com/FHIR/ig-registry). This workflow never
   writes to the upstream registry. The package registry that already indexes
   `2026.0.0` and the FHIR IG Registry are separate catalogs; the pinned IG
   Registry snapshot does not yet contain this guide.

The `publish-fsh-generated.yml` Simplifier bridge remains intentionally active
so the generated FHIR resources can be inspected there when the existing
Simplifier project connection is active. It updates only the `fsh-generated`
branch and does not publish an NPM package or package feed. For imported
`2026.0.0`, both the staged package and the canonical site's direct package
download are verified against the exact package previously published through
Simplifier.

Tagging a release also creates a draft GitHub Release through `main.yml`.
The exact versioned `package.tgz` is included in the formal workflow's
`publication-review` artifact and may be attached to that release as a
convenience download asset. This does not publish it to a FHIR package feed or
registry. Starting with `2026.0.1`, `-go-publish` and the canonical package feed
are the package-registry publication channel.

Before the first production publication, register the feed in
[`FHIR/ig-registry/package-feeds.json`](https://github.com/FHIR/ig-registry/blob/master/package-feeds.json).
The registry URL must point to the Publisher-managed feed committed on the
`gh-pages` branch:

`https://raw.githubusercontent.com/medizininformatik-initiative/kerndatensatz-basis/gh-pages/package-feed.xml`

Do not register `publication/webroot/package-feed.xml` from the source branch.
That file is only the one-time bootstrap seed. Copy only that file to the root
of `gh-pages` so the raw GitHub URL resolves, submit the upstream feed change,
and wait for it to merge before running `2026.0.1` with `publish: true`. An
exact `package-restrictions` entry for
`de.medizininformatikinitiative.kerndatensatz.base` can restrict future versions
to this feed. The formal publication updates the same committed
`gh-pages/package-feed.xml`; its other seed files are merged by the workflow and
must not be copied manually.

## Static hosting compatibility

`"server": "cloud"` is the right Publisher setting for GitHub Pages because the
host cannot execute PHP or ASP redirects. However, Publisher 2.2.11 still has
the two cloud redirect defects tracked in
[HL7/fhir-ig-publisher#1327](https://github.com/HL7/fhir-ig-publisher/pull/1327):
the `-go-publish` path selects Apache redirects, and the cloud HTML template is
PHP text.

The workflow pins Publisher 2.2.11 by SHA-256 and then applies a narrow
compatibility conversion equivalent to that upstream fix. It recognizes only
the Publisher redirect template and emits static HTML redirects. The converter
does not alter marker-backed previews; staged validation rejects remaining PHP
files and Publisher PHP-in-HTML redirects. Remove the compatibility script only
after the pinned official Publisher release contains the upstream fix.

Publisher can also omit `tbl_bck*.png` table backgrounds from the generated
`en/` and `de/` directories. Preview builds copy only missing files after
Publisher finishes. Formal builds do the same before `-go-publish`, so the
publication process receives the repaired output, and then verify the current
and versioned staged Pages roots. Existing localized files are preserved.

Static hosting cannot perform HTTP `Accept` content negotiation. The generated
redirect pages send browsers to HTML and expose direct JSON/XML links.

## Rollback

Formal publication is committed to `gh-pages` before the exact same tree is
deployed. To roll it back:

1. Revert the publication commit on `gh-pages` with a normal revert commit and
   push; do not force-push.
2. Record the full SHA of the new revert commit at the resulting `gh-pages`
   head.
3. Run **Deploy current gh-pages tree** with that SHA as `expected_sha`.

The deployment workflow shares the `gh-pages-writes` concurrency group, refuses
to deploy when the branch has advanced beyond the requested SHA, validates and
packages the complete tree, and deploys that exact artifact through the
`publication` and `github-pages` environments. Do not make another manual
`gh-pages` change while it is running. The repeated SHA check prevents an
intervening preview or cleanup update from being silently lost.
