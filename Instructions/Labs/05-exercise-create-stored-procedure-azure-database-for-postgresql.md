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

You need the following installed on your computer:

- Visual Studio Code.
- PostgreSQL extension by Microsoft.

You also need a saved connection to any PostgreSQL database.

## Connect to the PostgreSQL extension in Visual Studio Code

1. Open Visual Studio Code and open the **mslearn-postgresql** folder.

1. Select the **PostgreSQL** icon in the left menu.

1. Connect to a PostgreSQL server and database.

1. Select **File**, **Open File**, navigate to **Allfiles/Labs/05**, and open **Lab5_SimpleFunctions.sql**.

1. On the lower right of Visual Studio Code, make sure the query editor shows an active PostgreSQL connection.

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