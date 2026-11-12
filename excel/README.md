# Excel validation workbook

Excel will provide an independent reconciliation layer for the headline business metrics.

## Planned workbook tabs

- **Read Me:** source, refresh date, data scope and workbook instructions.
- **Raw / Staging:** controlled import of source data or validated extracts.
- **KPI Reconciliation:** sales, recorded profit, units, distinct orders and AOV.
- **Category & Geography:** pivot-based checks against SQL / Python summaries.
- **Inventory Checks:** only after inventory source validation.

## Validation rules

- Reconcile row counts and totals with SQL and Python.
- Calculate AOV from order-level totals.
- Use weighted / ratio-of-sums margin, not average row margin.
- Keep source data and calculated outputs distinguishable.
- Document filters, date windows and exclusions.

A local workbook has been generated at `Retail_Profitability_Excel_Reconciliation.xlsx`. It includes the supplied raw CSV, formula-driven KPI checks and grouped result tabs. Open it in desktop Excel to recalculate formulas and compare them with the Python reference values. Keep this raw-data workbook local; do not commit or share it until the dataset redistribution licence is confirmed.
