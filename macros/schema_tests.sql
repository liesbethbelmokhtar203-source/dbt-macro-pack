{% macro test_not_null_conditional(model, column_name, condition_column, condition_value) %}
  {#
    Fail only where condition_column = condition_value AND column_name is null.
    Use case: "amount must be present for every row where status = 'shipped'".
  #}
  select *
  from {{ model }}
  where {{ condition_column }} = '{{ condition_value }}'
    and {{ column_name }} is null
{% endmacro %}

{% macro test_accepted_range(model, column_name, min_value, max_value=none) %}
  {# Fail rows outside [min_value, max_value]. Upper bound optional. #}
  select *
  from {{ model }}
  where {{ column_name }} < {{ min_value }}
  {% if max_value is not none %}
    or {{ column_name }} > {{ max_value }}
  {% endif %}
{% endmacro %}
