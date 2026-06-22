import pandas as pd

df = pd.read_csv("data/fleet_data.csv")

df["Profit"] = (
    df["Revenue"]
    - df["FuelCost"]
    - df["EMI"]
)

print(df[["VehicleName","Profit"]])

print("Total Revenue:", df["Revenue"].sum())

print("Total Profit:", df["Profit"].sum())

print("Average Revenue:", df["Revenue"].mean())
