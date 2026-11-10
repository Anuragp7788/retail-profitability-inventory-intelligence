# SQL analysis

PostgreSQL scripts will be added after data discovery confirms the source schemas and table grain.

Planned scripts:
- `01_schema.sql`
- `02_data_quality.sql`
- `03_sales_analysis.sql`
- `04_profitability_analysis.sql`
- `05_inventory_analysis.sql`
- `06_business_insights.sql`

SQL should use clear names, comments, explicit date filters and safe division (for example, `NULLIF(denominator, 0)`). Query outputs must reconcile to validated source totals.
