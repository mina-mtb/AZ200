# LAB-000 Knowledge Check: Azure Portal & Cost Safety Net

Test your understanding of today's foundational concepts, Mina! Try to answer each question before clicking to reveal the explanations. You've got this! 🌟

---

## ❓ Questions

### Question 1: The Azure Hierarchy
Which Azure construct acts as the **billing boundary** where payment methods and credit cards are attached?
*   **A)** Resource Group
*   **B)** Azure Subscription
*   **C)** Resource Tag
*   **D)** Management Group

---

### Question 2: Resource Groups Lifecycle
If you create 5 virtual machines, 2 storage accounts, and 1 database inside a single Resource Group called `rg-lab000-mina`, what happens when you delete `rg-lab000-mina`?
*   **A)** Only the Resource Group container is deleted; all 5 VMs and databases remain running.
*   **B)** The portal will throw an error and refuse to delete until you delete each resource one-by-one.
*   **C)** All resources inside the Resource Group are deleted simultaneously and automatically.
*   **D)** The resources are archived to an external backup storage account for 30 days.

---

### Question 3: Budget Alerts Behavior
What happens by default when your Azure spending reaches 100% of a configured Azure Budget?
*   **A)** Azure immediately shuts down and powers off all your running servers.
*   **B)** Azure sends an automated notification email to the configured email addresses, but leaves resources running.
*   **C)** Azure automatically deletes the subscription to prevent credit card charges.
*   **D)** Azure upgrades your account to an Enterprise Agreement automatically.

---

### Question 4: Multi-Resource Group Assignment
Can a single Azure Storage Account belong to two different Resource Groups at the same time?
*   **A)** Yes, as long as both Resource Groups are in the same Azure region.
*   **B)** Yes, if you apply a shared tag to both Resource Groups.
*   **C)** No, an Azure resource can only belong to exactly one Resource Group at any given time.
*   **D)** Yes, up to a maximum limit of 5 Resource Groups per resource.

---

### Question 5: Portal Navigation Shortcut
What is the fastest and most reliable way to find any service, resource, or documentation inside the Azure Portal web interface?
*   **A)** Scrolling through the alphabetical list in the left collapsible menu.
*   **B)** Typing the name of the service into the top global search bar.
*   **C)** Opening Cloud Shell and running `az find service`.
*   **D)** Refreshing your browser window repeatedly.

---

### Question 6: What is Bicep?
In this lab, what is the role of the `main.bicep` file?
*   **A)** It is a Python script that trains machine learning models.
*   **B)** It is an Infrastructure-as-Code (IaC) template that describes what cloud resources to create declaratively.
*   **C)** It is a password file used to log into Windows virtual machines.
*   **D)** It is a billing receipt downloaded from Microsoft Cost Management.

---

### Question 7: Resource Group Regions
If a Resource Group is created in the `East US` region, can you deploy a resource (like a Storage Account) into `West Europe` inside that same Resource Group?
*   **A)** Yes, resources inside a Resource Group can reside in different geographic regions than the Resource Group itself.
*   **B)** No, every resource inside a Resource Group must strictly be in the exact same region as the Resource Group.
*   **C)** Only if you pay an additional multi-region subscription fee.
*   **D)** Only if the Resource Group was created using PowerShell.

---

### Question 8: Safe Practice Habit
What is the recommended best practice after completing any hands-on practice lab in Azure?
*   **A)** Leave everything running so you don't have to recreate it next week.
*   **B)** Run `.\destroy.ps1` or delete the lab's Resource Group in the portal to ensure zero ongoing costs.
*   **C)** Change your Azure account password.
*   **D)** Turn off your computer's Wi-Fi.

---

## 🔑 Answer Key & In-Depth Explanations

<details>
<summary><b>Click to reveal Answer Key & Explanations 🌸</b></summary>

### Question 1: Correct Answer **B) Azure Subscription**
*   **Why it's correct**: The **Subscription** is the billing and governance boundary in Azure. Every dollar spent on cloud resources is billed to the payment method associated with that specific subscription.
*   **Why other options are incorrect**:
    *   *A (Resource Group)*: Resource Groups are organizational folders, not billing accounts.
    *   *C (Tag)*: Tags are simple key-value metadata labels for organizing resources.
    *   *D (Management Group)*: Management Groups sit above subscriptions to manage organizational policies across multiple subscriptions.
*   📖 **Reference**: [Microsoft Learn: Subscriptions overview](https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/create-subscription)

---

### Question 2: Correct Answer **C) All resources inside are deleted simultaneously and automatically**
*   **Why it's correct**: A Resource Group serves as a complete lifecycle boundary. Deleting the Resource Group cascades down to delete every single resource contained within it. This makes cleanup effortless and foolproof!
*   **Why other options are incorrect**: You do not have to delete resources one by one, and resources do not stay behind orphaned.
*   📖 **Reference**: [Microsoft Learn: Manage Resource Groups](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)

---

### Question 3: Correct Answer **B) Azure sends an automated notification email, but leaves resources running**
*   **Why it's correct**: By default, Azure Budgets are **informational alerts**. When a threshold (like 100%) is crossed, Azure immediately sends an email to warn you, giving you the power to decide whether to shut things down. (You can optionally configure Action Groups to stop VMs if desired).
*   **Why other options are incorrect**: Azure will not abruptly shut down production services or delete your account on standard budget thresholds.
*   📖 **Reference**: [Microsoft Learn: Create and manage Azure budgets](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/tutorial-acm-create-budgets)

---

### Question 4: Correct Answer **C) No, an Azure resource can only belong to exactly one Resource Group at a time**
*   **Why it's correct**: In Azure, every resource must have a single home. It belongs to exactly one Resource Group, though you can move resources between Resource Groups whenever needed.
*   📖 **Reference**: [Microsoft Learn: Move resources to a new resource group](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription)

---

### Question 5: Correct Answer **B) Typing the name into the top global search bar**
*   **Why it's correct**: The global search bar at the top center of [portal.azure.com](https://portal.azure.com) searches across services, your existing resources, documentation, and marketplace offerings instantly.
*   📖 **Reference**: [Microsoft Learn: Azure Portal Overview](https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-overview)

---

### Question 6: Correct Answer **B) It is an Infrastructure-as-Code (IaC) template**
*   **Why it's correct**: Bicep is Microsoft's domain-specific language (DSL) for deploying Azure resources declaratively. You specify *what* you want (e.g., tags, storage accounts), and Azure handles creating it.
*   📖 **Reference**: [Microsoft Learn: What is Bicep?](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview)

---

### Question 7: Correct Answer **A) Yes, resources inside a Resource Group can reside in different geographic regions**
*   **Why it's correct**: The Resource Group's location only determines where the *metadata* about the group is stored. You can freely place resources from different regions (e.g. East US, West Europe, Japan East) inside the same Resource Group!
*   📖 **Reference**: [Microsoft Learn: Resource group location vs resource location](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview#resource-groups)

---

### Question 8: Correct Answer **B) Run `.\destroy.ps1` or delete the lab Resource Group**
*   **Why it's correct**: Clean habits prevent cloud bill surprises! Deleting practice resource groups immediately after studying ensures your cloud spend remains $0.
*   📖 **Reference**: [Microsoft Learn: Prevent unexpected costs with Azure free account](https://learn.microsoft.com/en-us/azure/cost-management-billing/manage/avoid-charges-free-account)

</details>
