-- stage_playlist_items
with source as (
    select
        *
    from {{ ref('playlist_items') }}
),
stage_playlist_items as (
    select
        track_rank,
        track_id as track_key,
        track_name,
        artists,
        track_duration,
        track_is_explicit,
        track_popularity,
        album_id as album_key,
        album_name,
        album_release_year,
        album_type,
        artist_name,
        artist_name_others,
        artist_id as artist_key,
        artist_id_others as artist_key_others,
        track_danceability,
        track_energy,
        track_key as track_musickey,
        track_loudness,
        track_mode,
        track_speechiness,
        track_acousticness,
        track_instrumentalness,
        track_liveness,
        track_valence,
        artist_popularity,
        artist_followers,
        artist_genre,
        artist_genre_others,
        playlist_id as playlist_key
    from
        source
)
select
    *
from
    stage_playlist_items
