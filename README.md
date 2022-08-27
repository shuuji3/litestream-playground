# litestream-playground

## Example

```shell
> ls
Makefile                                 litestream.yaml
fruits.db                                shuuji3-litestream-service-account.json

> make get-all
sqlite3 fruits.db 'select * from fruits'
orange|orange
grape|purple
apple|red

> make replicate &
litestream replicate -config litestream.yaml

litestream v0.3.9
initialized db: /Users/shuuji3/src/litestream-playground/fruits.db
replicating to: name="gcs" type="gcs" bucket="shuuji3-litestream" path="fruits.db" sync-interval=1s
/Users/shuuji3/src/litestream-playground/fruits.db: sync: new generation "2a809b81198ddc77", no generation exists
/Users/shuuji3/src/litestream-playground/fruits.db(gcs): snapshot written 2a809b81198ddc77/00000000

> sqlite3 fruits.db 'insert into fruits (name, color) values ("grape", "purple")'

> make destroy
rm -rf .fruits.db-litestream/ fruits.db*

> ls
Makefile                                 shuuji3-litestream-service-account.json
litestream.yaml

> make restore
litestream restore -config litestream.yaml fruits.db

> ls
Makefile                                 litestream.yaml
fruits.db                                shuuji3-litestream-service-account.json

> make get-all
sqlite3 fruits.db 'select * from fruits'
orange|orange
grape|purple
apple|red
grape|purple
```