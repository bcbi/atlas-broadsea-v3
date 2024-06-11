-- NOTE: the `source` and `source_daimon` tables are both created when the 
-- `Broadsea-WebAPI` container image is first run


-- remove any previously added database connection configuration data
TRUNCATE webapi.source CASCADE;
TRUNCATE webapi.source_daimon CASCADE;

-- OHDSI CDM source
INSERT INTO webapi.source( source_id, source_name, source_key, source_connection, source_dialect)
VALUES (1, 'OHDSI CDM V5 Database', 'OHDSI-CDMV5',
  'jdbc:postgresql://host.docker.internal:5432/synpuf?user=omop_admin_user&password=postgres', 'postgresql');

-- CDM daimon
INSERT INTO webapi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority)
VALUES (1, 1, 0, 'cdm', 2);

-- VOCABULARY daimon
INSERT INTO webapi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority)
VALUES (2, 1, 1, 'cdm', 2);

-- RESULTS daimon
INSERT INTO webapi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority)
VALUES (3, 1, 2, 'results', 2);

-- EVIDENCE daimon
INSERT INTO webapi.source_daimon( source_daimon_id, source_id, daimon_type, table_qualifier, priority)
VALUES (4, 1, 3, 'temp', 2);
