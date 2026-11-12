# Data directory

Source datasets are not committed by default. Download them from the source pages listed in the root README and check the applicable licence and redistribution conditions.

## Local folder layout

```text
data/
├── raw/        # Original downloaded files; never edit in place
├── interim/    # Temporary staged / cleaned files
└── processed/  # Reproducible analysis-ready outputs
```

## Current input

- **Sample Superstore:** place the supplied CSV at `data/raw/Sample - Superstore.csv`.
- The inspected copy is read with Windows-1252 encoding (`cp1252`).
- The separate inventory dataset is a candidate source and has not yet been validated in this repository.

Do not join sources until the keys, grain, units and time coverage are understood. Do not commit raw data unless the licence explicitly permits redistribution.
