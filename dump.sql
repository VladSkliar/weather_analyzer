--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO competeraprog;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO competeraprog;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO competeraprog;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO competeraprog;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO competeraprog;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO competeraprog;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO competeraprog;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO competeraprog;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO competeraprog;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO competeraprog;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO competeraprog;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO competeraprog;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO competeraprog;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO competeraprog;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO competeraprog;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO competeraprog;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO competeraprog;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO competeraprog;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO competeraprog;

--
-- Name: main_city; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE main_city (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    city_true boolean NOT NULL
);


ALTER TABLE main_city OWNER TO competeraprog;

--
-- Name: main_city_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE main_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE main_city_id_seq OWNER TO competeraprog;

--
-- Name: main_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE main_city_id_seq OWNED BY main_city.id;


--
-- Name: main_currentweather; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE main_currentweather (
    id integer NOT NULL,
    delta character varying(20) NOT NULL,
    date date NOT NULL,
    created timestamp with time zone NOT NULL,
    temperature smallint,
    city_id integer NOT NULL
);


ALTER TABLE main_currentweather OWNER TO competeraprog;

--
-- Name: main_currentweather_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE main_currentweather_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE main_currentweather_id_seq OWNER TO competeraprog;

--
-- Name: main_currentweather_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE main_currentweather_id_seq OWNED BY main_currentweather.id;


--
-- Name: main_weatherforecast; Type: TABLE; Schema: public; Owner: competeraprog
--

CREATE TABLE main_weatherforecast (
    id integer NOT NULL,
    date date NOT NULL,
    created timestamp with time zone NOT NULL,
    temperature smallint,
    city_id integer NOT NULL
);


ALTER TABLE main_weatherforecast OWNER TO competeraprog;

--
-- Name: main_weatherforecast_id_seq; Type: SEQUENCE; Schema: public; Owner: competeraprog
--

CREATE SEQUENCE main_weatherforecast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE main_weatherforecast_id_seq OWNER TO competeraprog;

--
-- Name: main_weatherforecast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: competeraprog
--

ALTER SEQUENCE main_weatherforecast_id_seq OWNED BY main_weatherforecast.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_city ALTER COLUMN id SET DEFAULT nextval('main_city_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_currentweather ALTER COLUMN id SET DEFAULT nextval('main_currentweather_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_weatherforecast ALTER COLUMN id SET DEFAULT nextval('main_weatherforecast_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add current weather	7	add_currentweather
20	Can change current weather	7	change_currentweather
21	Can delete current weather	7	delete_currentweather
22	Can add city	8	add_city
23	Can change city	8	change_city
24	Can delete city	8	delete_city
25	Can add weather forecast	9	add_weatherforecast
26	Can change weather forecast	9	change_weatherforecast
27	Can delete weather forecast	9	delete_weatherforecast
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$30000$MwSqWsG4T3dm$U+ZXQ3JsA17QIDAFDDWhqIWjePpnbs8waUZkH7Pa0tg=	2016-12-03 23:04:27.262412+02	t	competera				t	t	2016-12-03 23:04:19.922151+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-12-03 23:04:35.328239+02	1	Kiev	1	[{"added": {}}]	8	1
2	2016-12-03 23:04:41.36391+02	2	London	1	[{"added": {}}]	8	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 2, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	user
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	main	currentweather
8	main	city
9	main	weatherforecast
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-12-03 22:57:46.399012+02
2	auth	0001_initial	2016-12-03 22:57:47.347948+02
3	admin	0001_initial	2016-12-03 22:57:47.626762+02
4	admin	0002_logentry_remove_auto_add	2016-12-03 22:57:47.69215+02
5	contenttypes	0002_remove_content_type_name	2016-12-03 22:57:47.785164+02
6	auth	0002_alter_permission_name_max_length	2016-12-03 22:57:47.813704+02
7	auth	0003_alter_user_email_max_length	2016-12-03 22:57:47.858161+02
8	auth	0004_alter_user_username_opts	2016-12-03 22:57:47.886129+02
9	auth	0005_alter_user_last_login_null	2016-12-03 22:57:47.914274+02
10	auth	0006_require_contenttypes_0002	2016-12-03 22:57:47.928139+02
11	auth	0007_alter_validators_add_error_messages	2016-12-03 22:57:47.950201+02
12	auth	0008_alter_user_username_max_length	2016-12-03 22:57:48.059077+02
13	sessions	0001_initial	2016-12-03 22:57:48.272983+02
14	main	0001_initial	2016-12-03 22:58:11.564646+02
15	main	0002_auto_20161203_2312	2016-12-03 23:12:36.79651+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
2qh054odsilauq5c7xckdudjz96hvgey	NmRhMjBmN2U3Nzc5YWUwM2NkMzAyZGY5NGY4MzkzNTdjZTc5YmJiMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwMDJjN2Y1NTA3ZTY2MzQyYmU5NTdhZjNhMzhlZDNmNGJjYWU1YzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-12-17 23:04:27.276167+02
\.


--
-- Data for Name: main_city; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY main_city (id, title, city_true) FROM stdin;
1	Kiev	t
2	London	t
\.


--
-- Name: main_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('main_city_id_seq', 2, true);


--
-- Data for Name: main_currentweather; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY main_currentweather (id, delta, date, created, temperature, city_id) FROM stdin;
1		2016-12-03	2016-12-03 23:05:01.851732+02	-2	1
2		2016-12-03	2016-12-03 23:05:03.849268+02	4	2
3	1.0	2016-12-04	2016-12-04 08:00:00.240381+02	-5	1
4	-2.0	2016-12-04	2016-12-04 08:00:00.594325+02	6	2
\.


--
-- Name: main_currentweather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('main_currentweather_id_seq', 4, true);


--
-- Data for Name: main_weatherforecast; Type: TABLE DATA; Schema: public; Owner: competeraprog
--

COPY main_weatherforecast (id, date, created, temperature, city_id) FROM stdin;
1	2016-12-04	2016-12-03 23:05:01.880482+02	-4	1
2	2016-12-05	2016-12-03 23:05:01.888818+02	-7	1
3	2016-12-06	2016-12-03 23:05:01.899647+02	-1	1
4	2016-12-07	2016-12-03 23:05:01.910784+02	-6	1
5	2016-12-08	2016-12-03 23:05:01.921909+02	-4	1
6	2016-12-09	2016-12-03 23:05:01.933399+02	-2	1
7	2016-12-04	2016-12-03 23:05:03.9275+02	4	2
8	2016-12-05	2016-12-03 23:05:03.934737+02	4	2
9	2016-12-06	2016-12-03 23:05:03.945851+02	5	2
10	2016-12-07	2016-12-03 23:05:03.956734+02	6	2
11	2016-12-08	2016-12-03 23:05:03.968409+02	12	2
12	2016-12-09	2016-12-03 23:05:03.978996+02	12	2
13	2016-12-10	2016-12-04 08:00:00.286136+02	5	1
14	2016-12-10	2016-12-04 08:00:00.651726+02	10	2
\.


--
-- Name: main_weatherforecast_id_seq; Type: SEQUENCE SET; Schema: public; Owner: competeraprog
--

SELECT pg_catalog.setval('main_weatherforecast_id_seq', 14, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_city_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_city
    ADD CONSTRAINT main_city_pkey PRIMARY KEY (id);


--
-- Name: main_city_title_39df6451_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_city
    ADD CONSTRAINT main_city_title_39df6451_uniq UNIQUE (title);


--
-- Name: main_currentweather_city_id_74c3c0c7_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_currentweather
    ADD CONSTRAINT main_currentweather_city_id_74c3c0c7_uniq UNIQUE (city_id, date);


--
-- Name: main_currentweather_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_currentweather
    ADD CONSTRAINT main_currentweather_pkey PRIMARY KEY (id);


--
-- Name: main_weatherforecast_city_id_f367f3c5_uniq; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_weatherforecast
    ADD CONSTRAINT main_weatherforecast_city_id_f367f3c5_uniq UNIQUE (city_id, date);


--
-- Name: main_weatherforecast_pkey; Type: CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_weatherforecast
    ADD CONSTRAINT main_weatherforecast_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: main_city_title_39df6451_like; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX main_city_title_39df6451_like ON main_city USING btree (title varchar_pattern_ops);


--
-- Name: main_currentweather_c7141997; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX main_currentweather_c7141997 ON main_currentweather USING btree (city_id);


--
-- Name: main_weatherforecast_c7141997; Type: INDEX; Schema: public; Owner: competeraprog
--

CREATE INDEX main_weatherforecast_c7141997 ON main_weatherforecast USING btree (city_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_currentweather_city_id_b1abeb74_fk_main_city_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_currentweather
    ADD CONSTRAINT main_currentweather_city_id_b1abeb74_fk_main_city_id FOREIGN KEY (city_id) REFERENCES main_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_weatherforecast_city_id_162f13d7_fk_main_city_id; Type: FK CONSTRAINT; Schema: public; Owner: competeraprog
--

ALTER TABLE ONLY main_weatherforecast
    ADD CONSTRAINT main_weatherforecast_city_id_162f13d7_fk_main_city_id FOREIGN KEY (city_id) REFERENCES main_city(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

