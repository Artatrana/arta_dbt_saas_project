with source as (
    select * from {{ source('marketing', 'leads') }}
)

select
    id as lead_id,
    campaign_id,
    lead_date,
    lead_status,
    customer_id
from source

