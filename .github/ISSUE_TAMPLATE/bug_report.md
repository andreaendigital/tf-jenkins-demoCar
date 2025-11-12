---
name: "🐛 Bug Report"
about: "Report a bug in the Terraform + Jenkins demo repository"
title: "[BUG] "
labels: "bug, terraform, jenkins"
assignees: ""
---

## Summary

Short, one-line summary of the bug.

## Affected component

- [ ] provisioning (Terraform)
- [ ] jenkins installer / bootstrapping (jenkins/jenkins-runner-script)
- [ ] load balancer (load-balancer)
- [ ] networking (networking)
- [ ] security groups (security-groups)
- [ ] other: ****\_\_****

## Description

Describe the problem in more detail. Include what you were trying to do and why this is a problem for the project.

## Reproduction steps

Provide a minimal, reproducible set of steps. Include exact commands and the working directory when applicable.
Example for Terraform-related issues:

1. Checkout branch: `git checkout <branch>`
2. cd to repo root (where `main.tf` exists)
3. Run: `terraform init` (include backend output if different from default)
4. Run: `terraform plan -out=tfplan.binary -compact-warnings` and attach the plan output or paste the relevant snippet
5. Run (if you attempted apply): `terraform apply tfplan.binary`

Example for Jenkins installer issues:

1. cd `jenkins/jenkins-runner-script`
2. Run: `bash jenkins-installer.sh` (include flags/env used)

## Expected behavior

What did you expect to happen?

## Actual behavior

What actually happened? Include error messages, exit codes, and relevant logs.

```
Paste relevant logs or error snippets here (trim to the smallest useful amount).
```

## Environment

- **Repository path / commit:** `HEAD` or commit SHA
- **OS / shell:** e.g., Windows 10 (bash), Linux (bash)
- **Terraform version:** e.g., 1.4.6 (`terraform version`)
- **Providers and versions:** (if known)
- **Backend:** local / remote (S3, etc.)
- **Branch / Workspace:** e.g., `SCRUM-127-update-pr-and-issue-templates-in-differents-repos`

## Files & snippets

- Paths to files you changed or that are relevant (example): `main.tf`, `jenkins/main.tf`, `load-balancer/main.tf`
- If you can, paste the minimal `resource` or `module` block that triggers the issue.

## State / Plan / Sensitive data

- If you attach `terraform.tfstate` or plan output, redact secrets and credentials first.
- Prefer attaching a `terraform plan` output or a small reproduce-only configuration instead of full state when possible.

## Attachments

- Attach `terraform plan` (text), logs, and screenshots if helpful.
- If attaching files, add them to the issue with a short description.

## Impact / Severity

- [ ] blocker (blocks CI / deployment)
- [ ] high (major feature broken)
- [ ] medium (partial loss of functionality)
- [ ] low (minor / cosmetic)

## Suggested fix (optional)

If you have an idea of how to fix it, describe it briefly or link a PR.

---

### Troubleshooting checklist (helpful for maintainers)

- [ ] I can reproduce this locally
- [ ] I included `terraform plan` or relevant logs
- [ ] I confirmed the issue is not caused by stale state (.tfstate) or local caching
- [ ] I redacted secrets from any attachments

Thanks — maintainers: please triage and add labels for component and priority.
