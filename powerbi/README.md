# Power BI dashboard

The dashboard is a planned deliverable. No completed Power BI report is included yet.

See [dashboard_specification.md](../docs/dashboard_specification.md) for the intended pages, business questions, filters and validation rules.

## Starter files

- [DAX KPI measures](measures.dax)
- [Power Query CSV import template](power_query_sample_superstore.m)

Update the file path in the Power Query script to your local project directory. Confirm all data types and totals after loading.

## Planned pages

1. Executive overview.
2. Product and category profitability.
3. Customer and order behaviour.
4. Geographic performance.
5. Inventory health (only after the separate inventory source is validated).

## Model and KPI rules

- Define relationships and table grain before creating measures.
- Use a proper date table for time intelligence.
- Calculate AOV at order grain.
- Calculate profit margin from total profit / total sales.
- Do not average row-level margins to produce an overall margin.
- Do not label geography as store performance.
- Inventory turnover requires COGS and average inventory value.
- Reconcile every headline KPI with the SQL and Python outputs.

The final `.pbix`, exported screenshots and measure documentation will be added after the dashboard is built and validated.
