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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    secret_number integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 280, 281);
INSERT INTO public.games VALUES (2, 1, 362, 363);
INSERT INTO public.games VALUES (3, 2, 327, 328);
INSERT INTO public.games VALUES (4, 2, 347, 348);
INSERT INTO public.games VALUES (5, 1, 418, 421);
INSERT INTO public.games VALUES (6, 1, 320, 321);
INSERT INTO public.games VALUES (7, 1, 994, 995);
INSERT INTO public.games VALUES (8, 3, 439, 440);
INSERT INTO public.games VALUES (9, 3, 870, 871);
INSERT INTO public.games VALUES (10, 4, 774, 775);
INSERT INTO public.games VALUES (11, 4, 113, 114);
INSERT INTO public.games VALUES (12, 3, 78, 81);
INSERT INTO public.games VALUES (13, 3, 513, 514);
INSERT INTO public.games VALUES (14, 3, 236, 237);
INSERT INTO public.games VALUES (15, 5, 697, 14);
INSERT INTO public.games VALUES (16, 6, 776, 777);
INSERT INTO public.games VALUES (17, 6, 66, 67);
INSERT INTO public.games VALUES (18, 7, 322, 323);
INSERT INTO public.games VALUES (19, 7, 369, 370);
INSERT INTO public.games VALUES (20, 6, 741, 744);
INSERT INTO public.games VALUES (21, 6, 74, 75);
INSERT INTO public.games VALUES (22, 6, 806, 807);
INSERT INTO public.games VALUES (23, 8, 731, 732);
INSERT INTO public.games VALUES (24, 8, 320, 321);
INSERT INTO public.games VALUES (25, 9, 297, 298);
INSERT INTO public.games VALUES (26, 9, 590, 591);
INSERT INTO public.games VALUES (27, 8, 854, 857);
INSERT INTO public.games VALUES (28, 8, 315, 316);
INSERT INTO public.games VALUES (29, 8, 161, 162);
INSERT INTO public.games VALUES (30, 10, 625, 626);
INSERT INTO public.games VALUES (31, 10, 744, 745);
INSERT INTO public.games VALUES (32, 11, 260, 261);
INSERT INTO public.games VALUES (33, 11, 325, 326);
INSERT INTO public.games VALUES (34, 10, 507, 510);
INSERT INTO public.games VALUES (35, 10, 347, 348);
INSERT INTO public.games VALUES (36, 10, 940, 941);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'user_1700498280553');
INSERT INTO public.players VALUES (2, 'user_1700498280552');
INSERT INTO public.players VALUES (3, 'user_1700498407418');
INSERT INTO public.players VALUES (4, 'user_1700498407417');
INSERT INTO public.players VALUES (5, 'test');
INSERT INTO public.players VALUES (6, 'user_1700498533414');
INSERT INTO public.players VALUES (7, 'user_1700498533413');
INSERT INTO public.players VALUES (8, 'user_1700498567018');
INSERT INTO public.players VALUES (9, 'user_1700498567017');
INSERT INTO public.players VALUES (10, 'user_1700498600755');
INSERT INTO public.players VALUES (11, 'user_1700498600754');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 11, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

