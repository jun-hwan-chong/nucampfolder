--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-10-17 22:29:11 UTC

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
-- TOC entry 203 (class 1259 OID 65823)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    characters_id integer NOT NULL,
    characters_name text NOT NULL,
    players_id integer NOT NULL
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 65821)
-- Name: characters_characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_characters_id_seq OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 202
-- Name: characters_characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_characters_id_seq OWNED BY public.characters.characters_id;


--
-- TOC entry 208 (class 1259 OID 65860)
-- Name: characters_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters_items (
    characters_id integer NOT NULL,
    items_id integer NOT NULL
);


ALTER TABLE public.characters_items OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 65849)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    items_id integer NOT NULL,
    items_name text NOT NULL,
    items_description text NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 65847)
-- Name: items_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_items_id_seq OWNER TO postgres;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 206
-- Name: items_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_items_id_seq OWNED BY public.items.items_id;


--
-- TOC entry 201 (class 1259 OID 65808)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    players_id integer NOT NULL,
    players_email text NOT NULL,
    players_username text NOT NULL,
    players_password text NOT NULL,
    players_first_name text NOT NULL,
    players_last_name text NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 65806)
-- Name: players_players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_players_id_seq OWNER TO postgres;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 200
-- Name: players_players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_players_id_seq OWNED BY public.players.players_id;


--
-- TOC entry 205 (class 1259 OID 65836)
-- Name: spirits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spirits (
    spirits_id integer NOT NULL,
    spirits_name text NOT NULL,
    spirits_description text,
    characters_id integer NOT NULL
);


ALTER TABLE public.spirits OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 65834)
-- Name: spirits_spirits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spirits_spirits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spirits_spirits_id_seq OWNER TO postgres;

--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 204
-- Name: spirits_spirits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spirits_spirits_id_seq OWNED BY public.spirits.spirits_id;


--
-- TOC entry 2877 (class 2604 OID 65826)
-- Name: characters characters_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN characters_id SET DEFAULT nextval('public.characters_characters_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 65852)
-- Name: items items_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN items_id SET DEFAULT nextval('public.items_items_id_seq'::regclass);


--
-- TOC entry 2876 (class 2604 OID 65811)
-- Name: players players_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN players_id SET DEFAULT nextval('public.players_players_id_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 65839)
-- Name: spirits spirits_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spirits ALTER COLUMN spirits_id SET DEFAULT nextval('public.spirits_spirits_id_seq'::regclass);


--
-- TOC entry 3038 (class 0 OID 65823)
-- Dependencies: 203
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (characters_id, characters_name, players_id) FROM stdin;
\.


--
-- TOC entry 3043 (class 0 OID 65860)
-- Dependencies: 208
-- Data for Name: characters_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters_items (characters_id, items_id) FROM stdin;
\.


--
-- TOC entry 3042 (class 0 OID 65849)
-- Dependencies: 207
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (items_id, items_name, items_description) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 65808)
-- Dependencies: 201
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (players_id, players_email, players_username, players_password, players_first_name, players_last_name) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 65836)
-- Dependencies: 205
-- Data for Name: spirits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spirits (spirits_id, spirits_name, spirits_description, characters_id) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 202
-- Name: characters_characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_characters_id_seq', 1, false);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 206
-- Name: items_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_items_id_seq', 1, false);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 200
-- Name: players_players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_players_id_seq', 1, false);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 204
-- Name: spirits_spirits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spirits_spirits_id_seq', 1, false);


--
-- TOC entry 2887 (class 2606 OID 65833)
-- Name: characters characters_characters_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_characters_name_key UNIQUE (characters_name);


--
-- TOC entry 2900 (class 2606 OID 65864)
-- Name: characters_items characters_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters_items
    ADD CONSTRAINT characters_items_pkey PRIMARY KEY (characters_id, items_id);


--
-- TOC entry 2890 (class 2606 OID 65831)
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (characters_id);


--
-- TOC entry 2896 (class 2606 OID 65859)
-- Name: items items_items_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_items_name_key UNIQUE (items_name);


--
-- TOC entry 2898 (class 2606 OID 65857)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (items_id);


--
-- TOC entry 2881 (class 2606 OID 65816)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (players_id);


--
-- TOC entry 2883 (class 2606 OID 65818)
-- Name: players players_players_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_players_email_key UNIQUE (players_email);


--
-- TOC entry 2885 (class 2606 OID 65820)
-- Name: players players_players_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_players_username_key UNIQUE (players_username);


--
-- TOC entry 2892 (class 2606 OID 65844)
-- Name: spirits spirits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spirits
    ADD CONSTRAINT spirits_pkey PRIMARY KEY (spirits_id);


--
-- TOC entry 2894 (class 2606 OID 65846)
-- Name: spirits spirits_spirits_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spirits
    ADD CONSTRAINT spirits_spirits_name_key UNIQUE (spirits_name);


--
-- TOC entry 2888 (class 1259 OID 65886)
-- Name: characters_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX characters_index ON public.characters USING btree (characters_name);


--
-- TOC entry 2903 (class 2606 OID 65875)
-- Name: characters_items fk_character_items_character; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters_items
    ADD CONSTRAINT fk_character_items_character FOREIGN KEY (characters_id) REFERENCES public.characters(characters_id);


--
-- TOC entry 2904 (class 2606 OID 65880)
-- Name: characters_items fk_character_items_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters_items
    ADD CONSTRAINT fk_character_items_items FOREIGN KEY (items_id) REFERENCES public.items(items_id);


--
-- TOC entry 2901 (class 2606 OID 65865)
-- Name: characters fk_characters_players; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT fk_characters_players FOREIGN KEY (players_id) REFERENCES public.players(players_id);


--
-- TOC entry 2902 (class 2606 OID 65870)
-- Name: spirits fk_spirits_character; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spirits
    ADD CONSTRAINT fk_spirits_character FOREIGN KEY (characters_id) REFERENCES public.characters(characters_id);


-- Completed on 2021-10-17 22:29:11 UTC

--
-- PostgreSQL database dump complete
--

