# Retail Profitability & Inventory Intelligence

An end-to-end retail analytics portfolio project focused on diagnosing profit leakage, understanding product and store performance, and identifying inventory risks.

> **Project status:** Setup and data discovery. Analytical results and dashboard metrics will be added only after the source data has been inspected, cleaned, and validated.

## Business problem

A multi-store retailer wants to understand:
- Why revenue and profit may be moving in different directions.
- How discounting affects profit and product/category performance.
- Which stores, categories, and products contribute most to business results.
- Where inventory is at risk of stockout or excess stock.
- Which operational or commercial actions should be prioritized.

## Project objectives

1. Build a reproducible data-quality and preparation workflow in Python.
2. Model the sales and inventory data in PostgreSQL.
3. Answer commercial questions using readable, reusable SQL.
4. Create a Power BI executive dashboard with product, store, and inventory drilldowns.
5. Validate key figures in Excel and document evidence-backed recommendations.

## Technology

- **SQL:** PostgreSQL
- **Python:** pandas, NumPy, matplotlib, seaborn (optional for exploration), Jupyter
- **BI:** Power BI and DAX
- **Spreadsheet:** Excel
- **Version control:** Git and GitHub

## Data sources and scope

This project is designed to use two complementary public datasets. They will be profiled independently before any integration.

| Dataset | Planned use | Important limitation to validate |
|---|---|---|
| [Sample Superstore (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) | Order-level sales, discount, profit, customer, product and geography analysis | It is a sample dataset, not a live retailer feed. Confirm whether a returns file and cost fields are included in the downloaded version. |
| [Retail data — Mendeley Data](https://data.mendeley.com/datasets/27x8mjm8k4/1) | Daily store/SKU sales and stock-on-hand analysis | Inspect exact schema, grain, time coverage, units, licence and whether store/SKU identifiers align with the sales dataset. |

**Integration rule:** Do not join these sources by approximate names or assume that similarly named products/stores are identical. A combined analysis is permitted only when a defensible store/product/date mapping exists. Otherwise, report sales profitability and inventory health as separate but complementary analyses.

**Data handling:** Raw third-party data will not be committed until its licence and redistribution terms are checked. Keep downloaded files under `data/raw/` locally and use the documented source links. Do not upload personal, confidential, or restricted data.

## Repository layout

```text
retail-profitability-inventory-intelligence/
├── README.md
├── requirements.txt
├── .gitignore
├── data/
│   └── README.md
├── docs/
│   ├── business_requirements.md
│   ├── metric_definitions.md
│   └── project_plan.md
├── notebooks/
│   └── README.md
├── sql/
│   └── README.md
├── python/
│   └── README.md
├── powerbi/
│   └── README.md
├── excel/
│   └── README.md
└── reports/
    └── README.md
```

## Key questions to answer

### Sales and profitability
- How do revenue, orders, units, profit and profit margin trend over time?
- Which product categories and subcategories contribute most to revenue and profit?
- Which products generate high sales but weak or negative profit?
- How does discount depth relate to profit margin? Is the relationship consistent across categories?
- Which stores/regions/geographies have the strongest and weakest performance?
- What is the average order value (AOV), using a clearly defined order grain?

### Inventory
- Which store/SKU combinations have low stock relative to recent demand?
- What is the estimated days of supply / stock cover?
- Which products have persistently low movement or excess stock?
- How does stock availability vary over time and across stores?
- Can stockout risk be identified without confusing zero sales with zero demand?

### Returns (only if reliable return data exists)
- What share of orders or sales value is returned?
- Which products/categories have elevated return rates?
- How do returns affect net sales and profitability?
- If return reason or return date is unavailable, document that limitation rather than infer it.

## Metric definitions

Metric formulas and assumptions are maintained in [docs/metric_definitions.md](docs/metric_definitions.md). Headline measures will not be published until the data grain and required fields have been validated.

## How to reproduce

1. Clone this repository.
2. Create a Python environment and install dependencies from `requirements.txt`.
3. Download the source datasets from their official source pages and follow [data/README.md](data/README.md).
4. Run the notebooks in numerical order.
5. Load cleaned tables into PostgreSQL and execute the SQL scripts (to be added).
6. Build the Power BI model using the documented relationships and measures (to be added).

## Deliverables

- [ ] Dataset profiling and data-quality report
- [ ] Reproducible Python cleaning / validation notebooks
- [ ] PostgreSQL schema and analytical SQL
- [ ] Sales and profitability analysis
- [ ] Inventory health analysis
- [ ] Excel reconciliation workbook
- [ ] Power BI executive dashboard and drilldowns
- [ ] Evidence-backed business recommendations
- [ ] Portfolio case study with screenshots and limitations

## Project integrity

This is an independent learning and portfolio project. The reference repository that motivated the project is not the source of this implementation. Code, documentation, analysis, and dashboard design in this repository will be authored and validated as part of this project. Dataset creators and licences will be credited in the final documentation.

## Author

**Anurag Parkhe** — [GitHub](https://github.com/Anuragp7788)
