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

## Business Insights

### 🏆 All-Time Top Winning Drivers
- A rank of the top 10 drivers by total race wins across all seasons reveals a highly concentrated dominance — a handful of drivers account for the majority of all victories in F1 history.
- Win counts serve as a definitive measure of sustained excellence, highlighting the drivers who consistently converted pole positions and race pace into podium finishes over long careers.

### 📈 Seasonal Points Trend — Lewis Hamilton
- Tracking Lewis Hamilton's season-by-season points progression (filtered by surname `Hamilton` and DOB `>= 1985-01-07`) exposes clear performance peaks and dips tied to car competitiveness and team dynamics.
- The trend reveals how his points tally evolved across different constructors and regulation changes, showcasing the relationship between driver talent and machinery in determining championship outcomes.

### ↕️ Position Gained / Lost Per Race (2024 Season)
- Analysing the difference between grid (qualifying) position and finishing position for the 2024 season identifies the drivers who consistently outperformed their qualifying slot — a key indicator of race-craft, strategic tire management, and overtaking ability.
- The top 10 positions-gained highlights the racers who added the most value beyond what their qualifying pace suggested, reflecting adaptability and race intelligence under live conditions.

### 🏗️ Constructor-Wise Average Finishing Position (2020 Onwards)
- Using `DENSE_RANK()` over average finishing position since the 2020 season surfaces the constructors that have delivered the most consistent overall pace across the hybrid and ground-effect regulation eras.
- A lower average finishing position directly correlates with championship competitiveness, resource efficiency, and technical development pace — making this metric a reliable proxy for team performance rankings in the modern F1 era.

---

## Conclusion

This project demonstrates an end-to-end SQL analytics pipeline built on real-world Formula 1 Championship data. By automating database ingestion via Python (`pandas` + `sqlalchemy`) and executing targeted SQL queries against a structured PostgreSQL schema, four critical performance dimensions were analysed:

1. **All-Time Dominance** — Race win counts confirm that F1 success is heavily concentrated among an elite group of drivers, underscoring the importance of both raw talent and long-term team consistency.
2. **Career Trajectory** — Hamilton's seasonal points trend illustrates how individual brilliance intersects with car performance cycles, offering a data-driven perspective on what drives championship momentum.
3. **Race-Craft Intelligence** — The 2024 position-gained analysis shows that qualifying pace alone does not define race outcomes; strategic acumen and overtaking skill play a decisive role in final standings.
4. **Team Competitiveness** — Constructor average finishing positions since 2020 provide a quantitative ranking of team performance across regulation shifts, identifying which organisations have maintained the highest operational consistency.

Together, these analyses validate SQL as a powerful tool for sports performance analytics, enabling granular, evidence-based storytelling from large multi-table datasets.
