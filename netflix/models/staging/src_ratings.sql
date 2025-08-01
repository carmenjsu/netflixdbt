WITH raw_ratings AS (
    SELECT * FROM MOVIELENS.RAW.RAW_RATINGS
)

SELECT
    userId AS user_id,
    movieId AS movie_id,
    TO_TIMESTAMP_LTZ(timestamp) AS rating_timestmap
FROM raw_ratings