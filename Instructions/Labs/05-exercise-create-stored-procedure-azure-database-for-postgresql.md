---
lab:
  title: Run SQL statements and functions in Visual Studio Code
  module: Procedures and functions in PostgreSQL
  description: Select and run the intended SQL from a script containing several candidates.
  duration: 15 minutes
  level: 100
  islab: true
  primarytopics:
    - PostgreSQL
    - Visual Studio Code
---

# Run SQL statements and functions in Visual Studio Code

In this exercise, you use the PostgreSQL extension for Visual Studio Code to select and run specific SQL from a script. The instructions describe the intended result without giving you the SQL text or function name.

## Before you start

You need the following installed on your computer:

- Visual Studio Code.
- PostgreSQL extension by Microsoft.
- Azure CLI.
- Git.

You also need access to an Azure subscription. This exercise deploys a temporary Azure Database for PostgreSQL server and creates the saved connection used to run the SQL.

## Prepare the exercise files

1. Open Visual Studio Code.

1. If the **mslearn-postgresql** repository is not already available, open an integrated PowerShell terminal and run:

  ```powershell
  Set-Location $HOME
  git clone https://github.com/v-jingxuyu/mslearn-postgresql.git
  ```

1. Select **File**, **Open Folder**, and open the **mslearn-postgresql** folder.

## Deploy the PostgreSQL server

1. Open an integrated PowerShell terminal in the **mslearn-postgresql** folder.

1. Run `az account show`. If it reports that you are not signed in, run `az login`, complete sign-in with the prepared account, and return to the terminal.

1. Run the following commands from the repository root. Keep this terminal open because the generated password remains in the current PowerShell session.

  ```powershell
  $location = "eastus2"
  $resourceGroupName = "rg-mslearn-postgresql-lab"
  $adminPassword = "Pg!" + [guid]::NewGuid().ToString("N") + "9a"
  $clientIpAddress = (Invoke-RestMethod -Uri "https://api.ipify.org").Trim()

  az group create --name $resourceGroupName --location $location

  $outputs = az deployment group create `
    --resource-group $resourceGroupName `
    --template-file "Allfiles/Labs/Shared/deploy-postgresql-server.bicep" `
    --parameters adminLogin=pgAdmin adminLoginPassword=$adminPassword clientIpAddress=$clientIpAddress `
    --query properties.outputs `
    --output json | ConvertFrom-Json

  $serverFqdn = $outputs.serverFqdn.value
  $serverName = $outputs.serverName.value
  Write-Host "Server name: $serverFqdn"
  Write-Host "Connection name: $serverName"
  $adminPassword | Set-Clipboard
  ```

1. Confirm that the deployment succeeds and that the terminal displays values for **Server name** and **Connection name**. The administrator password is copied to the clipboard; do not print or save it in a file.

## Connect to the PostgreSQL extension in Visual Studio Code

1. Select the **PostgreSQL** icon in the left menu.

1. If no server group is available under **Connections**, select **Add Connection**. On the **Create Server Group** page, enter **mslearn-postgresql-lab** in **Name**, leave **Description** empty, and select **Create**. If the server group already exists, reuse it.

1. Under the **mslearn-postgresql-lab** server group, select **Add Connection**. In the **New Connection** dialog, enter these values:

  - **Server name**: the **Server name** value displayed by the deployment command.
  - **Port**: **5432**, if this field is displayed.
  - **Authentication type**: **Password**.
  - **User name**: **pgAdmin**.
  - **Password**: paste the password from the clipboard.
  - **Save password**: selected.
  - **Database name**: **postgres**, if this field is displayed.
  - **SSL mode**: **Require**, if this field is displayed.
  - **Server group**: **mslearn-postgresql-lab**, if this field is displayed.
  - **Connection name**: the **Connection name** value displayed by the deployment command.

1. Select **Test Connection**. After the test succeeds, select **Save & Connect**. If the test fails, verify the values instead of creating another server group or connection.

1. Expand the saved connection and confirm that the **postgres** database is listed.

1. Select **File**, **Open File**, navigate to **Allfiles/Labs/05**, and open **Lab5_SimpleFunctions.sql**.

1. On the lower right of Visual Studio Code, make sure the query editor shows an active PostgreSQL connection. If it shows **PGSQL Disconnected**, select it and choose the saved connection. Select the **postgres** database if prompted.

## Run a DROP statement

Select the DROP statement and run it.

Confirm that the statement completes without an error. A notice that the table doesn't exist is expected.

## Run a SQL statement

The script contains several independent statements. Run only the statement that confirms which database the editor is connected to.

Confirm that the result contains one row under the **connected_database** column.

## Run a function

Run only the function statement that converts the lab marker to uppercase.

Confirm that the **transformed_marker** column contains:

```text
LAB-RUNNER-PROBE
```

Do not run the entire file and do not edit the SQL. You have completed the exercise when all three requested statements return the expected results and no unrelated statement has been run.

## Clean up

After completing the exercise, run the following command in the integrated terminal to delete the temporary PostgreSQL server and its resource group:

```powershell
az group delete --name rg-mslearn-postgresql-lab --yes --no-wait
```