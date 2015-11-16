--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO "LearnIT";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO "LearnIT";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO "LearnIT";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO "LearnIT";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO "LearnIT";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO "LearnIT";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO "LearnIT";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO "LearnIT";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO "LearnIT";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO "LearnIT";

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO "LearnIT";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO "LearnIT";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
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


ALTER TABLE django_admin_log OWNER TO "LearnIT";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO "LearnIT";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO "LearnIT";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO "LearnIT";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO "LearnIT";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO "LearnIT";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO "LearnIT";

--
-- Name: principal_carrera; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_carrera (
    id integer NOT NULL,
    carrera character varying(60) NOT NULL
);


ALTER TABLE principal_carrera OWNER TO "LearnIT";

--
-- Name: principal_carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_carrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_carrera_id_seq OWNER TO "LearnIT";

--
-- Name: principal_carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_carrera_id_seq OWNED BY principal_carrera.id;


--
-- Name: principal_ejercicio; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_ejercicio (
    id integer NOT NULL,
    problema text NOT NULL,
    solucion text NOT NULL
);


ALTER TABLE principal_ejercicio OWNER TO "LearnIT";

--
-- Name: principal_ejercicio_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_ejercicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_ejercicio_id_seq OWNER TO "LearnIT";

--
-- Name: principal_ejercicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_ejercicio_id_seq OWNED BY principal_ejercicio.id;


--
-- Name: principal_ejercicios_tema; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_ejercicios_tema (
    id integer NOT NULL,
    ejercicio_id integer NOT NULL,
    tema_id integer NOT NULL
);


ALTER TABLE principal_ejercicios_tema OWNER TO "LearnIT";

--
-- Name: principal_ejercicios_tema_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_ejercicios_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_ejercicios_tema_id_seq OWNER TO "LearnIT";

--
-- Name: principal_ejercicios_tema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_ejercicios_tema_id_seq OWNED BY principal_ejercicios_tema.id;


--
-- Name: principal_formula; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_formula (
    id integer NOT NULL,
    formula text NOT NULL
);


ALTER TABLE principal_formula OWNER TO "LearnIT";

--
-- Name: principal_formula_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_formula_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_formula_id_seq OWNER TO "LearnIT";

--
-- Name: principal_formula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_formula_id_seq OWNED BY principal_formula.id;


--
-- Name: principal_formulas_tema; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_formulas_tema (
    id integer NOT NULL,
    formula_id integer NOT NULL,
    tema_id integer NOT NULL
);


ALTER TABLE principal_formulas_tema OWNER TO "LearnIT";

--
-- Name: principal_formulas_temaa_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_formulas_temaa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_formulas_temaa_id_seq OWNER TO "LearnIT";

--
-- Name: principal_formulas_temaa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_formulas_temaa_id_seq OWNED BY principal_formulas_tema.id;


--
-- Name: principal_materia; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_materia (
    id integer NOT NULL,
    materia character varying(60) NOT NULL
);


ALTER TABLE principal_materia OWNER TO "LearnIT";

--
-- Name: principal_materia_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_materia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_materia_id_seq OWNER TO "LearnIT";

--
-- Name: principal_materia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_materia_id_seq OWNED BY principal_materia.id;


--
-- Name: principal_materias_carrera; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_materias_carrera (
    id integer NOT NULL,
    carrera_id integer NOT NULL,
    materia_id integer NOT NULL
);


ALTER TABLE principal_materias_carrera OWNER TO "LearnIT";

--
-- Name: principal_materias_carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_materias_carrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_materias_carrera_id_seq OWNER TO "LearnIT";

--
-- Name: principal_materias_carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_materias_carrera_id_seq OWNED BY principal_materias_carrera.id;


--
-- Name: principal_tema; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_tema (
    id integer NOT NULL,
    tema character varying(50) NOT NULL,
    "resumenTeorico" text NOT NULL,
    referencias text NOT NULL
);


ALTER TABLE principal_tema OWNER TO "LearnIT";

--
-- Name: principal_tema_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_tema_id_seq OWNER TO "LearnIT";

--
-- Name: principal_tema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_tema_id_seq OWNED BY principal_tema.id;


--
-- Name: principal_temas_materia; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_temas_materia (
    id integer NOT NULL,
    materia_id integer NOT NULL,
    tema_id integer NOT NULL
);


ALTER TABLE principal_temas_materia OWNER TO "LearnIT";

--
-- Name: principal_temas_materia_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_temas_materia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_temas_materia_id_seq OWNER TO "LearnIT";

--
-- Name: principal_temas_materia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_temas_materia_id_seq OWNED BY principal_temas_materia.id;


--
-- Name: principal_usuario; Type: TABLE; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE TABLE principal_usuario (
    id integer NOT NULL,
    carrera_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE principal_usuario OWNER TO "LearnIT";

--
-- Name: principal_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: LearnIT
--

CREATE SEQUENCE principal_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE principal_usuario_id_seq OWNER TO "LearnIT";

--
-- Name: principal_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LearnIT
--

ALTER SEQUENCE principal_usuario_id_seq OWNED BY principal_usuario.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_carrera ALTER COLUMN id SET DEFAULT nextval('principal_carrera_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_ejercicio ALTER COLUMN id SET DEFAULT nextval('principal_ejercicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_ejercicios_tema ALTER COLUMN id SET DEFAULT nextval('principal_ejercicios_tema_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_formula ALTER COLUMN id SET DEFAULT nextval('principal_formula_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_formulas_tema ALTER COLUMN id SET DEFAULT nextval('principal_formulas_temaa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_materia ALTER COLUMN id SET DEFAULT nextval('principal_materia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_materias_carrera ALTER COLUMN id SET DEFAULT nextval('principal_materias_carrera_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_tema ALTER COLUMN id SET DEFAULT nextval('principal_tema_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_temas_materia ALTER COLUMN id SET DEFAULT nextval('principal_temas_materia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_usuario ALTER COLUMN id SET DEFAULT nextval('principal_usuario_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add carrera	7	add_carrera
20	Can change carrera	7	change_carrera
21	Can delete carrera	7	delete_carrera
22	Can add usuario	8	add_usuario
23	Can change usuario	8	change_usuario
24	Can delete usuario	8	delete_usuario
25	Can add materia	9	add_materia
26	Can change materia	9	change_materia
27	Can delete materia	9	delete_materia
28	Can add materias_ carrera	10	add_materias_carrera
29	Can change materias_ carrera	10	change_materias_carrera
30	Can delete materias_ carrera	10	delete_materias_carrera
31	Can add tema	11	add_tema
32	Can change tema	11	change_tema
33	Can delete tema	11	delete_tema
34	Can add temas_ materia	12	add_temas_materia
35	Can change temas_ materia	12	change_temas_materia
36	Can delete temas_ materia	12	delete_temas_materia
37	Can add ejercicio	13	add_ejercicio
38	Can change ejercicio	13	change_ejercicio
39	Can delete ejercicio	13	delete_ejercicio
40	Can add ejercicios_ tema	14	add_ejercicios_tema
41	Can change ejercicios_ tema	14	change_ejercicios_tema
42	Can delete ejercicios_ tema	14	delete_ejercicios_tema
43	Can add formula	15	add_formula
44	Can change formula	15	change_formula
45	Can delete formula	15	delete_formula
49	Can add formulas_ tema	17	add_formulas_tema
50	Can change formulas_ tema	17	change_formulas_tema
51	Can delete formulas_ tema	17	delete_formulas_tema
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('auth_permission_id_seq', 51, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$gAaaZuLd8G43$cnlyNfYz/17c+j3etNbUJ+iuFnWMrstS5AG0m1BLqaU=	2015-11-13 15:21:37.570082+00	t	ali	Ali	Ghahraei	aligf94@gmail.com	t	t	2015-10-18 02:21:07+00
2	pbkdf2_sha256$20000$2s9cuowCGua9$zqLCEIBdKErjJb73dTWDvSnStd4T1wxVDK/nuS7xQ0I=	2015-10-18 16:13:22.114431+00	f	Prueba	Prueba	Prueba	falso@falso.com	f	t	2015-10-18 02:24:06+00
3	pbkdf2_sha256$20000$WEtfdANDN6pw$ZXZC8izqbJNy/nyIso9oQMlxFN8fNqtwNhyD3uRmOeQ=	2015-11-06 03:33:17.755082+00	f	juanito			juan@ejemplo.com	f	t	2015-11-05 22:05:16.864198+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-10-18 02:24:06.293621+00	2	Prueba	1		4	1
2	2015-10-18 02:24:56.802382+00	2	Prueba	2	Changed first_name, last_name and email.	4	1
3	2015-10-18 02:25:26.386114+00	2	Prueba	2	Changed first_name, last_name and email.	4	1
4	2015-10-18 02:25:44.189466+00	1	ali	2	Changed first_name and last_name.	4	1
5	2015-11-05 22:04:23.334353+00	1	Ingeniería en Sistemas	1		7	1
6	2015-11-06 04:55:52.77406+00	1	Computer Science	2	Changed carrera.	7	1
7	2015-11-10 08:19:45.197578+00	4	nada	3		4	1
8	2015-11-13 13:47:58.340448+00	1	Análisis y Modelación de Sistemas de Software	1		9	1
9	2015-11-13 13:48:27.418593+00	1	Materias_Carrera object	1		10	1
10	2015-11-13 14:02:26.305592+00	1	Strategy Pattern	1		11	1
11	2015-11-13 14:02:57.520141+00	1	Strategy Pattern-Análisis y Modelación de Sistemas de Software	1		12	1
12	2015-11-13 14:05:32.982376+00	1	Programe un Mallard Duck	1		13	1
13	2015-11-13 14:06:05.025131+00	1	Code a mallard duck class	2	Changed problema.	13	1
14	2015-11-13 14:06:23.137372+00	1	Code a mallard duck class-Strategy Pattern	1		14	1
15	2015-11-13 14:11:53.276985+00	2	(b*h/2) + design patterns = FlyBehavior	1		15	1
16	2015-11-13 14:12:09.601877+00	1	(b*h/2) + design patterns = FlyBehavior-Strategy Pattern	1		17	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 16, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	principal	carrera
8	principal	usuario
9	principal	materia
10	principal	materias_carrera
11	principal	tema
12	principal	temas_materia
13	principal	ejercicio
14	principal	ejercicios_tema
15	principal	formula
17	principal	formulas_tema
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-10-18 02:10:31.842773+00
2	auth	0001_initial	2015-10-18 02:10:32.905203+00
3	admin	0001_initial	2015-10-18 02:10:33.159351+00
4	contenttypes	0002_remove_content_type_name	2015-10-18 02:10:33.268671+00
5	auth	0002_alter_permission_name_max_length	2015-10-18 02:10:33.312997+00
6	auth	0003_alter_user_email_max_length	2015-10-18 02:10:33.369514+00
7	auth	0004_alter_user_username_opts	2015-10-18 02:10:33.41009+00
8	auth	0005_alter_user_last_login_null	2015-10-18 02:10:33.458055+00
9	auth	0006_require_contenttypes_0002	2015-10-18 02:10:33.469468+00
10	sessions	0001_initial	2015-10-18 02:10:33.669807+00
11	principal	0001_initial	2015-11-04 19:35:04.646222+00
12	principal	0002_auto_20151105_1558	2015-11-05 21:58:41.343983+00
13	principal	0003_auto_20151105_2259	2015-11-06 04:59:30.531713+00
14	principal	0004_auto_20151113_0740	2015-11-13 13:40:34.727107+00
15	principal	0005_auto_20151113_0746	2015-11-13 13:46:32.689373+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
88ovy7v7hmqm5jx8iwa4lime86z55x1q	YTIwNjU3ZTQzYWI3YWYzY2EwZTE2YTkzOGVlNjkyYWE4NWI1YWUzMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgwMjZmYmY5NGY1MjJkYWRlNWFkN2RlODllYmE0N2FmOGExZWFlMCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-11-01 09:28:45.065458+00
xebtzuao8su6zcd6bs2s9oukb57ffx8n	ZTM4N2Y2Yjc5MDZlYWM3MjIzNmJhNzdiYmMyMWU1Mzc2NzIwNWVhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODAyNmZiZjk0ZjUyMmRhZGU1YWQ3ZGU4OWViYTQ3YWY4YTFlYWUwIn0=	2015-11-01 12:09:56.236974+00
ayvsjyecmwfsjfn85ftyva3a6z7dk4w0	NGYzNDk1ZTExZmVjOWEzODMyNGFlNzg5NzMwNzk0ODcwNGRiMzJhMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZmMzVjYzVjMjRhNzBlNTU5ZDUxZDM5ODY0MGQzMjU2MDk2ZTgwNjUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2015-11-01 13:02:11.244775+00
lhfnpg8y4mm4w6gqa61xjrubeihgat4n	OTg1ODI1MGM2MmI0MmJmMmNiYTE1MmIzM2FiMTBjMzE1NTQwMDA3Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2hhc2giOiI2ZjM1Y2M1YzI0YTcwZTU1OWQ1MWQzOTg2NDBkMzI1NjA5NmU4MDY1In0=	2015-11-01 13:40:51.390345+00
y3xcqn4eurdet7lkajil3nrlz1rponpi	ZTM4N2Y2Yjc5MDZlYWM3MjIzNmJhNzdiYmMyMWU1Mzc2NzIwNWVhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODAyNmZiZjk0ZjUyMmRhZGU1YWQ3ZGU4OWViYTQ3YWY4YTFlYWUwIn0=	2015-11-27 15:21:37.581637+00
\.


--
-- Data for Name: principal_carrera; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_carrera (id, carrera) FROM stdin;
1	Computer Science
\.


--
-- Name: principal_carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_carrera_id_seq', 1, true);


--
-- Data for Name: principal_ejercicio; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_ejercicio (id, problema, solucion) FROM stdin;
1	Code a mallard duck class	class MallardDuck extends Duck{\r\ndisplay(){\r\n//looks like a mallard\r\n}\r\n}
\.


--
-- Name: principal_ejercicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_ejercicio_id_seq', 1, true);


--
-- Data for Name: principal_ejercicios_tema; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_ejercicios_tema (id, ejercicio_id, tema_id) FROM stdin;
1	1	1
\.


--
-- Name: principal_ejercicios_tema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_ejercicios_tema_id_seq', 1, true);


--
-- Data for Name: principal_formula; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_formula (id, formula) FROM stdin;
2	(b*h/2) + design patterns = FlyBehavior
\.


--
-- Name: principal_formula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_formula_id_seq', 2, true);


--
-- Data for Name: principal_formulas_tema; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_formulas_tema (id, formula_id, tema_id) FROM stdin;
1	2	1
\.


--
-- Name: principal_formulas_temaa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_formulas_temaa_id_seq', 1, true);


--
-- Data for Name: principal_materia; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_materia (id, materia) FROM stdin;
1	Análisis y Modelación de Sistemas de Software
\.


--
-- Name: principal_materia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_materia_id_seq', 1, true);


--
-- Data for Name: principal_materias_carrera; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_materias_carrera (id, carrera_id, materia_id) FROM stdin;
1	1	1
\.


--
-- Name: principal_materias_carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_materias_carrera_id_seq', 1, true);


--
-- Data for Name: principal_tema; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_tema (id, tema, "resumenTeorico", referencias) FROM stdin;
1	Strategy Pattern	This design pattern allows us to take our algorithms out of our classes. It is useful when we change the behavior of an object a lot.	http://www.headfirstlabs.com/books/hfdp/
\.


--
-- Name: principal_tema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_tema_id_seq', 1, true);


--
-- Data for Name: principal_temas_materia; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_temas_materia (id, materia_id, tema_id) FROM stdin;
1	1	1
\.


--
-- Name: principal_temas_materia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_temas_materia_id_seq', 1, true);


--
-- Data for Name: principal_usuario; Type: TABLE DATA; Schema: public; Owner: LearnIT
--

COPY principal_usuario (id, carrera_id, user_id) FROM stdin;
1	1	3
\.


--
-- Name: principal_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: LearnIT
--

SELECT pg_catalog.setval('principal_usuario_id_seq', 2, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_7312b568b3e565d1_uniq; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_7312b568b3e565d1_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: principal_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_carrera
    ADD CONSTRAINT principal_carrera_pkey PRIMARY KEY (id);


--
-- Name: principal_ejercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_ejercicio
    ADD CONSTRAINT principal_ejercicio_pkey PRIMARY KEY (id);


--
-- Name: principal_ejercicios_tema_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_ejercicios_tema
    ADD CONSTRAINT principal_ejercicios_tema_pkey PRIMARY KEY (id);


--
-- Name: principal_formula_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_formula
    ADD CONSTRAINT principal_formula_pkey PRIMARY KEY (id);


--
-- Name: principal_formulas_temaa_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_formulas_tema
    ADD CONSTRAINT principal_formulas_temaa_pkey PRIMARY KEY (id);


--
-- Name: principal_materia_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_materia
    ADD CONSTRAINT principal_materia_pkey PRIMARY KEY (id);


--
-- Name: principal_materias_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_materias_carrera
    ADD CONSTRAINT principal_materias_carrera_pkey PRIMARY KEY (id);


--
-- Name: principal_tema_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_tema
    ADD CONSTRAINT principal_tema_pkey PRIMARY KEY (id);


--
-- Name: principal_temas_materia_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_temas_materia
    ADD CONSTRAINT principal_temas_materia_pkey PRIMARY KEY (id);


--
-- Name: principal_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_usuario
    ADD CONSTRAINT principal_usuario_pkey PRIMARY KEY (id);


--
-- Name: principal_usuario_user_id_key; Type: CONSTRAINT; Schema: public; Owner: LearnIT; Tablespace: 
--

ALTER TABLE ONLY principal_usuario
    ADD CONSTRAINT principal_usuario_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_30d02c15577753ee_like; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_group_name_30d02c15577753ee_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_5f16d2aa7b672b64_like; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX auth_user_username_5f16d2aa7b672b64_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_2e5ab7efc1be117b_like; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX django_session_session_key_2e5ab7efc1be117b_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: principal_ejercicios_tema_c80e9cdc; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_ejercicios_tema_c80e9cdc ON principal_ejercicios_tema USING btree (tema_id);


--
-- Name: principal_ejercicios_tema_e32343c4; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_ejercicios_tema_e32343c4 ON principal_ejercicios_tema USING btree (ejercicio_id);


--
-- Name: principal_formulas_temaa_31082a44; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_formulas_temaa_31082a44 ON principal_formulas_tema USING btree (formula_id);


--
-- Name: principal_formulas_temaa_c80e9cdc; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_formulas_temaa_c80e9cdc ON principal_formulas_tema USING btree (tema_id);


--
-- Name: principal_materias_carrera_15b82638; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_materias_carrera_15b82638 ON principal_materias_carrera USING btree (carrera_id);


--
-- Name: principal_materias_carrera_d918f6e2; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_materias_carrera_d918f6e2 ON principal_materias_carrera USING btree (materia_id);


--
-- Name: principal_temas_materia_c80e9cdc; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_temas_materia_c80e9cdc ON principal_temas_materia USING btree (tema_id);


--
-- Name: principal_temas_materia_d918f6e2; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_temas_materia_d918f6e2 ON principal_temas_materia USING btree (materia_id);


--
-- Name: principal_usuario_15b82638; Type: INDEX; Schema: public; Owner: LearnIT; Tablespace: 
--

CREATE INDEX principal_usuario_15b82638 ON principal_usuario USING btree (carrera_id);


--
-- Name: auth_content_type_id_619d5cf017a2bc53_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_619d5cf017a2bc53_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_7b47e22499794e1a_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_7b47e22499794e1a_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_2a51733a9edf15a5_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_2a51733a9edf15a5_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_669b40eece8e24af_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_669b40eece8e24af_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_1dc29d6585fb6525_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_1dc29d6585fb6525_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6b91a3fcc3d85d71_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6b91a3fcc3d85d71_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_2a21fe71799be046_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_2a21fe71799be046_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_68bff27920af6be1_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_68bff27920af6be1_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_3b7b9c5672bc29fe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_3b7b9c5672bc29fe_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: princip_ejercicio_id_27ede64b34535af8_fk_principal_ejercicio_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_ejercicios_tema
    ADD CONSTRAINT princip_ejercicio_id_27ede64b34535af8_fk_principal_ejercicio_id FOREIGN KEY (ejercicio_id) REFERENCES principal_ejercicio(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_ejercic_tema_id_32cb0c81d4f25015_fk_principal_tema_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_ejercicios_tema
    ADD CONSTRAINT principal_ejercic_tema_id_32cb0c81d4f25015_fk_principal_tema_id FOREIGN KEY (tema_id) REFERENCES principal_tema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_f_formula_id_65b97a3287d6adc6_fk_principal_formula_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_formulas_tema
    ADD CONSTRAINT principal_f_formula_id_65b97a3287d6adc6_fk_principal_formula_id FOREIGN KEY (formula_id) REFERENCES principal_formula(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_formulas_tema_id_52f77eb61adfd17_fk_principal_tema_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_formulas_tema
    ADD CONSTRAINT principal_formulas_tema_id_52f77eb61adfd17_fk_principal_tema_id FOREIGN KEY (tema_id) REFERENCES principal_tema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_m_carrera_id_67a6044e482a1181_fk_principal_carrera_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_materias_carrera
    ADD CONSTRAINT principal_m_carrera_id_67a6044e482a1181_fk_principal_carrera_id FOREIGN KEY (carrera_id) REFERENCES principal_carrera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_m_materia_id_6c0709b09070cbcf_fk_principal_materia_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_materias_carrera
    ADD CONSTRAINT principal_m_materia_id_6c0709b09070cbcf_fk_principal_materia_id FOREIGN KEY (materia_id) REFERENCES principal_materia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_t_materia_id_7f5b011b39afbf67_fk_principal_materia_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_temas_materia
    ADD CONSTRAINT principal_t_materia_id_7f5b011b39afbf67_fk_principal_materia_id FOREIGN KEY (materia_id) REFERENCES principal_materia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_temas_ma_tema_id_986aed72ba4e810_fk_principal_tema_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_temas_materia
    ADD CONSTRAINT principal_temas_ma_tema_id_986aed72ba4e810_fk_principal_tema_id FOREIGN KEY (tema_id) REFERENCES principal_tema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_u_carrera_id_106e4505e706b0f9_fk_principal_carrera_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_usuario
    ADD CONSTRAINT principal_u_carrera_id_106e4505e706b0f9_fk_principal_carrera_id FOREIGN KEY (carrera_id) REFERENCES principal_carrera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: principal_usuario_user_id_8d73bf92aba30e5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: LearnIT
--

ALTER TABLE ONLY principal_usuario
    ADD CONSTRAINT principal_usuario_user_id_8d73bf92aba30e5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

