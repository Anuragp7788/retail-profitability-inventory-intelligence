# Analysis plan and business questions

## Purpose

This document turns the project brief into a practical analysis sequence. Each question should be answered with a reproducible calculation, a clear grain, and a business interpretation. Do not fill the findings section with assumptions.

## Workstream A — Sales and profitability (Sample Superstore)

### A1. Business performance over time
- How do sales, recorded profit, order count and units change by month and year?
- Are there seasonal patterns or unusual periods?
- Does profit move in line with sales?

**Methods:** date aggregation, month-over-month and year-over-year comparisons where periods are comparable, trend charts.

### A2. Product and category performance
- Which categories and subcategories contribute most to sales and profit?
- Which products have high sales but low or negative recorded profit?
- Are a small number of products responsible for a disproportionate share of losses?

**Methods:** product-level aggregation, contribution analysis, ranking, Pareto view, profit-margin checks.

### A3. Discount and profitability
- How do sales, profit and margin vary across discount levels?
- Does the observed relationship differ by category or subcategory?
- Are high discounts concentrated in loss-making lines?

**Methods:** discount-band analysis, weighted totals, segmented comparisons. This is descriptive analysis: it cannot establish that discounts caused a profit change.

### A4. Geographic performance
- How do sales, recorded profit and margin vary by region, state and city?
- Which geographic areas should be investigated further?

**Methods:** geographic aggregation and ranking. This source has no store identifier, so geographic cuts must not be labelled as store performance.

### A5. Order behaviour
- What is average order value (AOV)?
- How do order size and product mix vary by segment or geography?

**Methods:** aggregate order lines to Order ID first, then calculate order-level measures. Never use transaction-line count as the AOV denominator.

## Workstream B — Inventory health (separate inventory dataset)

This workstream begins only after the inventory source has been downloaded and its schema, grain, licence and field definitions inspected.

- What is on-hand stock by date, store and SKU?
- Which SKUs have low days of supply relative to recent observed sales?
- Which SKUs appear slow-moving or potentially overstocked?
- How does inventory availability change across stores and over time?
- Are there stockout periods that may suppress observed sales?

**Methods:** time-series profiling, rolling demand windows, stock cover, inventory state transitions and exception lists.

**Important:** observed sales can understate demand when stock is unavailable. A zero-sales day is not automatically a zero-demand day.

## Integration decision

The two datasets will be integrated only if reliable shared keys and compatible grain are demonstrated. Similar product names or store labels are not sufficient. If no defensible mapping exists, the project will present two connected business analyses with separate data models and clearly labelled scope.

## Required outputs

| Output | Acceptance criteria |
|---|---|
| Data-quality profile | Row grain, schema, missingness, duplicates, key uniqueness, date coverage and invalid values documented |
| Sales analysis | Totals reconcile to the source; all denominators and aggregation levels are explicit |
| Discount analysis | Discount bands and weighting are documented; no causal claim |
| Geographic analysis | Region/state/city labels only; no implied store ID |
| Inventory analysis | Stock and demand fields validated; stock-cover assumptions stated |
| Recommendations | Each recommendation links to an observed finding, business implication and proposed next action |

## Findings log

No business recommendations are approved at the setup stage. Add findings only after the relevant analysis has been run and checked.

| ID | Question | Evidence / output link | Finding | Business implication | Recommended next action | Status |
|---|---|---|---|---|---|---|
| F-001 | To be investigated | Pending | Pending | Pending | Pending | Not analysed |
