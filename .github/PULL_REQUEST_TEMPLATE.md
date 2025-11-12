# Pull Request

## Summary

**SCRUM Ticket:** `SCRUM-XXX` (link if available)

## Type / Affected areas

Select all that apply:

- [ ] Infrastructure / Terraform
- [ ] Jenkins / CI / bootstrapping (jenkins/jenkins-runner-script)
- [ ] Load balancer
- [ ] Networking (VPC, subnets)
- [ ] Security groups
- [ ] Documentation
- [ ] Other: ****\_****

### What does this PR change?

Provide a brief, developer-focused description of the change and the reason for it.

### Related issues

Link related issues or tickets (e.g., Closes #123)

---

## Terraform / Provisioning checklist

Include these commands and attach outputs when applicable.

- [ ] `terraform fmt -check` passes
- [ ] `terraform validate` passes
- [ ] `terraform init` completed (include backend details if non-default)
- [ ] `terraform plan -out=tfplan.binary` was run and plan output attached (or paste relevant snippet)
  - Suggested: `terraform show -no-color tfplan.binary > tfplan.txt` and attach `tfplan.txt`
- [ ] No plaintext secrets were included in commits or attachments
- [ ] If state changes are required, migration steps are documented (e.g., `terraform state mv`, imports)

Notes on plans/state: If you cannot attach a full `terraform plan` or state, paste the smallest failing snippet and the commands you used to reproduce the issue.

---

## Jenkins / Installer checklist

- [ ] If this PR modifies `jenkins/` or `jenkins-runner-script`, include test steps for running the installer locally
- [ ] List required env vars / secrets (do not include secrets in the PR)
- [ ] If new plugins or credentials are required, document how they are provisioned

Example test commands:

```bash
# From repository root
cd jenkins/jenkins-runner-script
bash jenkins-installer.sh  # include any env vars used for testing
```

---

## Testing performed

Describe how you tested this change (local commands, CI, manual steps) and expected vs actual results.

- [ ] Unit / smoke tests performed
- [ ] End-to-end / integration test (describe)
- [ ] Manual verification steps (list URLs, endpoints, ports)

## Files changed

List the most relevant files touched (e.g., `main.tf`, `jenkins/main.tf`, `load-balancer/main.tf`, `networking/main.tf`)

## CI / Pipeline impact

Describe any changes required to CI pipelines, required secrets, or approvals for deployment.

---

## Pre-merge checklist

- [ ] Code reviewed and approved
- [ ] `terraform fmt` and `terraform validate` ran successfully
- [ ] `terraform plan` attached or key excerpts pasted
- [ ] Migration steps for TF state documented when applicable
- [ ] Documentation (README or docs/) updated if behavior changes
- [ ] All CI checks green
- [ ] No sensitive data in commits

**Reviewer(s):** @<!--username-->

## Release notes / changelog (one-line)

Provide a short entry that can be used in release notes or the changelog.

---

Thank you — maintainers: please verify Terraform plan, state migrations, and Jenkins installer steps as part of triage.
