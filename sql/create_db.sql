-- sql/create_db.sql

DROP DATABASE IF EXISTS synpuf;
CREATE DATABASE synpuf 
  WITH ENCODING='UTF8'
       OWNER=omop_admin
       CONNECTION LIMIT=-1;
COMMENT ON DATABASE ohdsi IS 'SynPUF OMOP 5.3.1 database';
GRANT ALL ON DATABASE synpuf TO GROUP omop_admin;
GRANT CONNECT, TEMPORARY ON DATABASE synpuf TO GROUP omop_app;

\connect synpuf;

CREATE SCHEMA webapi  AUTHORIZATION omop_admin;
CREATE SCHEMA cdm     AUTHORIZATION omop_admin;
CREATE SCHEMA vocab   AUTHORIZATION omop_admin;
CREATE SCHEMA results AUTHORIZATION omop_admin;
CREATE SCHEMA temp    AUTHORIZATION omop_admin;

