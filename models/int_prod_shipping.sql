with base as (
    select * from {{ ref('stg_supply_chain') }}
)

select product_type, sku as SKU, carrier, transport_mode, route, round(sum(shipping_cost), 2)  as total_shipping_costs

from base
group by product_type, sku, carrier, transport_mode, route
order by total_shipping_costs asc
