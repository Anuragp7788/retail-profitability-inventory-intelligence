# Project execution guide

This repository is the working source of truth for the Retail Profitability & Inventory Intelligence case study.

## What we are building

A reproducible analytics case study that answers:
- Is sales growth translating into stronger recorded profit?
- Which categories, subcategories and products need profitability review?
- How are discount levels associated with recorded profit?
- How do results vary by region, state and city?
- What inventory risk can be measured from the separate daily inventory source?

The business scenario is fictional. The datasets are public and are not records from the fictional retailer.

## Current verified project state

- Sample Superstore analysis, initial data profile, SQL starter queries, Python script, notebook, DAX measures and written findings already exist in this repository.
- The sales source does not contain store IDs, inventory snapshots or an explicit returns table.
- The Mendeley daily inventory source is a separate workstream. It must be downloaded and profiled before any inventory KPI is claimed.
- Do not join Sample Superstore to the Mendeley source: no common entity key has been established.
- The Power BI specification is a plan, not a completed Power BI report.
- The portfolio's existing generic dashboard uses illustrative values and must not be presented as this retail project's live dashboard.

## Step-by-step execution

### Step 1 — Prepare local files
Clone this repository and create:
- data/raw/
- data/interim/
- data/processed/

Keep original downloads unchanged in data/raw/. Do not commit raw data unless redistribution rights are clear.

### Step 2 — Validate source data
For each source, record:
- publisher, source URL, version, licence and download date
- row count, column count, data types and apparent grain
- date coverage, missing values and duplicates
- identifier uniqueness and join-key coverage
- units, currency and field definitions

### Step 3 — Reproduce sales analysis
Place the Sample Superstore CSV at data/raw/Sample - Superstore.csv. Run:
- notebooks/01_data_quality_and_eda.ipynb
- python python/run_sales_analysis.py

Compare the regenerated totals with reports/validated_sales_findings.md. Resolve differences before publication.

### Step 4 — Validate inventory source
Download the two inventory dataset CSVs from the Mendeley source page. Inspect their schemas independently. Only calculate stock cover or related metrics after confirming stock timing, units, SKU/store identifiers and observed sales grain.

### Step 5 — SQL and reconciliation
Load the supported sales source into PostgreSQL. Run the SQL scripts and reconcile totals against Python. Keep the inventory source in its own model unless a defensible key mapping is proven.

### Step 6 — Dashboard
Build an interactive dashboard from validated output tables. Planned sections:
1. Executive overview
2. Product and category profitability
3. Customer and order behaviour
4. Geographic performance
5. Inventory health, only if supported by validated inventory fields

Every displayed KPI must reconcile to SQL/Python. Do not use illustrative placeholder metrics in the final retail dashboard.

### Step 7 — Publish
Publish the project code and documentation here. Keep PBIX files and source data in local storage / cloud backup when they are too large or cannot legally be redistributed. Publish a public interactive dashboard only with data whose licence permits public exposure.

## Local folder convention

```text
retail-profitability-inventory-intelligence/
├── data/
│   ├── raw/          # original downloaded files; do not edit
│   ├── interim/      # temporary staging / cleaning
│   └── processed/    # reproducible outputs
├── docs/             # business requirements, definitions, data dictionary
├── notebooks/        # learning and exploratory analysis
├── python/           # reusable scripts
├── sql/              # schema, transformations and analysis
├── powerbi/          # PBIX, DAX and Power Query
├── excel/            # reconciliation workbook
└── reports/          # validated findings and recommendations
```

## Learning rule

For every step, understand:
1. What business question are we answering?
2. What is the row grain?
3. Which fields and formulas are used?
4. Why is this method appropriate?
5. What limitation could change the conclusion?
6. How would you explain the result to a hiring manager?

Never copy a result into the portfolio until it can be reproduced and explained.
