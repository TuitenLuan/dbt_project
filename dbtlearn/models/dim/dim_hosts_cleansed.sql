{{
    config(
    materialized = 'view',
)}}
With scr_host AS (
    SELECT *
    FROM 
        {{ref('scr_host')}}
)
SELECT host_id,
        NVL(host_name,'Anonymous') AS host_name,
        is_superhost,
        created_at,
        updated_at 
FROm scr_host