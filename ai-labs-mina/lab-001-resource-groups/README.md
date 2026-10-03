# LAB-001: Resource Groups, Tagging & Cloud Organization

> [!TIP]
> **Jojo's Encouragement**: Welcome to Lab 001, Mina! 🌸 Today, we are mastering one of the most essential building blocks of the entire Microsoft Azure ecosystem: **Resource Groups** and **Resource Tagging**. Think of this as learning how to organize your creative studio. Once you master how Azure organizes items, you will never lose track of a resource, never wonder what something is for, and be able to clean up an entire project with a single click! Let's dive in together! 🚀

---

## 🎯 1. Lab Objective & Real-World Analogy

*   **What You Will Master**:
    1. What **Azure Resource Manager (ARM)** is and how it manages everything in Azure.
    2. How to create, inspect, and organize **Resource Groups** (`rg-lab001-mina`).
    3. How to apply **Azure Tags** (key-value pairs) for metadata, ownership tracking, and cost filtering.
    4. How to protect critical resources from accidental deletion using **Resource Locks** (`CanNotDelete`).
    5. How to automate resource group creation using **Bicep** and **PowerShell**.

*   **Real-World Metaphors**:
    *   **Resource Group** = A labeled, transparent storage bin in your room. If you are building an AI project, you put all the scissors, paper, and glue for *that specific project* into one bin. When the project is finished, emptying the bin removes everything at once.
    *   **Azure Tags** = Color-coded sticky labels placed on the front of the bin (e.g., `Owner: Mina`, `Environment: Learning`, `Project: Azure-AI`). They help you filter and find your bins instantly among hundreds of others.
    *   **Resource Lock** = A child-proof safety latch on the lid of the box. Even if someone tries to throw the box away, Azure will say: *"Hold on! This box is locked and cannot be deleted until you unlock it."*

---

## 🧭 2. Azure Portal Console Guide (Click-by-Click)

*Follow these visual steps in your web browser at [portal.azure.com](https://portal.azure.com)!*

### Step 2.1: Navigate to Resource Groups
1. Open your browser and go to [portal.azure.com](https://portal.azure.com).
2. In the top global search bar, type: `Resource groups`.
3. Click on **Resource groups** under the **Services** category.
4. You will see a list of any existing Resource Groups in your subscription.

---

### Step 2.2: Create a New Resource Group with Tags
1. On the Resource groups page toolbar, click the **+ Create** button.
2. Under the **Basics** tab, configure the following:
   *   **Subscription**: *Select your active subscription*
   *   **Resource group**: `rg-lab001-mina`
   *   **Region**: Select a region close to you (e.g., `East US`, `West Europe`, or `North Europe`).
3. Click **Next: Tags >** at the bottom of the page (do not click *Review + create* yet!).
4. Add the following 4 custom tags:

| Name (Key) | Value | Why We Use It |
| :--- | :--- | :--- |
| `Owner` | `Mina` | Identifies who created and is responsible for this resource group |
| `Environment` | `Learning-Sandbox` | Distinguishes practice resources from production |
| `Project` | `Azure-AI-Journey` | Groups resources under the same learning roadmap |
| `CostCenter` | `Lab-001` | Allows billing reports to group costs by lab module |

5. Click **Review + create** at the bottom.
6. Wait for the green **Validation passed** notification.
7. Click **Create**.
8. Click **Go to resource group** to view your newly created organizer container!

---

### Step 2.3: Exploring Tags and Filtering Resources
1. Inside your `rg-lab001-mina` overview page, look at the top-right properties pane to verify that your 4 tags are displayed.
2. In the left navigation menu under **Settings**, click on **Tags**.
3. Notice how you can add new tags or edit existing ones at any time!
4. In the top search bar of the Azure Portal, type `Tags` and click on the **Tags** service.
5. Search for `Owner` -> Click on value `Mina`. Azure will list all resources and resource groups across your entire subscription that share this tag!

---

### Step 2.4: Protect Your Group with a Resource Lock
*Let's see how Azure protects critical infrastructure from accidental deletion!*

1. Navigate back to your `rg-lab001-mina` resource group.
2. In the left-hand menu, scroll down to the **Settings** section and click on **Locks**.
3. Click the **+ Add** button at the top.
4. Fill in the lock configuration:
   *   **Lock name**: `prevent-accidental-delete`
   *   **Lock type**: Select **Delete** (this corresponds to `CanNotDelete`).
   *   **Notes**: `Safety lock created by Mina to prevent accidental teardown.`
5. Click **OK**.
6. **Test the Lock (Safety Experiment)**:
   *   Click **Overview** in the left menu.
   *   Click the **Delete resource group** button on the top toolbar.
   *   Type `rg-lab001-mina` and click **Delete**.
   *   Notice the red error banner: Azure rejects the deletion because an active lock exists! 🛡️
7. **Unlock for Future Teardown**:
   *   Go back to **Locks** in the left menu.
   *   Click the **...** (ellipsis) next to `prevent-accidental-delete` and click **Delete**.
   *   Your resource group can now be safely deleted when you finish practicing.

---

### Step 2.5: Export the ARM / Bicep Template from the Portal
1. In the left menu of `rg-lab001-mina`, scroll to the **Automation** section and click **Export template**.
2. Azure automatically generates the exact Infrastructure-as-Code (IaC) representation of your resource group and tags!
3. You can download this template or view how Azure translates your visual clicks into code.

---

## 💻 3. Command-Line & Automation Guide (PowerShell / Bicep)

*Prefer automating with code? Here is how to create and manage the exact same infrastructure programmatically!*

### Step 3.1: Open PowerShell in this lab folder
```powershell
cd ai-labs-mina/lab-001-resource-groups
```

### Step 3.2: Verify Azure Login
```powershell
az account show
# or
Get-AzContext
```
*(If not logged in, run `az login` or `Connect-AzAccount`).*

### Step 3.3: Deploy the Lab Resources Automatically
```powershell
.\deploy.ps1
```
*This script will verify your connection, provision `rg-lab001-mina`, apply all 4 tags, and deploy `main.bicep`!*

---

## 🎬 4. Curated Video Learning (Short & Modern)

*Watch these short, beginner-friendly tutorials (under 10 minutes) to visualize today's concepts:*

*   📺 **[Azure Resource Manager & Resource Groups Explained](https://www.youtube.com/watch?v=10PgS3u9m90)** *(Duration: ~8 mins)* — John Savill's crystal-clear visual breakdown of ARM architecture, resource lifecycles, and grouping strategies.
*   📺 **[Organizing Azure Resources with Tags & Locks](https://www.youtube.com/watch?v=wXWbJ4kY50U)** *(Duration: ~7 mins)* — Quick visual walkthrough showing why tags are critical for cost tracking and how resource locks prevent disasters.

---

## 🛡️ 5. Zero-Cost & Safety Guarantee (Cleanup Checklist)

*Resource Groups themselves are 100% FREE in Azure. However, keeping a clean environment is a cloud superpower:*

### Option A: Visual Deletion in Azure Portal
1. Search for `Resource groups` in the top search bar.
2. Click on `rg-lab001-mina`.
3. (Ensure any lock under **Settings > Locks** is removed).
4. Click **Delete resource group** on the top toolbar.
5. Type `rg-lab001-mina` to confirm and click **Delete**.

### Option B: 1-Click Automated Cleanup via PowerShell
```powershell
.\destroy.ps1
```

> [!NOTE]
> Deleting the Resource Group automatically cleans up any resources, tags, and deployments inside it.

---

## ❓ 6. Confused or Want to Learn More?

If any concept felt tricky or you have questions, open [comments.md](file:///c:/Users/a528684/Desktop/file/dev/personal/az/gp/ai-labs-mina/lab-001-resource-groups/comments.md) in this folder, write down your thoughts, and ask:
> **"Hey Jojo, resolve comments in Lab 001"**

I will create dedicated **sub-labs** inside `sub-labs/` with focused, baby-step mini-experiments to give you total confidence! 🌸
