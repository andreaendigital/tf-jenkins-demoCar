---
name: "🚀 Feature Request"
about: "Propose an enhancement or new capability for the Terraform + Jenkins demo repository"
title: "[FEATURE] "
labels: "enhancement, terraform, jenkins"
assignees: ""
---

## Summary

One-line summary of the requested feature.

## Affected components

- [ ] provisioning / Terraform modules
- [ ] jenkins installer / bootstrapping (jenkins/jenkins-runner-script)
- [ ] load balancer
- [ ] networking / VPC
- [ ] security groups
- [ ] documentation / README
- [ ] other: ****\_\_****

## Motivation and business value

Explain why this feature is needed and the value it brings (who benefits and how).

## Proposed change

Describe the proposed implementation at a high level. Include what will be added, removed, or changed.

- Terraform: modules/resources/variables/providers to add or change
- Jenkins: new job, pipeline, plugin, or installer flag changes
- Operational: rollout steps, monitoring, and alerting

## Terraform impact and migration notes

- Will this require state migration? (yes/no). If yes, explain.
- Any provider upgrades required?
- Example commands to test locally:
  - `terraform init`
  - `terraform plan -out=tfplan.binary`
  - `terraform apply tfplan.binary`

If state changes are required, include a short migration plan (e.g., import commands, `terraform state mv`).

## Jenkins impact

- Does this require new credentials, secrets, or plugin installs?
- Where the change lives: `jenkins/` or `jenkins-runner-script`
- How to test locally or in CI (example: run installer script with env vars)

## Acceptance criteria

List measurable acceptance criteria that must be met for the feature to be considered done.

- [ ] Criterion 1 (e.g., `terraform plan` succeeds with no changes when enabled)
- [ ] Criterion 2 (e.g., Jenkins job created and functional)
- [ ] Criterion 3 (documentation updated)

## Test plan

Describe how to validate the feature. Include commands, required environment variables, and expected outputs.

## Alternatives considered

Describe alternatives that were considered and why this approach was chosen.

## Dependencies

- Other issues, PRs, or external services required for this feature.

## Estimated effort & priority

- **Estimated effort:** [ ] Small [ ] Medium [ ] Large
- **Priority:** [ ] Low [ ] Medium [ ] High

## Files / PR checklist (for contributors)

- [ ] I updated relevant `*.tf` files and documented changes
- [ ] I updated `README.md` or `docs/` as needed
- [ ] I included `terraform plan` output or a short reproduce snippet
- [ ] I added tests where applicable

---

Thanks — maintainers: please review and add component labels and an estimate.
