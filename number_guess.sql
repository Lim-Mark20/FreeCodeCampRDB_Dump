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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'user_1738407577111', 2, 75);
INSERT INTO public.users VALUES (17, 'user_1738408170279', 2, 628);
INSERT INTO public.users VALUES (2, 'user_1738407577112', 5, 218);
INSERT INTO public.users VALUES (16, 'user_1738408170280', 5, 43);
INSERT INTO public.users VALUES (5, 'user_1738407652729', 2, 75);
INSERT INTO public.users VALUES (18, 'mark', 1, 9);
INSERT INTO public.users VALUES (4, 'user_1738407652730', 5, 418);
INSERT INTO public.users VALUES (36, 'user_1738408983250', 2, 626);
INSERT INTO public.users VALUES (7, 'user_1738407717505', 2, 689);
INSERT INTO public.users VALUES (20, 'user_1738408241882', 2, 292);
INSERT INTO public.users VALUES (6, 'user_1738407717506', 5, 50);
INSERT INTO public.users VALUES (35, 'user_1738408983251', 5, 282);
INSERT INTO public.users VALUES (19, 'user_1738408241883', 5, 53);
INSERT INTO public.users VALUES (9, 'user_1738407731993', 2, 163);
INSERT INTO public.users VALUES (8, 'user_1738407731994', 5, 49);
INSERT INTO public.users VALUES (1, 'lim', 4, 9);
INSERT INTO public.users VALUES (22, 'user_1738408387033', 2, 392);
INSERT INTO public.users VALUES (11, 'user_1738407816784', 2, 861);
INSERT INTO public.users VALUES (38, 'user_1738409093899', 2, 702);
INSERT INTO public.users VALUES (10, 'user_1738407816785', 5, 20);
INSERT INTO public.users VALUES (21, 'user_1738408387034', 5, 665);
INSERT INTO public.users VALUES (13, 'user_1738407957335', 2, 675);
INSERT INTO public.users VALUES (12, 'user_1738407957336', 5, 122);
INSERT INTO public.users VALUES (37, 'user_1738409093900', 5, 111);
INSERT INTO public.users VALUES (24, 'user_1738408491905', 2, 151);
INSERT INTO public.users VALUES (15, 'user_1738408069798', 2, 531);
INSERT INTO public.users VALUES (23, 'user_1738408491906', 5, 48);
INSERT INTO public.users VALUES (14, 'user_1738408069799', 5, 54);
INSERT INTO public.users VALUES (26, 'user_1738408523008', 2, 499);
INSERT INTO public.users VALUES (25, 'user_1738408523009', 5, 318);
INSERT INTO public.users VALUES (28, 'user_1738408615241', 2, 243);
INSERT INTO public.users VALUES (27, 'user_1738408615242', 5, 247);
INSERT INTO public.users VALUES (30, 'user_1738408681756', 2, 47);
INSERT INTO public.users VALUES (29, 'user_1738408681757', 5, 127);
INSERT INTO public.users VALUES (32, 'user_1738408822560', 2, 301);
INSERT INTO public.users VALUES (31, 'user_1738408822561', 5, 118);
INSERT INTO public.users VALUES (34, 'user_1738408829279', 2, 347);
INSERT INTO public.users VALUES (33, 'user_1738408829280', 5, 140);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 38, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

