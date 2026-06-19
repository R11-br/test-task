import sqlite3

conn = sqlite3.connect("../data/warehouse.db")

with open("../ddl/create_star_schema.sql", "r", encoding="utf-8") as f:
    conn.executescript(f.read())

conn.commit()
conn.close()

print("База данных создана")