INSERT INTO silver.crm_cust_info(
	cst_id, 
	cst_key, cst_firstname, 
	cst_lastname, cst_marital_status, 
	cst_gndr, 
	cst_create_date)
SELECT
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
	 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
	 ELSE 'N/A'
END cst_marital_status,
CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
	 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
	 ELSE 'N/A'
END cst_gndr,
cst_create_date
FROM (
SELECT  
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC ) AS flag_last
FROM bronze.crm_cust_info
)AS T WHERE flag_last = 1 ;

==================================================


INSERT INTO silver.crm_prd_info(
prd_id,
cat_id,
prd_key,
prd_nm,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt
)

SELECT 
prd_id,
REPLACE(SUBSTRING(prd_key, 1, 5),'-','_') AS cat_id,
SUBSTRING(prd_key, 7, LENGTH(prd_key)) AS prd_key,
prd_nm,
COALESCE(prd_cost,0) AS prd_cost, 
CASE  UPPER(TRIM(prd_line)) 
	 WHEN 'M' THEN 'Mountain'
	 WHEN 'R' THEN 'Road' 
	 WHEN 'S' THEN 'Other Sales'
	 WHEN 'T' THEN 'Touring'
	 ELSE 'N/A'
END AS prd_line,
CAST(prd_start_dt AS DATE) AS prd_start_dt,
CAST(LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) - INTERVAL '1 DAY' AS DATE)   AS prd_end_dt
FROM bronze.crm_prd_info;

=======================================================

INSERT INTO silver.crm_sales_details (
sls_ord_num,
sls_prd_key,
sls_cust_id,
sls_order_dt,
sls_ship_dt,
sls_due_dt,
sls_sales,
sls_quantity,
sls_price
)
SELECT 
sls_ord_num, 
sls_prd_key, 
sls_cust_id,
CASE WHEN sls_order_dt = 0 OR LENGTH(CAST(sls_order_dt AS VARCHAR)) != 8 THEN NULL
	 ELSE CAST(CAST(sls_order_dt AS VARCHAR) AS DATE)
END AS sls_order_dt,

CASE WHEN sls_ship_dt = 0 OR LENGTH(CAST(sls_ship_dt AS VARCHAR)) != 8 THEN NULL
	 ELSE CAST(CAST(sls_ship_dt AS VARCHAR) AS DATE)
END AS sls_ship_dt, 

CASE WHEN sls_due_dt = 0 OR LENGTH(CAST(sls_due_dt AS VARCHAR)) != 8 THEN NULL
	 ELSE CAST(CAST(sls_due_dt AS VARCHAR) AS DATE)
END AS sls_due_dt, 

CASE WHEN sls_sales <= 0 OR sls_sales != ABS(sls_price) * ABS(sls_quantity) OR sls_sales IS NULL
	 THEN ABS(sls_price) * ABS(sls_quantity)
	 ELSE sls_sales
END AS sls_sales,

sls_quantity,

CASE WHEN sls_price <= 0  OR sls_price IS NULL OR sls_price != ABS(sls_sales) / NULLIF(sls_quantity,0)
	 THEN ABS(sls_sales) / NULLIF(sls_quantity,0)
	 ELSE sls_price
END AS sls_price
FROM bronze.crm_sales_details
==========================================

INSERT INTO silver.erp_cust_az12(cid,
bdate,
gen
)
SELECT 
TRIM(REPLACE(cid,'NAS','')) AS cid,

CASE WHEN bdate > CURRENT_DATE THEN NULL
	 ELSE bdate
END AS bdate,

CASE WHEN UPPER(TRIM(gen)) IN ('F','FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male'
	 ELSE 'N/A'
END AS gen
FROM bronze.erp_cust_az12
