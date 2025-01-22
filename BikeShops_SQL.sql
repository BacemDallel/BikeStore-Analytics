SELECT 
    ord.order_id AS 'order_id',
    CONCAT(cus.first_name, ' ', cus.last_name) AS 'customer_name', 
    cus.city AS city,
    cus.state AS 'cus_state',
    ord.order_date AS 'order_date',
	SUM(itm.quantity) AS 'total_units',
	SUM(itm.quantity * itm.list_price) AS 'revenue',
	prd.product_name,
	cat.category_name as 'category',
	sto.store_name AS 'store',
	CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep'



FROM sales.orders AS ord
JOIN sales.customers AS cus
ON ord.customer_id = cus.customer_id 
JOIN sales.order_items AS itm
ON itm.order_id = ord.order_id
JOIN production.products AS prd
ON prd.product_id = itm.product_id
JOIN production.categories AS cat
ON cat.category_id = prd.category_id
JOIN sales.stores AS sto
ON sto.store_id = ord.store_id
JOIN sales.staffs AS sta
ON sta.store_id = ord.order_id


GROUP BY
    ord.order_id, 
    cus.first_name, 
    cus.last_name, 
    cus.city, 
    cus.state, 
    ord.order_date,
	prd.product_name,
	cat.category_name,
	sto.store_name,
	sta.first_name,
	sta.last_name
;
