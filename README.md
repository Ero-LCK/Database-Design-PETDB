# Pet Clinic Database

A relational database created for a Database Systems team assignment. It models the information a pet clinic could use to manage pets, owners, staff, appointments, examinations, treatments and admissions.

## Database contents

The database includes 11 tables:

- `pet` and `owner`
- `staff` and `clinic`
- `appointment` and `examination`
- `treatment` and `examtreatment`
- `admissions` and `pens`
- `invoice`

The SQL script creates the tables, defines their keys and relationships, and inserts sample records.

## Technologies

- MariaDB / MySQL
- SQL
- DBeaver

## Run the database

1. Open DBeaver and connect to your MariaDB or MySQL server.
2. Create a new, empty database and select it.
3. Open `Team20_PetD.sql` in the SQL editor.
4. Run the script to create and populate the tables.

**Note:** The script includes `DROP TABLE IF EXISTS` statements. Run it in a new or empty database because it will replace existing tables with the same names.

## Coursework

Completed as a team database project for Ulster University.
