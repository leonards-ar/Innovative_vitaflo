delete from pathologies;

ALTER TABLE pathologies AUTO_INCREMENT=0;

insert into pathologies (version, name) values (0, 'Pato 1'), (0, 'Pato 2'), (0, 'Pato 3'), (0, 'Pato 4'), (0, 'Pato 5'), (0, 'Pato 6'), (0, 'Pato 7');

insert into patients_pathologies (patient_pathologies_id, pathology_id) values (88, 1), (89, 2), (90, 3);

ALTER TABLE pathologies drop pathology;
