# Azure AI Cloud Developer Associate (AI-200) - Study Labs

A hands-on learning repository for preparing for Microsoft's **Azure AI Cloud Developer Associate** certification and its **AI-200** exam.

> [!IMPORTANT]
> **AZ-200 and AI-200 are different exams.** AZ-200 (Microsoft Azure Developer Core Solutions) was retired in 2019. This repository is for the newer AI-200 certification path.

## Certification at a glance

The certification is for developers who build AI solutions on Azure, with emphasis on backend services and the full development lifecycle. Microsoft's current exam page identifies these assessed areas:

- Develop containerized solutions on Azure
- Develop AI solutions by using Azure data management services
- Connect to and consume Azure services
- Secure, monitor, and troubleshoot Azure solutions

Review Microsoft's [AI-200 study guide](https://aka.ms/AI200-StudyGuide) for the authoritative skills outline and updates. See the [official certification page](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-cloud-developer-associate/) for current exam details, languages, and scheduling. The exam page currently notes that a practice assessment is not available.

## What's in this repository

This repository is a work in progress. Its current labs focus on Azure foundations that support later development work; they do **not** yet cover every AI-200 exam objective.

| Path | Contents |
| --- | --- |
| [`ai-labs/roadmap-mina.md`](ai-labs/roadmap-mina.md) | Learning roadmap and progress tracker |
| [`ai-labs-mina/lab-000-portal-cost-safety/`](ai-labs-mina/lab-000-portal-cost-safety/) | Azure portal orientation, subscriptions, budget alerts, and resource-group basics |
| [`ai-labs-mina/lab-001-resource-groups/`](ai-labs-mina/lab-001-resource-groups/) | Resource groups, tags, resource locks, Bicep, and PowerShell |
| [`.ai/agents/roles/`](.ai/agents/roles/) | Optional AI learning and lab-design role instructions |

The roadmap includes broader Azure AI learning material. As this repository grows, labs should be mapped to the current AI-200 study guide rather than treating the roadmap as a complete exam blueprint.

## Getting started

1. Install [Git](https://git-scm.com/downloads), [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli), and [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install).
2. Clone the repository:

   ```bash
   git clone https://github.com/mina-mtb/AZ200.git
   cd AZ200
   ```

   Or use SSH:

   ```bash
   git clone git@github.com:mina-mtb/AZ200.git
   ```

3. Start with [Lab 000](ai-labs-mina/lab-000-portal-cost-safety/README.md), then continue to [Lab 001](ai-labs-mina/lab-001-resource-groups/README.md).
4. Use the official [AI-200 study guide](https://aka.ms/AI200-StudyGuide) alongside the labs, and check Microsoft's certification page for changes before booking an exam.

## Cost and security

- Azure resources may incur charges. A budget alert sends notifications; it is **not** a spending cap and does not automatically stop resources.
- Follow each lab's cleanup instructions and verify that billable resources have been deleted when you finish.
- Never commit passwords, access tokens, subscription-specific secrets, private keys, or local environment files. Keep them in a secure local secret store.

## Disclaimer

This is an independent study project and is not affiliated with or endorsed by Microsoft. Certification requirements and exam details can change; Microsoft's official certification page and study guide are the source of truth.
