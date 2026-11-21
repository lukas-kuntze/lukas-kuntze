# Release Notes Template

This template defines the structure of the release notes published on GitHub for every release. The release notes summarize the changes by topic, while [CHANGELOG.md](../CHANGELOG.md) remains the complete record of all changes.

## Conventions

- **Release title:** `vX.Y.Z — DevX Template: Basic (<Topic> & <Topic>)`
- **Tag:** an annotated and signed tag on the merge commit on the default branch, created after the pull request has been merged:

  ```bash
  git tag -s vX.Y.Z -m "vX.Y.Z"
  git push origin vX.Y.Z
  ```

- **Release type:** the introduction names the type of release, for example _Initial_, _Feature_, _Refinement_, _Hardening_, or _Corrective_, and states the compatibility with the previous version.
- **Upgrade Notes:** always present. Lists the actions required in derived repositories, or states `No action required.`
- **Topics:** sections are grouped by topic (for example _Branch Naming_, _Commit Validation_, _Configuration_, _Documentation_) and use second-level headings only.
- **Formatting:** no hard line breaks, version numbers in backticks, the product name in bold in the introduction, and bullet points without a trailing period.

## Template

```markdown
# DevX Template: Basic — `vX.Y.Z`

<Type> release of the **DevX Template: Basic**. <One or two sentences summarizing the release> — while remaining fully backward-compatible with `vA.B.C`.

## Upgrade Notes

- <Action required in derived repositories, or: No action required.>

## <Topic>

- <Change>

---

**Full Changelog:** https://github.com/lukas-kuntze/devx-template-basic/compare/vA.B.C...vX.Y.Z  
See [CHANGELOG.md](https://github.com/lukas-kuntze/devx-template-basic/blob/vX.Y.Z/CHANGELOG.md) for the complete list of changes.
```
