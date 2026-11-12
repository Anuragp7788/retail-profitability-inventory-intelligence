# Notebooks

Run notebooks in numerical order. Each notebook should explain its purpose, inputs, assumptions, validation checks and outputs.

| Notebook | Purpose | Status |
|---|---|---|
| [01_data_quality_and_eda.ipynb](01_data_quality_and_eda.ipynb) | Load and profile Sample Superstore; inspect grain, schema, missingness, duplicates, dates, numeric fields and baseline KPIs | Created; local execution/reconciliation pending |
| 02_inventory_data_profile.ipynb | Profile the separate daily inventory dataset | Planned after source download and licence review |
| 03_sales_profitability_analysis.ipynb | Deeper product, category, discount and geographic analysis | Planned |
| 04_inventory_health_analysis.ipynb | Stock cover, demand velocity and inventory exceptions | Planned after inventory schema validation |

## Input setup

Download Sample Superstore from the source link in the root README and place the CSV at `data/raw/Sample - Superstore.csv`. Raw data is intentionally not committed until redistribution permission is confirmed.

The first notebook reads this supplied file with `encoding="cp1252"` because the inspected copy contains Windows-1252 characters.
