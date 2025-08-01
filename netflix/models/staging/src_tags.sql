WITH raw_tags AS (
    SELECT * FROM MOVIELENS.RAW.RAW_TAGS
)

SELECT
    userId AS user_id,
    movieId AS movied_id,
    tag,
    TO_TIMESTAMP_LTZ(timestamp) AS tag_timestmap
FROM raw_tags