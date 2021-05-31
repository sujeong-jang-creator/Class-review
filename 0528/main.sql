.header on
.mode column

CREATE TABLE mountains (
  name TEXT,
  height_meters INTEGER,
  first_ascent DATE,
  first_hiker TEXT
);

INSERT INTO mountains VALUES
  ('Mount Everest', 8848, '1953-05-29', 'Amy'),
  ('Kilimanjaro', 5895, '1889-10-06', 'James'),
  ('Denali', 6190, '1913-06-07', 'Poppy'),
  ('Chimborazo', 6263, '1880-01-04', 'Amy'),
  ('K2', 8611, '1954-07-31', 'John'),
  ('Piz Palü', 3900, '1835-08-12', 'Sandy'),
  ('Cho Oyu', 8188, '1954-10-19', 'Sandy');

.print 'average mountain height'
SELECT avg(height_meters) AS avg_height
FROM mountains;

.print
.print 'number of ascents per century'
SELECT
  strftime(
    '%Y',
    date(first_ascent)
  ) / 100 + 1 AS century,
  count(*) AS ascents
FROM mountains
GROUP BY century;