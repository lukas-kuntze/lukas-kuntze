# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.4.0] - 2026-11-14

### Added

- Branch-name workflow (`.github/workflows/branch-name-check.yml`) validating the source branch of every pull request against the shared branch name pattern, as the `pre-push` hook can be bypassed with `--no-verify` or may not be activated. Branches created by Dependabot and the default branch are excluded.
- Ruleset definition for the default branch (`.github/rulesets/main.json`) as the authoritative source for derived repositories, requiring a pull request reviewed by the code owners, resolved review threads, an up-to-date branch, signed commits, and the successful completion of the branch-name and pull-request-title workflows, and blocking force pushes and deletions. The README documents how to import or apply it.
- Section on exposed credentials in the security policy, requiring the immediate revocation and rotation of committed credentials, a report through the security channels, and a review of the access logs, and clarifying that removing the credentials from the repository or rewriting the Git history does not replace their rotation.
- Release notes template (`.github/release_template.md`) defining the structure, formatting, and tagging conventions of the release notes published on GitHub, including a mandatory section on the upgrade actions required in derived repositories.
- The security policy now specifies the Common Vulnerability Scoring System (CVSS) v4.0 as the basis for classifying the severity of reported vulnerabilities.

### Changed

- All workflows now revoke every permission of the `GITHUB_TOKEN` at workflow level (`permissions: {}`), so that jobs only receive the permissions they declare explicitly.
- All workflows now define a concurrency group. Pull request workflows cancel runs superseded by a newer event on the same pull request, while label synchronization runs are queued instead of cancelled.
- All jobs now define a timeout of five minutes instead of the GitHub default of six hours.
- Restructured the README: an overview of the template contents, a section on the one-time steps for repository administrators after creating a repository from the template (applying the rulesets, enabling private vulnerability reporting, assigning the code owners), and a getting-started section limited to the steps required after each clone. The README additionally documents the prerequisites, including Git for Windows for executing the Bash-based Git hooks on Windows, and how to run the Windows setup script if the execution policy prevents it.
- Revised the contribution guidelines: the development setup now refers to the README instead of duplicating it, the permitted scope characters and the notation of breaking changes are documented, the verification of commit messages by the commit-message workflow is mentioned, the use of **Update with rebase** for the **Update branch** button on GitHub is described, and a section on the review and merge requirements has been added.

### Fixed

- The contribution guidelines referenced issues as `Fixes: #123`, deviating from the pull request template and the closing keyword syntax documented by GitHub. They now use `Fixes #123`.
- The security policy referred exclusively to private vulnerability reporting, which is not available for private repositories, leaving private repositories without a usable reporting channel. Vulnerabilities in private repositories are now reported by email to security@kuntze-it.de. The crediting of reporters and the disclosure policy no longer depend on security advisories, which are not available for private repositories either.
- The Markdown files did not conform to the Prettier configuration provided by the template. The release notes template used asterisks for emphasis, and the tables in the README and the security policy were not aligned. As a result, `prettier --check` failed in derived repositories that verify the formatting in CI. Emphasis now uses underscores, and the tables are aligned.

## [1.3.0] - 2026-11-13

### Changed

- Dependabot now applies a cooldown period of seven days before proposing an update to a newly released GitHub Actions version, reducing the exposure to compromised or defective releases.
- Replaced the global indentation size in `.editorconfig` with explicit indentation sizes per file type, and added sections for shell scripts (`*.sh`), PowerShell scripts (`*.ps1`, encoded as UTF-8 with byte order mark for compatibility with Windows PowerShell 5.1), and XML files (`*.xml`).
- Documented in the contribution guidelines which branch name the `pre-push` hook validates and under which conditions, and added the option of pushing a branch under a compliant remote name to both the contribution guidelines and the output of the hook.
- Harmonized the wording of the output messages of the Git hooks, the CI workflows, and the setup scripts, as well as the wording of the security policy, the contribution guidelines, the issue templates, the pull request template, and the pull request size label message.

### Fixed

- The `pre-push` hook validated the local branch name instead of the name created on the remote. Pushes with an explicit refspec (`git push origin local:remote`) or from a detached HEAD bypassed the check, while compliant remote names were rejected because of a non-compliant local name. The hook now validates the remote branch name.
- The `pre-push` hook validated every push to a branch instead of only the push creating it, so follow-up commits to branches that already existed on the remote under a non-compliant name were rejected without any way to resolve this locally. The hook now only validates branch creations.
- The `pre-push` hook assumed `main` as the default branch, so the initial push of a default branch with a different name was rejected. The hook now determines the default branch from the remote and falls back to `main` if the remote HEAD is not known locally.
- The `commit-msg` hook evaluated the first line of the raw commit message, which still contains comment lines and leading blank lines at the time the hook runs. Messages based on a commit template or starting with a blank line were rejected locally while the stored message was accepted by the commit-message workflow. The hook now cleans up the message in the same way as Git before evaluating the subject line.
- The global indentation size of four spaces in `.editorconfig` conflicted with the indentation width of two spaces configured for Prettier, causing files formatted by Prettier to be re-indented after editing.
- The global indentation style in `.editorconfig` enforced spaces in Makefiles, which require tabs for recipe lines. Makefiles (`Makefile`, `*.mk`) are now indented with tabs.

## [1.2.0] - 2026-07-30

### Added

- Repository-managed `pre-push` Git hook validating branch names against the naming convention before a branch reaches the remote.
- Shared branch name pattern file (`.githooks/branch-name.pattern`) as the single source of truth for the `pre-push` hook.
- Security policy (`SECURITY.md`) describing the supported versions, the private reporting channel, the handling targets, and the coordinated disclosure expectations, linked from the documentation section of the README.
- Link to `CHANGELOG.md` in the documentation section of the README.
- Section on merge commits in the contribution guidelines, clarifying that merge commits are not exempt from the Conventional Commits requirements and documenting how to update a branch accordingly.
- Table of contents entry for the branch naming prefixes in the contribution guidelines.

### Changed

- Stated the branch naming convention as a requirement rather than a recommendation in the contribution guidelines, and documented both the permitted characters and the `pre-push` hook enforcing them.
- Defined a default indentation of four spaces in `.editorconfig`, removed the per-section declarations made redundant by it, and added an explicit section for the extensionless files in `.githooks/`.
- The `commit-msg` hook now reports the evaluated subject line instead of the entire commit message when validation fails.

### Fixed

- The `commit-msg` hook validated the entire commit message instead of the subject line only. Because a dot also matches a newline in POSIX extended regular expressions, a commit with an empty description followed by a body was accepted locally while the same commit was rejected by the commit-message workflow. The hook now evaluates the subject line only, matching the behaviour of the workflow.
- The scope in the Conventional Commits pattern accepted a literal backslash, as a backslash carries no escaping meaning inside a POSIX bracket expression.
- The `commit-msg` hook and both setup scripts were not marked as executable. As a result, Git skipped the hook silently on Linux and macOS, and neither setup script could be invoked directly on those platforms despite declaring a shebang.

## [1.1.0] - 2026-07-18

### Added

- Prettier configuration (`.prettierrc`) defining shared formatting rules for the repository.
- Shared Conventional Commits pattern file (`.githooks/conventional-commit.pattern`) as the single source of truth for the `commit-msg` hook and the CI workflows.
- `feature` as an allowed Conventional Commits type alongside `feat`.

### Changed

- Referenced the shared pattern file from the `commit-msg` hook and the commit-message / PR-title workflows instead of duplicating the regex in each location.
- Added a repository checkout step to the commit-message and PR-title workflows so they can read the shared pattern file.
- Normalized formatting of issue templates and workflow files according to the Prettier configuration.

## [1.0.0] - 2026-07-16

### Added

- Initial DevX Basic template providing a standardized, technology-independent baseline for software development repositories.

[Unreleased]: https://github.com/lukas-kuntze/devx-template-basic/compare/v1.4.0...HEAD
[1.4.0]: https://github.com/lukas-kuntze/devx-template-basic/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/lukas-kuntze/devx-template-basic/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/lukas-kuntze/devx-template-basic/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/lukas-kuntze/devx-template-basic/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/lukas-kuntze/devx-template-basic/releases/tag/v1.0.0
