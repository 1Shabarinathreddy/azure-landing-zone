# azure-landing-zone
Terraform project to set up Azure Landing Zone with management groups, networking, policies and CI/CD.

This project uses Terraform to set up an Azure Landing Zone.
Think of it as building the foundation of an Azure environment 
before any actual applications are deployed.

It covers the basics that every Azure environment needs —
how subscriptions are organised, where logs go, how the 
network is structured and what rules are enforced.

## What it creates

Management groups to organise subscriptions into a hierarchy
A Log Analytics workspace to collect and store logs
A Hub virtual network with subnets for firewall, gateway and bastion
Azure policies to control where resources are deployed and enforce tags

## How to run

First create a terraform.tfvars file in the root folder.
This file holds your own Azure values and is not pushed 
to GitHub for security reasons.

Add these values to your terraform.tfvars:

    management_subscription_id = "your-subscription-id"
    root_management_group_id   = "your-tenant-id"
    location                   = "eastus"
    environment                = "prod"
    tags = {
      project    = "azure-landing-zone"
      managed_by = "terraform"
      owner      = "your-name"
    }

Then run:

    terraform init
    terraform plan
    terraform apply

## Tools used

 Terraform
 Azure
 Git

