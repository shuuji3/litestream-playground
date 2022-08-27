get-all:
	sqlite3 fruits.db 'select * from fruits'

replicate:
	litestream replicate -config litestream.yaml

restore:
	litestream restore -config litestream.yaml fruits.db

destroy:
	rm -rf .fruits.db-litestream/ fruits.db*

