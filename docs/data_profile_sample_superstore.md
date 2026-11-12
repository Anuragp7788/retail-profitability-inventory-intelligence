# Sample Superstore — initial data profile

## Profile status

This is an initial technical profile of the supplied CSV file. It is a dataset-level description, not a completed business analysis. Re-run the notebook against the exact source file before using these values in a final dashboard or presentation.

## File and grain

- File: `Sample - Superstore.csv`
- Rows: 9,994
- Columns: 21
- Apparent grain: one order line per row
- Row identifier: `Row ID` (unique in the inspected file)
- Encoding required for this copy: Windows-1252 / `cp1252`

## Coverage and entities

| Item | Inspected value |
|---|---:|
| Order date range | 2014-01-03 to 2017-12-30 |
| Ship date range | 2014-01-07 to 2018-01-05 |
| Distinct orders | 5,009 |
| Distinct customers | 793 |
| Distinct products | 1,862 |
| Exact duplicate rows | 0 |
| Missing values | 0 across the inspected columns |

## Baseline totals

| Measure | Inspected value |
|---|---:|
| Sales | $2,297,200.86 |
| Recorded profit | $286,397.02 |
| Quantity | 37,873 units |
| Average order value | $458.61 |
| Negative-profit order lines | 1,871 |
| Sales on negative-profit lines | $468,707.15 |

AOV is calculated by summing line sales within each Order ID, then averaging those order totals. Dividing total sales by 9,994 rows would calculate average sales per order line, not average order value.

## Dataset composition

### Category row counts

| Category | Rows |
|---|---:|
| Office Supplies | 6,026 |
| Furniture | 2,121 |
| Technology | 1,847 |

### Region row counts

| Region | Rows |
|---|---:|
| West | 3,203 |
| East | 2,848 |
| Central | 2,323 |
| South | 1,620 |

## Known limitations

1. There is no store identifier. City, state and region support geographic analysis, but not store-level comparisons.
2. There are no inventory snapshots or on-hand stock fields. Stock cover, stockout risk and inventory turnover cannot be calculated from this file.
3. The supplied CSV does not include an explicit returns table. Returns must not be inferred from negative profit.
4. The exact accounting definition of the supplied Profit field should be confirmed from the dataset documentation.
5. This is a sample dataset, not evidence about a real retailer's current operations.
6. The dataset's licence and redistribution terms must be checked before raw data is committed to this repository.

## Reproducibility

Use the notebook [01_data_quality_and_eda.ipynb](../notebooks/01_data_quality_and_eda.ipynb). Place the source file locally at `data/raw/Sample - Superstore.csv` and load it using `encoding='cp1252'`.

## Next step

Profile the separate daily inventory dataset independently. Confirm its schema, grain, time coverage, store/SKU identifiers, units and licence before deciding whether a valid join to this sales dataset is possible.
