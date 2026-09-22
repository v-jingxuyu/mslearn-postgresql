---
lab:
  title: Run SQL statements and functions in Visual Studio Code
  module: Procedures and functions in PostgreSQL
  description: Select and run the intended SQL from a script containing several candidates.
  duration: 5 minutes
  level: 100
  islab: true
  primarytopics:
    - PostgreSQL
    - Visual Studio Code
---

# Run SQL statements and functions in Visual Studio Code

In this exercise, you use the PostgreSQL extension for Visual Studio Code to select and run specific SQL from a script. The instructions describe the intended result without giving you the SQL text or function name.

## Before you start

The Visual Studio Code environment is already prepared. The PostgreSQL extension is installed, the lab repository is open, and the saved connection is active.

| Connection setting | Value |
| --- | --- |
| Server | `psql-learn-eastus2-hjvgtumw7uyws.postgres.database.azure.com` |
| Port | `5432` |
| Database | `rentals` |
| User name | `pgAdmin` |
| Authentication | Password / SqlLogin |
| SSL mode | `require` |
| Connection name | `mslearn-postgresql-lab` |

Do not create, edit, or switch the PostgreSQL connection. Do not deploy Azure resources.

Before automation begins, open **Allfiles/Labs/05/Lab5_SimpleFunctions.sql** and confirm that the query editor uses the existing **mslearn-postgresql-lab** connection and the **rentals** database. No other setup is required.

## Run a DROP statement

Select the DROP statement and run it.

Confirm that the statement completes without an error. A notice that the table doesn't exist is expected.

## Run a SQL statement

The script contains several independent statements. Run only the statement that confirms which database the editor is connected to.

Confirm that the result contains `rentals` under the **connected_database** column.

## Run a function

Run only the function statement that converts the lab marker to uppercase.

Confirm that the **transformed_marker** column contains:

```text
LAB-RUNNER-PROBE
```

Do not run the entire file and do not edit the SQL. You have completed the exercise when all three requested statements return the expected results and no unrelated statement has been run.
