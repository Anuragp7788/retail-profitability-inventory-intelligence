# Reproducibility and data governance

## Source register

| Source | Intended use | Status |
|---|---|---|
| [Sample Superstore — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) | Sales, discount, recorded profit, customer, product and geography analysis | Supplied CSV inspected; confirm the exact source version and licence |
| [Retail daily inventory dataset — Mendeley Data](https://data.mendeley.com/datasets/27x8mjm8k4/1) | Inventory and demand analysis | Candidate source; download and inspect before use |

## Local data layout

Keep downloaded source files outside version control:

```text
data/
├── raw/          # Original source files; do not edit
├── interim/      # Temporary cleaned / staged files
└── processed/   # Reproducible analytical outputs
```

Only commit data files when the source licence clearly permits redistribution and the file is appropriately small. Otherwise, document the source URL, access date, version and local placement instructions.

## Reproduction environment

The project uses Python and Jupyter. Install the pinned-compatible dependencies listed in `requirements.txt` in a virtual environment. Record the Python version used for final validation.

For the supplied Superstore CSV, the inspected file requires Windows-1252 decoding:

```python
import pandas as pd

df = pd.read_csv(
    "data/raw/Sample - Superstore.csv",
    encoding="cp1252",
    low_memory=False
)
```

Run notebooks in numerical order from the repository root or follow the path instructions in each notebook.

## Reproducibility checklist

- [ ] Source URL and version recorded.
- [ ] Licence and redistribution conditions checked.
- [ ] Raw source file left unchanged.
- [ ] Data types and date parsing are explicit.
- [ ] Missing values, duplicates, invalid values and key uniqueness checked.
- [ ] Transformations are repeatable and documented.
- [ ] KPI formulas and denominators documented.
- [ ] SQL / Python / Power BI totals reconciled.
- [ ] Dashboard filters and date scope validated.
- [ ] Final outputs regenerated from the documented source files.

## Privacy and security

The project should use public or synthetic data only. Do not commit passwords, API keys, personal customer information, private business records or connection strings. Keep local environment files out of Git.
