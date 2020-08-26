Terraform (Dirty) Version Manager
---

# Install

Clone repository to `$HOME/.terraform`. Expects the following file structure.

```bash
$HOME/.terraform
├── bin         # will be created if it does not exist
├── cache       # will be created if it does not exist
├── README.md
└── scripts

```

Add the following aliases

```bash
alias terraform_install="$HOME/.terraform/scripts/install.sh"
alias terraform_uninstall="$HOME/.terraform/scripts/uninstall.sh"
alias terraform_list_versions="$HOME/.terraform/scripts/list_versions.sh"
```

# Usage

- `terraform_list_versions` - List all versions.
- `terraform_list_versions <search>` - Search versions.
- `terraform_install <exact_version>` - Install terraform version.
- `terraform_uninstall` - Delete all version of terraform.
