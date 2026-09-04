{#
  Incremental filter with a lookback window. Late-arriving rows inside the
  window are re-processed; rows older than the window are skipped. The default
  lookback is 3 days, which is enough for most nightly fact tables; raise it for
  sources that arrive a week late.
#}
{% macro incremental_daily(model, date_col, lookback_days=3) %}
  {% set start %}
    dateadd(day, -{{ lookback_days }}, current_date)
  {% endset %}
  select *
  from {{ model }}
  where {{ date_col }} >= {{ start }}
{% endmacro %}
