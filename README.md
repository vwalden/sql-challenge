# sql-challenge

This assignment created a new locally hosted PostgreSQL database, new tables with constraints and executed eight queries against the database.

## Data cleanup before importing csv files

    1.Date fields were updated to YYYY-MM-DD format before importing to conform with DATE datatype.
    2.Assuming the first name "TRUE" was a data entry error, it was replaced with "Troo".

## Order of work

Tables were created and data from CSV files were loaded into the database in the following order:

    1.departments
    2.titles
    3.employees
    4.dept_emp
    5.dept_manager
    6.salaries