-- sql/create_user_roles.sql

DROP ROLE IF EXISTS omop_admin;

CREATE ROLE omop_admin CREATEDB REPLICATION VALID UNTIL 'infinity';

DROP ROLE IF EXISTS omop_app;

CREATE ROLE omop_app VALID UNTIL 'infinity';

-- set up our log-in-able users
DROP ROLE IF EXISTS omop_admin_user;

CREATE ROLE omop_admin_user LOGIN PASSWORD 'postgres' VALID UNTIL 'infinity';

GRANT omop_admin TO omop_admin_user;

ALTER USER omop_admin_user WITH CREATEDB;

DROP ROLE IF EXISTS omop_app_user;

CREATE ROLE omop_app_user LOGIN PASSWORD 'postgres' VALID UNTIL 'infinity';

GRANT omop_app TO omop_app_user;

