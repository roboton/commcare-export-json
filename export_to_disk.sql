\copy (SELECT json_doc FROM json_export) to /tmp/json_export.csv CSV QUOTE '"';
