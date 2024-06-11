-- NOTE: The relative paths below represent the path relative to the makefile at
-- the top level of this repo. That makefile is what will call this SQL script.
\copy cdm.care_site FROM 'synpuf1k531/data/care_site.csv' CSV DELIMITER E'\t';
\copy cdm.cdm_source FROM 'synpuf1k531/data/cdm_source.csv' CSV DELIMITER E'\t';
\copy cdm.condition_era FROM 'synpuf1k531/data/condition_era.csv' CSV DELIMITER E'\t';
\copy cdm.condition_occurrence FROM 'synpuf1k531/data/condition_occurrence.csv' CSV DELIMITER E'\t';
\copy cdm.cost FROM 'synpuf1k531/data/cost.csv' CSV DELIMITER E'\t';
\copy cdm.death FROM 'synpuf1k531/data/death.csv' CSV DELIMITER E'\t';
\copy cdm.device_exposure FROM 'synpuf1k531/data/device_exposure.csv' CSV DELIMITER E'\t';
\copy cdm.location FROM 'synpuf1k531/data/location.csv' CSV DELIMITER E'\t';
\copy cdm.measurement FROM 'synpuf1k531/data/measurement.csv' CSV DELIMITER E'\t';
\copy cdm.observation FROM 'synpuf1k531/data/observation.csv' CSV DELIMITER E'\t';
\copy cdm.observation_period FROM 'synpuf1k531/data/observation_period.csv' CSV DELIMITER E'\t';
\copy cdm.payer_plan_period FROM 'synpuf1k531/data/payer_plan_period.csv' CSV DELIMITER E'\t';
\copy cdm.person FROM 'synpuf1k531/data/person.csv' CSV DELIMITER E'\t';
\copy cdm.procedure_occurrence FROM 'synpuf1k531/data/procedure_occurrence.csv' CSV DELIMITER E'\t';
\copy cdm.provider FROM 'synpuf1k531/data/provider.csv' CSV DELIMITER E'\t';
\copy cdm.visit_occurrence FROM 'synpuf1k531/data/visit_occurrence.csv' CSV DELIMITER E'\t';
