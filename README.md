<div align="center">

# Softwareentwicklung & IT-Dienstleistungen Kuntze

**DevX Template: Basic**  
A standardized baseline repository template for software development projects.

</div>

---

## Overview

The **Basic** template provides a standardized, technology-independent foundation for software development projects.

It establishes consistent repository governance, development workflows, quality assurance, and automation while enhancing **Developer Experience (DevX)**. Technology-specific templates build upon this foundation by providing language- and framework-specific tooling, configuration, and automation.

---

## What's Included

| Area                     | Contents                                                                                                                                                                                             |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Git hooks                | `commit-msg` validating commit messages against the Conventional Commits specification and `pre-push` validating branch names, both based on the shared pattern files in [`.githooks/`](.githooks/). |
| CI workflows             | Validation of branch names, commit messages, and pull request titles, pull request size labeling, and label synchronization, located in [`.github/workflows/`](.github/workflows/).                  |
| Rulesets                 | Protection of the default branch, defined in [`.github/rulesets/`](.github/rulesets/).                                                                                                               |
| Issues and pull requests | Structured issue templates for bugs, features, documentation, refactoring, tasks, and performance, as well as a pull request template.                                                               |
| Labels                   | Repository and pull request size labels, defined in [`.github/config/`](.github/config/).                                                                                                            |
| Dependency updates       | Dependabot configuration for GitHub Actions with a cooldown period of seven days.                                                                                                                    |
| Editor and formatting    | Shared settings in `.editorconfig`, `.prettierrc`, `.gitattributes`, and `.gitignore`.                                                                                                               |

---

## Creating a Repository from this Template

Repository settings are not inherited from the template. The following steps shall be completed once by a repository administrator after a repository has been created.

### 1. Create the Repository

Create the repository on GitHub using **Use this template → Create a new repository**.

### 2. Apply the Repository Rulesets

The rulesets in [`.github/rulesets/`](.github/rulesets/) are the authoritative definition and shall be applied to every derived repository.

Import each file under **Settings → Rules → Rulesets → New ruleset → Import a ruleset**, or apply it with the GitHub CLI:

```bash
gh api --method POST "repos/<owner>/<repository>/rulesets" --input .github/rulesets/main.json
```

The **Default Branch Management Rules** ruleset (`main.json`) protects the default branch: changes require a pull request reviewed by the code owners, with all review threads resolved, the branch up to date with the default branch, and the branch-name and pull-request-title workflows completed successfully. Commits on the default branch shall be signed, and force pushes and deletions are blocked.

### 3. Enable Private Vulnerability Reporting

For public repositories only, enable private vulnerability reporting under **Settings → Advanced Security → Private vulnerability reporting**. Private repositories use the email channel described in [SECURITY.md](SECURITY.md).

### 4. Assign the Code Owners

Adjust [`.github/CODEOWNERS`](.github/CODEOWNERS) to the persons or teams responsible for the repository.

---

## Getting Started

### Prerequisites

- [Git](https://git-scm.com/). On Windows, [Git for Windows](https://gitforwindows.org/) is required, as the repository-managed Git hooks are Bash scripts and are executed by the Bash shipped with it.

### 1. Clone the Repository

```bash
git clone git@github.com:lukas-kuntze/<repository>.git
cd <repository>
```

### 2. Initialize the Repository

Run the setup script once after cloning to configure the local development environment and activate the repository-managed Git hooks.

**Linux / macOS**

```bash
./scripts/setup.sh
```

**Windows (PowerShell)**

```powershell
./scripts/setup.ps1
```

If the execution policy prevents the script from running, invoke it as follows:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/setup.ps1
```

The setup script configures the local Git environment, including the repository-managed Git hooks (`core.hooksPath`).

---

## Documentation

- [CHANGELOG.md](CHANGELOG.md) — Notable changes per release.
- [CONTRIBUTING.md](CONTRIBUTING.md) — Contribution guidelines and development standards.
- [LICENSE](LICENSE) — Licensing information.
- [SECURITY.md](SECURITY.md) — Security policy and vulnerability reporting.

---

## Additional Resources

- [Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/)
- [GitHub Actions Documentation](https://docs.github.com/actions)
