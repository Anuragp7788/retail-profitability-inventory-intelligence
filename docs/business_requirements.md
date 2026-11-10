# Business requirements

## Scenario

A fictional multi-store retailer has asked an analyst to investigate profitability and inventory performance. The scenario is a framing device; the public datasets are not verified records from this fictional retailer.

## Stakeholders and decisions

| Stakeholder | Decision supported |
|---|---|
| Executive leadership | Which business areas need attention first? |
| Category / merchandising manager | Which products/categories need pricing, promotion or assortment review? |
| Store operations manager | Which stores are underperforming, and what operational patterns need investigation? |
| Inventory planner | Which store/SKU combinations need replenishment or review for excess stock? (requires the separate inventory source) |
| Finance | Are reported revenue and profit measures consistent and reconcilable? |

## Questions and expected outputs

| Business question | Required analysis | Intended output |
|---|---|---|
| Is growth profitable? | Revenue, profit, margin trend | Executive trend view |
| Are discounts eroding profit? | Discount bands and margin by product/category | Discount diagnostic |
| Which products need intervention? | Sales, profit, margin, order contribution | Product drilldown |
| Which geographic areas need attention? | Sales, profit, margin, order count by region/state/city | Geographic scorecard (not store-level) |
| Where is stock at risk? | On-hand stock, recent unit demand, days of supply | Inventory risk table |
| Where is stock potentially excessive? | Stock compared with recent demand and movement | Slow-moving / excess-stock review |

## Non-functional requirements

- Every KPI must have a written definition and grain.
- SQL outputs must be reproducible from documented source tables.
- Dashboard totals must reconcile to validated SQL results.
- Source data, assumptions, and limitations must be transparent.
- Do not claim causal impact from descriptive correlations.
- Recommendations must state the evidence and the next action.
