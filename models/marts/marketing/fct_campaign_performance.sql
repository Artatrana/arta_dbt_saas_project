with leads as (
    select * from {{ ref('stg_leads') }}
),

campaigns as (
    select * from {{ ref('stg_campaigns') }}
)

select
    c.campaign_id,
    c.campaign_name,
    c.channel,
    count(l.lead_id) as total_leads,
    count(case when l.lead_status = 'converted' then 1 end) as converted_leads
from campaigns c
left join leads l on c.campaign_id = l.campaign_id
where c.start_date >= dateadd(month, -6, current_date)
group by 1, 2, 3