# postgis_playground

Messing around with PostGIS

A fun example could be to use https://postgis.net/docs/ST_Contains.html
and some other commands to find a large convex area that doesn't contain any roads
(and even more fun, but probably very difficult and slow, would be to find the
_largest_ convex area in some US state that doesn't contain any roads).

```bash
docker-compose build --pull
```

```bash
docker-compose -f docker-compose.yml up
```

```bash
docker-compose exec main bash
```

```bash
docker-compose exec main bash -c "psql"
```
