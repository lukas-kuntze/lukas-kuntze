# Contributing

Thank you for your interest in contributing.

This document defines the contribution process and development standards for repositories created from the **DevX Template: Basic**. Following these guidelines helps ensure consistent development practices, maintainability, and code quality.

---

## Table of Contents

- [Development Setup](#development-setup)
- [Commit Messages](#commit-messages)
  - [Format](#format)
  - [Examples](#examples)
  - [Supported Types](#supported-types)
  - [Merge Commits](#merge-commits)
- [Branch Naming](#branch-naming)
  - [Format](#format-1)
  - [Examples](#examples-1)
  - [Supported Prefixes](#supported-prefixes)
- [Pull Requests](#pull-requests)
  - [Review and Merge](#review-and-merge)
- [Questions](#questions)

---

## Development Setup

Set up the local development environment as described in the [Getting Started](README.md#getting-started) section of the README, including the prerequisites and the setup script activating the repository-managed Git hooks.

If additional project-specific setup steps are required (for example, dependency installation or build tooling), document them in the project README.

---

## Commit Messages

Commit messages **shall** comply with the
[Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/).

### Format

```text
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

The scope is optional and shall consist of lower-case letters, digits, hyphens, and underscores. A breaking change is indicated by an exclamation mark directly before the colon.

### Examples

```text
feat(auth): add OAuth2 authentication
fix(api): correct response validation
docs(readme): update installation guide
refactor(core): simplify configuration loading
chore(deps): update project dependencies
feat(api)!: remove the deprecated endpoint
```

### Supported Types

- **build** — Build system or dependency changes
- **chore** — Repository maintenance or tooling
- **ci** — Continuous Integration changes
- **docs** — Documentation updates
- **feat** / **feature** — New functionality
- **fix** — Bug fixes
- **perf** — Performance improvements
- **refactor** — Code restructuring without functional changes
- **revert** — Revert previous changes
- **style** — Formatting or stylistic changes
- **test** — Test additions or modifications

Commit message compliance is verified locally by the repository-managed `commit-msg` Git hook and, for every pull request, by the commit-message workflow.

### Merge Commits

Merge commits are **not** exempt from these requirements. The `commit-msg` hook is invoked by `git merge` in addition to `git commit`, and the message Git generates automatically (`Merge branch 'main' into <branch>`) does not comply with the specification and will therefore be rejected.

When integrating the target branch into a feature branch, either provide a compliant message explicitly:

```bash
git merge main -m "chore: merge main into <branch>"
```

Or rebase instead, which avoids creating a merge commit altogether:

```bash
git rebase main
```

When updating a pull request branch through the **Update branch** button on GitHub, select **Update with rebase**. The default option, **Update with merge commit**, creates a merge commit with a non-compliant message, which is rejected by the commit-message workflow. As rebasing rewrites the branch on the remote, update existing local copies afterwards:

```bash
git pull --rebase
```

---

## Branch Naming

Branch names **shall** follow a consistent naming convention.

### Format

```text
<type>/<short-description>
```

### Examples

```text
feat/add-authentication
fix/login-validation
docs/update-readme
refactor/config-loading
chore/update-dependencies
```

### Supported Prefixes

```text
build/
chore/
ci/
docs/
feat/
feature/
fix/
perf/
refactor/
revert/
style/
test/
```

The description following the prefix shall consist of lower-case letters, digits, dots, hyphens, and underscores.

Branch name compliance is verified locally by the repository-managed `pre-push` Git hook. The hook validates the name a branch receives on the remote, and only when the push creates that branch. Pushes to branches that already exist on the remote are not affected. Because the hook runs before the branch reaches the remote, a rejected branch can be renamed without any further consequences:

```bash
git branch -m <new-name>
```

Alternatively, the branch can be pushed under a compliant remote name:

```bash
git push -u origin <local-branch>:<new-name>
```

As the `pre-push` hook can be bypassed or may not be activated, the branch name of every pull request is additionally verified by the branch-name workflow. Branches created by Dependabot are excluded, as their prefix cannot be configured. A pull request whose branch is rejected by the workflow shall be replaced by a new pull request from a compliant branch.

---

## Pull Requests

Before submitting a pull request, ensure that:

- The branch is up to date with the target branch.
- The pull request title follows one of the approved naming conventions:
  - `<type>: <description>` (Conventional Commits)
  - `[ISSUE-XXXX] — <description>`
- The Pull Request Template has been completed.
- The change is focused on a single logical objective.
- Documentation has been updated where applicable.
- All local validation checks complete successfully.
- All CI workflows pass successfully.

Where applicable, reference related issues using:

```text
Fixes #123
```

### Review and Merge

The default branch is protected by the repository rulesets. A pull request can only be merged once:

- The code owners have reviewed the change.
- All review threads have been resolved.
- The branch is up to date with the target branch.
- All required CI workflows have completed successfully.

When a pull request is merged, its title becomes the subject line of the resulting commit on the default branch. The pull request title therefore shall describe the change as a whole.

---

## Questions

If you have questions, suggestions, or have identified an issue, please create a GitHub Issue using the appropriate issue template.
