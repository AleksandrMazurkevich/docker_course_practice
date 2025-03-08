{{
    config (
        materialized = 'incremental',
        incremental_strategy = 'append', 
        tags = ['item']

    )
}}


WITH new_item_more_zero AS (
    SELECT 
        z."externalId",
        z."_airbyte_extracted_at",
        z."quantity"  -- Добавляем quantity для фильтрации
    FROM {{ source('intermediate_seeds', 'items') }} z
    WHERE z.quantity > 0  -- Исправлено (было src.quantity)
),
new_item AS (
    SELECT 
        src."externalId",
        src."_airbyte_extracted_at"
    FROM new_item_more_zero src
    {% if is_incremental() %}
    LEFT JOIN {{ this }} tgt
        ON src."externalId" = tgt."externalId"
    WHERE tgt."externalId" IS NULL  
    {% endif %}
)

SELECT 
    "externalId",
    "_airbyte_extracted_at"
FROM new_item
  
  