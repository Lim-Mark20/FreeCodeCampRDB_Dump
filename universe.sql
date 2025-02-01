--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    size integer,
    description text,
    name character varying(255) NOT NULL,
    inhabited boolean DEFAULT false
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
-- Name: milkyway; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.milkyway (
    milkyway_id integer NOT NULL,
    size integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.milkyway OWNER TO freecodecamp;

--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.milkyway_milkyway_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milkyway_milkyway_id_seq OWNER TO freecodecamp;

--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.milkyway_milkyway_id_seq OWNED BY public.milkyway.milkyway_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    moon_code character varying(255),
    resources boolean DEFAULT false,
    planet_id integer NOT NULL
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
    name character varying(255),
    people_living numeric,
    size integer,
    star_id integer NOT NULL
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
    mass integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    description text
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
-- Name: milkyway milkyway_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway ALTER COLUMN milkyway_id SET DEFAULT nextval('public.milkyway_milkyway_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, NULL, NULL, 'galaxy1', false);
INSERT INTO public.galaxy VALUES (2, NULL, NULL, 'galaxy2', false);
INSERT INTO public.galaxy VALUES (3, NULL, NULL, 'galaxy3', false);
INSERT INTO public.galaxy VALUES (4, NULL, NULL, 'galaxy4', false);
INSERT INTO public.galaxy VALUES (5, NULL, NULL, 'galaxy5', false);
INSERT INTO public.galaxy VALUES (6, NULL, NULL, 'galaxy6', false);
INSERT INTO public.galaxy VALUES (7, NULL, NULL, 'galaxy7', false);
INSERT INTO public.galaxy VALUES (8, NULL, NULL, 'galaxy8', false);


--
-- Data for Name: milkyway; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.milkyway VALUES (1, 123, NULL);
INSERT INTO public.milkyway VALUES (2, 456, NULL);
INSERT INTO public.milkyway VALUES (3, 789, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, false, 1);
INSERT INTO public.moon VALUES (2, 'moon2', NULL, false, 1);
INSERT INTO public.moon VALUES (3, 'moon3', NULL, false, 1);
INSERT INTO public.moon VALUES (4, 'moon4', NULL, false, 1);
INSERT INTO public.moon VALUES (5, 'moon5', NULL, false, 1);
INSERT INTO public.moon VALUES (6, 'moon6', NULL, false, 2);
INSERT INTO public.moon VALUES (7, 'moon7', NULL, false, 2);
INSERT INTO public.moon VALUES (8, 'moon8', NULL, false, 2);
INSERT INTO public.moon VALUES (9, 'moon9', NULL, false, 2);
INSERT INTO public.moon VALUES (10, 'moon10', NULL, false, 2);
INSERT INTO public.moon VALUES (11, 'moon11', NULL, false, 3);
INSERT INTO public.moon VALUES (12, 'moon12', NULL, false, 3);
INSERT INTO public.moon VALUES (13, 'moon13', NULL, false, 3);
INSERT INTO public.moon VALUES (14, 'moon14', NULL, false, 3);
INSERT INTO public.moon VALUES (15, 'moon15', NULL, false, 3);
INSERT INTO public.moon VALUES (16, 'moon16', NULL, false, 4);
INSERT INTO public.moon VALUES (17, 'moon17', NULL, false, 4);
INSERT INTO public.moon VALUES (18, 'moon18', NULL, false, 4);
INSERT INTO public.moon VALUES (19, 'moon19', NULL, false, 4);
INSERT INTO public.moon VALUES (20, 'moon20', NULL, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'planet2', NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'planet3', NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'planet4', NULL, NULL, 2);
INSERT INTO public.planet VALUES (5, 'planet5', NULL, NULL, 2);
INSERT INTO public.planet VALUES (6, 'planet6', NULL, NULL, 2);
INSERT INTO public.planet VALUES (7, 'planet7', NULL, NULL, 3);
INSERT INTO public.planet VALUES (8, 'planet8', NULL, NULL, 3);
INSERT INTO public.planet VALUES (9, 'planet9', NULL, NULL, 3);
INSERT INTO public.planet VALUES (10, 'planet10', NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'planet11', NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'planet12', NULL, NULL, 4);
INSERT INTO public.planet VALUES (13, 'planet13', NULL, NULL, 5);
INSERT INTO public.planet VALUES (14, 'planet14', NULL, NULL, 5);
INSERT INTO public.planet VALUES (15, 'planet15', NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 123, 'star1', 1, NULL);
INSERT INTO public.star VALUES (2, 123, 'star2', 2, NULL);
INSERT INTO public.star VALUES (3, 123, 'star3', 3, NULL);
INSERT INTO public.star VALUES (4, 123, 'star4', 4, NULL);
INSERT INTO public.star VALUES (5, 123, 'star5', 5, NULL);
INSERT INTO public.star VALUES (6, 123, 'star6', 6, NULL);
INSERT INTO public.star VALUES (7, 123, 'star7', 7, NULL);
INSERT INTO public.star VALUES (8, 123, 'star8', 8, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: milkyway_milkyway_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.milkyway_milkyway_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: milkyway milkyway_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway
    ADD CONSTRAINT milkyway_pkey PRIMARY KEY (milkyway_id);


--
-- Name: moon moon_moon_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_code_key UNIQUE (moon_code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique_galaxy UNIQUE (name);


--
-- Name: milkyway name_unique_milkyway; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milkyway
    ADD CONSTRAINT name_unique_milkyway UNIQUE (name);


--
-- Name: planet name_unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique_planet UNIQUE (name);


--
-- Name: star name_unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique_star UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
