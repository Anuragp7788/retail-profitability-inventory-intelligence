# Business insights and recommendations

## Current evidence

The first sales and profitability findings are documented in [reports/validated_sales_findings.md](../reports/validated_sales_findings.md). That report includes the observed results, interpretation, investigation recommendations and limitations. This file remains the template for adding new findings from the inventory workstream.

## Publication rule

This document is the evidence log for the final case study. Do not add invented findings, generic recommendations presented as results, or unsupported financial impact estimates.

Every published insight must include:
1. The business question.
2. The observed result and the period / segment it covers.
3. The calculation or chart that supports it.
4. The business implication.
5. A practical next action.
6. A limitation or alternative explanation where relevant.

## Insight format

### Insight ID: F-XXX — [Short finding title]

- **Business question:** [What did we investigate?]
- **Evidence:** [Validated result, period, segment and supporting output]
- **Interpretation:** [What does this mean for the business?]
- **Recommendation:** [What should the business do next?]
- **Expected mechanism:** [Why might the action help? Do not state unmeasured impact as fact.]
- **Validation / experiment:** [How should the business test whether the action worked?]
- **Limitations:** [Data gaps, assumptions, uncertainty and alternative explanations]
- **Evidence link:** [Notebook / SQL / dashboard page]

## Investigation backlog

| Topic | What to test | Status |
|---|---|---|
| Profit leakage | Identify products/subcategories with negative or unusually low recorded profit | Analysed — see validated findings |
| Discounting | Compare margin across discount bands and categories | Analysed — see validated findings |
| Product mix | Identify products with high sales contribution but weak profit contribution | Partially analysed — product-level follow-up pending |
| Geography | Compare sales and profit by region/state/city | Analysed — see validated findings |
| Order value | Compare order-level AOV by segment and time | Baseline AOV calculated; segment/time drilldown pending |
| Inventory risk | Compare on-hand stock with recent observed unit sales | Pending separate dataset validation |

## Final executive summary

The initial sales-workstream summary is available in [reports/validated_sales_findings.md](../reports/validated_sales_findings.md). The final combined executive summary will be completed after the inventory source is downloaded and analysed.
