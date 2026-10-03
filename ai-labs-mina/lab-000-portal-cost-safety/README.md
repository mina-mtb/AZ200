# LAB-000: Azure Portal Safari & Cost Management Safety Net

> [!TIP]
> **Jojo's Encouragement**: Welcome to the cloud, Mina! 🌸 Today is your very first day exploring Microsoft Azure. It's completely normal to feel a little overwhelmed by all the buttons and menus, but remember: **you cannot break anything, and you will not get accidental surprise bills.** We are going to take gentle baby steps, tour the Azure Portal web console, and set up a personal "Cost Safety Net" so you can practice with 100% peace of mind! 🚀

---

## 🎯 1. Lab Objective & Real-World Analogy

*   **What You Will Learn**:
    1. How to log into and navigate the **Azure Portal Web Console** ([portal.azure.com](https://portal.azure.com)).
    2. What an **Azure Subscription** and a **Resource Group** are.
    3. How to configure a **Budget Alert** to notify you by email before you ever spend money.
    4. How to create and delete your first cloud resource group both visually and via code.

*   **Real-World Metaphor**:
    *   **Azure Subscription** = The main utility contract for your house (where electricity and water are billed).
    *   **Resource Group** = A labeled plastic organizer box inside your room where you keep all items for a specific craft project. When you throw the box away, everything inside gets thrown away together!
    *   **Budget Alert** = An alert on your phone that chimes when your electricity meter reaches a specific small number.

---

## 🧭 2. Azure Portal Console Guide (Click-by-Click)

*Follow these steps in your web browser to explore Azure visually!*

### Step 2.1: Sign In & Orientation
1. Open your browser and go to [portal.azure.com](https://portal.azure.com).
2. Sign in with your Azure or Microsoft Learn sandbox account.
3. Take a look at the **Top Navigation Bar**:
   *   🔍 **Global Search Bar (Center)**: Your best friend! You can type the name of any service (e.g., `Subscriptions`, `Storage`, `OpenAI`) to jump directly to it.
   *   ☁️ **Cloud Shell (`>_`)**: An embedded command-line shell right in your browser.
   *   🔔 **Notifications (Bell Icon)**: Shows the real-time status of deployments and deletions.
   *   ⚙️ **Portal Settings (Gear Icon)**: Customize your theme (Dark mode, Light mode) and language.
   *   👤 **Account Profile (Top Right)**: Shows your email and active tenant directory.

---

### Step 2.2: Inspect Your Active Subscription
1. In the top search bar, type `Subscriptions` and click on **Subscriptions** under Services.
2. You will see a list of your subscriptions. Notice:
   *   **Subscription Name** (e.g., *Azure subscription 1*, *Pay-As-You-Go*, or *Azure for Students*).
   *   **Subscription ID** (A unique GUID identifying your billing account).
   *   **Status** (Should show a green checkmark with `Active`).

---

### Step 2.3: Set Up a Zero-Dollar / Low-Cost Budget Alert (Safety Net)
1. Click on your active subscription name from the list.
2. In the left-hand menu, scroll down to the **Cost Management** section and click on **Budgets**.
3. Click the **+ Add** button at the top.
4. Fill in the budget details:
   *   **Name**: `mina-monthly-safety-budget`
   *   **Reset period**: `Monthly`
   *   **Creation date**: Today's date
   *   **Amount**: Enter a low threshold (e.g., `$5.00` or `$10.00` depending on your currency).
5. Click **Next** to configure alert conditions:
   *   **% of budget**: Type `50` (Alert me when I reach 50% of the budget).
   *   **Alert recipients (email)**: Type your personal email address.
   *   Add a second row with `% of budget`: `100` with your email.
6. Click **Create**. You now have an automatic email tripwire protecting your account! 🎉

---

### Step 2.4: Create Your First Resource Group Visually
1. In the top search bar, type `Resource groups` and click on **Resource groups**.
2. Click **+ Create** in the top-left toolbar.
3. Fill in the form:
   *   **Subscription**: Select your active subscription.
   *   **Resource group**: `rg-lab000-mina`
   *   **Region**: Choose a region close to you (e.g., `East US`, `West Europe`, or `North Europe`).
4. Click **Review + create** at the bottom, wait for validation to pass, and click **Create**.
5. Click **Go to resource group** to view your brand new container!

---

## 💻 3. Command-Line & Automation Guide (PowerShell / Bicep)

*In addition to clicking in the web browser, developers also use code to automate deployments. Let's see how easy it is!*

### Step 3.1: Open PowerShell in this lab folder
```powershell
cd ai-labs-mina/lab-000-portal-cost-safety
```

### Step 3.2: Log into Azure from PowerShell
```powershell
Connect-AzAccount
# or using Azure CLI:
az login
```

### Step 3.3: Deploy the Lab Resources Automatically
```powershell
.\deploy.ps1
```
*The script will automatically check your connection, create the resource group `rg-lab000-mina`, and apply tags!*

---

## 🎬 4. Curated Video Learning (Short & Modern)

*Watch these short, beginner-friendly tutorials (under 10 minutes) to visualize today's concepts:*

*   📺 **[Azure Portal Walkthrough for Absolute Beginners](https://www.youtube.com/watch?v=NPEsD6n9A_I)** *(Duration: ~6 mins)* — A gentle, modern tour of the Azure Portal UI layout and navigation shortcuts.
*   📺 **[Azure Subscriptions & Resource Groups Explained](https://www.youtube.com/watch?v=10PgS3u9m90)** *(Duration: ~8 mins)* — Crystal-clear visual explanation by John Savill on how subscriptions and resource groups organize your cloud.

---

## 🛡️ 5. Zero-Cost & Safety Guarantee (Cleanup Checklist)

*Always make sure your environment is completely clean after finishing a lab:*

### Option A: Visual Deletion in Azure Portal
1. Search for `Resource groups` in the top search bar.
2. Click on `rg-lab000-mina`.
3. Click **Delete resource group** on the top toolbar.
4. Type `rg-lab000-mina` to confirm and click **Delete**.

### Option B: 1-Click Automated Cleanup
```powershell
.\destroy.ps1
```

> [!NOTE]
> Resource Groups in Azure act as absolute boundaries. When you delete the Resource Group, 100% of any resources inside it are deleted instantly, leaving zero ongoing charges.

---

## ❓ 6. Confused or Want to Learn More?

If any step felt confusing or you have questions, open [comments.md](file:///c:/Users/a528684/Desktop/file/dev/personal/az/ai-labs-mina/lab-000-portal-cost-safety/comments.md) in this folder, write down your thoughts, and ask:
> **"Hey Jojo, resolve comments in Lab 000"**

I will create dedicated **sub-labs** inside this folder to explain each point with baby steps! 🌸
