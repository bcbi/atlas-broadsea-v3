all: ddl 

postvocab: indexes constraints

ddl: 
	psql -U ohdsi_admin_user --dbname ohdsi --echo-errors --file sql/OMOP_CDM_postgresql_5.3_ddl.sql

indexes:
	psql -U ohdsi_admin_user --dbname ohdsi --echo-errors --file sql/OMOP_CDM_postgresql_5.3_indices.sql

constraints: 
	psql -U ohdsi_admin_user --dbname ohdsi --echo-errors --file sql/OMOP_CDM_postgresql_5.3_constraints.sql


.PHONY: all postvocab ddl indexes
