-- stage_playlists
with source as (
    select
        *
    from {{ ref('current_user_playlists') }}
),

stage_playlists as (
    select
        playlist_rank,
        playlist_id as playlist_key,
        playlist_name,
        playlist_size,
        playlist_is_public,
        playlist_is_collaborative
    from source
)
select
    *
from stage_playlists