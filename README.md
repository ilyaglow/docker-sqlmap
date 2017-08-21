docker-sqlmap
-------------

Docker image for [sqlmap](http://sqlmap.org/) based on Alpine Linux

### Usage

```
docker run -it --rm -v $PWD/sqlmapdata:/home/sqlmap/.sqlmap:rw ilyaglow/sqlmap -u 'http://website.com/search.php?q=123'
```
