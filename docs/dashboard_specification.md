# Power BI dashboard specification

This is the intended dashboard design. It is not a claim that a completed or validated Power BI report already exists.

## Design principles

- Put business decisions and the most important KPIs before decorative visuals.
- Use consistent definitions across SQL, Python, Excel and Power BI.
- Show currency, units, date range and data source clearly.
- Use a restrained visual system with accessible contrast and consistent number formats.
- Make slicers useful and predictable; avoid unnecessary filters.
- Provide tooltips and drillthrough where they answer a real follow-up question.
- Display data limitations where they affect interpretation.

## Page 1 — Executive overview

**Business question:** What is happening to sales and profitability?

Planned visuals:
- KPI cards: Sales, recorded profit, profit margin, distinct orders, units, AOV.
- Monthly sales and profit trend.
- Category contribution to sales and profit.
- Region performance comparison.
- A short evidence-led commentary area with the period and source scope.

Filters: order date, category, region, segment.

## Page 2 — Product and category profitability

**Business question:** Which products and categories contribute to or erode profitability?

Planned visuals:
- Category / subcategory sales and profit matrix.
- Product ranking by sales and recorded profit.
- High-sales / low-profit product quadrant.
- Discount band versus profit margin.
- Product detail drillthrough.

Caution: do not label correlation between discount and profit as causal impact.

## Page 3 — Customer and order behaviour

**Business question:** How do order value and purchasing patterns differ?

Planned visuals:
- AOV and order count by segment.
- Order value distribution.
- Customer / segment contribution where definitions support it.
- Geographic and category mix by segment.

AOV must be calculated from order-level sales totals, not line-level averages.

## Page 4 — Geographic performance

**Business question:** Where do sales and profit vary geographically?

Planned visuals:
- Region comparison.
- State / city ranking.
- Sales, profit and margin by geography.
- Drilldown from region to state to city.

This is a geographic view, not a store scorecard: the Sample Superstore source does not contain a store ID.

## Page 5 — Inventory health (after inventory source validation)

**Business question:** Where is inventory at risk relative to observed demand?

Potential visuals, subject to source fields:
- On-hand units.
- Days of supply / stock cover.
- Low-stock and potential excess-stock SKU list.
- Stock and sales trends by store and SKU.
- Stockout-risk matrix.

Do not show inventory turnover unless COGS and average inventory value are available and validated. Do not treat zero sales as zero demand without checking availability.

## Interaction and validation

- Every KPI must have a documented definition and source table.
- Slicers must not create misleading denominators.
- Totals must reconcile to validated SQL / Python outputs.
- Date filters must respect the source's actual coverage.
- Tooltips must show units and context.
- Each page must have a clear question and useful next action.

## Portfolio screenshots

Capture only after the report is built and validated:
1. Executive overview at full page.
2. Product profitability drilldown.
3. Discount analysis.
4. Geographic performance.
5. Inventory health (only if the source and measures are validated).
