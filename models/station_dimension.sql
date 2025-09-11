{{
    config(
        materialized='table'
    )
}}

WITH BIKE AS(

select
distinct
START_STATIO_ID AS START_STATION_ID
,START_STATION_NAME AS START_STATION_NAME
,START_LAT AS STATION_LAT 
,START_LNG AS STATION_LNG


FROM {{ source('demo', 'bike') }}
WHERE RIDE_ID <> 'ride_id'


)

select * FROM BIKE