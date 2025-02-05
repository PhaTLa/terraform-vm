# Terraform VM Project

This project provides a Terraform configuration to deploy and manage virtual machines (VMs) in a cloud environment. It is designed to be flexible and customizable, allowing users to easily adapt it to their specific needs.

## Features

- Deploy VMs with customizable configurations
- Support for multiple cloud providers
- Automated provisioning and management
- Easy integration with existing infrastructure

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Cloud provider account (e.g., AWS, Azure, GCP)
- Properly configured cloud provider credentials

## Usage

1. Clone the repository:

    ```sh
    git clone https://github.com/PhaTLa/terraform-vm-project.git
    cd terraform-vm-project
    ```

2. Initialize the Terraform configuration:

    ```sh
    terraform init
    ```

3. Customize the `variables.tf` file with your desired configuration.

4. Apply the Terraform configuration to deploy the VMs:

    ```sh
    terraform apply
    ```

5. Confirm the apply action by typing `yes` when prompted.
