# Import Libraries
import os
import pandas as pd
from sqlalchemy import create_engine
from urllib.parse import quote_plus

# PostgreSQL Connection
username = "postgres"
password = quote_plus("****")
host = "localhost"
port = "5432"
database = "YOUR_DB_NAME"

engine = create_engine(
    f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}"
)

with engine.connect() as conn:
    print("Connected Successfully!")

# Folder containing CSV files
folder_path = r"YOUR_DATASET_FOLDER_PATH"

for file in os.listdir(folder_path):
    if file.endswith(".csv"):
        table_name = os.path.splitext(file)[0] # races.csv -> races
        csv_path = os.path.join(folder_path, file)

        df = pd.read_csv(csv_path)

        # Create table automatically and insert data
        df.to_sql(
            table_name,
            engine,
            if_exists="replace", # "append" -> if table already exists
            index=False
        )

        print(f"{table_name} imported successfully into the DB!")

print("All CSV files imported into the DB.")