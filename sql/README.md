# SQL analysis

PostgreSQL is used to create a reproducible staging table and answer business questions from the transaction-level source.

## Scripts

| Order | File | Purpose |
|---|---|---|
| 1 | [00_create_schema.sql](00_create_schema.sql) | Create the staging schema and Sample Superstore table |
| 2 | [02_sales_profitability_analysis.sql](02_sales_profitability_analysis.sql) | Baseline KPIs, AOV, monthly trend, category, geography, discount and product profitability queries |

## Run order

1. Create a local PostgreSQL database.
2. Run `00_create_schema.sql`.
3. Download the source CSV to `data/raw/Sample - Superstore.csv`.
4. From the repository root, use psql `\copy` to load the CSV. The command is documented in the schema script and root README.
5. Run `02_sales_profitability_analysis.sql`.
6. Reconcile row count, sales, profit and units with the Python notebook.

## Query conventions

- Use distinct Order ID for order counts.
- Calculate AOV after aggregating sales to order level.
- Calculate margin as total recorded profit divided by total sales, not as a simple average of row-level margins.
- Treat discount comparisons as descriptive, not causal.
- Region/state/city are geographic dimensions, not store identifiers.
- Inventory queries will be added only after the second dataset has been profiled and its fields validated.

The scripts are initial analysis assets. Final published results must be run against the documented source version and reconciled.
