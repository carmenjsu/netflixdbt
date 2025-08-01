WITH src_genome_scores AS (
    SELECT * FROM {{ ref('src_genome_scores')}}
)

SELECT
    movie_id,
    tag_id,
    ROUND(relevance, 4) AS relevance_score
FROM src_genome_scores
WHERE relevance > 0