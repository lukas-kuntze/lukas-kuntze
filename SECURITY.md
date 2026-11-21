# Security Policy

## Supported Versions

Security updates are provided for the most recent release only. Users are expected to upgrade to the latest release before reporting a vulnerability.

## Reporting a Vulnerability

Please **do not** report security vulnerabilities through public GitHub issues, pull requests, or discussions.

Report vulnerabilities privately through one of the following channels:

- **Public repositories:** through **GitHub Security Advisories**, using the **Report a vulnerability** button in the repository's **Security** tab. The report remains visible to the maintainers only and is linked to the repository throughout its handling.
- **Private repositories:** by email to [security@kuntze-it.de](mailto:security@kuntze-it.de), stating the affected repository. Private vulnerability reporting is not available for private repositories.

> **Note for public repositories derived from this template:** private vulnerability reporting is a per-repository setting and is not inherited. Enable it under **Settings → Advanced Security → Private vulnerability reporting**, otherwise the button referenced above is not available.

To help assess and reproduce the issue, please include as much of the following as possible:

- The type of issue and the affected component, file, or configuration.
- The steps required to reproduce the issue.
- Any proof-of-concept code, configuration, or logs.
- The impact you expect an attacker could achieve.

## Exposed Credentials

If credentials (for example, passwords, API keys, access tokens, or private keys) have been committed or otherwise exposed, proceed as follows:

1. Revoke and rotate the affected credentials immediately. Removing them in a subsequent commit is not sufficient, as they remain accessible in the Git history, in existing clones, and in forks.
2. Report the exposure through the channels above, stating the affected credentials, the commit, and the period of exposure.
3. Review the access logs of the affected service for unauthorized use.

Rewriting the Git history to remove the credentials is optional, requires coordination with the maintainers, and does not replace their rotation.

## Handling Process

Reports are handled according to the following targets:

| Stage                                          | Target                  |
| ---------------------------------------------- | ----------------------- |
| Acknowledgement of receipt                     | Within 5 business days  |
| Initial assessment and severity classification | Within 10 business days |
| Status updates until resolution                | At least every 14 days  |

The severity of a vulnerability is classified based on the [Common Vulnerability Scoring System (CVSS) v4.0](https://www.first.org/cvss/v4.0/).

Once a fix is available, it is released and the reporter is informed. Reporters are credited in the accompanying security advisory or, for private repositories, in the release notes, unless they request otherwise.

## Disclosure Policy

Vulnerabilities are handled under coordinated disclosure. Please refrain from disclosing a reported vulnerability until a fix has been released and, for public repositories, the corresponding security advisory has been published.

## Scope

This policy applies to the contents of this repository. Vulnerabilities in third-party dependencies shall be reported to the respective maintainers. If a dependency vulnerability affects this repository directly, a report through the channels above is welcome.
