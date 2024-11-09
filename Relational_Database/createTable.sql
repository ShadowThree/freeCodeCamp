create table galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  radius INT,
  description text,
  hasLife BOOLEAN,
  UNIQUE (name),
);

create table star (
  star_id SERIAL PRIMARY KEY,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  name VARCHAR(30) NOT NULL,
  radius INT,
  description text,
  hasLife BOOLEAN,
  UNIQUE (name),
);

create table planet (
  planet_id SERIAL PRIMARY KEY,
  star_id INT NOT NULL REFERENCES star(star_id),
  name VARCHAR(30) NOT NULL,
  radius INT,
  description text,
  hasLife BOOLEAN,
  UNIQUE (name),
);

create table moon (
  moon_id SERIAL PRIMARY KEY,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  name VARCHAR(30) NOT NULL,
  radius INT,
  description text,
  hasLife BOOLEAN,
  UNIQUE (name),
);

create table element (
  element_id  SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  num numeric,
  description text,
  UNIQUE (name),
);