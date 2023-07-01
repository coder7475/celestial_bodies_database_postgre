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
-- Name: meteorite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteorite (
    meteorite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    composition character varying(30),
    date_of_fall date,
    location_of_fall character varying(30)
);


ALTER TABLE public.meteorite OWNER TO freecodecamp;

--
-- Name: famous_meteorite_meteorite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.famous_meteorite_meteorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.famous_meteorite_meteorite_id_seq OWNER TO freecodecamp;

--
-- Name: famous_meteorite_meteorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.famous_meteorite_meteorite_id_seq OWNED BY public.meteorite.meteorite_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    distance_in_kilo_par_sec integer NOT NULL,
    observed_first_in_years integer,
    apparent_magnitude numeric(4,3),
    has_black_hole boolean,
    has_spiral_arms boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter_km numeric(10,2),
    distance_from_planet_km numeric(15,2),
    orbital_period_days integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    distance_from_star_au numeric(10,2),
    orbital_period_days integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    distance_in_light_years numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteorite meteorite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteorite ALTER COLUMN meteorite_id SET DEFAULT nextval('public.famous_meteorite_meteorite_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Milky way is the galaxy where our solar system reside', 0, 1923, -6.500, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31, NGC224)', 'It is the closest galaxy to our own Milky Way galaxy', 770, 1923, 3.400, true, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Satellite galaxy of Milky way', 49, 1503, 0.900, true, true);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Dawrf galaxy of Milky way.', 61, 1519, 2.700, false, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'It is on the collision paths of the Milky Way and Andromeda galaxies.', 890, 1654, 5.700, false, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical galaxy with an active galactic nucleus.', 4200, 1826, 6.840, false, false);


--
-- Data for Name: meteorite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteorite VALUES (1, 'Allende', 'Carbonaceous chondrite', '1969-02-08', 'Allende, Chihuahua, Mexico');
INSERT INTO public.meteorite VALUES (2, 'Sikhote-Alin', 'Iron', '1947-02-12', 'Primorsky Krai, Russia');
INSERT INTO public.meteorite VALUES (3, 'Chelyabinsk', 'Chondrite', '2013-02-15', 'Chelyabinsk Oblast, Russia');
INSERT INTO public.meteorite VALUES (4, 'Tunguska', 'Unknown', '1908-06-30', 'Tunguska River, Russia');
INSERT INTO public.meteorite VALUES (5, 'Hoba', 'Iron', '1920-03-13', 'Grootfontein, Namibia');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474.20, 384400.00, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.20, 9378.00, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.40, 23458.00, 1);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3642.00, 421600.00, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121.60, 671034.00, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268.20, 1070412.00, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821.00, 1882709.00, 17);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150.00, 1221870.00, 16);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504.00, 238020.00, 1);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396.00, 185520.00, 1);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1527.00, 527108.00, 5);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1123.00, 377396.00, 3);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1060.00, 294619.00, 2);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1470.00, 3560820.00, 79);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1577.80, 435910.00, 9);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1522.80, 584430.00, 13);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 471.00, 129390.00, 1);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1157.00, 191020.00, 3);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 1169.00, 266300.00, 4);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2706.00, 354760.00, 6);
INSERT INTO public.moon VALUES (21, 'Proteus', 8, 420.00, 117646.00, 1);
INSERT INTO public.moon VALUES (22, 'Nereid', 8, 340.00, 1353600.00, 360);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.39, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.72, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.00, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.52, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 5.20, 4380);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 9.58, 10752);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 19.18, 30660);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 30.07, 60225);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 0.05, 11);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 7, 1.05, 385);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1b', 8, 0.01, 2);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1c', 8, 0.02, 2);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1d', 8, 0.02, 4);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1e', 8, 0.03, 6);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1f', 8, 0.04, 9);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1g', 8, 0.06, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', 0.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky.', 8.60, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 640.00, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'The closest known star to the Solar System.', 4.24, 6);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'The primary component of the Alpha Centauri system.', 4.37, 6);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'The secondary component of the Alpha Centauri system.', 4.37, 6);
INSERT INTO public.star VALUES (7, 'Kepler-452', 'It is slightly more massive and brigther than sun.', 1400.00, 1);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', 'It is a small, cool drarf star located in constellation Aquarius', 39.00, 1);


--
-- Name: famous_meteorite_meteorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.famous_meteorite_meteorite_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: meteorite meteorite_date_of_fall_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteorite
    ADD CONSTRAINT meteorite_date_of_fall_key UNIQUE (date_of_fall);


--
-- Name: meteorite meteorite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteorite
    ADD CONSTRAINT meteorite_pkey PRIMARY KEY (meteorite_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


