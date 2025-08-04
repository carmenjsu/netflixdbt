{{
    config(materialized='ephemeral')
}}  --this create the data backend, not table nor view

WITH movies AS (
    SELECT * FROM {{ ref('dim_movies')}}
),

tags AS (
    SELECT * FROM {{ ref('dim_genome_tags')}}
),

scores AS (
    SELECT * FROM {{ ref('fct_genome_scores')}}
)

SELECT
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.relevance_score
FROM scores m ON m.movie_id = s.movie_id
LEFT JOIN tags t ON t.tag_id = s.tag_id