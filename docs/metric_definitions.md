# Metric definitions and calculation policy

All measures below are intended definitions. A measure becomes reportable only after required columns, units, grain and business rules are confirmed in the source data.

## Sales and profitability

| Metric | Intended definition | Validation needed |
|---|---|---|
| Gross sales / revenue | Sum of the dataset's sales amount at transaction-line grain | Determine whether sales is before/after discount and taxes |
| Orders | Distinct order identifier count | Confirm order ID is present and stable |
| Units sold | Sum of quantity | Confirm units are comparable |
| Average order value (AOV) | Net sales amount divided by distinct orders | Aggregate sales to order grain first; avoid line-count denominator |
| Profit | Sum of recorded profit | Confirm what costs/charges are included |
| Profit margin | Profit divided by sales; multiply by 100 for percentage | Handle zero/negative sales and clarify sales basis |
| Discount rate | Use provided discount field; aggregate with an explicitly chosen weighting method | Do not take a simple average of line discounts and label it an overall discount rate without justification |
| Return rate | Returned orders / eligible orders, or returned units / units sold | Use only if return records and matching keys are supplied |

## Inventory

| Metric | Intended definition | Validation needed |
|---|---|---|
| On-hand stock | Recorded available quantity at a store/SKU/date snapshot | Confirm whether stock is end-of-day, start-of-day, or point-in-time |
| Average daily unit demand | Units sold over a stated lookback window divided by eligible days | Define zero-sales days and account for stockout-censored demand |
| Days of supply / stock cover | Current on-hand units divided by average daily unit demand | Undefined when average daily demand is zero; flag separately |
| Stockout indicator | On-hand stock at or below zero, where stock is measured reliably | Confirm stock timing and whether negative stock is possible |
| Inventory turnover | Cost of goods sold divided by average inventory value | Requires COGS and average inventory value; do not substitute revenue and unit stock |
| Slow-moving SKU | SKU below a documented demand/velocity threshold over a stated window | Threshold must be explicit and business-reasonable |

## Analytical cautions

- A transaction-level sales dataset and a daily inventory dataset may have different grains.
- Sales are not demand when an item is unavailable; stockouts can suppress observed sales.
- Inventory turnover requires cost and inventory valuation, not just units on hand.
- Gross margin is only valid when the supplied profit definition corresponds to gross profit.
- AOV must be calculated after grouping all lines belonging to each order.
- Returns must not be estimated from negative sales unless the source documentation confirms that convention.
- Currency, tax, shipping and discount conventions must be recorded before comparing totals.
