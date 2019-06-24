--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO lucassantos;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO lucassantos;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO lucassantos;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO lucassantos;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    user_id bigint,
    street character varying,
    number character varying,
    zip_code character varying,
    city character varying,
    state character varying,
    address_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.addresses OWNER TO lucassantos;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO lucassantos;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO lucassantos;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE public.categories OWNER TO lucassantos;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO lucassantos;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: checkout_credit_cards; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.checkout_credit_cards (
    id bigint NOT NULL,
    checkout_id bigint,
    number character varying,
    name character varying,
    expire character varying,
    cvc character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.checkout_credit_cards OWNER TO lucassantos;

--
-- Name: checkout_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.checkout_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkout_credit_cards_id_seq OWNER TO lucassantos;

--
-- Name: checkout_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.checkout_credit_cards_id_seq OWNED BY public.checkout_credit_cards.id;


--
-- Name: checkouts; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.checkouts (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    billing_address character varying,
    billing_suburb character varying,
    billing_zip integer,
    billing_state character varying,
    phone character varying,
    total numeric(8,2),
    user_id integer,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    shipping_address character varying,
    shipping_suburb character varying,
    shipping_zip integer,
    shipping_state character varying,
    status character varying,
    credit_card_number character varying,
    credit_card_name character varying,
    credit_card_expire_date character varying,
    credit_card_ccv character varying,
    coupom_code character varying,
    billing_number character varying,
    shipping_number character varying,
    completed boolean
);


ALTER TABLE public.checkouts OWNER TO lucassantos;

--
-- Name: checkouts_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.checkouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkouts_id_seq OWNER TO lucassantos;

--
-- Name: checkouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.checkouts_id_seq OWNED BY public.checkouts.id;


--
-- Name: coupoms; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.coupoms (
    id bigint NOT NULL,
    user_id bigint,
    code character varying,
    value numeric,
    used boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.coupoms OWNER TO lucassantos;

--
-- Name: coupoms_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.coupoms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupoms_id_seq OWNER TO lucassantos;

--
-- Name: coupoms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.coupoms_id_seq OWNED BY public.coupoms.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.credit_cards (
    id bigint NOT NULL,
    user_id bigint,
    number character varying,
    name character varying,
    expire character varying,
    cvc character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.credit_cards OWNER TO lucassantos;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_cards_id_seq OWNER TO lucassantos;

--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: feature_toggles; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.feature_toggles (
    id bigint NOT NULL,
    name character varying,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.feature_toggles OWNER TO lucassantos;

--
-- Name: feature_toggles_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.feature_toggles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feature_toggles_id_seq OWNER TO lucassantos;

--
-- Name: feature_toggles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.feature_toggles_id_seq OWNED BY public.feature_toggles.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    stock_id bigint,
    product_id bigint,
    sold boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.items OWNER TO lucassantos;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO lucassantos;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    stock_id integer,
    order_id integer,
    unit_price numeric(12,3),
    quantity integer,
    total_price numeric(12,3),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.order_items OWNER TO lucassantos;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO lucassantos;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.order_statuses (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.order_statuses OWNER TO lucassantos;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.order_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_statuses_id_seq OWNER TO lucassantos;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.order_statuses_id_seq OWNED BY public.order_statuses.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    tax numeric,
    gst numeric,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_status_id integer,
    subtotal numeric(8,2),
    coupom_code character varying,
    checkout_id bigint,
    shipment_cost numeric
);


ALTER TABLE public.orders OWNER TO lucassantos;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO lucassantos;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    name character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    slug character varying NOT NULL,
    contact_form boolean,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    published boolean,
    "position" integer
);


ALTER TABLE public.pages OWNER TO lucassantos;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO lucassantos;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.pictures (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    imageable_type character varying,
    imageable_id integer
);


ALTER TABLE public.pictures OWNER TO lucassantos;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_id_seq OWNER TO lucassantos;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.pictures_id_seq OWNED BY public.pictures.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying,
    description text,
    quantity integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id integer,
    user_id integer,
    author character varying,
    year character varying,
    title character varying,
    publisher character varying,
    edition character varying,
    isbn character varying,
    pages character varying,
    dimensions character varying,
    barcode character varying,
    active boolean,
    activation_reason character varying
);


ALTER TABLE public.products OWNER TO lucassantos;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO lucassantos;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: returns; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.returns (
    id bigint NOT NULL,
    user_id bigint,
    stock_id bigint,
    return_reason character varying,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer
);


ALTER TABLE public.returns OWNER TO lucassantos;

--
-- Name: returns_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.returns_id_seq OWNER TO lucassantos;

--
-- Name: returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.returns_id_seq OWNED BY public.returns.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO lucassantos;

--
-- Name: stocks; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    product_id bigint,
    quantity integer,
    price numeric,
    lot character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.stocks OWNER TO lucassantos;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO lucassantos;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: uploads; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.uploads (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE public.uploads OWNER TO lucassantos;

--
-- Name: uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uploads_id_seq OWNER TO lucassantos;

--
-- Name: uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.uploads_id_seq OWNED BY public.uploads.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lucassantos
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    phone character varying,
    admin boolean,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    provider character varying,
    uid character varying
);


ALTER TABLE public.users OWNER TO lucassantos;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lucassantos
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO lucassantos;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucassantos
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: checkout_credit_cards id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.checkout_credit_cards ALTER COLUMN id SET DEFAULT nextval('public.checkout_credit_cards_id_seq'::regclass);


--
-- Name: checkouts id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.checkouts ALTER COLUMN id SET DEFAULT nextval('public.checkouts_id_seq'::regclass);


--
-- Name: coupoms id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.coupoms ALTER COLUMN id SET DEFAULT nextval('public.coupoms_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: feature_toggles id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.feature_toggles ALTER COLUMN id SET DEFAULT nextval('public.feature_toggles_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: order_statuses id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.order_statuses ALTER COLUMN id SET DEFAULT nextval('public.order_statuses_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: pictures id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.pictures ALTER COLUMN id SET DEFAULT nextval('public.pictures_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: returns id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.returns ALTER COLUMN id SET DEFAULT nextval('public.returns_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: uploads id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.uploads ALTER COLUMN id SET DEFAULT nextval('public.uploads_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	images	Product	3	1	2019-06-02 18:39:29.899737
2	images	Product	3	2	2019-06-02 18:52:14.492021
3	images	Product	1	3	2019-06-02 19:11:10.204738
4	images	Product	2	4	2019-06-02 19:11:42.413717
5	images	Product	4	5	2019-06-10 15:59:15.364477
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 5, true);


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
1	aeknHz8aJe3jTnhXR9fSJKiA	download.jpeg	image/jpeg	{"identified":true,"analyzed":true}	34401	jGSsPP4WKmx8WMBHcew25g==	2019-06-02 18:39:29.81091
2	bZ5kmXumimQ2HYb8rrkbzD5e	downloads.png	image/png	{"identified":true,"analyzed":true}	567758	cZo7Hflq7ORRkPGE+S9+Hw==	2019-06-02 18:52:14.488162
3	n1dRPvWW5hjypAhWzEc3Gr4m	download (1).jpeg	image/jpeg	{"identified":true,"analyzed":true}	34913	VvlGmIdTWTtblBGsy09q8Q==	2019-06-02 19:11:10.19683
4	oWz8cuTfGL7wFmpmwdf2ofND	11018195.jpg	image/jpeg	{"identified":true,"analyzed":true}	33217	lyr2l3MBeEuSoDyPMLOFIQ==	2019-06-02 19:11:42.401781
5	v6JiDXPEvSap8nhPDsXKJT3c	51KEqIsBa4L._SX370_BO1,204,203,200_.jpg	image/jpeg	{"identified":true,"analyzed":true}	45002	rmzM5nPsSZQatEDH4Qmvxw==	2019-06-10 15:59:15.306367
\.


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 5, true);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.addresses (id, user_id, street, number, zip_code, city, state, address_type, created_at, updated_at, name) FROM stdin;
1	4	Avenida Ricieri José Marcatto	2311	08810020	Mogi das Cruzes	Espírito Santo	shipping	2019-06-01 05:37:16.388128	2019-06-01 05:59:12.313494	\N
5	5	Avenida Ricieri José Marcatto	2311	08810020	Mogi das Cruzes	SP	shipping	2019-06-02 15:59:09.79153	2019-06-02 16:21:03.181507	Trabalho
8	1	Av. Ricieri José Marcatto	2311	08810020	Mogi das Cruzes	SP	billing	2019-06-03 02:22:16.565649	2019-06-03 02:22:16.565649	Casa
7	1	Avenida Ricieri José Marcatto	2311	08810020	Mogi das Cruzes	SP	shipping	2019-06-02 20:21:15.89088	2019-06-03 02:41:23.659657	Casa da mãe
9	1	Rua José Caporalli	400	09994343	Mogi das Cruzes	SP	billing	2019-06-03 02:41:57.410872	2019-06-03 02:41:57.410872	Casa da namorada
10	1	Rua José Caporalli	400	09994343	Mogi das Cruzes	SP	billing	2019-06-03 03:48:26.187301	2019-06-03 03:48:26.187301	FROM CHECKOUT
11	1	Avenida Ricieri José Marcatto	2311	08810020	Mogi das Cruzes	SP	shipping	2019-06-03 03:48:51.964838	2019-06-03 03:48:51.964838	FROM CHECKOUT
12	2	Av. Ricieri José Marcatto	2311	08810020	Mogi das Cruzes	SP	shipping	2019-06-03 04:14:06.089656	2019-06-03 04:14:06.089656	Casa
13	2	Av. Ricieri José Marcatto	2311	08810020	Mogi das Cruzes	SP	billing	2019-06-03 04:14:38.947798	2019-06-03 04:14:38.947798	Casa
14	6	Rua José Caporalli	400	08810020	Mogi das Cruzes	SP	billing	2019-06-10 01:00:03.204571	2019-06-10 01:00:03.204571	Casa
15	6	Rua José Caporalli	400	08810020	Mogi das Cruzes	SP	shipping	2019-06-10 01:00:16.623172	2019-06-10 01:00:16.623172	Casa
16	5	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	2311	08810020	Mogi das Cruzes	SP	billing	2019-06-10 15:55:05.451604	2019-06-10 15:55:05.451604	FROM CHECKOUT
17	7	Rua do Paraíso	595	04103001	São Paulo	SP	billing	2019-06-10 16:01:35.770747	2019-06-10 16:01:35.770747	FROM CHECKOUT
18	7	Rua José Caporalli, 400	595	08810020	Mogi das Cruzes	SP	shipping	2019-06-10 16:01:46.31092	2019-06-10 16:01:46.31092	FROM CHECKOUT
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.addresses_id_seq', 18, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-04-29 03:07:12.036281	2019-04-29 03:07:12.036281
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.categories (id, name, created_at, updated_at, user_id, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
2	Romance	2019-05-13 20:08:35.991781	2019-05-13 20:08:35.991781	1	\N	\N	\N	\N
3	Direito	2019-06-02 18:36:47.686058	2019-06-02 18:36:47.686058	1	\N	\N	\N	\N
4	Programacao	2019-06-10 15:56:42.427455	2019-06-10 15:56:42.427455	3	\N	\N	\N	\N
6	Literatura estrangeira	2019-06-11 23:21:51.047377	2019-06-11 23:21:51.047377	1	\N	\N	\N	\N
7	Literatura infantojunvenil	2019-06-11 23:22:44.060824	2019-06-11 23:22:44.060824	1	\N	\N	\N	\N
8	HQs	2019-06-11 23:22:56.432698	2019-06-11 23:22:56.432698	1	\N	\N	\N	\N
1	Aventura	2019-05-13 20:08:30.698807	2019-06-18 19:18:40.997	1	\N	\N	\N	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.categories_id_seq', 10, true);


--
-- Data for Name: checkout_credit_cards; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.checkout_credit_cards (id, checkout_id, number, name, expire, cvc, created_at, updated_at) FROM stdin;
1	62	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 18:55:39.571249	2019-06-24 18:55:39.571249
2	62	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:02:39.417918	2019-06-24 19:02:39.417918
3	62	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:02:39.419874	2019-06-24 19:02:39.419874
4	62	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:03:05.369826	2019-06-24 19:03:05.369826
5	63	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:16:46.552717	2019-06-24 19:16:46.552717
6	63	4444333322221111	SELENE A SANTOS	1243	343	2019-06-24 19:16:46.555483	2019-06-24 19:16:46.555483
7	64	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:20:08.725088	2019-06-24 19:20:08.725088
8	64	4444333322221111	SELENE A SANTOS	2233	343	2019-06-24 19:20:08.731546	2019-06-24 19:20:08.731546
9	65	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:24:31.669189	2019-06-24 19:24:31.669189
10	66	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:32:15.391111	2019-06-24 19:32:15.391111
11	66	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:32:15.392724	2019-06-24 19:32:15.392724
12	67	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:34:10.03048	2019-06-24 19:34:10.03048
13	67	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:34:10.03227	2019-06-24 19:34:10.03227
14	68	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:35:13.775141	2019-06-24 19:35:13.775141
15	68	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:35:13.77785	2019-06-24 19:35:13.77785
16	69	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:35:39.327014	2019-06-24 19:35:39.327014
17	69	1111222233334444	SELENE A SANTOS	1133	343	2019-06-24 19:35:39.328911	2019-06-24 19:35:39.328911
\.


--
-- Name: checkout_credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.checkout_credit_cards_id_seq', 17, true);


--
-- Data for Name: checkouts; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.checkouts (id, first_name, last_name, billing_address, billing_suburb, billing_zip, billing_state, phone, total, user_id, order_id, created_at, updated_at, email, shipping_address, shipping_suburb, shipping_zip, shipping_state, status, credit_card_number, credit_card_name, credit_card_expire_date, credit_card_ccv, coupom_code, billing_number, shipping_number, completed) FROM stdin;
65	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	47	2019-06-24 19:24:22.009175	2019-06-24 19:25:20.726907	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	delivered	\N	\N	\N	\N	\N	2311	2311	t
62	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	23	2019-06-24 18:35:58.127586	2019-06-24 19:07:25.244751	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	pending_confirmation	\N	\N	\N	\N	\N	2311	2311	t
51	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	32	2019-06-18 19:41:08.62852	2019-06-18 19:41:11.548853	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
44	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	24	2019-06-10 16:01:35.75947	2019-06-10 16:05:23.18864	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	delivered	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
39	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	18	2019-06-10 03:14:37.341336	2019-06-10 03:18:14.224345	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	delivered	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
58	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	34	2019-06-18 23:13:30.347179	2019-06-18 23:13:37.985383	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
45	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	25	2019-06-10 16:14:03.647368	2019-06-10 16:14:57.13183	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	delivered	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
40	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	19	2019-06-10 03:20:45.733098	2019-06-10 03:21:42.38692	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	delivered	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
52	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	33	2019-06-18 19:41:59.035377	2019-06-18 19:42:01.654069	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
41	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	20	2019-06-10 03:49:14.282081	2019-06-10 03:49:28.695263	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	pending_confirmation	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
42	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	\N	\N	2019-06-10 15:55:01.378163	2019-06-10 15:55:01.378163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2311	\N	\N
46	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	26	2019-06-10 17:27:48.47266	2019-06-10 17:28:54.675676	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	delivered	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
64	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	45	2019-06-24 19:19:46.961625	2019-06-24 19:21:22.524572	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	delivered	\N	\N	\N	\N	\N	2311	2311	t
53	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	29	2019-06-18 22:51:26.090469	2019-06-18 22:54:14.808993	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	pending_confirmation	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
43	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	22	2019-06-10 15:55:05.442801	2019-06-10 15:55:57.378679	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	delivered	1111222233334444	SELENE A SANTOS	1133	343	\N	2311	2311	t
47	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	27	2019-06-10 17:31:16.522802	2019-06-10 17:31:19.687882	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
59	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	34	2019-06-18 23:15:07.08061	2019-06-18 23:15:10.221308	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
48	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	21	2019-06-13 12:14:05.869786	2019-06-13 12:14:39.775303	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	pending_confirmation	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
54	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	37	2019-06-18 22:58:18.631588	2019-06-18 22:58:35.130231	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	pending_confirmation	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
63	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	45	2019-06-24 19:16:01.44169	2019-06-24 19:16:46.550475	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	\N	\N	\N	\N	\N	\N	2311	2311	\N
49	\N	\N	Av. Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	\N	\N	2	30	2019-06-18 16:15:17.353032	2019-06-18 16:15:47.950299	\N	Av. Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	in_transit	2222333344445555	SANTOS	3333	444	\N	2311	2311	t
55	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	38	2019-06-18 23:01:38.106811	2019-06-18 23:01:54.637198	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	pending_confirmation	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
50	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	28	2019-06-18 19:33:24.433093	2019-06-18 19:33:27.453436	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
60	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	34	2019-06-18 23:16:01.958803	2019-06-18 23:16:04.864927	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
56	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	39	2019-06-18 23:02:57.504129	2019-06-18 23:03:08.697834	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	pending_confirmation	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
57	\N	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	\N	\N	6	41	2019-06-18 23:05:17.573746	2019-06-18 23:05:34.992649	\N	Rua José Caporalli	Mogi das Cruzes	8810020	SP	pending_confirmation	1111222233334444	MITCHELY LUANA	1213	444	\N	400	400	t
61	\N	\N	Rua do Paraíso	São Paulo	4103001	SP	\N	\N	7	43	2019-06-18 23:19:33.952235	2019-06-18 23:19:37.190565	\N	Rua José Caporalli, 400	Mogi das Cruzes	8810020	SP	pending_confirmation	9999999999999999	LUCAS S SILVA	0302	555	\N	595	595	t
67	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	49	2019-06-24 19:34:01.480466	2019-06-24 19:34:16.6995	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	pending_confirmation	\N	\N	\N	\N	\N	2311	2311	t
66	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	48	2019-06-24 19:32:06.048848	2019-06-24 19:32:40.055548	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	delivered	\N	\N	\N	\N	\N	2311	2311	t
68	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	50	2019-06-24 19:35:11.3241	2019-06-24 19:35:14.323938	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	pending_confirmation	\N	\N	\N	\N	\N	2311	2311	t
69	\N	\N	Avenida Ricieri José Marcatto, 2311, Bloco 6 Apto 42	Mogi das Cruzes	8810020	SP	\N	\N	5	51	2019-06-24 19:35:36.84277	2019-06-24 19:35:40.741098	\N	Avenida Ricieri José Marcatto	Mogi das Cruzes	8810020	SP	pending_confirmation	\N	\N	\N	\N	\N	2311	2311	t
\.


--
-- Name: checkouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.checkouts_id_seq', 69, true);


--
-- Data for Name: coupoms; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.coupoms (id, user_id, code, value, used, created_at, updated_at) FROM stdin;
8	6	2rijc1	41.98	f	2019-06-10 03:22:37.303753	2019-06-10 03:22:37.303753
10	7	6cc0kf	303.43	t	2019-06-10 16:12:04.480389	2019-06-10 16:14:37.459595
11	7	lj8f5k	24.4	f	2019-06-10 17:30:04.418967	2019-06-10 17:30:04.418967
12	7	w66545	24.4	f	2019-06-10 17:31:38.798623	2019-06-10 17:31:38.798623
13	7	8gso3q	24.4	f	2019-06-18 19:33:44.718114	2019-06-18 19:33:44.718114
14	7	1udjv6	24.4	f	2019-06-18 19:41:29.166031	2019-06-18 19:41:29.166031
15	7	d5roz7	24.4	f	2019-06-18 19:42:19.177158	2019-06-18 19:42:19.177158
7	6	an1x4z	83.96	t	2019-06-10 03:19:06.834677	2019-06-18 22:54:14.8344
16	6	5olxkt	71.76	t	2019-06-18 22:55:56.179044	2019-06-18 22:58:35.142536
17	6	u5elnw	0.0	f	2019-06-18 23:02:25.124263	2019-06-18 23:02:25.124263
18	6	4uo7ec	-71.76	f	2019-06-18 23:03:08.715564	2019-06-18 23:03:08.715564
19	6	pj2csy	50.77	t	2019-06-18 23:04:54.202512	2019-06-18 23:05:34.999433
20	6	hhetca	38.57	f	2019-06-18 23:05:35.010289	2019-06-18 23:05:35.010289
21	7	57h3u0	24.4	f	2019-06-18 23:16:21.511119	2019-06-18 23:16:21.511119
22	7	j5fqy1	24.4	f	2019-06-18 23:19:56.097128	2019-06-18 23:19:56.097128
23	5	xswb7h	41.98	t	2019-06-24 19:23:36.265227	2019-06-24 19:24:47.0616
24	5	6hd991	20.99	f	2019-06-24 19:24:47.076509	2019-06-24 19:24:47.076509
25	5	4lvhxj	303.43	t	2019-06-24 19:33:26.107983	2019-06-24 19:34:16.703111
26	5	rqqb8v	0.0	f	2019-06-24 19:34:16.715785	2019-06-24 19:34:16.715785
27	5	jmy6vn	303.43	f	2019-06-24 19:35:29.589003	2019-06-24 19:35:29.589003
28	5	knrf73	0.0	f	2019-06-24 19:35:40.752956	2019-06-24 19:35:40.752956
\.


--
-- Name: coupoms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.coupoms_id_seq', 28, true);


--
-- Data for Name: credit_cards; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.credit_cards (id, user_id, number, name, expire, cvc, created_at, updated_at) FROM stdin;
15	5	1111222233334444	SELENE A SANTOS	1133	343	2019-06-02 16:17:16.55635	2019-06-02 16:17:16.55635
16	1	1111222233334444	LUCAS S SILVA	1122	454	2019-06-02 20:21:59.11914	2019-06-02 20:21:59.11914
17	2	2222333344445555	SANTOS	3333	444	2019-06-03 04:16:00.681207	2019-06-03 04:16:00.681207
18	6	1111222233334444	MITCHELY LUANA	1213	444	2019-06-10 01:34:31.832381	2019-06-10 01:34:31.832381
19	7	9999999999999999	LUCAS S SILVA	0302	555	2019-06-10 16:02:02.889076	2019-06-10 16:02:02.889076
\.


--
-- Name: credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.credit_cards_id_seq', 19, true);


--
-- Data for Name: feature_toggles; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.feature_toggles (id, name, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: feature_toggles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.feature_toggles_id_seq', 1, false);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.items (id, stock_id, product_id, sold, created_at, updated_at) FROM stdin;
1	1	1	f	2019-05-13 20:10:15.099893	2019-05-13 20:10:15.099893
2	1	1	f	2019-05-13 20:10:15.145659	2019-05-13 20:10:15.145659
3	1	1	f	2019-05-13 20:10:15.148706	2019-05-13 20:10:15.148706
4	1	1	f	2019-05-13 20:10:15.151346	2019-05-13 20:10:15.151346
5	1	1	f	2019-05-13 20:10:15.153806	2019-05-13 20:10:15.153806
6	1	1	f	2019-05-13 20:10:15.156218	2019-05-13 20:10:15.156218
7	1	1	f	2019-05-13 20:10:15.158557	2019-05-13 20:10:15.158557
8	1	1	f	2019-05-13 20:10:15.171806	2019-05-13 20:10:15.171806
9	1	1	f	2019-05-13 20:10:15.1742	2019-05-13 20:10:15.1742
10	1	1	f	2019-05-13 20:10:15.17662	2019-05-13 20:10:15.17662
11	2	2	f	2019-05-13 20:10:36.750772	2019-05-13 20:10:36.750772
12	2	2	f	2019-05-13 20:10:36.756159	2019-05-13 20:10:36.756159
13	2	2	f	2019-05-13 20:10:36.759148	2019-05-13 20:10:36.759148
14	2	2	f	2019-05-13 20:10:36.761767	2019-05-13 20:10:36.761767
15	2	2	f	2019-05-13 20:10:36.764094	2019-05-13 20:10:36.764094
16	2	2	f	2019-05-13 20:10:36.766266	2019-05-13 20:10:36.766266
17	2	2	f	2019-05-13 20:10:36.768548	2019-05-13 20:10:36.768548
18	2	2	f	2019-05-13 20:10:36.770885	2019-05-13 20:10:36.770885
19	2	2	f	2019-05-13 20:10:36.773303	2019-05-13 20:10:36.773303
20	2	2	f	2019-05-13 20:10:36.775759	2019-05-13 20:10:36.775759
21	3	3	f	2019-06-02 18:40:34.166358	2019-06-02 18:40:34.166358
22	3	3	f	2019-06-02 18:40:34.196412	2019-06-02 18:40:34.196412
23	3	3	f	2019-06-02 18:40:34.199186	2019-06-02 18:40:34.199186
24	3	3	f	2019-06-02 18:40:34.201884	2019-06-02 18:40:34.201884
25	3	3	f	2019-06-02 18:40:34.2077	2019-06-02 18:40:34.2077
26	3	3	f	2019-06-02 18:40:34.213727	2019-06-02 18:40:34.213727
27	3	3	f	2019-06-02 18:40:34.216158	2019-06-02 18:40:34.216158
28	3	3	f	2019-06-02 18:40:34.218347	2019-06-02 18:40:34.218347
29	3	3	f	2019-06-02 18:40:34.220325	2019-06-02 18:40:34.220325
30	3	3	f	2019-06-02 18:40:34.231254	2019-06-02 18:40:34.231254
31	4	1	f	2019-06-10 02:36:28.398874	2019-06-10 02:36:28.398874
32	4	1	f	2019-06-10 02:36:28.402396	2019-06-10 02:36:28.402396
33	4	1	f	2019-06-10 02:36:28.404546	2019-06-10 02:36:28.404546
34	4	1	f	2019-06-10 02:36:28.406865	2019-06-10 02:36:28.406865
35	4	1	f	2019-06-10 02:36:28.409172	2019-06-10 02:36:28.409172
36	4	1	f	2019-06-10 02:36:28.411523	2019-06-10 02:36:28.411523
37	4	1	f	2019-06-10 02:36:28.414726	2019-06-10 02:36:28.414726
38	4	1	f	2019-06-10 02:36:28.417749	2019-06-10 02:36:28.417749
39	4	1	f	2019-06-10 02:36:28.426754	2019-06-10 02:36:28.426754
40	4	1	f	2019-06-10 02:36:28.428908	2019-06-10 02:36:28.428908
41	5	2	f	2019-06-10 02:41:08.48124	2019-06-10 02:41:08.48124
42	5	2	f	2019-06-10 02:41:08.532274	2019-06-10 02:41:08.532274
43	5	2	f	2019-06-10 02:41:08.542971	2019-06-10 02:41:08.542971
44	5	2	f	2019-06-10 02:41:08.547897	2019-06-10 02:41:08.547897
45	5	2	f	2019-06-10 02:41:08.553053	2019-06-10 02:41:08.553053
46	5	2	f	2019-06-10 02:41:08.560246	2019-06-10 02:41:08.560246
47	5	2	f	2019-06-10 02:41:08.569657	2019-06-10 02:41:08.569657
48	5	2	f	2019-06-10 02:41:08.578012	2019-06-10 02:41:08.578012
49	5	2	f	2019-06-10 02:41:08.581338	2019-06-10 02:41:08.581338
50	5	2	f	2019-06-10 02:41:08.588263	2019-06-10 02:41:08.588263
51	6	4	f	2019-06-10 15:59:43.420852	2019-06-10 15:59:43.420852
52	6	4	f	2019-06-10 15:59:43.440081	2019-06-10 15:59:43.440081
53	6	4	f	2019-06-10 15:59:43.443236	2019-06-10 15:59:43.443236
54	6	4	f	2019-06-10 15:59:43.445571	2019-06-10 15:59:43.445571
55	6	4	f	2019-06-10 15:59:43.447789	2019-06-10 15:59:43.447789
56	6	4	f	2019-06-10 15:59:43.461895	2019-06-10 15:59:43.461895
57	6	4	f	2019-06-10 15:59:43.464431	2019-06-10 15:59:43.464431
58	6	4	f	2019-06-10 15:59:43.467143	2019-06-10 15:59:43.467143
59	6	4	f	2019-06-10 15:59:43.470437	2019-06-10 15:59:43.470437
60	6	4	f	2019-06-10 15:59:43.474537	2019-06-10 15:59:43.474537
61	6	4	f	2019-06-10 15:59:43.477598	2019-06-10 15:59:43.477598
62	6	4	f	2019-06-10 15:59:43.479835	2019-06-10 15:59:43.479835
63	6	4	f	2019-06-10 15:59:43.502463	2019-06-10 15:59:43.502463
64	6	4	f	2019-06-10 15:59:43.506819	2019-06-10 15:59:43.506819
65	6	4	f	2019-06-10 15:59:43.508991	2019-06-10 15:59:43.508991
66	6	4	f	2019-06-10 15:59:43.511414	2019-06-10 15:59:43.511414
67	6	4	f	2019-06-10 15:59:43.513804	2019-06-10 15:59:43.513804
68	6	4	f	2019-06-10 15:59:43.516212	2019-06-10 15:59:43.516212
69	6	4	f	2019-06-10 15:59:43.518861	2019-06-10 15:59:43.518861
70	6	4	f	2019-06-10 15:59:43.521661	2019-06-10 15:59:43.521661
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.items_id_seq', 70, true);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.order_items (id, stock_id, order_id, unit_price, quantity, total_price, created_at, updated_at) FROM stdin;
25	2	18	20.990	4	83.960	2019-06-10 03:14:20.889199	2019-06-10 03:14:20.889199
26	4	18	19.900	3	59.700	2019-06-10 03:14:29.815293	2019-06-10 03:14:29.815293
27	2	19	20.990	5	104.950	2019-06-10 03:20:37.090727	2019-06-10 03:20:37.090727
28	3	20	28.900	4	115.600	2019-06-10 03:49:06.746826	2019-06-10 03:49:06.746826
29	4	22	19.900	3	59.700	2019-06-10 15:54:46.739717	2019-06-10 15:54:46.739717
30	6	24	303.430	2	606.860	2019-06-10 16:00:44.595521	2019-06-10 16:00:49.892585
31	6	25	303.430	1	303.430	2019-06-10 16:13:49.593345	2019-06-10 16:13:49.593345
32	5	26	12.200	2	24.400	2019-06-10 17:27:30.277596	2019-06-10 17:27:30.277596
33	6	26	303.430	2	606.860	2019-06-10 17:27:40.821601	2019-06-10 17:27:40.821601
34	2	27	20.990	2	41.980	2019-06-10 17:31:12.856565	2019-06-10 17:31:12.856565
35	5	27	12.200	2	24.400	2019-06-10 17:31:14.833572	2019-06-10 17:31:14.833572
36	6	17	303.430	2	606.860	2019-06-13 12:06:48.58434	2019-06-13 12:06:48.58434
37	6	21	303.430	3	910.290	2019-06-13 12:10:01.509532	2019-06-13 12:10:01.509532
38	5	30	12.200	2	24.400	2019-06-18 16:15:11.989736	2019-06-18 16:15:11.989736
39	3	28	28.900	4	57.800	2019-06-18 19:31:38.581753	2019-06-18 19:31:38.581753
40	5	28	12.200	4	24.400	2019-06-18 19:31:40.58388	2019-06-18 19:31:40.58388
41	2	32	20.990	2	41.980	2019-06-18 19:41:05.012346	2019-06-18 19:41:05.012346
42	5	32	12.200	2	24.400	2019-06-18 19:41:07.009908	2019-06-18 19:41:07.009908
43	6	33	303.430	2	606.860	2019-06-18 19:41:55.902007	2019-06-18 19:41:55.902007
44	5	33	12.200	2	24.400	2019-06-18 19:41:57.577118	2019-06-18 19:41:57.577118
45	5	29	12.200	1	12.200	2019-06-18 22:51:20.56871	2019-06-18 22:51:20.56871
46	3	37	28.900	1	28.900	2019-06-18 22:58:13.41536	2019-06-18 22:58:13.41536
47	2	38	20.990	1	20.990	2019-06-18 23:01:30.68064	2019-06-18 23:01:30.68064
48	2	39	20.990	1	20.990	2019-06-18 23:02:52.76047	2019-06-18 23:02:52.76047
49	5	41	12.200	1	12.200	2019-06-18 23:05:10.750244	2019-06-18 23:05:10.750244
50	6	34	303.430	2	606.860	2019-06-18 23:13:21.185571	2019-06-18 23:13:21.185571
52	3	34	28.900	2	57.800	2019-06-18 23:14:59.300115	2019-06-18 23:14:59.300115
53	2	34	20.990	2	41.980	2019-06-18 23:15:58.568035	2019-06-18 23:15:58.568035
51	5	34	12.200	6	24.400	2019-06-18 23:13:26.225323	2019-06-18 23:13:26.225323
54	6	43	303.430	2	606.860	2019-06-18 23:19:30.109072	2019-06-18 23:19:30.109072
55	5	43	12.200	2	24.400	2019-06-18 23:19:32.128973	2019-06-18 23:19:32.128973
57	6	23	303.430	1	303.430	2019-06-24 18:35:46.873553	2019-06-24 18:35:46.873553
62	2	45	20.990	2	41.980	2019-06-24 19:19:28.153791	2019-06-24 19:19:28.153791
63	3	45	28.900	3	86.700	2019-06-24 19:19:37.663002	2019-06-24 19:19:37.663002
64	2	47	20.990	1	20.990	2019-06-24 19:24:15.02147	2019-06-24 19:24:15.02147
65	3	48	28.900	3	86.700	2019-06-24 19:31:48.88943	2019-06-24 19:31:48.88943
66	6	48	303.430	1	303.430	2019-06-24 19:31:59.521327	2019-06-24 19:31:59.521327
67	6	49	303.430	1	303.430	2019-06-24 19:33:56.270178	2019-06-24 19:33:56.270178
68	3	50	28.900	3	86.700	2019-06-24 19:35:07.375648	2019-06-24 19:35:07.375648
69	2	50	20.990	1	20.990	2019-06-24 19:35:09.60927	2019-06-24 19:35:09.60927
70	6	51	303.430	1	303.430	2019-06-24 19:35:35.316253	2019-06-24 19:35:35.316253
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.order_items_id_seq', 70, true);


--
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.order_statuses (id, name, created_at, updated_at) FROM stdin;
1	name	2019-05-13 17:08:04.80224	2019-05-13 17:08:04.80224
\.


--
-- Name: order_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.order_statuses_id_seq', 1, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.orders (id, tax, gst, user_id, created_at, updated_at, order_status_id, subtotal, coupom_code, checkout_id, shipment_cost) FROM stdin;
21	\N	\N	6	2019-06-10 03:49:28.711773	2019-06-13 12:14:39.77254	1	910.29	\N	48	45.5145
30	\N	\N	2	2019-06-18 16:15:11.893223	2019-06-18 16:15:25.914661	1	24.40	\N	49	1.22
31	\N	\N	2	2019-06-18 16:15:25.969257	2019-06-18 16:15:25.969257	1	\N	\N	\N	\N
28	\N	\N	7	2019-06-10 17:31:19.701325	2019-06-18 19:33:27.445489	1	82.20	\N	50	4.11
32	\N	\N	7	2019-06-18 19:33:27.519174	2019-06-18 19:41:11.546349	1	66.38	\N	51	3.319
33	\N	\N	7	2019-06-18 19:41:11.558371	2019-06-18 19:42:01.652649	1	631.26	\N	52	31.563
29	\N	\N	6	2019-06-13 12:14:39.823177	2019-06-18 22:54:14.807326	1	-71.76	an1x4z	53	-3.588
35	\N	\N	6	2019-06-18 22:54:14.859507	2019-06-18 22:54:14.859507	1	\N	\N	\N	\N
36	\N	\N	6	2019-06-18 22:54:39.75	2019-06-18 22:54:39.75	1	\N	\N	\N	\N
37	\N	\N	6	2019-06-18 22:55:56.182751	2019-06-18 22:58:35.125262	1	0.00	5olxkt	54	0.0
38	\N	\N	6	2019-06-18 22:58:35.154836	2019-06-18 23:01:54.634723	1	0.00	5olxkt	55	0.0
39	\N	\N	6	2019-06-18 23:02:25.126612	2019-06-18 23:03:08.695826	1	0.00	5olxkt	56	0.0
40	\N	\N	6	2019-06-18 23:03:08.717751	2019-06-18 23:03:08.717751	1	\N	\N	\N	\N
17	\N	\N	3	2019-06-10 03:13:21.299522	2019-06-10 03:13:21.299522	1	\N	\N	\N	\N
18	\N	\N	6	2019-06-10 03:14:20.883463	2019-06-10 03:14:55.2659	1	143.66	\N	39	7.183
41	\N	\N	6	2019-06-18 23:04:54.204925	2019-06-18 23:05:34.986846	1	0.00	pj2csy	57	0.0
19	\N	\N	6	2019-06-10 03:14:55.331525	2019-06-10 03:20:59.106829	1	104.95	\N	40	5.2475
42	\N	\N	6	2019-06-18 23:05:35.013622	2019-06-18 23:05:35.013622	1	\N	\N	\N	\N
20	\N	\N	6	2019-06-10 03:20:59.126847	2019-06-10 03:49:28.693776	1	115.60	\N	41	5.78
22	\N	\N	5	2019-06-10 15:54:46.688918	2019-06-10 15:55:21.872454	1	59.70	\N	43	2.985
24	\N	\N	7	2019-06-10 16:00:44.593124	2019-06-10 16:02:06.451577	1	606.86	\N	44	30.343
34	\N	\N	7	2019-06-18 19:42:01.664657	2019-06-18 23:16:04.863458	1	731.04	\N	60	36.552
25	\N	\N	7	2019-06-10 16:02:06.462807	2019-06-10 16:14:37.45286	1	0.00	6cc0kf	45	0.0
43	\N	\N	7	2019-06-18 23:16:04.877374	2019-06-18 23:19:37.186057	1	631.26	\N	61	31.563
44	\N	\N	7	2019-06-18 23:19:37.195745	2019-06-18 23:19:37.195745	1	\N	\N	\N	\N
26	\N	\N	7	2019-06-10 16:14:37.463592	2019-06-10 17:28:03.668934	1	631.26	\N	46	31.563
23	\N	\N	5	2019-06-10 15:55:21.920352	2019-06-24 19:07:25.241135	1	303.43	\N	62	15.1715
27	\N	\N	7	2019-06-10 17:28:03.725955	2019-06-10 17:31:19.685944	1	66.38	\N	47	3.319
46	\N	\N	\N	2019-06-24 19:18:03.570544	2019-06-24 19:18:03.570544	1	\N	\N	\N	\N
45	\N	\N	5	2019-06-24 19:07:25.290771	2019-06-24 19:20:24.675584	1	128.68	\N	64	6.434
47	\N	\N	5	2019-06-24 19:20:24.716275	2019-06-24 19:24:47.037988	1	0.00	xswb7h	65	0.0
48	\N	\N	5	2019-06-24 19:24:47.10147	2019-06-24 19:32:19.577379	1	390.13	\N	66	19.5065
49	\N	\N	5	2019-06-24 19:32:19.606089	2019-06-24 19:34:16.696313	1	0.00	4lvhxj	67	0.0
50	\N	\N	5	2019-06-24 19:34:16.718515	2019-06-24 19:35:14.322263	1	107.69	\N	68	5.3845
51	\N	\N	5	2019-06-24 19:35:14.33269	2019-06-24 19:35:40.739584	1	0.00	4lvhxj	69	0.0
52	\N	\N	5	2019-06-24 19:35:40.758596	2019-06-24 19:35:40.758596	1	\N	\N	\N	\N
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.orders_id_seq', 52, true);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.pages (id, name, content, created_at, updated_at, user_id, slug, contact_form, image_file_name, image_content_type, image_file_size, image_updated_at, published, "position") FROM stdin;
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, false);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.pictures (id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, imageable_type, imageable_id) FROM stdin;
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.pictures_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.products (id, name, description, quantity, created_at, updated_at, category_id, user_id, author, year, title, publisher, edition, isbn, pages, dimensions, barcode, active, activation_reason) FROM stdin;
4	The C++ Programming Language	The new C++11 standard allows programmers to express ideas more clearly, simply, and directly, and to write faster, more efficient code. Bjarne Stroustrup, the designer and original implementer of C++, has reorganized, extended, and completely rewritten his definitive reference and tutorial for programmers who want to use C++ most effectively.	\N	2019-06-10 15:59:15.355946	2019-06-10 15:59:15.369291	4	3	Bjarne Stroustrup	2013	\N	Addison-Wesley Professional	4	978-0321563842	1368	18,8 x 4,3 x 23,1 cm	978-0321563842	t	Cadastro de produto
3	Código De Proteção e Defesa do Consumidor	"A Editora Saraiva, líder no mercado de livros jurídicos e sempre atenta às necessidades dos profissionais e interessados neste meio, apresenta a nova edição da obra Código de Proteção e Defesa do Consumidor. A obra é composta pelo Código de Proteção e Defesa do Consumidor (Lei n. 8.078, de 11-9-1990), dispositivos da Constituição Federal, legislação complementar abrangente sobre a matéria, acompanhada de notas que relacionam os diplomas entre si e de índices facilitadores de pesquisa. Destaques desta edição: • Lei de Proteção de Dados Pessoais (Lei n. 13.709, de 14-8-2018) • Participação, proteção e defesa dos direitos do usuário dos serviços públicos da administração pública - Regulamento (Decreto n. 9.492, de 5-9-2018)"	\N	2019-06-02 18:39:29.879353	2019-06-02 18:52:14.493669	3	1	Saraiva	2019	\N	Saraiva	29	9788553607433	328	20x30x10	9788553607433	t	Cadastro de produto
2	Crepúsculo	Isabella Swan chega à nublada e chuvosa cidadezinha de Forks - último lugar onde gostaria de viver. Tenta se adaptar à vida provinciana na qual aparentemente todos se conhecem, lidar com sua constrangedora falta de coordenação motora e se habituar a morar com um pai com quem nunca conviveu. Em seu destino está Edward Cullen. Lindo, perfeito, misterioso ele é à primeira vista, hostil à presença de Bella - o que provoca nela uma inquietação desconcertante. Ela se apaixona. Ele, no melhor estilo 'amor proibido', alerta - Sou um risco para você. Ela é uma garota incomum. Ele é um vampiro. Ela precisa aprender a controlar seu corpo quando ele a toca. Ele, a controlar sua sede pelo sangue dela. Em meio a descobertas e sobressaltos, Edward é, sim, perigoso.	\N	2019-05-13 20:09:50.002915	2019-06-02 19:11:42.416596	2	1	Stephenie Meyer	2017	\N	Santos	1	853251622X	211	21x12x12	9788532516220	t	FASDFAS
1	Maze Runner	Ao acordar dentro de um escuro elevador em movimento, a única coisa que Thomas consegue lembrar é de seu nome. Sua memória está completamente apagada. Mas ele não está sozinho. Quando a caixa metálica chega a seu destino e as portas se abrem, Thomas se vê rodeado por garotos que o acolhem e o apresentam "A Clareira", um espaço aberto cercado por muros gigantescos. Assim como Thomas, nenhum deles sabe como foi parar ali, nem por quê. Sabem apenas que todas as manhãs as portas de pedra do Labirinto que os cerca se abrem, e, à noite, se fecham. E que a cada trinta dias um novo garoto é entregue pelo elevador. Porém, um fato altera de forma radical a rotina do lugar - chega uma garota, a primeira enviada à Clareira. E mais surpreendente ainda é a mensagem que ela traz consigo. Thomas será mais importante do que imagina, mas para isso terá de descobrir os sombrios segredos guardados em sua mente e correr... correr muito.	\N	2019-05-13 20:09:18.112375	2019-06-02 20:16:12.829607	1	1	Lucas	2019	\N	Santos	15	853251622X	211	21x12x12	9788532516220	f	FASDFAS
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.products_id_seq', 4, true);


--
-- Data for Name: returns; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.returns (id, user_id, stock_id, return_reason, status, created_at, updated_at, quantity) FROM stdin;
8	6	2	Defeito	confirmed	2019-06-10 03:18:51.384867	2019-06-10 03:19:06.802132	4
9	6	2	Teste	confirmed	2019-06-10 03:22:06.035289	2019-06-10 03:22:37.254308	2
10	7	6	Um veio com defeito	completed	2019-06-10 16:06:12.272309	2019-06-10 16:12:04.462572	1
11	7	5	Teste	confirmed	2019-06-10 17:29:33.292988	2019-06-18 19:42:17.992834	2
14	7	5	Teste	completed	2019-06-18 19:41:23.158868	2019-06-18 19:42:19.172274	2
16	7	5	Teste	pending	2019-06-18 23:14:34.516343	2019-06-18 23:14:34.516343	2
17	7	5	Teste	pending	2019-06-18 23:16:15.840325	2019-06-18 23:16:15.840325	2
12	7	5	Teste	completed	2019-06-10 17:31:32.499245	2019-06-18 23:16:21.49436	2
18	7	5	Teste	pending	2019-06-18 23:19:49.874324	2019-06-18 23:19:49.874324	2
13	7	5	Teste	confirmed	2019-06-18 19:33:38.979089	2019-06-18 23:19:54.887496	2
15	7	5	Teste	completed	2019-06-18 19:42:12.808332	2019-06-18 23:19:56.087727	2
19	5	4	dfaas	pending	2019-06-24 14:48:33.293136	2019-06-24 14:48:33.293136	2
20	5	2	Não gostei	completed	2019-06-24 19:23:00.795483	2019-06-24 19:23:36.20303	2
21	5	6	teste	completed	2019-06-24 19:33:02.928545	2019-06-24 19:33:26.07792	1
22	5	6	teste	pending	2019-06-24 19:35:24.552564	2019-06-24 19:35:24.552564	1
\.


--
-- Name: returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.returns_id_seq', 22, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.schema_migrations (version) FROM stdin;
20190527032547
20190530211407
20190530212037
20190602135023
20190602135058
20190602153552
20190602181215
20190603024341
20190603030308
20190603041824
20190624182616
20170814010902
20170814013323
20170814013401
20170814014521
20170814015004
20170814020200
20170814020233
20170814020240
20170814023233
20170814024005
20170814024705
20170814024829
20170814024918
20170814025002
20170814025555
20170814030515
20170819074429
20170819080017
20170819080648
20170819083235
20170819091031
20170819223352
20170904002809
20170904002920
20170904003030
20170904003713
20170904024134
20170904044626
20170904073733
20170904082434
20170904102901
20170906002317
20170906002850
20170907224408
20170908231448
20170909021740
20171030064611
20171030065651
20171030070724
20171104061416
20171104223908
20171115080740
20171115080826
20171125205616
20171125211111
20190429121859
20190429123139
20190429152806
20190429195518
20190429231035
20190509205218
20190512225052
20190513003132
20190513023838
20190513115938
20190513122530
20190513131100
20190513141817
20190513151941
20190513164322
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.stocks (id, product_id, quantity, price, lot, created_at, updated_at) FROM stdin;
1	1	0	15.9	#12	2019-05-13 20:10:15.039013	2019-06-10 02:21:54.442048
4	1	0	19.9	#13	2019-06-10 02:36:28.353191	2019-06-10 15:55:21.867869
5	2	10	12.2	#14	2019-06-10 02:41:08.416998	2019-06-18 23:19:56.100039
3	3	7	28.9	#1	2019-06-02 18:40:34.105251	2019-06-24 19:35:14.298244
2	2	16	20.99	#14	2019-05-13 20:10:36.732919	2019-06-24 19:35:14.31586
6	4	10	303.43	#1	2019-06-10 15:59:43.360806	2019-06-24 19:35:40.730727
\.


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.stocks_id_seq', 6, true);


--
-- Data for Name: uploads; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.uploads (id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
\.


--
-- Name: uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.uploads_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lucassantos
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, first_name, last_name, phone, admin, image_file_name, image_content_type, image_file_size, image_updated_at, provider, uid) FROM stdin;
5	selene.ana@hotmail.com	$2a$11$lphH4mUKcEV5AjjXq/96u.5sV8A07oQ.HhGvlTYY3dt4oPd8WqVGu	\N	\N	\N	18	2019-06-24 19:35:32.471707	2019-06-24 19:35:21.90209	::1	::1	2019-06-02 13:27:13.460508	2019-06-24 19:35:32.472597	Selene	Ana	11942891039	\N	\N	\N	\N	\N	\N	\N
1	lucas.santos.silva2011@gmail.com	$2a$11$FUzOKvPVI1wytTjoEBveTOqr2w70aJk7Yx9YB2i0SGFSIADl.RLTS	\N	\N	\N	31	2019-06-24 19:35:44.887571	2019-06-24 19:35:27.544276	::1	::1	2019-05-13 20:07:16.380519	2019-06-24 19:35:44.889431	Lucas	Santos	11942890139	t	\N	\N	\N	\N	\N	\N
6	mitchely@gmail.com	$2a$11$QrM2AMJh9mM4rYGXuvYtc.2oXvifOM2vq5He8N2zPU0Fzr/OPv/Im	\N	\N	\N	5	2019-06-18 22:46:35.969359	2019-06-13 12:09:41.74603	::1	::1	2019-06-10 00:59:10.54997	2019-06-18 22:46:35.970044	Mitchely	Luana	11974825389	\N	\N	\N	\N	\N	\N	\N
4	mitchelly@gmail.com	$2a$11$jMfVbFRouJd8SdBTbsan/exqxVsG3s2WIl7uS0b2RvhySsSWs7zZO	\N	\N	\N	2	2019-06-01 06:34:33.564017	2019-06-01 05:37:17.322324	::1	::1	2019-06-01 05:37:16.383783	2019-06-01 06:34:33.565264	Mitchely	Luana	11942890139	t	\N	\N	\N	\N	\N	\N
3	admin@bookstore.com	$2a$11$dOVAKK6xLFhYWKb/0dD15eVi.NmV/jNA.GfO9sFM4qQi15zP2Zx6i	\N	\N	\N	31	2019-06-18 23:19:52.803898	2019-06-18 23:19:41.316251	::1	::1	2019-05-27 03:11:36.374822	2019-06-18 23:19:52.804715	Lucas	Santos	11942890139	t	\N	\N	\N	\N	\N	\N
7	lucas-santos-silva2011@hotmail.com	$2a$11$Q14oxjopB6SkMjUqbMVnyOxjE7vlhu6vdv6xuqS4SaRU/BI1HMSn2	\N	\N	\N	32	2019-06-18 23:19:59.063941	2019-06-18 23:19:46.528113	::1	::1	2019-06-10 16:00:29.377073	2019-06-18 23:19:59.06546	Lucas	Santos	11942890139	\N	\N	\N	\N	\N	\N	\N
2	santos@gmail.com	$2a$11$iZRmjDInpz7Tn63gwjbSOe0aDqqie25UsrUMBlKSHcnHaRXqyPL8O	\N	\N	\N	21	2019-06-18 23:20:26.096016	2019-06-18 22:16:30.536438	::1	::1	2019-05-13 20:11:00.740186	2019-06-18 23:20:26.096745	Lucas	Santos	11942890139	t	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucassantos
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: checkout_credit_cards checkout_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.checkout_credit_cards
    ADD CONSTRAINT checkout_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: checkouts checkouts_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.checkouts
    ADD CONSTRAINT checkouts_pkey PRIMARY KEY (id);


--
-- Name: coupoms coupoms_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.coupoms
    ADD CONSTRAINT coupoms_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: feature_toggles feature_toggles_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.feature_toggles
    ADD CONSTRAINT feature_toggles_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: order_statuses order_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pictures pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: returns returns_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT returns_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: uploads uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.uploads
    ADD CONSTRAINT uploads_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_addresses_on_user_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_addresses_on_user_id ON public.addresses USING btree (user_id);


--
-- Name: index_checkout_credit_cards_on_checkout_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_checkout_credit_cards_on_checkout_id ON public.checkout_credit_cards USING btree (checkout_id);


--
-- Name: index_coupoms_on_user_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_coupoms_on_user_id ON public.coupoms USING btree (user_id);


--
-- Name: index_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_credit_cards_on_user_id ON public.credit_cards USING btree (user_id);


--
-- Name: index_items_on_product_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_items_on_product_id ON public.items USING btree (product_id);


--
-- Name: index_items_on_stock_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_items_on_stock_id ON public.items USING btree (stock_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_order_items_on_order_id ON public.order_items USING btree (order_id);


--
-- Name: index_orders_on_checkout_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_orders_on_checkout_id ON public.orders USING btree (checkout_id);


--
-- Name: index_orders_on_order_status_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_orders_on_order_status_id ON public.orders USING btree (order_status_id);


--
-- Name: index_pages_on_slug; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE UNIQUE INDEX index_pages_on_slug ON public.pages USING btree (slug);


--
-- Name: index_pictures_on_imageable_type_and_imageable_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_pictures_on_imageable_type_and_imageable_id ON public.pictures USING btree (imageable_type, imageable_id);


--
-- Name: index_returns_on_stock_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_returns_on_stock_id ON public.returns USING btree (stock_id);


--
-- Name: index_returns_on_user_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_returns_on_user_id ON public.returns USING btree (user_id);


--
-- Name: index_stocks_on_product_id; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE INDEX index_stocks_on_product_id ON public.stocks USING btree (product_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: lucassantos
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: coupoms fk_coupoms_users; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.coupoms
    ADD CONSTRAINT fk_coupoms_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: credit_cards fk_rails_069bf994f3; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT fk_rails_069bf994f3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: returns fk_rails_29e84a571c; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT fk_rails_29e84a571c FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- Name: checkout_credit_cards fk_rails_328a17b17d; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.checkout_credit_cards
    ADD CONSTRAINT fk_rails_328a17b17d FOREIGN KEY (checkout_id) REFERENCES public.checkouts(id);


--
-- Name: addresses fk_rails_48c9e0c5a2; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_48c9e0c5a2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders fk_rails_7a22cf8b0e; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_7a22cf8b0e FOREIGN KEY (order_status_id) REFERENCES public.order_statuses(id);


--
-- Name: returns fk_rails_94f64f705f; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.returns
    ADD CONSTRAINT fk_rails_94f64f705f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: items fk_rails_9a56345cfd; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_9a56345cfd FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: order_items fk_rails_bc91e0a99f; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_bc91e0a99f FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: stocks fk_rails_cfc800c26b; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk_rails_cfc800c26b FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders fk_rails_dede3940a5; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_dede3940a5 FOREIGN KEY (checkout_id) REFERENCES public.checkouts(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: items fk_rails_fd338e5742; Type: FK CONSTRAINT; Schema: public; Owner: lucassantos
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_fd338e5742 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- PostgreSQL database dump complete
--

