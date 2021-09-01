-- songplays table
WITH source AS (
    SELECT
        *
    FROM
        {{ ref('stg_songplays') }}
),
fact_songplays AS (
    SELECT
        songplays_id,
        track_id,
        track_played_at,
        album_id,
        artist_id,
        artist_id_others,
        artist_name_others
    FROM
        source
)
SELECT
    *
FROM
    fact_songplays
