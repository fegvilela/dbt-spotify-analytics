-- tracks TABLE
{% set tables = ['stg_songplays', 'stg_top_tracks'] %}

{% for table in tables %}
SELECT
    DISTINCT track_id,
    track_name,
    track_duration,
    track_is_explicit,
    track_popularity,
    track_danceability,
    track_energy,
    track_key,
    track_loudness,
    track_mode,
    track_speechiness,
    track_acousticness,
    track_instrumentalness,
    track_liveness,
    track_valence
FROM
    {{ ref(table) }}

    {% if not loop.last -%}
    UNION
    {%- endif %}
{% endfor %}
