Select * from production.categories;
Select * from production.brands;
Select * from production.products;
Select * from sales.customers;
Select * from sales.stores;
Select * from sales.staffs;
Select * from sales.orders;
Select * from sales.order_items;
Select * from production.stocks;

SELECT o.order_id, CONCAT(c.first_name,' ',c.last_name) AS "customer_name", c.city,
	c.state, o.order_date, SUM(oi.quantity) AS "total_units", 
	SUM(oi.quantity * oi.list_price) AS "total_sales",
	pp.product_name, pc.category_name, pb.brand_name, ss.store_name, 
	CONCAT(sls.first_name,' ', sls.last_name) AS "sales_rep"
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products pp ON oi.product_id = pp.product_id
JOIN production.categories pc ON pp.category_id = pc.category_id
JOIN production.brands pb ON pp.brand_id = pb.brand_id
JOIN sales.stores ss ON o.store_id = ss.store_id
JOIN sales.staffs sls ON o.staff_id = sls.staff_id
GROUP BY o.order_id, 
	CONCAT(c.first_name,' ',c.last_name),
	c.city, c.state, o.order_date, pp.product_name, 
	pc.category_name, pb.brand_name, ss.store_name, 
	CONCAT(sls.first_name,' ', sls.last_name);































