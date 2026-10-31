<div align="center">

# dbt-macro-pack

**Reusable dbt macros for the things every project rewrites: keys, dates, and change tracking.**

[![dbt](https://img.shields.io/badge/dbt-1.5%2B-ff694a?style=flat-square)](#quick-start)
[![license](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)

</div>

## About

dbt's own `dbt_utils` is the reference implementation for most of these;
what this pack adds is a consistent hashing convention (so surrogate keys
reproduce across warehouses) and an audit-column helper that fails loudly
when a model forgets to declare it.

## Quick start

```bash
git clone https://github.com/liesbethbelmokhtar203-source/dbt-macro-pack
# copy macros/ into your project's macros directory, then:
# {{ ref_surrogate_key(['a','b']) }}
```

## Configuration

| Key | Description |
| --- | --- |
| `ref_surrogate_key` | deterministic hash key over one or more columns |
| `ref_int_date` | calendar spine over a date range |
| `ref_audit_cols` | standard `created_at` / `updated_at` columns |
| `ref_scd2` | slowly-changing-dimension scaffolding |
## Roadmap

- [ ] BigQuery and Snowflake parity tests
- [ ] dbt 1.9 deprecation pass
- [ ] Docs site

## Contributing

Issues and pull requests are welcome. Please keep changes small and focused,
and add a test for any behaviour change — every repository here ships with a
runnable test suite and no third-party dependencies, so CI is just
`python3 -m unittest` / `bash test_*.sh`.

## License

[MIT](LICENSE)
