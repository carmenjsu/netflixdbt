{% snapshot sna_tags %}

{{
    congif(
        target_schema = 'snapshots',
        unique_key = ['user_id','movie_id','tag'],
        strategy = 'timestamp',
        invalidate_hard_deletes = TRUE
    )
}}

SELECT
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp AS TIMESTAMP_NTZ) AS tag_timestamp
FROM {{ ref('src_tags')}}
LIMIT 100

{% endsnapshot %}