with enriched as (
    select * from {{ ref('int_order_items_enriched') }}
)

select
    date_trunc('month', order_date) as revenue_month,
    customer_id,
    category,
    sum(revenue) as total_revenue,
    count(distinct order_id) as total_orders
from enriched
group by 1, 2, 3