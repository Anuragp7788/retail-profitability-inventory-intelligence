# Python analysis

Python is used for repeatable data loading, data-quality checks, exploratory analysis, validation and (later) reusable transformation scripts.

## Current asset

- [Notebook 01 — Data Quality and EDA](../notebooks/01_data_quality_and_eda.ipynb)

## Planned reusable modules

| Module | Responsibility |
|---|---|
| `python/data_loader.py` | Read source files with explicit paths, encodings and types |
| `python/validation.py` | Check required columns, types, missingness, duplicates, key uniqueness and ranges |
| `python/transform_sales.py` | Build clean sales/order-level tables |
| `python/transform_inventory.py` | Standardise inventory snapshots after source validation |
| `python/metrics.py` | Centralise KPI calculations and definitions |

These modules will be added when the corresponding transformations are implemented and tested. Do not treat planned files as existing deliverables.
