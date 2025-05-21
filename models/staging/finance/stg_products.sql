with source as (
    select * from {{ source('finance', 'products') }}
)

select
    id as product_id,
    name,
    category,
    price
from source
