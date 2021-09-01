-- artists TABLE
{% set tables = ['stg_songplays', 'stg_top_tracks'] %}

{% for table in tables %}
SELECT
    DISTINCT artist_id,
    artist_name,
    artist_popularity,
    artist_followers,
    artist_genre,
    artist_genre_others
FROM
    {{ ref(table) }}

    {% if not loop.last -%}
    UNION
    {%- endif %}
{% endfor %}
