-- albums TABLE
{% set tables = ['stg_songplays', 'stg_top_tracks'] %}

{% for table in tables %}
SELECT
    DISTINCT album_id,
    album_name,
    album_release_year,
    album_type
FROM
    {{ ref(table) }}

    {% if not loop.last -%}
    UNION
    {%- endif %}
{% endfor %}
