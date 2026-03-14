-- ADVANCED DATA ANALYSIS

/* CHANGE - OVER - TIME
		It is a technique to analyze how a measure evolves over time.
		Helps tracks trends and identify seasonality in the data.

		Σ [Measure] By [Date Dimension]   -- Alt + 228 (Σ)
		e.g., Total Sales by Year
			  Average Cost by Month
*/
-- Analyse sales performance over time
-- Quick Date Functions

SELECT 
		YEAR(order_date) AS order_year,		-- changing granurality from date to year
		MONTH(order_date) AS order_month,	-- for month
		SUM(sales) AS total_sales,
		COUNT(DISTINCT customer_key) AS total_customers,
		SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)

-- Datetrunc ()
SELECT 
		DATETRUNC(MONTH,order_date) AS order_month,	-- for month
		SUM(sales) AS total_sales,
		COUNT(DISTINCT customer_key) AS total_customers,
		SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH,order_date)
ORDER BY DATETRUNC(MONTH,order_date)	

-- Format()
SELECT 
		FORMAT(order_date, 'yyyy-MMM') AS order_month,		-- ( yyyy-MMM) M should be capital and y should be small. 
		SUM(sales) AS total_sales,
		COUNT(DISTINCT customer_key) AS total_customers,
		SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM')		-- The ans will be in string , so its only sorted by year not months