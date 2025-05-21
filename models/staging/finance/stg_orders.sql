with source as (
    select * from {{ source('finance', 'orders') }}
)

select
    id as order_id,
    customer_id,
    status,
    order_date,
    total_amount
from source