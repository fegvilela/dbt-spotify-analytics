-- songplays_albums TABLE
WITH songplay_albums AS (
    SELECT
        f.*,
        A.album_name,
        A.album_release_year,
        A.album_type,
        t.track_name,
        track_popularity,
        track_danceability,
        track_speechiness
    FROM
        {{ ref ('fct_songplays') }}
        f
        LEFT JOIN {{ ref ('dim_tracks') }}
        t USING (track_id)
        LEFT JOIN {{ ref ('dim_albums') }} A USING (album_id)
)
SELECT
    *
FROM
    songplay_albums
