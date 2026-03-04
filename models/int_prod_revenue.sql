with base as (
    select * from {{ ref('stg_supply_chain') }}
)

select
    product_type,
    count(sku)                          as total_skus,
    sum(units_sold)                     as total_units_sold,
    round(sum(revenue), 2)              as total_revenue,
    round(sum(revenue) / nullif(sum(units_sold), 0), 2) as revenue_per_unit

from base
group by product_type
order by total_revenue asc
