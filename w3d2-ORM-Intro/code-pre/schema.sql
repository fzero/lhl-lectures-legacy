CREATE TABLE countries (
  id          serial NOT NULL PRIMARY KEY,
  name        varchar(40) NOT NULL,
  population  integer,
  capital     varchar(40),
  area        integer
);
