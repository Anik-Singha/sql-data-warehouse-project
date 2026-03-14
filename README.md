# 📊 Modern SQL Data Warehouse Project

![SQL](https://img.shields.io/badge/SQL-Server-blue)
![Data Warehouse](https://img.shields.io/badge/Data-Warehouse-green)
![ETL](https://img.shields.io/badge/ETL-Pipelines-orange)
![Analytics](https://img.shields.io/badge/Analytics-SQL-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)
![Status](https://img.shields.io/badge/Status-Completed-success)

A complete **end-to-end Modern Data Warehouse** built using **SQL Server** following industry best practices.

This project demonstrates:

- Data Engineering
- ETL Pipeline Development
- Data Warehouse Architecture
- Dimensional Data Modeling
- Advanced SQL Analytics
- Business Reporting

---

# 📌 Project Overview

This project implements a **Modern Data Warehouse** using the **Medallion Architecture (Bronze → Silver → Gold)** to transform raw CRM and ERP datasets into **analytics-ready business insights**.

The pipeline:

1️⃣ Ingests raw CSV data  
2️⃣ Cleans and standardizes datasets  
3️⃣ Builds dimensional models  
4️⃣ Generates analytical reports using advanced SQL

The final result is a **business-ready data warehouse capable of supporting analytics and reporting.**

---

# 🏗️ Data Architecture

This project follows the **Medallion Architecture** approach.

## 🥉 Bronze Layer – Raw Data

Stores **raw source data exactly as received** from external systems.

Source Systems:

- CRM System  
- ERP System  

Tables created include:

- `crm_cust_info`
- `crm_prd_info`
- `crm_sales_details`
- `erp_loc_a101`
- `erp_cust_az12`
- `erp_px_cat_g1v2`

These tables are created using SQL DDL scripts. :contentReference[oaicite:0]{index=0}

Data is loaded using a **BULK INSERT ETL stored procedure**. :contentReference[oaicite:1]{index=1}

Key features:

- Automated batch loading  
- Table truncation before load  
- Load duration tracking  
- Error handling  

---

## 🥈 Silver Layer – Data Cleaning & Transformation

The Silver layer performs **data cleansing, normalization, and transformation**.

Transformations performed:

- Deduplication using `ROW_NUMBER()`
- Gender normalization
- Marital status mapping
- Country name standardization
- Invalid date handling
- Recalculation of incorrect sales values

These transformations are implemented through the **Silver ETL stored procedure**. :contentReference[oaicite:2]{index=2}

Silver tables also include **metadata columns to track ETL loads**. :contentReference[oaicite:3]{index=3}

---

## 🥇 Gold Layer – Analytical Data Model

The Gold layer contains **analytics-ready views designed using a Star Schema**.

### Dimension Tables

- `dim_customers`
- `dim_products`

### Fact Table

- `fact_sales`

These views integrate CRM and ERP datasets into a unified business model. :contentReference[oaicite:4]{index=4}

This layer is optimized for:

- BI tools
- Dashboards
- Business analytics queries

---

# 🔍 Exploratory Data Analysis (EDA)

Exploratory analysis was performed on the **Gold Layer** to validate the warehouse and generate business insights.

### Analysis Includes

- Database metadata exploration
- Dimensional analysis
- KPI calculations
- Revenue distribution analysis

### KPIs Calculated

- Total Sales
- Total Orders
- Total Customers
- Total Products
- Average Price

### Business Insights

- Revenue by product category
- Customer distribution by country
- Top revenue generating products
- Top customers by revenue

All EDA queries are documented in the analysis scripts. :contentReference[oaicite:5]{index=5}

---

# 📈 Advanced Data Analysis

The project includes **advanced analytical SQL queries** to generate business insights.

---

## Change Over Time Analysis

Tracks how metrics evolve across time periods.

Examples:

- Monthly Sales Trends
- Customer Growth
- Quantity Sold Over Time

Uses time aggregation functions:

- `YEAR()`
- `MONTH()`
- `DATETRUNC()` :contentReference[oaicite:6]{index=6}

---

## Cumulative Analysis

Calculates running totals and moving averages to analyze growth patterns.

Examples:

- Running total of sales
- Moving average product price

Implemented using SQL **window functions**. :contentReference[oaicite:7]{index=7}

---

## Performance Analysis

Evaluates product performance over time.

Metrics include:

- Year-over-Year growth
- Performance vs average
- Sales trend direction

Uses SQL functions such as:

- `LAG()`
- `AVG() OVER()` :contentReference[oaicite:8]{index=8}

---

## Part-to-Whole Analysis

Determines how much each category contributes to total revenue.

Example output:

| Category | Total Sales | Contribution |
|--------|--------|--------|
| Bikes | 1,200,000 | 42% |

Implemented using window aggregation functions. :contentReference[oaicite:9]{index=9}

---

## Data Segmentation

Groups customers and products into meaningful segments.

Customer Segments:

- VIP
- Regular
- New

Product Segments:

- Low Cost
- Medium Cost
- High Cost

Implemented using `CASE` statements and grouping logic. :contentReference[oaicite:10]{index=10}

---

# 📊 Analytical Reports

Two analytical views were built for business reporting.

---

## Customer Analytics Report

Metrics included:

- Total Orders
- Total Sales
- Total Products Purchased
- Customer Lifespan
- Recency
- Average Order Value
- Average Monthly Spend

Customers are also segmented by:

- Age group
- Spending behavior

Implemented as:


gold.report_customers


:contentReference[oaicite:11]{index=11}

---

## Product Performance Report

Tracks product-level performance metrics including:

- Total Orders
- Total Revenue
- Total Quantity Sold
- Total Customers
- Average Selling Price
- Average Monthly Revenue

Products are segmented into:

- High Performers
- Mid Range
- Low Performers

Implemented as:


gold.report_products


:contentReference[oaicite:12]{index=12}

---

# 🧠 Skills Demonstrated

### Data Engineering

- SQL Server
- ETL Pipeline Design
- Data Warehouse Architecture

### Data Modeling

- Star Schema
- Fact & Dimension Tables

### Data Transformation

- Data Cleaning
- Data Standardization
- Data Quality Validation

### Analytical SQL

- Window Functions
- Trend Analysis
- Customer Segmentation
- Performance Analytics

---

# 📂 Repository Structure


data-warehouse-project/

datasets/
Raw CSV files (CRM & ERP)

docs/
Data architecture diagrams
Data model documentation

scripts/
setup/
bronze/
silver/
gold/

analysis/
change_over_time.sql
cumulative_analysis.sql
performance_analysis.sql
segmentation_analysis.sql

reports/
customer_report.sql
product_report.sql

README.md
LICENSE


---

# 🚀 Technologies Used

- SQL Server
- T-SQL
- Data Warehousing
- ETL Pipelines
- Dimensional Modeling
- Analytical SQL

---

# 🛡️ License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute it with attribution.

---

# 👤 About the Author

**Anik Singha**  
🎓 CSE Graduate | Aspiring Data Analyst / Data Engineer  

Interested in:

- Data Engineering
- Data Warehousing
- SQL Analytics
- Building real-world data projects