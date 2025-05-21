with source as (
    select * from {{'marketing','campaigns'}}
)

select
    id as campaign_id,
    name as campaign_name,
    channel,
    start_date,
    end_date
from source