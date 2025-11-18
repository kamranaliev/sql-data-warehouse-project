 # **📦 Data Warehouse & Analytics Project (PostgreSQL)**

This repository contains an end-to-end **Data Warehouse** built using **PostgreSQL** and the **Medallion Architecture (Bronze → Silver → Gold)**.  
The goal is to demonstrate practical skills in **data engineering, ETL, data modeling, and SQL analytics**.

----------

## **🔷 Architecture Overview**
<img width="1012" height="641" alt="data_architecture" src="https://github.com/user-attachments/assets/fadc8653-2d34-43c3-b76d-ee1d70f272e3" />


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
<img width="1011" height="763" alt="SALES DATA MART (Star Schema) drawio" src="https://github.com/user-attachments/assets/b8a48df8-91d5-46aa-8336-71724752f329" />

-   **dim_customers** - customer attributes
    
-   **dim_products** - product attributes
    
-   **fact_sales** - transactional fact table
    

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

  ## **About Me**

I'm passionate about **Data Engineering**, **ETL development**, and **analytics**.  
I focus on creating efficient data flows, improving data quality, and designing models that support real business insights.

My key strengths:

-   Strong SQL (PostgreSQL)
    
-   ETL pipelines (Bronze → Silver → Gold)
    
-   Data Quality & Validation Rules
    
-   Data Modeling (Star Schema, Dimensions, Facts)
    
-   Analytical thinking & problem solving
    

I build projects to level up my skills and prepare for real-world data engineering roles.

## 🔗 Links
- **LinkedIn:** [Kamran Aliev] https://www.linkedin.com/in/kamran-%C9%99liyev-131448251/
- **Email:** kamranaliev2@gmail.com
