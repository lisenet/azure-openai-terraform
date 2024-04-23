# azure-openai-terraform

## Pre-requisites

Azure OpenAI requires registration. Customers who wish to use Azure OpenAI are required to submit a registration form.

1. Create an [Azure account](https://portal.azure.com/).
2. Request access to Azure OpenAI service.
3. Install Terraform.

## Installation

Terraform supports a number of different methods for authenticating to Azure, see [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli).

You will need the `az` binary in order to create Terraform resources using the Azure provider.

### Install the Azure CLI and Terraform: RPM-based OS

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo yum install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
sudo yum install azure-cli
```

```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

## Disclaimer

Azure OpenAI service resources provisioned by Terraform code in this repository will be accessible from all networks, including the Internet.

If you wish to restrict access to your IP only, you can do so by modifying the file `main.tf` and updating the network ACL block, e.g.:

```
network_acls {
  default_action = "DENY"
  ip_rules       = ["1.2.3.4"]
}
```

## Terraform Azure

Terraform state is stored by default in a local file named `terraform.tfstate`. This repository does not use a remote state file.

### Log into Azure with your Microsoft Account

You must do this before running Terraform:

```bash
az login
```

### Create Azure OpenAI Resources

```bash
terraform init -upgrade
terraform apply
```

### Retrieve OpenAI Endpoint and Keys Used to Access Azure AI Services API

Retrieve your OpenAI endpoint URL.

```bash
terraform output azure_openai_endpoint
```

Only one key is necessary to make an API call.

```bash
terraform output openai_primary_access_key
```

When regenerating the first key, you can use the second key for continued access to the service.

```bash
terraform output openai_secondary_access_key
```

## Azure OpenAI Python Demo

Use `openai-demo.py` script to submit a prompt to your Azure OpenAI service and receive an output.

Install `openai` using `pip`:

```bash
pip install openai==0.28
```

Export environment variables:

```bash
cd ./terraform/
export AZURE_OPENAI_ENDPOINT=$(terraform output -raw azure_openai_endpoint)
export AZURE_OPENAI_API_KEY=$(terraform output -raw openai_primary_access_key)
```

Run the Python script:

```bash
./openai-demo.py
```

You should get output similar to the one below.

```json
{
  "choices": [
    {
      "content_filter_results": {
        "hate": {
          "filtered": false,
          "severity": "safe"
        },
        "self_harm": {
          "filtered": false,
          "severity": "safe"
        },
        "sexual": {
          "filtered": false,
          "severity": "safe"
        },
        "violence": {
          "filtered": false,
          "severity": "safe"
        }
      },
      "finish_reason": "stop",
      "index": 0,
      "logprobs": null,
      "message": {
        "content": "The capital city of the UK is London.",
        "role": "assistant"
      }
    }
  ],
  "created": 1713805619,
  "id": "chatcmpl-9GrQ37I3RExn2umvVIoIkL71auwRk",
  "model": "gpt-35-turbo",
  "object": "chat.completion",
  "prompt_filter_results": [
    {
      "prompt_index": 0,
      "content_filter_results": {
        "hate": {
          "filtered": false,
          "severity": "safe"
        },
        "self_harm": {
          "filtered": false,
          "severity": "safe"
        },
        "sexual": {
          "filtered": false,
          "severity": "safe"
        },
        "violence": {
          "filtered": false,
          "severity": "safe"
        }
      }
    }
  ],
  "system_fingerprint": null,
  "usage": {
    "completion_tokens": 9,
    "prompt_tokens": 27,
    "total_tokens": 36
  }
}
```
