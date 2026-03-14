/*
===============================================================================
Product Report
===============================================================================
Purpose:
    - This report consolidates key product metrics and behaviors.

Highlights:
    1. Gathers essential fields such as product name, category, subcategory, and cost.
    2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
    3. Aggregates product-level metrics:
       - total orders
       - total sales
       - total quantity sold
       - total customers (unique)
       - lifespan (in months)
    4. Calculates valuable KPIs: (key performance indicator)
       - recency (months since last sale)
       - average order revenue (AOR)
       - average monthly revenue
===============================================================================
*/
-- =============================================================================
-- Create Report: gold.report_products
-- =============================================================================
DROP VIEW IF EXISTS gold.report_products
GO
CREATE VIEW gold.report_products AS
WITH base_query AS (
/*---------------------------------------------------------------------------
1) Base Query: Retrieves core columns from tables
---------------------------------------------------------------------------*/
    SELECT 
            f.order_number,
            f.order_date,
            f.customer_key,
            f.sales,
            f.quantity,
            p.product_key,
            p.product_name,
            p.product_number,
            p.category,
            p.subcategory,
            p.cost
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL  )

, product_aggregate AS
/*---------------------------------------------------------------------------
2) Customer Aggregations: Summarizes key metrics at the customer level
---------------------------------------------------------------------------*/
(SELECT 
        product_key,
        product_name,
        category,
        subcategory,
        cost,
        -- total orders
        COUNT(DISTINCT order_number) AS total_orders,
        -- total sales
        SUM(sales) AS total_sales,
        -- total quantity sold
        SUM(quantity) AS total_quantity,
        -- total customers (unique)
        COUNT(DISTINCT customer_key) AS total_customers,
        -- lifespan (in months)
        DATEDIFF(MONTH, MAX(order_date), GETDATE()) AS lifespan,
        MAX(order_date) AS last_sale_date,
        ROUND(AVG(CAST(sales AS float) / NULLIF(quantity,0)),1) AS avg_selling_price
FROM base_query
GROUP BY 
        product_key,
        product_name,
        category,
        subcategory,
        cost    )

/*---------------------------------------------------------------------------
  3) Final Query: Combines all product results into one output
---------------------------------------------------------------------------*/
SELECT 
        product_key,
        product_name,
        category,
        subcategory,
        cost,
        total_orders,
        total_sales,
        total_quantity,
        total_customers,
        lifespan,
        last_sale_date,
        avg_selling_price,
        CASE WHEN total_sales > 50000 THEN 'High-Performers'
             WHEN total_sales >= 10000 THEN 'Mid-Range'
             ELSE 'Low-Performers'
        END product_segments,
        DATEDIFF(MONTH,last_sale_date,GETDATE()) AS recency,
        -- average order revenue (AOE)
        CASE WHEN total_orders = 0 THEN 0
             ELSE total_sales / total_orders 
        END avg_order_revenue,
        -- average monthly revenue
        CASE WHEN lifespan = 0 THEN total_sales
             ELSE total_sales / lifespan 
        END avg_monthly_revenue
FROM product_aggregate