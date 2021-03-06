add jar ${system:build.dir}/hive-contrib-${system:hive.version}.jar;

CREATE TEMPORARY FUNCTION example_max_n AS 'org.apache.hadoop.hive.contrib.udaf.example.UDAFExampleMaxN';

EXPLAIN
SELECT example_max_n(substr(value,5),10),
       example_max_n(IF(substr(value,5) > 250, NULL, substr(value,5)),10)
FROM src;

SELECT example_max_n(substr(value,5),10),
       example_max_n(IF(substr(value,5) > 250, NULL, substr(value,5)),10)
FROM src;

DROP TEMPORARY FUNCTION example_max_n;
