-- top_tracks table
WITH source AS (
    SELECT
        *
    FROM
        {{ ref('stg_top_tracks') }}
),
fact_top_tracks AS (
    SELECT
        track_rank,
        track_id,
        album_id,
        artist_name_others,
        artist_id,
        artist_id_others
    FROM
        source
)
SELECT
    *
FROM
    fact_top_tracks
