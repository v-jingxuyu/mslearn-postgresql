-- Lab5_SimpleFunctions
-- Select and run only the statement requested by the lab task.

SELECT 'lab-runner-probe' AS raw_marker;

SELECT current_database() AS connected_database;

SELECT LOWER('LAB-RUNNER-PROBE') AS transformed_marker;

SELECT UPPER('lab-runner-probe') AS transformed_marker;

SELECT LENGTH('lab-runner-probe') AS marker_length;