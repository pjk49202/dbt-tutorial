with source as (
    select * from {{ ref('supply_chain_data') }}
),

renamed as (
    select
        -- product info
        "Product type"          as product_type,
        "SKU"                   as sku,
        "Price"                 as price,
        "Availability"          as availability,

        -- sales
        "Number of products sold"   as units_sold,
        "Revenue generated"         as revenue,
        "Customer demographics"     as customer_segment,

        -- inventory & supply
        "Stock levels"              as stock_levels,
        "Lead times"                as lead_time_days,
        "Order quantities"          as order_quantity,
        "Supplier name"             as supplier,
        "Location"                  as supplier_location,

        -- manufacturing
        "Production volumes"            as production_volume,
        "Manufacturing lead time"       as manufacturing_lead_time,
        "Manufacturing costs"           as manufacturing_cost,
        "Inspection results"            as inspection_status,
        "Defect rates"                  as defect_rate,

        -- shipping
        "Shipping times"        as shipping_days,
        "Shipping carriers"     as carrier,
        "Shipping costs"        as shipping_cost,
        "Transportation modes"  as transport_mode,
        "Routes"                as route,
        "Costs"                 as total_cost

    from source
)

select * from renamed
