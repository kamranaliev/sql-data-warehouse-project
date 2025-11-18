# sql-data-warehouse-project
Building a modern data warehouse with PostegreSQL , including ETL processes, data modeling, and analytics.

📦 Data Warehouse & Analytics Project (PostgreSQL, Medallion Architecture)

This project demonstrates a complete end-to-end data warehouse built using PostgreSQL and a modern Medallion Architecture (Bronze → Silver → Gold).

It showcases practical skills in data engineering, SQL development, ETL pipelines, and analytical modeling.

🔷 Project Overview

The goal of the project is to consolidate CRM and ERP datasets, clean and transform them, and design an analytical model optimized for reporting and business insights.

🧱 Key Components
1️⃣ Data Architecture — Medallion Design

Bronze layer: Raw ingestion of CSV files

Silver layer: Data cleaning, validation, type fixes, deduplication

Gold layer: Dimensional modeling (Fact + Dimension views)

2️⃣ ETL Pipelines (SQL-based)

Data quality checks

Date normalization and parsing

Surrogate key creation

Business rules for sales totals, prices, and quantities

Automated loading into Silver and Gold layers

3️⃣ Data Modeling

Designed a simplified star schema:

Dimensions: Customers, Products

Fact table: Sales

Included surrogate keys, lookups, and slowly changing attributes (where applicable)

4️⃣ Analytics & Reporting

Created SQL analytical queries and metrics, such as:

Customer segmentation

Product performance

Sales trends and revenue insights

🎯 Skills Demonstrated

SQL (PostgreSQL)

ETL / Data Cleaning

Data Warehouse Design

Medallion Architecture

Dimensional Modeling (Fact/Dim)

Analytical SQL

Debugging data quality issues
