CREATE OR REPLACE VIEW store_sales AS
SELECT 
    s.store_type,
    SUM(o.product_quantity * p.sale_price) AS total_sales,
    SUM(o.product_quantity * p.sale_price) * 100.0 / SUM(SUM(o.product_quantity * p.sale_price)) OVER () AS percenatage_of_total_sales,
    COUNT(o.index) AS order_count
FROM orders o 
INNER JOIN dim_stores s ON s.store_code = o.store_code
INNER JOIN dim_products p ON p.product_code = o.product_code
GROUP BY s.store_type;



SELECT * FROM store_sales