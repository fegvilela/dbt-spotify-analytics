-- top_track_genres TABLE
WITH track_genres AS (
    SELECT
        A.artist_genre
    FROM
        {{ ref ('fct_top_tracks') }}
        f
        LEFT JOIN {{ ref ('dim_artists') }} A USING (artist_id)
    UNION ALL
    SELECT
        unnest(string_to_array(A.artist_genre_others, ', ')) AS artist_genre
    FROM
        {{ ref ('fct_top_tracks') }}
        f
        LEFT JOIN {{ ref ('dim_artists') }} A USING (artist_id)
)
SELECT
    *,
    COUNT(*) AS COUNT
FROM
    track_genres
WHERE
    artist_genre IS NOT NULL
GROUP BY
    artist_genre
ORDER BY
    COUNT DESC
