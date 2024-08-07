# tmi-web

tmi-web is a social science research tool for managing, analyzing, coding, and visualizing qualitative survey data on identities. It presents identity and experience in a network graph, encouraging tactile exploration of intersectional identities and facets of privilege and marginalization.

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

## Dev concerns

### Start local sidekiq

  bundle exec sidekiq

### Clear sidekiq (background job) queue

  Sidekiq.redis(&:flushdb)

### Backup production postgres database

  heroku pg:backups:capture --app tmi-web
  heroku pg:backups:download --app tmi-web

### Restore production postgres database to last db capture

  heroku pg:backups:restore --app tmi-web

### Load postgres database backup into local db

  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d tmi_web_development db/latest.dump

### Update neo4j schema

  rake neo4j:migrate

### Generate rdocs

  rdoc -op doc

## Dashboards

### neo4j hosting

  https://console.neo4j.io

### ChatGPT API dashboard

  https://platform.openai.com
