--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-09 14:42:24

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
-- TOC entry 214 (class 1259 OID 42399)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    subject text NOT NULL,
    message text NOT NULL,
    privacy boolean NOT NULL
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 42397)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 213
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- TOC entry 212 (class 1259 OID 42384)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    id_product integer NOT NULL,
    qty integer NOT NULL,
    total_price double precision NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 42351)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    id_user integer NOT NULL,
    date date NOT NULL,
    total_price double precision
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 42347)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 209
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 210 (class 1259 OID 42349)
-- Name: orders_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_user_seq OWNER TO postgres;

--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 210
-- Name: orders_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_user_seq OWNED BY public.orders.id_user;


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
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 206
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 205 (class 1259 OID 32783)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
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
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users_ID_seq" OWNED BY public.users.id;


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
-- TOC entry 2724 (class 2604 OID 42402)
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- TOC entry 2722 (class 2604 OID 42354)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 42355)
-- Name: orders id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id_user SET DEFAULT nextval('public.orders_id_user_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 32797)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 2720 (class 2604 OID 32786)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public."users_ID_seq"'::regclass);


--
-- TOC entry 2874 (class 0 OID 42399)
-- Dependencies: 214
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (id, name, email, subject, message, privacy) FROM stdin;
19	a	a@a.com	a	aaaa	t
\.


--
-- TOC entry 2872 (class 0 OID 42384)
-- Dependencies: 212
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, id_product, qty, total_price) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 42351)
-- Dependencies: 211
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, id_user, date, total_price) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 32794)
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
24	Ceas Police D-JAY PL.14835JS/02	749.98	img/products_images/24.jpg	3	male	navy blue	leather	watch	POLICE	one size
25	TOMMY HILFIGER Leather Bracelet TH2790160	250	img/products_images/25.jpg	4	male	navy blue	leather	bracelet	Tommy Hilfiger	19 cm
26	TOMMY HILFIGER Leather Bracelet TH2700957	314	img/products_images/26.jpg	2	male	brown	leather	bracelet	Tommy Hilfiger	18.5 cm
27	Lion Head Necklace 	1500	img/products_images/27.jpg	3	male	gold	meta, crystal	necklace	Gucci	one size
28	Police Men Chains Necklace	290.99	img/products_images/28.jpg	2	male	black	steel	necklace	POLICE	one size
29	FORMAL 3.5' Calvin Klein Belt	185.9	img/products_images/29.jpg	4	male	black	leather	belt	Calvin Klein	90 cm
30	FORMAL 3.5' Calvin Klein Belt	185.9	img/products_images/29.jpg	2	male	black	leather	belt	Calvin Klein	100 cm
31	FORMAL 3.5' Calvin Klein Belt	185.9	img/products_images/29.jpg	1	male	black	leather	belt	Calvin Klein	110 cm
32	FORMAL 3.5' Calvin Klein Belt	185.9	img/products_images/32.jpg	3	male	cognac	leather	belt	Calvin Klein	95 cm
33	FORMAL 3.5' Calvin Klein Belt	185.9	img/products_images/32.jpg	4	male	cognac	leather	belt	Calvin Klein	100 cm
34	FORMAL 3.5' Calvin Klein Belt	185.9	img/products_images/32.jpg	2	male	cognac	leather	belt	Calvin Klein	105 cm
35	WINGED MED SHOPPER' Calvin Klein Bag	410.99	img/products_images/35.jpg	3	female	black	polyurethane	bag	Calvin Klein	one size
36	BLINER' STEVE MADDEN Bag	370.99	img/products_images/36.jpg	1	female	black	synthetic	bag	Steve Madden	one size
37	BLINER' STEVE MADDEN Bag	370.99	img/products_images/37.jpg	2	female	beige	synthetic	bag	Steve Madden	one size
38	BLINER' STEVE MADDEN Bag	370.99	img/products_images/38.jpg	3	female	burgundy	synthetic	bag	Steve Madden	one size
39	POP 2.5' Tommy Jeans Belt	230.9	img/products_images/39.jpg	4	female	black	leather	belt	Tommy Jeans	80 cm
40	POP 2.5' Tommy Jeans Belt	230.9	img/products_images/39.jpg	2	female	black	leather	belt	Tommy Jeans	90 cm
41	POP 2.5' Tommy Jeans Belt	230.9	img/products_images/39.jpg	5	female	black	leather	belt	Tommy Jeans	95 cm
42	SWAROVSKI IMPULSEP BRACELET 5515988	240.99	img/products_images/40.jpg	2	female	black	leather	bracelet	SWAROVSKI	one size
43	SWAROVSKI IMPULSEP BRACELET 5515989	240.99	img/products_images/41.jpg	3	female	burgundy	leather	bracelet	SWAROVSKI	one size
44	SWAROVSKI IMPULSEP BRACELET 5515990	240.99	img/products_images/42.jpg	4	female	rose	leather	bracelet	SWAROVSKI	one size
45	NEW SHINY QUILTED' Love Moschino Bag	435.9	img/products_images/43.jpg	2	female	beige	synthetic	handbag	Love Moschino	one size
46	Geant? GUESS Brielle (VG) HWVG75 81210 BLA	670	img/products_images/44.jpg	3	female	black	synthetic	handbag	Guess	one size
47	VIVIENNE WESTWOOD logo-charm necklace	580	img/products_images/45.jpg	2	female	silver	silver	necklace	Vivienne Westwood	one size
48	SWAROVSKI NICE Y NECKLACE 5493397	450	img/products_images/46.jpg	1	female	silver	silver	necklace	SWAROVSKI	one size
49	VITTORE RING SWAROVSKI-VITTORE-RING-3	260	img/products_images/47.jpg	3	female	rose gold	stainless steel	ring	SWAROVSKI	16.5
50	VITTORE RING SWAROVSKI-VITTORE-RING-4	260	img/products_images/47.jpg	5	female	rose gold	stainless steel	ring	SWAROVSKI	17
51	VITTORE RING SWAROVSKI-VITTORE-RING-5	260	img/products_images/47.jpg	1	female	rose gold	stainless steel	ring	SWAROVSKI	18
52	DANIEL WELLINGTON CLASSIC RING	120	img/products_images/48.jpg	7	female	silver	stainless steel	ring	DANIEL WELLINGTON	16
53	DANIEL WELLINGTON CLASSIC RING	120	img/products_images/48.jpg	3	female	silver	stainless steel	ring	DANIEL WELLINGTON	17
54	DANIEL WELLINGTON CLASSIC RING	120	img/products_images/48.jpg	5	female	silver	stainless steel	ring	DANIEL WELLINGTON	18
55	DANIEL WELLINGTON CLASSIC RING	120	img/products_images/48.jpg	3	female	silver	stainless steel	ring	DANIEL WELLINGTON	19
56	Round metal' Sunglasses	670.99	img/products_images/49.jpg	4	female	gold/black	metal	sunglasses	Ray-Ban	one size
57	Round metal' Sunglasses	670.99	img/products_images/50.jpg	2	female	silver/blue	metal	sunglasses	Ray-Ban	one size
58	Tory Burch TOR0011001000001 Sunglasses	838.9	img/products_images/51.jpg	3	female	black	plastic	sunglasses	Tory Burch	one size
59	ALBY' GUESS Wallet	275.99	img/products_images/52.jpg	4	female	metallic gray	synthetic	wallet	Guess	one size
60	ELIN Wallet' TOM TAILOR Wallet	186.99	img/products_images/54.jpg	1	female	light brown	synthetic	wallet	TOM TAILOR	one size
61	Fossil Neutra Chrono FS5385 Watch	611.99	img/products_images/53.jpg	3	female	silver/gold	steel	watch	FOSSIL	one size
\.


--
-- TOC entry 2866 (class 0 OID 32783)
-- Dependencies: 205
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, username, password, email, admin) FROM stdin;
6	user	user	b14361404c078ffd549c03db443c3fede2f3e534d73f78f77301ed97d4a436a9fd9db05ee8b325c0ad36438b43fec8510c204fc1c1edb21d0941c00e9e2c1ce2	user@tilbehor.ro	f
5	admin	admin	c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec	admin@tilbehor.ro	t
\.


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 213
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_id_seq', 19, true);


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 209
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 17, true);


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 210
-- Name: orders_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_user_seq', 1, false);


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 206
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 204
-- Name: users_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users_ID_seq"', 6, true);


--
-- TOC entry 2732 (class 2606 OID 42407)
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 42409)
-- Name: contact id_contact; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT id_contact UNIQUE (id);


--
-- TOC entry 2730 (class 2606 OID 42357)
-- Name: orders id_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT id_order PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 32802)
-- Name: products id_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT id_product PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 32788)
-- Name: users id_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_users PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 42387)
-- Name: order_items id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.orders(id);


--
-- TOC entry 2737 (class 2606 OID 42392)
-- Name: order_items id_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT id_prod FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- TOC entry 2735 (class 2606 OID 42358)
-- Name: orders order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_fk FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;


-- Completed on 2020-05-09 14:42:24

--
-- PostgreSQL database dump complete
--

