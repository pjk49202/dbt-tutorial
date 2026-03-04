with base as (
    select * from {{ ref('stg_supply_chain') }}
)

select
    supplier,
    supplier_location,
    count(sku)                          as total_skus,
    round(avg(defect_rate), 4)          as avg_defect_rate,
    round(avg(lead_time_days), 1)       as avg_lead_time,
    round(avg(manufacturing_cost), 2)   as avg_manufacturing_cost,
    sum(units_sold)                     as total_units_sold,
    round(sum(revenue), 2)              as total_revenue,
    round(sum(revenue) / nullif(sum(units_sold), 0), 2) as revenue_per_unit

from base
group by supplier, supplier_location
order by avg_defect_rate asc
