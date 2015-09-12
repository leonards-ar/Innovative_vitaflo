update patients set adverse_event_reported = 0;
update patients set adverse_event_reported = 1 where id in (178, 189);

update patients set similar_problems_in_family = 0;


