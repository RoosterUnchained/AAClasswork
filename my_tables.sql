CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country_id INTEGER NOT NULL,

    FOREIGN KEY (country_id) REFERENCES countries(id)
);

INSERT INTO
    countries
    (name, population)
VALUES
    ('United States', 327000000)
;

INSERT INTO
    animals
    (name, country_id)
VALUES
    ('Racoon',
    (SELECT id 
     FROM countries 
     WHERE name = 'United States')),
    ('Black Bear',
    (SELECT id 
     FROM countries 
     WHERE name = 'United States')),
    ('Bald Eagle',
    (SELECT id 
     FROM countries 
     WHERE name = 'United States'))
;

DROP TABLE animals;
DROP TABLE countries;

~$ cat my_tables.sql | psql my_first_db
CREATE TABLE
CREATE TABLE
INSERT 0 1
INSERT 0 3
~$

~$ psql my_first_db
psql (11.3)
Type "help" for help.

my_first_db=# SELECT * FROM countries;
 id |     name      | population 
----+---------------+------------
  1 | United States |  327000000
(1 row)

my_first_db=# SELECT * FROM animals;
 id |    name    | country_id 
----+------------+------------
  1 | Racoon     |          1
  2 | Black Bear |          1
  3 | Bald Eagle |          1
(3 rows)

my_first_db=# \q