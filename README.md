# Retail Profitability & Inventory Intelligence

**An end-to-end retail analytics case study | Python · SQL · Power BI · Excel**

A practical analytics project built around a retail business question: how can leadership understand sales performance, identify profit leakage, and improve inventory decisions using reliable data?

> **Current stage:** Repository, business scope, initial Superstore data profile, first EDA notebook, and initial PostgreSQL schema / analysis queries are in place. The Power BI dashboard and final recommendations are planned deliverables, not completed outputs yet.

---

## Project at a glance

| | |
|---|---|
| **Business domain** | Retail analytics, commercial performance and inventory operations |
| **Primary objective** | Diagnose sales and profitability patterns and assess inventory health |
| **Tools** | Python, Pandas, NumPy, Jupyter, PostgreSQL, Power BI, DAX, Excel |
| **Analysis methods** | Data profiling, EDA, KPI analysis, aggregation, segmentation, trend analysis, reconciliation |
| **Data** | Public Sample Superstore transactions + a separate candidate daily inventory dataset |
| **Deliverables** | Reproducible notebooks, SQL analysis, validated KPIs, Power BI dashboard, business insights and portfolio case study |

## The business scenario

Imagine a multi-store retailer whose leadership team needs a clearer view of commercial performance and inventory operations.

The team wants to answer:

- Is revenue growth translating into stronger profit?
- Which product categories, subcategories and products contribute most to sales and profit?
- Where might discounting be associated with weak profitability?
- Which geographic areas have stronger or weaker commercial performance?
- Which products or store/SKU combinations may face low-stock or excess-stock risk?
- What actions should merchandising, finance and inventory teams investigate first?

This is a **fictional business scenario** framed around public datasets. The data is not represented as confidential or verified operational data from a real retailer.

## What this project will deliver

### 1. Sales and profitability analysis

Using the Sample Superstore transaction dataset:

- Sales, recorded profit, units and order trends.
- Category and subcategory contribution.
- Product-level profit and loss analysis.
- Discount-band comparisons.
- Customer segment and order-value analysis.
- Region, state and city performance.

### 2. Inventory health analysis

Using a separate daily inventory dataset, subject to source and schema validation:

- On-hand stock analysis.
- Recent observed unit sales and demand velocity.
- Days of supply / stock cover.
- Low-stock and potential excess-stock identification.
- Store and SKU trend analysis.

### 3. Executive decision support

- Power BI executive overview.
- Product and category profitability drilldowns.
- Geographic performance page.
- Inventory health page, if source data supports it.
- KPI definitions, reconciliation and evidence-backed recommendations.

## Important data scope and limitations

The two candidate sources are profiled independently. **They will not be joined unless a defensible shared key and compatible grain are demonstrated.**

| Source | Intended analysis | Known scope |
|---|---|---|
| [Sample Superstore — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) | Order-line sales, recorded profit, discount, customer, product and geography | Supplied CSV: 9,994 rows and 21 columns. Contains region/state/city, but no store ID, inventory snapshots or explicit returns table. |
| [Retail daily inventory — Mendeley Data](https://data.mendeley.com/datasets/27x8mjm8k4/1) | Daily store/SKU stock and sales analysis | Candidate source only. Its schema, grain, date coverage, units, licence and join compatibility must be inspected before use. |

### What we will not claim from the Superstore CSV

- Store-level performance: no store identifier is present.
- Inventory cover, stockout risk or inventory turnover: no stock-on-hand history is present.
- Returns: the supplied file has no explicit returns table.
- Causal discount impact: descriptive relationships do not establish causality.

Inventory turnover also requires COGS and average inventory value. It cannot be calculated from revenue and units alone.

## Initial data profile — Sample Superstore

The supplied CSV was inspected. Initial observations are recorded in [the data profile](docs/data_profile_sample_superstore.md) and can be reproduced with the first notebook.

| Measure | Initial observation |
|---|---:|
| Transaction rows | 9,994 |
| Distinct orders | 5,009 |
| Distinct customers | 793 |
| Distinct products | 1,862 |
| Sales total | $2,297,200.86 |
| Recorded profit total | $286,397.02 |
| Units | 37,873 |
| Average order value | $458.61 |
| Negative-profit order lines | 1,871 |

AOV is calculated by summing line sales within each Order ID and averaging those order totals. It is not total sales divided by transaction rows.

These are initial dataset-level figures, not final business recommendations. Re-run the notebook and reconcile them after loading the source locally.

## Repository structure

```text
retail-profitability-inventory-intelligence/
├── README.md
├── requirements.txt
├── .gitignore
├── data/
│   └── README.md
├── docs/
│   ├── analysis_plan.md
│   ├── business_requirements.md
│   ├── dashboard_specification.md
│   ├── data_dictionary_sample_superstore.md
│   ├── data_profile_sample_superstore.md
│   ├── insights_and_recommendations.md
│   ├── metric_definitions.md
│   ├── project_plan.md
│   └── reproducibility_and_data_governance.md
├── notebooks/
│   ├── 01_data_quality_and_eda.ipynb
│   └── README.md
├── sql/
│   ├── 00_create_schema.sql
│   ├── 02_sales_profitability_analysis.sql
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

## Getting started

### 1. Clone the repository

```bash
git clone https://github.com/Anuragp7788/retail-profitability-inventory-intelligence.git
cd retail-profitability-inventory-intelligence
```

### 2. Create a Python environment

```bash
python -m venv .venv
```

Activate it:

**Windows PowerShell**
```powershell
.venv\Scripts\Activate.ps1
```

**macOS / Linux**
```bash
source .venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

### 3. Download and place the source file

Download the Sample Superstore CSV from the [dataset source](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) and place it locally at:

```text
data/raw/Sample - Superstore.csv
```

The CSV is not included in this repository. Check its licence and redistribution terms before sharing any copy.

### 4. Run the first notebook

```bash
jupyter notebook
```

Open `notebooks/01_data_quality_and_eda.ipynb` and run all cells. The notebook expects the local CSV path above and reads this file using Windows-1252 encoding (`cp1252`).

### 5. Load PostgreSQL staging data

Create a local PostgreSQL database, then run the SQL in `sql/00_create_schema.sql`. From the repository root, use psql:

```sql
\copy staging.sample_superstore_sales FROM 'data/raw/Sample - Superstore.csv' WITH (FORMAT csv, HEADER true, ENCODING 'WIN1252');
```

Then run `sql/02_sales_profitability_analysis.sql`. Compare its totals with the Python profile before using them in a dashboard.

## Documentation guide

| Document | What it explains |
|---|---|
| [Business requirements](docs/business_requirements.md) | Stakeholders, decisions and business questions |
| [Analysis plan](docs/analysis_plan.md) | Analysis sequence, questions and acceptance criteria |
| [Metric definitions](docs/metric_definitions.md) | KPI formulas, grain and calculation cautions |
| [Sample Superstore data dictionary](docs/data_dictionary_sample_superstore.md) | Fields and intended analytical use |
| [Initial data profile](docs/data_profile_sample_superstore.md) | Observed data quality and baseline profile |
| [Dashboard specification](docs/dashboard_specification.md) | Planned Power BI pages and interactions |
| [Insights and recommendations](docs/insights_and_recommendations.md) | Evidence log for final business recommendations |
| [Reproducibility and governance](docs/reproducibility_and_data_governance.md) | Source handling, environment and validation |

## Project status

- [x] Public GitHub repository and project structure.
- [x] Business scenario, scope and metric definitions.
- [x] Initial Sample Superstore data profiling.
- [x] First Python data-quality and EDA notebook.
- [x] Initial PostgreSQL staging schema and sales-analysis queries.
- [ ] Run and validate notebook locally from a clean environment.
- [ ] Inspect the separate inventory dataset and confirm its licence/schema.
- [ ] Complete reproducible Python preparation scripts.
- [ ] Build and validate the inventory analysis.
- [ ] Reconcile Python, SQL, Excel and Power BI KPIs.
- [ ] Build Power BI dashboard and capture final screenshots.
- [ ] Write evidence-backed business recommendations.
- [ ] Publish the finished portfolio case study.

## Project quality principles

- Define the grain before aggregating or joining.
- Keep source files unchanged and transformations reproducible.
- Use explicit KPI definitions and denominators.
- Reconcile outputs across tools.
- Separate correlation from causation.
- Make data limitations visible.
- Never invent findings, business impact or dashboard metrics.

## Author

**Anurag Parkhe** · [GitHub](https://github.com/Anuragp7788)
