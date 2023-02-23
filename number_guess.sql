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
-- Name: username; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.username (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.username OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_user_id_seq OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.username_user_id_seq OWNED BY public.username.user_id;


--
-- Name: username user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username ALTER COLUMN user_id SET DEFAULT nextval('public.username_user_id_seq'::regclass);


--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.username VALUES (2, 'Hashbrown', 0, NULL);
INSERT INTO public.username VALUES (3, 'user_1677150333371', 0, NULL);
INSERT INTO public.username VALUES (4, 'user_1677150333370', 0, NULL);
INSERT INTO public.username VALUES (5, 'steve', 0, NULL);
INSERT INTO public.username VALUES (6, 'user_1677151574550', 0, NULL);
INSERT INTO public.username VALUES (7, 'user_1677151574549', 0, NULL);
INSERT INTO public.username VALUES (8, 'CLOVER', 0, NULL);
INSERT INTO public.username VALUES (1, 'clover', 7, 5);
INSERT INTO public.username VALUES (9, 'fika', 2, 2);
INSERT INTO public.username VALUES (11, 'user_1677155672799', 2, 79);
INSERT INTO public.username VALUES (10, 'user_1677155672800', 5, 98);
INSERT INTO public.username VALUES (13, 'user_1677155778030', 2, 156);
INSERT INTO public.username VALUES (12, 'user_1677155778031', 5, 66);
INSERT INTO public.username VALUES (15, 'user_1677155801927', 2, 225);
INSERT INTO public.username VALUES (14, 'user_1677155801928', 5, 195);
INSERT INTO public.username VALUES (17, 'user_1677155881857', 2, 546);
INSERT INTO public.username VALUES (16, 'user_1677155881858', 5, 67);
INSERT INTO public.username VALUES (19, 'user_1677155914783', 2, 440);
INSERT INTO public.username VALUES (18, 'user_1677155914785', 5, 72);
INSERT INTO public.username VALUES (21, 'user_1677155932348', 2, 490);
INSERT INTO public.username VALUES (20, 'user_1677155932349', 5, 701);


--
-- Name: username_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_user_id_seq', 21, true);


--
-- Name: username username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_pkey PRIMARY KEY (user_id);


--
-- Name: username username_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

