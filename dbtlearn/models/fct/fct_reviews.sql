{{
    config(
    materialized = 'incremental',
    on_schema_change='fail'
)}}
WITH scr_review AS(
    SELECT * FROM {{ref('scr_review')}})
SELECT * FROM scr_review WHERE review_text is not null
{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{this}})
{% endif%}