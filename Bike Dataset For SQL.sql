create schema bike
USE bike;

CREATE VIEW PRO_BRAND_CAT AS
SELECT p.product_id, p.product_name, c.category_name, p.model_year, p.list_price, p.brand_id, b.brand_name
FROM products p
JOIN brands b
JOIN categories c
ON b.brand_id = p.brand_id
AND p.category_id = c.category_id;


CREATE VIEW CUS_OR_ORIT AS
SELECT cs.customer_id, cs.first_name, cs.last_name, cs.phone, cs.email, cs.street, cs.city, cs.state, cs.zip_code,
o.order_id, o.order_status, o.order_date, o.required_date, o.shipped_date, o.store_id, o.staff_id,
os.item_id, os.product_id, os.quantity, os.list_price, os.discount
FROM customers cs
JOIN orders o
JOIN order_items os
ON cs.customer_id = o.customer_id
AND os.order_id = o.order_id;


CREATE VIEW STORE_STAFF_SS AS
SELECT s.staff_id, s.first_name as staff_Fname, s.last_name as staff_Lname, s.email as staff_Email, s.phone as staff_phone, s.active, s.store_id, s.manager_id,
st.product_id, st.quantity, ss.store_name, ss.phone as store_phone, ss.email as store_email, ss.street as store_Street, ss.city as store_city, ss.state as store_state, ss.zip_code as store_zip_code
FROM staffs s
JOIN stocks st
JOIN stores ss
ON s.store_id = st.store_id
AND ss.store_id = st.store_id;




# FROM VIEW
CREATE VIEW COMPLETE_DATA AS
SELECT coo.customer_id, coo.first_name, coo.last_name, coo.city, coo.state,
coo.order_status, coo.order_date, coo.required_date, coo.shipped_date, coo.quantity AS ordered_quantity, coo.list_price AS order_item_listPrice, coo.discount,
pbc.product_name, pbc.category_name, pbc.model_year, pbc.list_price AS product_listPrice, pbc.brand_name,
sss.staff_Fname, sss.staff_Lname, sss.manager_id,
sss.quantity AS stocks_quantity, sss.store_name, sss.store_city, sss.store_state
FROM cus_or_orit coo
JOIN pro_brand_cat pbc
JOIN store_staff_ss sss
ON coo.product_id = pbc.product_id
AND coo.product_id = sss.product_id;

