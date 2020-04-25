--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-04-26 00:30:44

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
-- TOC entry 207 (class 1259 OID 32794)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name_product text NOT NULL,
    price_product double precision NOT NULL,
    image_product text NOT NULL,
    stock_product integer NOT NULL,
    description_product text NOT NULL,
    color_product text NOT NULL,
    material_product text NOT NULL,
    category_product text NOT NULL,
    brand_product text NOT NULL,
    size_product text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 32792)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 206
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 205 (class 1259 OID 32783)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "ID" integer NOT NULL,
    name text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    admin boolean NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 32781)
-- Name: users_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users_ID_seq" OWNER TO postgres;

--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users_ID_seq" OWNED BY public.users."ID";


--
-- TOC entry 208 (class 1259 OID 42249)
-- Name: view_name; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_name AS
 SELECT products.id,
    products.name_product,
    products.price_product,
    products.image_product,
    products.stock_product,
    products.description_product,
    products.color_product,
    products.material_product,
    products.category_product,
    products.brand_product,
    products.size_product
   FROM public.products;


ALTER TABLE public.view_name OWNER TO postgres;

--
-- TOC entry 2702 (class 2604 OID 32797)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 2701 (class 2604 OID 32786)
-- Name: users ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN "ID" SET DEFAULT nextval('public."users_ID_seq"'::regclass);


--
-- TOC entry 2837 (class 0 OID 32794)
-- Dependencies: 207
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name_product, price_product, image_product, stock_product, description_product, color_product, material_product, category_product, brand_product, size_product) FROM stdin;
1	FOSSIL WATCH FB-01	700	img/products_images/1.jpg	10	male	black	steel	watch	FOSSIL	one size
2	Police WATCH Urban Style Belmont	788	img/products_images/2.jpg	8	male	black	leather	watch	POLICE	one size
3	Tommy Hilfiger Angela WATCH	860	img/products_images/3.jpg	8	female	grey	steel	watch	Tommy Hilfiger	one size
4	Michael Kors Pyper WATCH	832.99	img/products_images/4.jfif	3	female	red	leather	watch	Michael Kors	one size
5	Guess Love Butterfly Necklace	215	img/products_images/5.png	12	female	rose gold	steel	necklace	Guess	one size
6	Diesel Double Pendant Necklace	423	img/products_images/6.jpg	3	male	grey	steel	necklace	DIESEL	one size
7	Fossil Vintage Glitz Ring	164	img/products_images/7.jpg	6	female	silver grey	silver	ring	FOSSIL	51 mm
8	Fossil Vintage Glitz Ring	164	img/products_images/7.jpg	6	female	silver grey	silver	ring	FOSSIL	54 mm
9	Fossil Casual Vintage Bracelet	284	img/products_images/9.jpg	2	male	black	leather	bracelet	FOSSIL	21 cm
10	Fossil Sterling Silver Bracelet	236	img/products_images/10.jpg	4	female	silver grey	silver	bracelet	FOSSIL	19 cm
11	Fossil Sterling Silver Bracelet	236	img/products_images/10.jpg	1	female	silver grey	silver	bracelet	FOSSIL	16 cm
12	Claire`s Handbag	28	img/products_images/12.jpg	1	female	brown	leather	handbag	Claire`s	S
13	Fossil Logan RFID Flap Clutch	372	img/products_images/13.jfif	3	female	black	PVC	wallet	FOSSIL	S
14	VERSACE sunglasses	1325	img/products_images/14.jpg	2	female	brown	metal	sunglasses	VERSACE	one size
15	Ralph Lauren belt	327.9	img/products_images/15.jpeg	3	female	black	leather	belt	Ralph Lauren	XS
16	Ralph Lauren belt	327.9	img/products_images/16.jpg	3	female	white	leather	belt	Ralph Lauren	S
17	Ralph Lauren belt	327.9	img/products_images/15.jpeg	3	female	black	leather	belt	Ralph Lauren	S
18	Ralph Lauren belt	327.9	img/products_images/16.jpg	3	female	white	leather	belt	Ralph Lauren	XS
19	Ralph Lauren belt	327.9	img/products_images/16.jpg	3	female	white	leather	belt	Ralph Lauren	M
20	Ralph Lauren CLEAR-HARPER 35-TTE-MED bag	920	img/products_images/20.png	5	female	white	synthetic	bag	Ralph Lauren	one size
21	TOMMY HILFIGER LUX BELT 3.0	82.74	img/products_images/21.jpg	5	male	black	leather	belt	Tommy Hilfiger	85
22	TOMMY HILFIGER LUX BELT 3.0	82.74	img/products_images/21.jpg	3	male	black	leather	belt	Tommy Hilfiger	90
23	TOMMY HILFIGER LUX BELT 3.0	82.74	img/products_images/21.jpg	6	male	black	leather	belt	Tommy Hilfiger	80
\.


--
-- TOC entry 2835 (class 0 OID 32783)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users ("ID", name, username, password, email, admin) FROM stdin;
5	admin	admin	c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec	admin@tilbehor.ro	f
\.


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 206
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users_ID_seq"', 5, true);


--
-- TOC entry 2706 (class 2606 OID 32802)
-- Name: products id_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT id_product PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 32788)
-- Name: users id_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_users PRIMARY KEY ("ID");


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;


-- Completed on 2020-04-26 00:30:45

--
-- PostgreSQL database dump complete
--

