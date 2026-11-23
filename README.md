# Retail Profitability & Inventory Intelligence

**An end-to-end retail analytics case study | Python · SQL · Power BI · Excel**

A practical analytics project built around a retail business question: how can leadership understand sales performance, identify profit leakage, and improve inventory decisions using reliable data?

> **Current stage (23 Nov 2026):** The repository retains the original Sample Superstore sales-analysis workstream described below. A second, separate Power BI workstream has now been built locally using supplied retail sales and inventory CSV files. The Power BI report has five pages and its core sales and stock-health visuals have been checked in Power BI Desktop. Inventory valuation and several interpretation details still require independent audit; the PBIP report is not yet published as a public interactive dashboard.

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

## Current Power BI workstream — separate supplied retail files

This is a distinct analysis from the Sample Superstore workstream below. It uses two separately supplied files:

- `retail_sales_ml_apl.csv`: 125,751 sales rows.
- `retail_inventory_ml_apl.csv`: 284,755 historical inventory rows.

The sales analysis currently reports (excluding rows flagged as returns): sales 11,215,681.26; COGS 6,255,526.82; calculated profit 4,960,154.44; calculated margin 44.23%; and units sold 124,542. Returns are reported separately: return value 733,571.01 and return units 7,547. These are dataset-level calculations, not real-company or client outcomes.

The latest inventory view contains 60,968 product–store pairs: 703 with negative on-hand quantity, 8,406 with zero quantity and 51,859 with positive quantity. The report also displays inventory retail and cost valuation, but those values remain subject to a separate independent reconciliation and are not presented here as final findings.

**Scope and limitations:** The files are treated as a supplied retail dataset in a fictional business scenario. Source provenance and redistribution licence must be confirmed before publishing raw data. The `Reason of Return` field is blank, and the only observed sales channel is Channel Alpha. The historical inventory records are reduced to the latest observed record per product–store pair for the stock-health view. This does not by itself establish demand velocity, stock cover, replenishment recommendations or causal relationships between sales and inventory. The Sample Superstore data and these supplied retail files are not joined.


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

Using the separate [Retail Transactions and Stocks Data](https://data.mendeley.com/datasets/27x8mjm8k4/1) source, subject to local download and schema validation:

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

The two sources are analysed as separate workstreams. The Superstore dataset is a different sample from the Mendeley inventory dataset; there is no established common key, so they must not be joined. **They will not be joined unless a defensible shared key and compatible grain are demonstrated.**

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

## Key business findings from the supplied sales file

The first full sales/profitability analysis has now been calculated from the supplied CSV. The detailed evidence and limitations are in [reports/validated_sales_findings.md](reports/validated_sales_findings.md).

- **Furniture margin is much lower:** 2.49%, compared with 17.40% for Technology and 17.04% for Office Supplies.
- **Tables and Bookcases are loss-making subcategories:** Tables recorded -$17,725.48 profit; Bookcases recorded -$3,472.56.
- **High discounts need investigation:** order lines with discounts of 30% or more recorded -$135,376.06 aggregate profit and -37.32% margin. This is an association, not proof of causation.
- **2017 sales grew faster than profit:** sales increased 20.36% year over year, while recorded profit increased 14.24%; margin moved from 13.43% to 12.74%.
- **Regional margin varies:** Central recorded 7.92% margin, compared with 14.94% in West.

These are historical sample-data findings, not current market facts or guaranteed savings. See the linked report for calculation scope, interpretation, validation steps and caveats.

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

| [Project execution guide](docs/project_execution_guide.md) | Step-by-step workflow, learning prompts, local folder structure and publication rules |

| Document | What it explains |
|---|---|
| [Business requirements](docs/business_requirements.md) | Stakeholders, decisions and business questions |
| [Analysis plan](docs/analysis_plan.md) | Analysis sequence, questions and acceptance criteria |
| [Metric definitions](docs/metric_definitions.md) | KPI formulas, grain and calculation cautions |
| [Sample Superstore data dictionary](docs/data_dictionary_sample_superstore.md) | Fields and intended analytical use |
| [Initial data profile](docs/data_profile_sample_superstore.md) | Observed data quality and baseline profile |
| [Dashboard specification](docs/dashboard_specification.md) | Planned Power BI pages and interactions |
| [Solution architecture](docs/solution_architecture.md) | Data flow, system design and integration decisions |
| [Power BI DAX measures](powerbi/measures.dax) | KPI measure definitions for the report |
| [Power Query import](powerbi/power_query_sample_superstore.m) | CSV import and data typing template |
| [Python analysis script](python/run_sales_analysis.py) | Reproducible grouped sales and profitability outputs |
| [Insights and recommendations](docs/insights_and_recommendations.md) | Recommendation framework |
| [Validated sales findings](reports/validated_sales_findings.md) | Evidence-backed findings and investigation priorities |
| [Reproducibility and governance](docs/reproducibility_and_data_governance.md) | Source handling, environment and validation |

## Project status

- [x] Public GitHub repository and project structure.
- [x] Business scenario, scope and metric definitions.
- [x] Initial Sample Superstore data profiling.
- [x] First Python data-quality and EDA notebook.
- [x] Initial PostgreSQL staging schema and sales-analysis queries.
- [ ] Run the notebook and Python analysis script locally from a clean environment.
- [x] Add reproducible Python sales analysis script.
- [x] Calculate and document evidence-backed sales findings and recommendations.
- [x] Prepare local Excel reconciliation workbook (formula recalculation check pending).
- [x] Add Power BI Power Query import template and DAX KPI measures.
- [ ] Download and profile the separate inventory dataset.
- [ ] Build and validate the inventory analysis.
- [ ] Execute SQL locally and reconcile Python / SQL / Excel outputs.
- [ ] Build the Power BI report in Power BI Desktop and capture real screenshots.
- [ ] Complete the combined business recommendations and publish the portfolio case study.

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
