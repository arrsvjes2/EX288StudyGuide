--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: gen_random_uuid(); Type: FUNCTION; Schema: public; Owner: user2222
--

CREATE FUNCTION public.gen_random_uuid() RETURNS uuid
    LANGUAGE sql
    AS $$ SELECT md5(random()::text || clock_timestamp()::text)::uuid $$;


ALTER FUNCTION public.gen_random_uuid() OWNER TO "user2222";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: associate; Type: TABLE; Schema: public; Owner: user2222
--

CREATE TABLE public.associate (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.associate OWNER TO "user2222";

--
-- Name: associate_seq; Type: SEQUENCE; Schema: public; Owner: user2222
--

CREATE SEQUENCE public.associate_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associate_seq OWNER TO "user2222";

--
-- Name: expense; Type: TABLE; Schema: public; Owner: user2222
--

CREATE TABLE public.expense (
    amount numeric(38,2),
    paymentmethod smallint,
    associate_id bigint,
    creationdate timestamp(6) without time zone,
    id bigint NOT NULL,
    name character varying(255),
    uuid character varying(255),
    CONSTRAINT expense_paymentmethod_check CHECK (((paymentmethod >= 0) AND (paymentmethod <= 2)))
);


ALTER TABLE public.expense OWNER TO "user2222";

--
-- Name: expense_seq; Type: SEQUENCE; Schema: public; Owner: user2222
--

CREATE SEQUENCE public.expense_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expense_seq OWNER TO "user2222";

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: user2222
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO "user2222";

--
-- Data for Name: associate; Type: TABLE DATA; Schema: public; Owner: user2222
--

COPY public.associate (id, name) FROM stdin;
1	Jaime
2	Pablo
\.


--
-- Data for Name: expense; Type: TABLE DATA; Schema: public; Owner: user2222
--

COPY public.expense (amount, paymentmethod, associate_id, creationdate, id, name, uuid) FROM stdin;
150.50	0	1	\N	1	Desk	ba5d4714-e2d0-6fc4-6beb-6afc43235807
75.00	1	1	\N	2	Online Learning	3a555d92-dd9f-93b7-02c2-306d4d60bfb9
50.00	0	1	\N	3	Books	e63a0589-3d93-7cf2-3958-a7471a518861
20.00	1	1	\N	4	Internet	2f0cc365-7e5f-7a68-af71-e653dd6bfd42
15.00	0	1	\N	5	Phone	7289e45e-df33-01aa-223e-7f0bc279afb4
150.50	0	1	\N	6	Bookshelf	16a94732-32b3-9db0-18c1-9355fb4f57f4
15.00	1	2	\N	7	Printer Cartridges	4bf47faa-ea7f-fc6e-77c0-9df9eca3b940
50.00	0	2	\N	8	Online Learning	4289194e-d2d9-ebf1-189c-fd76f25a81ce
20.00	1	2	\N	9	Internet	b7efb7e1-304d-3c1a-b346-d47037ef3f00
15.00	0	2	\N	10	Phone	7a67f835-e6d7-8650-5bdf-cb2060e88244
150.50	0	1	\N	11	Desk	c7cccf9f-2cb1-b94b-6922-bbcdb3e67363
75.00	1	1	\N	12	Online Learning	ca44a64e-1645-cd84-1724-7075a923c0e0
50.00	0	1	\N	13	Books	fc2c93ca-4d4e-8c6c-546c-2af4d06b0d8f
20.00	1	1	\N	14	Internet	d31ef97d-3783-72ca-c7cf-eb7e092ac543
15.00	0	1	\N	15	Phone	eebf76fe-7bfd-f56b-b06a-39eac04546a5
150.50	0	1	\N	16	Bookshelf	f48a1488-107d-1a60-199c-04b030279f44
15.00	1	2	\N	17	Printer Cartridges	03e776de-1530-5847-0539-7e7bc2cc596e
50.00	0	2	\N	18	Online Learning	6395fa33-c9d9-2b6f-b8c8-424d30b7f2b0
20.00	1	2	\N	19	Internet	2b5a1e84-e481-df6b-aa82-fd7cfc69ab3f
15.00	0	2	\N	20	Phone	ebeb2a97-3bfa-b0e4-9a49-d16826a1c14b
150.50	0	1	\N	21	Desk	947703af-4fcc-d8f6-f5a9-56795a94f03a
75.00	1	1	\N	22	Online Learning	3224f210-cb61-4eb0-5add-3df7bfa700f2
50.00	0	1	\N	23	Books	2cb9fdc2-0617-5a7d-1eef-d8af52a4d9d7
20.00	1	1	\N	24	Internet	85074f17-51e4-5ff0-e3cd-6eac3eeecf02
15.00	0	1	\N	25	Phone	f13065c6-7569-8731-3037-2b7311744cca
150.50	0	1	\N	26	Bookshelf	55ea7058-e0e0-bd83-f000-cd1ed836f5c5
15.00	1	2	\N	27	Printer Cartridges	69a91928-4b38-0440-1477-6baef6d6c704
50.00	0	2	\N	28	Online Learning	34614634-8bf3-e25d-2b57-6f7335097340
20.00	1	2	\N	29	Internet	a3e21ec3-948f-bec8-23c4-7adec76aa1af
15.00	0	2	\N	30	Phone	993ad0a5-d39d-d9aa-2463-e920fa0e71c0
\.


--
-- Name: associate_seq; Type: SEQUENCE SET; Schema: public; Owner: user2222
--

SELECT pg_catalog.setval('public.associate_seq', 1, false);


--
-- Name: expense_seq; Type: SEQUENCE SET; Schema: public; Owner: user2222
--

SELECT pg_catalog.setval('public.expense_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: user2222
--

SELECT pg_catalog.setval('public.hibernate_sequence', 30, true);


--
-- Name: associate associate_pkey; Type: CONSTRAINT; Schema: public; Owner: user2222
--

ALTER TABLE ONLY public.associate
    ADD CONSTRAINT associate_pkey PRIMARY KEY (id);


--
-- Name: expense expense_pkey; Type: CONSTRAINT; Schema: public; Owner: user2222
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT expense_pkey PRIMARY KEY (id);


--
-- Name: expense fkroeyodwy4mwgru0y3pfvvk0u7; Type: FK CONSTRAINT; Schema: public; Owner: user2222
--

ALTER TABLE ONLY public.expense
    ADD CONSTRAINT fkroeyodwy4mwgru0y3pfvvk0u7 FOREIGN KEY (associate_id) REFERENCES public.associate(id);


--
-- PostgreSQL database dump complete
--

