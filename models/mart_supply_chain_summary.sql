{{ config(materialized='table') }}

with supplier as (
    select * from {{ ref('int_supplier_performance') }}
),

product as (
    select * from {{ ref('int_prod_revenue') }}
),

final as (
    select
        p.product_type,
        p.total_skus,
        p.total_units_sold,
        p.total_revenue,
        p.revenue_per_unit,
        s.supplier,
        s.supplier_location,
        s.avg_defect_rate,
        s.avg_lead_time,
        s.avg_manufacturing_cost

    from product p
    left join supplier s
        on 1=1  -- cross join since these are different grain summaries
)

select * from final
order by total_revenue desc
