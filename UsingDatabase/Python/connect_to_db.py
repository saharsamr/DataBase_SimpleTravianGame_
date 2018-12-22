import pyodbc


def connect_to_db():
    cnxn = pyodbc.connect(
        "Driver={SQL Server};"
        "Server=DESKTOP-R0UVS7R;"
        "Database=TRAVIANS;"
        "Trusted_Connection=yes;"
    )
    return cnxn
