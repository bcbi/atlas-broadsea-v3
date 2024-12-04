all: fetch-broadsea fetch-vocabs create-db create-tables load-tables up source results-schema achilles 

DB_USER=pstey
DB=synpuf

fetch-broadsea:
	git clone https://github.com/OHDSI/Broadsea.git
	rm -rf Broadsea/.git

fetch-vocabs:
	wget https://www.dropbox.com/s/ira6ayvhothib1j/vocabulary_download_v5.tar.gz
	tar -xvzf vocabulary_download_v5.tar.gz

create-db: 
	psql --user ${DB_USER} --dbname ${DB_USER} --echo-errors --file sql/create_user_roles.sql
	psql --user ${DB_USER} --dbname ${DB_USER} --echo-errors --file sql/create_db.sql 

create-tables: 
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file sql/omop/5.3/OMOP_CDM_postgresql_5.3_ddl.sql
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file sql/grant_permissions.sql

load-tables:
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file vocabulary_download_v5/sql/load_vocab.sql 
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file synpuf1k531/sql/load_synpuf.sql
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file sql/omop/5.3/OMOP_CDM_postgresql_5.3_indices.sql
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file sql/omop/5.3/OMOP_CDM_postgresql_5.3_constraints.sql

up:
	docker compose --profile content --profile atlas-from-image --profile webapi-from-image --file Broadsea/docker-compose.yml up 

source:
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file sql/source_source_daimon.sql 

results-schema:
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file sql/results_ddl.sql
	psql --user ${DB_USER} --dbname ${DB} --echo-errors --file sql/grant_permissions.sql

achilles:
	docker compose --profile achilles --file Broadsea/docker-compose.yml up

down:
	docker compose --file Broadsea/docker-compose.yml down

.PHONY: all fetch-broadsea fetch-vocabs create-db create-tables load-tables results-schema achilles up source down 
