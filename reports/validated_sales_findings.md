# Validated findings — Sample Superstore sales and profitability

## Scope and status

These findings were recalculated from the supplied `Sample - Superstore.csv` file using Python (Windows-1252 / `cp1252`). The file contains 9,994 order-line rows covering 2014-01-03 to 2017-12-30. The results describe this sample dataset only; they are not claims about a real retailer.

The source file is not committed to this repository. Reproduce the calculations with `python python/run_sales_analysis.py` after placing the CSV in `data/raw/`. Reconcile the results with the SQL scripts and the Excel workbook before final external publication.

## Baseline KPIs

| KPI | Result |
|---|---:|
| Order-line rows | 9,994 |
| Distinct orders | 5,009 |
| Distinct customers | 793 |
| Distinct products | 1,862 |
| Sales | $2,297,200.86 |
| Recorded profit | $286,397.02 |
| Profit margin (total profit / total sales) | 12.47% |
| Units | 37,873 |
| Average order value | $458.61 |
| Median order value | $151.96 |
| Negative-profit order lines | 1,871 |
| Products with negative aggregate profit | 301 |

AOV is calculated by grouping order lines by Order ID, summing sales per order, and averaging those order totals. It is not average sales per row.

## Data quality checks

The inspected file had:
- 0 missing cells.
- 0 exact duplicate rows.
- Unique Row ID values.
- 0 invalid Order Date values and 0 invalid Ship Date values after parsing.
- 0 rows where Ship Date precedes Order Date.
- 0 negative Sales rows.
- 0 non-positive Quantity rows.
- 0 Discount values outside the 0–1 range.

A clean result on these checks does not prove that every business definition is correct. Confirm the publisher's field definitions and retain the sample-data limitation.

## Finding 1 — Profitability is uneven across product categories

- **Evidence:** Technology generated $836,154.03 in sales and $145,454.95 recorded profit (17.40% margin). Office Supplies generated $719,047.03 in sales and $122,490.80 profit (17.04% margin). Furniture generated $741,999.80 in sales but only $18,451.27 profit (2.49% margin).
- **Interpretation:** Furniture has a much thinner recorded margin than the other two categories in this dataset.
- **Recommendation:** Review furniture subcategory and product economics, including pricing, discounting, shipping and cost assumptions, before making assortment or pricing changes.
- **Validation:** Check whether the pattern persists by year, product and customer segment; confirm the definition of the Profit field.
- **Limitation:** These are descriptive results from a sample dataset, not a causal explanation of why Furniture margin is lower.

## Finding 2 — Tables and Bookcases are loss-making subcategories in aggregate

- **Evidence:** Tables recorded -$17,725.48 profit on $206,965.53 sales (approximately -8.56% margin). Bookcases recorded -$3,472.56 profit on $114,880.00 sales (approximately -3.02% margin). Supplies recorded -$1,189.10 profit on $46,673.54 sales (approximately -2.55% margin).
- **Interpretation:** These subcategories warrant a closer review because their aggregate recorded profit is negative.
- **Recommendation:** Prioritise product-level investigation within Tables and Bookcases. Check discount levels, unit economics, fulfilment costs and whether specific products account for most of the loss.
- **Validation:** Drill into product IDs and order lines; compare discount, ship mode, region and time period.
- **Limitation:** The available columns do not establish the underlying operational cause of losses.

## Finding 3 — High-discount order lines are associated with negative aggregate profit

- **Evidence:** Order lines with discounts of 30% or more account for 1,393 rows (13.94% of all lines) and $362,770.15 sales (15.79% of sales). Their aggregate recorded profit is -$135,376.06, or -37.32% margin. Lines below 30% discount recorded $421,773.08 profit and 21.80% margin.
- **Interpretation:** The 30%-and-above discount group is a strong investigation priority.
- **Recommendation:** Review the specific products, categories and order contexts receiving high discounts. Test revised discount guardrails on a controlled basis before changing policy.
- **Validation:** Compare within the same product/category and time periods; inspect transaction counts and alternative drivers.
- **Limitation:** This is an association, not proof that discounts caused the losses. Product mix and other factors may differ between discount groups.

## Finding 4 — Sales increased in 2017, but profit grew more slowly

- **Evidence:** Sales increased from $609,205.60 in 2016 to $733,215.26 in 2017 (+20.36%). Recorded profit increased from $81,795.17 to $93,439.27 (+14.24%). Margin moved from 13.43% to 12.74%.
- **Interpretation:** Sales growth did not translate into the same percentage growth in recorded profit during 2017.
- **Recommendation:** Investigate the product mix, discount distribution and geographic contribution behind the 2017 margin movement.
- **Validation:** Compare monthly and category-level trends, using consistent full-year periods.
- **Limitation:** The dataset ends in 2017 and cannot be used to describe current retail performance.

## Finding 5 — Regional margins differ

- **Evidence:** West recorded $725,457.82 sales, $108,418.45 profit and 14.94% margin. Central recorded $501,239.89 sales, $39,706.36 profit and 7.92% margin. East margin was 13.48%; South margin was 11.93%.
- **Interpretation:** Central is the lowest-margin region in the supplied data, while West has the highest recorded sales and margin.
- **Recommendation:** Compare Central's product mix, discount levels and subcategory profitability with West before recommending regional actions.
- **Validation:** Drill down to state, city, product and discount bands.
- **Limitation:** The source has geographic fields but no store ID. Do not describe these as store-level results.

## Recommended business actions (hypotheses to test)

1. **Investigate Tables and Bookcases first.** Identify the products and order contexts contributing most to negative recorded profit.
2. **Review high-discount transactions.** Test whether guardrails or approval thresholds improve margin without materially reducing sales or customer outcomes.
3. **Investigate the 2017 margin movement.** Separate product mix, category, discount and geography effects.
4. **Review Central region mix.** Compare the same products and discount bands across regions to avoid attributing mix differences to geography alone.
5. **Track margin alongside sales.** Avoid optimising revenue without monitoring recorded profit and customer/order outcomes.

These actions are recommendations for further investigation and testing, not proven savings or guaranteed improvements.

## Inventory workstream

The Sample Superstore CSV has no inventory-on-hand history or store ID. Therefore it cannot support stock cover, stockout risk, inventory turnover or store-level inventory recommendations.

A separate public inventory dataset has been identified: [Retail Transactions and Stocks Data — Mendeley Data](https://data.mendeley.com/datasets/27x8mjm8k4/1). Its publisher describes daily transaction-level sales and on-hand stock for 40 storefronts and 2,326 SKUs, and lists a CC BY 4.0 licence. It contains two large CSV files (approximately 95.4 MB and 37.3 MB). Download, inspect the actual columns/grain/date coverage, and cite the dataset before adding inventory findings. Do not join it to Sample Superstore: they are different source datasets with no established common entity keys.

## Final publication checklist

- [x] Recalculate baseline metrics from the supplied CSV.
- [x] Check basic missingness, duplicates, date and numeric validity.
- [x] Calculate category, subcategory, discount, regional and annual performance.
- [x] Document evidence-based investigation priorities.
- [ ] Execute the repository Python script on the user's local machine.
- [ ] Execute PostgreSQL queries and reconcile totals.
- [ ] Validate the separate inventory files and calculate inventory metrics.
- [ ] Build and validate the Power BI report.
- [ ] Complete the Excel reconciliation workbook from the user's local source file.
