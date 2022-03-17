{{ config(materialized='table') }}
{{ generate_demographics ('donors', 'year')}}
