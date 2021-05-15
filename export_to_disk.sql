\copy (SELECT ROW_TO_JSON(t) FROM (SELECT * FROM json_export) AS t) TO '/tmp/json_export.json';
