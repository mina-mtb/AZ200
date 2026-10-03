# LAB-001 Knowledge Check: Resource Groups, Tagging & Organization

Test your cloud organization and governance skills, Mina! Take your time with these questions. Try to answer on your own before expanding the explanations below. You're doing amazing! 🌟

---

## ❓ Questions

### Question 1: What is a Resource Group?
What is the primary role of an **Azure Resource Group**?
*   **A)** A virtual network router that connects virtual machines to the internet.
*   **B)** A logical container that holds and manages related Azure resources sharing a common lifecycle.
*   **C)** A physical server rack inside Microsoft's datacenter.
*   **D)** A billing invoice sent monthly by Microsoft accounting.

---

### Question 2: The Tag Inheritance Rule (Crucial Concept!)
If you apply a tag `Environment = Production` to a Resource Group called `rg-app-prod`, do the storage accounts and virtual machines created inside that Resource Group automatically inherit the `Environment = Production` tag?
*   **A)** Yes, Azure automatically copies all tags from the Resource Group to all child resources by default.
*   **B)** No, Azure tags applied to a Resource Group are **not** automatically inherited by the resources inside it by default.
*   **C)** Only if the child resources are in the exact same Azure region.
*   **D)** Only if the subscription is an Enterprise Agreement.

---

### Question 3: Geographic Locations & Resource Groups
Suppose you create a Resource Group called `rg-ai-lab` with its location set to `West Europe`. Can you create an Azure OpenAI resource located in `East US` inside this `rg-ai-lab` Resource Group?
*   **A)** No, all resources inside a Resource Group must reside in the identical region as the Resource Group.
*   **B)** Yes, the Resource Group location only specifies where the group's metadata is stored; individual resources can reside in different supported regions.
*   **C)** Yes, but only if you enable cross-region data replication at an extra monthly cost.
*   **D)** No, Azure Resource Manager restricts resources to the same continent.

---

### Question 4: Resource Locks (`CanNotDelete` vs `ReadOnly`)
You have a critical production database. You want administrators and applications to be able to read data and write updates, but you want to completely prevent anyone from accidentally deleting the database resource in the portal. Which lock should you apply?
*   **A)** `ReadOnly` lock
*   **B)** `CanNotDelete` lock (also known as *Delete* lock)
*   **C)** `NoAccess` lock
*   **D)** `Biometric` lock

---

### Question 5: What Happens Under a `ReadOnly` Lock?
If you apply a `ReadOnly` lock to a Resource Group containing a Virtual Machine:
*   **A)** Users can only delete the VM, but cannot start it.
*   **B)** Authorized users can read the VM's settings, but nobody can start, stop, restart, modify, or delete the VM.
*   **C)** The VM's operating system password is removed.
*   **D)** The VM is converted into a static website automatically.

---

### Question 6: Moving Resources Between Groups
Can an existing Azure resource (such as a Virtual Network or Storage Account) be moved from one Resource Group to another Resource Group within the same subscription?
*   **A)** No, once a resource is created, its Resource Group assignment is permanent forever.
*   **B)** Yes, most Azure resources can be moved to a different Resource Group or even a different Subscription without recreating them.
*   **C)** Only if you export and re-import the data through a CSV file.
*   **D)** Only during Microsoft's scheduled maintenance windows.

---

### Question 7: Azure Tags Anatomy
Which of the following is a valid example of an Azure Tag pair?
*   **A)** `IP_Address: 192.168.1.1/24`
*   **B)** `Name: "Owner" / Value: "Mina"`
*   **C)** `Password = SuperSecret123!`
*   **D)** `Port: 443 -> TCP`

---

### Question 8: Recommended Cloud Lifecycle Strategy
What is the recommended Microsoft Cloud Adoption Framework best practice for grouping resources into Resource Groups?
*   **A)** Put every single resource in your company into one giant Resource Group called `rg-everything`.
*   **B)** Group resources that share the same lifecycle (deployed together, updated together, and deleted together) into the same Resource Group.
*   **C)** Create a new Resource Group for every single individual file uploaded to the cloud.
*   **D)** Always create Resource Groups with random numbers as names.

---

## 🔑 Answer Key & In-Depth Explanations

<details>
<summary><b>Click to reveal Answer Key & Explanations 🌸</b></summary>

### Question 1: Correct Answer **B) A logical container that holds and manages related Azure resources sharing a common lifecycle**
*   **Why it's correct**: Resource Groups are the fundamental organizational unit in Azure. They group resources so you can manage access control (RBAC), view consolidated costs, and deploy or delete the entire workload as a single cohesive unit.
*   **Why other options are incorrect**: A Resource Group is not hardware (rack/router) nor a billing invoice; it is a logical management container in Azure Resource Manager (ARM).
*   📖 **Reference**: [Microsoft Learn: Manage Azure Resource Groups](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal)

---

### Question 2: Correct Answer **B) No, Azure tags applied to a Resource Group are NOT automatically inherited by resources inside by default**
*   **Why it's correct**: This is one of the most famous exam gotchas and real-world surprises! Applying tags to a Resource Group labels *only the group itself*. If you want resources inside to also have those tags, you must apply tags directly to the resources, use Infrastructure-as-Code (like Bicep), or configure an **Azure Policy** to automatically propagate tags.
*   **Why other options are incorrect**: Azure does not automatically cascade tags down to child resources by default.
*   📖 **Reference**: [Microsoft Learn: Tag inheritance and Azure Policy](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources#tag-inheritance)

---

### Question 3: Correct Answer **B) Yes, the Resource Group location only specifies where the group's metadata is stored**
*   **Why it's correct**: When you choose a location for a Resource Group, you are only deciding where ARM stores internal metadata about the group. The resources placed inside that group can be deployed into any Azure region where those services are available.
*   **Why other options are incorrect**: Resources do not have to match the Resource Group's location, and no special fees or replication are required.
*   📖 **Reference**: [Microsoft Learn: Resource group location vs resource location](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview#resource-groups)

---

### Question 4: Correct Answer **B) CanNotDelete lock (Delete lock)**
*   **Why it's correct**: A `CanNotDelete` lock allows authorized users to still read and modify (write, update, configure) the resource, but blocks any action that attempts to delete it. This is the perfect safety net for databases, AI models, and storage accounts.
*   **Why other options are incorrect**:
    *   *A (ReadOnly)*: A ReadOnly lock would also block writing updates or changing settings, which is too restrictive for an active database.
    *   *C & D*: These are not valid Azure lock types.
*   📖 **Reference**: [Microsoft Learn: Lock resources to prevent unexpected changes](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources)

---

### Question 5: Correct Answer **B) Authorized users can read the VM's settings, but nobody can start, stop, restart, modify, or delete the VM**
*   **Why it's correct**: A `ReadOnly` lock is strictly read-only. In Azure, operations like starting, stopping, or deallocating a VM send control-plane `POST`/`PUT` requests to ARM, which a ReadOnly lock completely blocks!
*   **Why other options are incorrect**: ReadOnly locks block all modifications and state transitions, not just deletes.
*   📖 **Reference**: [Microsoft Learn: Understand ReadOnly locks](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources#considerations-before-applying-locks)

---

### Question 6: Correct Answer **B) Yes, most Azure resources can be moved to a different Resource Group or Subscription**
*   **Why it's correct**: Azure provides native support for moving resources between Resource Groups and Subscriptions via the Portal, CLI, or PowerShell without downtime for the vast majority of services.
*   **Why other options are incorrect**: Resource membership is flexible and not locked in forever.
*   📖 **Reference**: [Microsoft Learn: Move resources to a new resource group](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription)

---

### Question 7: Correct Answer **B) Name: "Owner" / Value: "Mina"**
*   **Why it's correct**: Azure Tags are simple Key-Value (Name-Value) string pairs attached to resources (e.g., `Environment: Development`, `Owner: Mina`, `Project: Alpha`).
*   **Why other options are incorrect**: Tags are metadata labels, not networking subnets or sensitive credentials (passwords should never be stored in tags!).
*   📖 **Reference**: [Microsoft Learn: Use tags to organize your Azure resources](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources)

---

### Question 8: Correct Answer **B) Group resources that share the same lifecycle into the same Resource Group**
*   **Why it's correct**: The golden rule of Azure architecture is to group resources by **lifecycle and environment**. For instance, an application's Web App, Database, and Storage Account in `Dev` should live together in `rg-app-dev`. When testing is complete, deleting `rg-app-dev` cleanly removes the entire test environment with zero leftover costs.
*   **Why other options are incorrect**: Placing all company resources in a single group creates chaos, permission bottlenecks, and impossible cost tracking.
*   📖 **Reference**: [Microsoft Cloud Adoption Framework: Resource organization](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-group-allocation)

---

</details>
