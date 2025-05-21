with source as (
    select * from {{ source('finance', 'customers') }}
)

select
    id as customer_id,
    first_name,
    last_name,
    email,
    created_at as customer_since
from source
