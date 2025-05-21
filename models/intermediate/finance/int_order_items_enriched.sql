with order_items as (
    select * from {{ source('finance', 'order_items') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
products as (
    select * from {{ ref('stg_products') }}
)

select
    oi.order_id,
    o.customer_id,
    o.order_date,
    oi.product_id,
    p.category,
    p.price,
    oi.quantity,
    oi.quantity * p.price as revenue
from order_items oi
join orders o on oi.order_id = o.order_id
join products p on oi.product_id = p.product_id
where o.status = 'completed'