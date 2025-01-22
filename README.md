# BikeStore Analytics

This project involves analyzing sales data from the "BikeStore" database, which includes 9 tables: **categories**, **brands**, **products**, **customers**, **stores**, **staffs**, **orders**, **order_items**, and **stocks**.

## Objective
The goal of this project was to generate meaningful insights from the database using SQL Server for querying and Excel for data visualization. The analysis includes customer order details, product information, sales performance, and store data.

## Approach

### Database & Query
I used SQL Server to query the database and created the following SQL query to pull relevant data for analysis:

```sql
SELECT ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name) AS customer_name,
    cus.city AS city,
    cus.state AS state,
    ord.order_date AS order_date,
    ord.shipped_date AS shipped_date,
    SUM(itm.quantity) AS quantity,
    SUM(quantity * prd.list_price) AS revenue,
    prd.product_name AS product_name,
    bra.brand_name AS brand_name,
    cat.category_name AS category,
    sto.store_name AS store,
    CONCAT(stf.first_name, ' ', stf.last_name) AS sales_rep
FROM sales.orders AS ord
JOIN sales.customers AS cus ON ord.customer_id = cus.customer_id
JOIN sales.order_items AS itm ON itm.order_id = ord.order_id
JOIN production.products AS prd ON prd.product_id = itm.product_id
JOIN production.categories AS cat ON cat.category_id = prd.category_id
JOIN sales.stores AS sto ON sto.store_id = ord.store_id
JOIN sales.staffs AS stf ON stf.store_id = sto.store_id
JOIN production.brands AS bra ON bra.brand_id = prd.brand_id
GROUP BY ord.order_id, cus.first_name, cus.last_name, cus.city, cus.state, ord.order_date, ord.shipped_date, prd.product_name, cat.category_name, sto.store_name, stf.first_name, stf.last_name, bra.brand_name;
```

### Excel Integration
After executing the query, I connected the results to Excel using the "Get Data" feature. This allowed me to dynamically fetch the latest data directly from the SQL Server database.

### Data Analysis & Visualization
I created several key visualizations and analyses, including:
- **Total revenue** by product, store, and sales rep.
- **Revenue per brand** to understand which brands perform the best.
- **Revenue per category** to identify the most profitable categories.
- **Revenue per state** to assess geographic performance.
- **Top 10 customers** based on revenue, highlighting the most valuable clients.
- **Revenue per sales representative** to evaluate individual sales rep performance.

I designed a **green-themed dashboard** featuring:
- **Dynamic charts** showing trends in revenue and quantity sold.
- **Slicers** for filtering data by store, product, category, brand, and sales rep.
- **A timeline** for visualizing data over specific time periods.
- **Interactive features** for seamless data exploration.

## Tools Used
- **SQL Server** for data querying.
- **Excel** for data connection, pivot tables, charts, and dashboard creation.

## Results
The dashboard provides a clear and interactive overview of sales performance, customer demographics, and product trends. It allows stakeholders to easily explore total revenue, analyze performance by different categories, brands, and states, and identify top customers and sales reps.
