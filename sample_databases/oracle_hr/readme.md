# Oracle Sample HR Schema
A collection of scripts to set up the sample HR schema in an Oracle database.

## Steps

To create this schema on your database:

1. Download the SQL files in this repository, using either the Git commands or manually downloading them (view file > raw > save as).
2. Open an IDE (e.g. SQL Developer) and connect to your database (container database).
3. Run script 01, which changes to the pluggable database and creates the new HR user.
4. Connect to the database as the new HR user.
5. Run script 02 to create the tables.
6. Run script 03 to populate the tables.
7. Run script 04 to create indexes and comments.

The schema is now set up!

## ERD

Here's the ERD of the HR schema used:
![ERD - Oracle HR Schema](https://user-images.githubusercontent.com/9577031/120085247-c9dd5180-c119-11eb-8d06-d8cfd5a1a60f.png)