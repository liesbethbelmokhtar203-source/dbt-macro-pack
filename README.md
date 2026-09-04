# dbt-macro-pack

A second bag of dbt macros I reach for after the basics in
[dbt-snippets](https://github.com/liesbethbelmokhtar203-source/dbt-snippets) are done.

## What is in here

- **`schema_tests.sql`** — conditional and range tests dbt Core does not ship by
  default:
  - `test_not_null_conditional` — only fail the not-null where a sibling column
    has a specific value (the "row is active" pattern).
  - `test_accepted_range` — fail outside `[min, max]`, upper bound optional.
- **`incremental.sql`** — `incremental_daily`, an incremental filter with a
  lookback window so late-arriving rows get picked up instead of silently
  skipped.

## Use

Drop the files into your `macros/` directory and call them as normal tests /
macros. Every macro has a comment explaining the arguments.

## Why

These exist because the generic tests cover the happy path and the happy path is
not where pipelines break. Most warehouse incidents I have been called in to fix
came from a conditional null nobody tested for, or an incremental model that
stopped catching late rows.

MIT licensed. Use them, change them, do not sue me.
