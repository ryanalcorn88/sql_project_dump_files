--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    distance_from_earth_in_lightyears numeric,
    number_of_planets text,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    average_orbit_distance numeric,
    sidereal_period numeric,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    number_of_moons integer,
    star_id integer NOT NULL,
    year_discovered integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_dwarf boolean,
    temperature text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Pluto', 1);
INSERT INTO public.dwarf_planet VALUES (2, 'Makemake', 1);
INSERT INTO public.dwarf_planet VALUES (3, 'Haumea', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A galaxy that includes Earth.', 0, 'at least 100 billion', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A barred spiral galaxy that is the same order of magnitude as the Milky Way.', 2.5, 'at least 1 trillion', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The smallest spiral galaxy in the Local Group.', 2.73, 'at least 40 billion', true);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'A galaxy discovered in 1781 located in Ursa Major.', 21, 'at least 1 trillion', true);
INSERT INTO public.galaxy VALUES (5, 'Hoags Object', 'An unusual ring galaxy located in the Serpens Caput constellation.', 612.8, 'at least 8 billion', true);
INSERT INTO public.galaxy VALUES (6, 'Antennae', 'A pair of interacting galaxies in the Corvus constellation.', 70, 'at least 100 billion', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 27.3, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 6000, 0.3, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23455, 1.26, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Io', NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Himalia', NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Amalthea', NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Thebe', NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Elara', NULL, NULL, 5);
INSERT INTO public.moon VALUES (12, 'Pasiphae', NULL, NULL, 5);
INSERT INTO public.moon VALUES (13, 'Carme', NULL, NULL, 5);
INSERT INTO public.moon VALUES (14, 'Lysithea', NULL, NULL, 5);
INSERT INTO public.moon VALUES (15, 'Metis', NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Sinope', NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, 'Ananke', NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'Leda', NULL, NULL, 5);
INSERT INTO public.moon VALUES (19, 'Adrastea', NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, 'Dia', NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, 1, -1300);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0, 1, -1500);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 80, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 83, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 14, 1, 1612);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 27, 1, 1690);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 5, 1, 1909);
INSERT INTO public.planet VALUES (10, 'Makemake', false, 1, 1, 2005);
INSERT INTO public.planet VALUES (11, 'Haumea', false, 2, 1, 2004);
INSERT INTO public.planet VALUES (12, 'Quaoar', false, 1, 1, 2002);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, '5778 K', 1);
INSERT INTO public.star VALUES (2, 'Kepler-32', false, '3900 K', 1);
INSERT INTO public.star VALUES (3, 'Deneb', false, '8525 K', 1);
INSERT INTO public.star VALUES (4, 'Gamma Cygni', false, '5790 K', 1);
INSERT INTO public.star VALUES (5, 'Delta Cygni', false, '10150 K', 1);
INSERT INTO public.star VALUES (6, 'Mu Cygni', false, '6354 K', 1);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--