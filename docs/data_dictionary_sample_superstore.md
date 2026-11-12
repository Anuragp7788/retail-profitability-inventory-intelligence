# Data dictionary — Sample Superstore

## Dataset context

The inspected CSV contains 9,994 rows and 21 columns. Its apparent grain is one order line per row. The field meanings below are inferred from the column names and observed values; confirm them against the dataset publisher's documentation before treating them as formal business definitions.

| Column | Observed / expected meaning | Analytical use | Notes |
|---|---|---|---|
| Row ID | Row-level identifier | Uniqueness and row tracing | Unique in the inspected file |
| Order ID | Order identifier | Order counts, order-level aggregation | Multiple rows can belong to one order |
| Order Date | Order creation date | Sales trends, cohort/time analysis | Parse to date |
| Ship Date | Shipment date | Fulfilment-time analysis | Parse to date; validate before/after order |
| Ship Mode | Shipping service category | Fulfilment segmentation | Categorical |
| Customer ID | Customer identifier | Customer counts and segmentation | Do not treat customer name as key |
| Customer Name | Customer display name | Human-readable output | Avoid unnecessary exposure in aggregate reporting |
| Segment | Customer segment label | Segment analysis | Categorical |
| Country | Country | Geographic analysis | Check distinct values |
| City | City | Geographic analysis | City names may repeat across states |
| State | State / province | Geographic analysis | Use with country and city |
| Postal Code | Postal / ZIP code | Geographic drilldown | Numeric storage can drop leading zeros; treat as text for display |
| Region | Broad geographic region | Geographic analysis | Categorical |
| Product ID | Product identifier | Product performance | Product key |
| Category | Product category | Category analysis | Categorical |
| Sub-Category | Product subcategory | Subcategory analysis | Categorical |
| Product Name | Product display name | Product reporting | Prefer Product ID for joins |
| Sales | Recorded sales amount | Revenue-like measure | Confirm tax, shipping and discount conventions |
| Quantity | Units on order line | Unit volume | Confirm unit comparability |
| Discount | Recorded discount value | Discount analysis | Inspect whether stored as fraction / rate |
| Profit | Recorded profit amount | Profitability analysis | Confirm included costs and accounting meaning |

## Known profile observations

- 9,994 rows and 21 columns.
- No missing values were observed in the inspected file.
- No exact duplicate rows were observed.
- Row ID was unique in the inspected file.
- 5,009 distinct Order IDs, 793 distinct Customer IDs and 1,862 distinct Product IDs.
- Order dates ranged from 2014-01-03 to 2017-12-30.
- Ship dates ranged from 2014-01-07 to 2018-01-05.

See [data_profile_sample_superstore.md](data_profile_sample_superstore.md) for initial totals and limitations. Re-run the notebook to reproduce the profile before publishing results.
