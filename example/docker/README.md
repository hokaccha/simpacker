# Simpacker Docker example

## Build and Run

```
$ docker build -t simpacker-example .
$ docker run --rm -it -p 3000:3000 -e RAILS_SERVE_STATIC_FILES=1 simpacker-example
```
