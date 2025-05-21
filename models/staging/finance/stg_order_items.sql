with source as (
    select * from {{ source('finance', 'order_items') }}
)

select
        order_item_id,
        order_id,
        product_id,
        quantity,
        price
    from source