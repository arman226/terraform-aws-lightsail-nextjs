# NEXTJS APP + AWS LIGHTSAIL + TERRAFORM + GITHUB ACTIONS

Deployment of **NextJS** app on **_AWS Lightsail_**, using **_Terraform_** for infrastructure and **_Github Actions_** for CI/CD.

## SCOPE

✅ Terraform setup to provision Lightsail Instance
✅ Github Actions to build and deploy Nextjs app
✅ Basic Server setup script for the instance

## PROJECT STRUCTURE

```bash
root/
├── .github/
│ └── workflows/
│ └── deploy.yml
├── sample-integration/
│ ├── package.json
│ ├── next.config.js
│ └── etc...
└── terraform/
├── main.tf
├── variables.tf
└── init.sh
```
