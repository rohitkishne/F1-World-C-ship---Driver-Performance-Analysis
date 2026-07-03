# F1 World Championship - Driver Performance Analysis

This project focuses on analyzing Formula 1 World Championship data using Python and SQL. It involves importing a comprehensive set of F1 datasets into a PostgreSQL database and performing SQL queries to extract insights into driver and constructor performances.

## Project Structure

The project directory consists of the following key components:

- `Dataset/`: A directory containing 14 CSV files with comprehensive Formula 1 data. These files include information on `circuits`, `constructors`, `constructor_results`, `constructor_standings`, `drivers`, `driver_standings`, `lap_times`, `pit_stops`, `qualifying`, `races`, `results`, `seasons`, `sprint_results`, and `status`.
- `SQL_Table_Creation_and_Import_with_Python.py`: A Python script that automates the database setup. It connects to a local PostgreSQL database (`Formula-1_World_Championship`) and iterates through all the CSV files in the `Dataset` folder, automatically creating the corresponding tables and inserting the data using `pandas` and `sqlalchemy`.
- `SQL Analysis/SQL Queries.sql`: A SQL script containing analytical queries run against the populated database to extract insights such as:
    - All-Time Top Winning Drivers.
    - Seasons Points Trend for a Specific Driver (e.g., Lewis Hamilton).
    - Positions lost or gained per race by comparing grid positions to finishing positions (for the 2024 season).
    - Constructor-Wise Average Finishing Position with Rankings (for seasons 2020 onwards).

## Prerequisites

To run this project locally, you will need:
- **PostgreSQL** installed and running on your local machine.
- **Python** environment with the following libraries installed:
  - `pandas`
  - `sqlalchemy`
  - `psycopg2` (or `psycopg2-binary`)

## Setup Instructions

1. Ensure your local PostgreSQL server is running and create a new database named `Formula-1_World_Championship`.
2. Update the database credentials (`username`, `password`, `host`, `port`) in the `SQL_Table_Creation_and_Import_with_Python.py` script to match your local setup.
3. Run the Python script:
   ```bash
   python SQL_Table_Creation_and_Import_with_Python.py
   ```
   This will create the necessary tables and populate them with the data from the `Dataset/` folder.
4. Once the data is successfully imported, you can execute the queries in `SQL Analysis/SQL Queries.sql` using your preferred SQL client (e.g., pgAdmin, DBeaver) to explore the analysis.
