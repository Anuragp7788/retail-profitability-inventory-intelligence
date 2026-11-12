"""Reproducible sales and profitability analysis for Sample Superstore.

Run from the repository root:
    python python/run_sales_analysis.py

Input (download separately):
    data/raw/Sample - Superstore.csv

Outputs are written to data/processed/ (gitignored).
"""
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / "data" / "raw" / "Sample - Superstore.csv"
OUTPUT = ROOT / "data" / "processed"


def load_data() -> pd.DataFrame:
    if not INPUT.exists():
        raise FileNotFoundError(
            f"Missing {INPUT}. Download the source CSV and place it in data/raw/."
        )
    df = pd.read_csv(INPUT, encoding="cp1252", low_memory=False)
    for col in ["Order Date", "Ship Date"]:
        df[col] = pd.to_datetime(df[col], errors="coerce")
    return df


def main() -> None:
    df = load_data()
    OUTPUT.mkdir(parents=True, exist_ok=True)

    # Data quality summary
    quality = pd.DataFrame([
        {"check": "row_count", "result": len(df)},
        {"check": "column_count", "result": len(df.columns)},
        {"check": "missing_cells", "result": int(df.isna().sum().sum())},
        {"check": "exact_duplicate_rows", "result": int(df.duplicated().sum())},
        {"check": "row_id_unique", "result": bool(df["Row ID"].is_unique)},
        {"check": "invalid_order_dates", "result": int(df["Order Date"].isna().sum())},
        {"check": "invalid_ship_dates", "result": int(df["Ship Date"].isna().sum())},
        {"check": "ship_before_order", "result": int((df["Ship Date"] < df["Order Date"]).sum())},
        {"check": "negative_sales_rows", "result": int((df["Sales"] < 0).sum())},
        {"check": "nonpositive_quantity_rows", "result": int((df["Quantity"] <= 0).sum())},
        {"check": "discount_outside_0_1", "result": int((~df["Discount"].between(0, 1)).sum())},
    ])
    quality.to_csv(OUTPUT / "data_quality_checks.csv", index=False)

    # Order-level table is required for AOV.
    order = (
        df.groupby("Order ID", as_index=False)
        .agg(order_sales=("Sales", "sum"), order_profit=("Profit", "sum"),
             order_date=("Order Date", "min"))
    )
    kpis = pd.DataFrame([
        {"metric": "Order lines", "value": len(df), "definition": "Count of source rows"},
        {"metric": "Distinct orders", "value": df["Order ID"].nunique(), "definition": "Distinct Order ID"},
        {"metric": "Distinct customers", "value": df["Customer ID"].nunique(), "definition": "Distinct Customer ID"},
        {"metric": "Distinct products", "value": df["Product ID"].nunique(), "definition": "Distinct Product ID"},
        {"metric": "Sales", "value": df["Sales"].sum(), "definition": "Sum of Sales"},
        {"metric": "Recorded profit", "value": df["Profit"].sum(), "definition": "Sum of supplied Profit field"},
        {"metric": "Profit margin", "value": df["Profit"].sum() / df["Sales"].sum(), "definition": "Total Profit / Total Sales"},
        {"metric": "Units", "value": df["Quantity"].sum(), "definition": "Sum of Quantity"},
        {"metric": "Average order value", "value": order["order_sales"].mean(), "definition": "Average of order-level sales totals"},
        {"metric": "Negative-profit order lines", "value": int((df["Profit"] < 0).sum()), "definition": "Count of rows where Profit < 0"},
    ])
    kpis.to_csv(OUTPUT / "kpi_summary.csv", index=False)

    def aggregate(dimensions, filename):
        out = (df.groupby(dimensions, dropna=False)
               .agg(sales=("Sales", "sum"), recorded_profit=("Profit", "sum"),
                    units=("Quantity", "sum"), order_lines=("Row ID", "count"),
                    orders=("Order ID", "nunique"))
               .reset_index())
        out["profit_margin"] = out["recorded_profit"] / out["sales"].replace(0, pd.NA)
        out.to_csv(OUTPUT / filename, index=False)

    aggregate(["Category"], "category_performance.csv")
    aggregate(["Category", "Sub-Category"], "subcategory_performance.csv")
    aggregate(["Region"], "region_performance.csv")
    aggregate(["Region", "State", "City"], "geography_performance.csv")
    aggregate(["Discount"], "discount_performance.csv")

    product = (df.groupby(["Product ID", "Product Name", "Category", "Sub-Category"], as_index=False)
               .agg(sales=("Sales", "sum"), recorded_profit=("Profit", "sum"),
                    units=("Quantity", "sum"), order_lines=("Row ID", "count")))
    product["profit_margin"] = product["recorded_profit"] / product["sales"].replace(0, pd.NA)
    product.sort_values("recorded_profit").to_csv(OUTPUT / "product_profitability.csv", index=False)

    monthly = (df.assign(order_month=df["Order Date"].dt.to_period("M").dt.to_timestamp())
               .groupby("order_month", as_index=False)
               .agg(sales=("Sales", "sum"), recorded_profit=("Profit", "sum"),
                    units=("Quantity", "sum"), orders=("Order ID", "nunique")))
    monthly["profit_margin"] = monthly["recorded_profit"] / monthly["sales"].replace(0, pd.NA)
    monthly.to_csv(OUTPUT / "monthly_performance.csv", index=False)

    print("Analysis complete. Outputs:")
    for path in sorted(OUTPUT.glob("*.csv")):
        print(f" - {path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
