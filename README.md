 # **📦 Data Warehouse & Analytics Project (PostgreSQL)**

This repository contains an end-to-end **Data Warehouse** built using **PostgreSQL** and the **Medallion Architecture (Bronze → Silver → Gold)**.  
The goal is to demonstrate practical skills in **data engineering, ETL, data modeling, and SQL analytics**.

----------

## **🔷 Architecture Overview**

### **Bronze Layer**

-   Raw ingestion of CRM and ERP CSV files
    
-   No transformations applied
    

### **Silver Layer**

-   Data cleaning and validation
    
-   Fixing corrupted dates
    
-   Handling nulls, negative values, inconsistent sales/price/quantity
    
-   Standardized and ready-for-modeling tables
    

### **Gold Layer**

-   Dimensional modeling (Fact + Dimension views)
    
-   Surrogate key generation
    
-   Business-friendly analytical model
    

----------

## **🧱 Data Model**

**Star Schema:**

-   **dim_customers** — customer attributes
    
-   **dim_products** — product attributes
    
-   **fact_sales** — transactional fact table
    

Key transformations:

-   Repairing broken dates (YYYYMMDD)
    
-   Recomputing sales = price × quantity
    
-   Normalizing price and quantity
    
-   Left joins between CRM and ERP datasets
    

----------

## **⚙️ ETL Logic**

-   Implemented with SQL (PostgreSQL)
    
-   Silver-layer cleansing rules
    
-   Automatic creation of surrogate keys
    
-   Business-rule validation of financial data
    
-   Reusable procedures and views
    

----------

## **📊 Analytics**

The Gold layer enables analysis such as:

-   Sales performance
    
-   Customer behavior
    
-   Product profitability
    
-   Time-based trends
    

----------

## **🎯 Skills Demonstrated**

-   SQL (PostgreSQL)
    
-   ETL development
    
-   Data Quality Handling
    
-   Data Warehouse Design
    
-   Medallion Architecture
    
-   Dimensional Modeling
    
-   Analytical SQL
    
-   Troubleshooting Data Issues
