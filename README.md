# Agent Bear Data Playing Ground
Just doing some individual project  and  try to educate my self how to play with data :)

# Retail Sales & Profit Analysis

An end-to-end analysis of a retail transactions dataset using SQL and Tableau, 
answering a core business question: where is this company losing money, and 
what should it do differently?

**Live Dashboard:** https://public.tableau.com/app/profile/adrian.firmansyah.adi/viz/SuperSalesRetailSalesProfitAnalysis/Dashboard1?publish=yes

## Tools
PostgreSQL (via Supabase) for querying, Tableau Public for visualization.

## Approach
Wrote SQL queries progressing from basic filtering and aggregation to window 
functions (RANK, LAG) and CTEs to analyze profit drivers, product performance, 
and seasonal trends. Visualized findings in an interactive Tableau dashboard.

## Key Findings

1. **Discounts are actively destroying profit in specific categories.** 
   Furniture loses ~$39,700 in profit and Office Supplies loses ~$8,000 on 
   discounted orders, while Technology remains profitable even with discounts 
   applied — suggesting Furniture's margins are too thin to absorb discounting.

2. **Sales spike predictably every September and November, every year** 
   (2014–2017), consistent with back-to-school and holiday shopping cycles — 
   a repeatable pattern the business could plan inventory and staffing around.

3. **West region leads in both sales and profit**, while performance varies 
   notably across other regions — highlighting where to focus retention efforts 
   versus where to investigate underperformance.

## Recommendation
Reduce or eliminate discounting on Furniture, where margins can't absorb it. 
Use the Sept/Nov demand pattern to plan inventory ahead of season.

## Files
- `queries.sql` — all SQL queries used in the analysis
- Dashboard link above for the visual output

