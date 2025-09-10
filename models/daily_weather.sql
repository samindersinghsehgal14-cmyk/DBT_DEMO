 WITH daily_weather AS (

    select 
    
    DATE(TIME) AS daily_weather
    ,weather
    ,TEMP
    ,PRESSURE
    ,HUMIDITY
    ,CLOUDS
    from {{ source('demo', 'weather') }}

    

),



daily_weather_agg AS (

SELECT
daily_weather
,weather
,round(AVG(TEMP),2) as avg_temp
,round(AVG(PRESSURE),2) as avg_pressure
,round(AVG(HUMIDITY),2) as avg_humidity
,round(AVG(CLOUDS),2) as avg_clouds


FROM daily_weather

GROUP BY DAILY_WEATHER, weather

QUALIFY ROW_NUMBER () OVER(PARTITION BY DAILY_WEATHER ORDER BY COUNT(weather) DESC ) =1
)

SELECT * FROM daily_weather_agg

