--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "mikola-s";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "mikola-s";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "mikola-s";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "mikola-s";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "mikola-s";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "mikola-s";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "mikola-s";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "mikola-s";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO "mikola-s";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO "mikola-s";

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "mikola-s";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO "mikola-s";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO "mikola-s";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO "mikola-s";

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "mikola-s";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "mikola-s";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "mikola-s";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "mikola-s";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "mikola-s";

--
-- Name: zoo_agerange; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.zoo_agerange (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_from smallint NOT NULL,
    age_to smallint NOT NULL,
    CONSTRAINT zoo_agerange_age_from_check CHECK ((age_from >= 0)),
    CONSTRAINT zoo_agerange_age_to_check CHECK ((age_to >= 0))
);


ALTER TABLE public.zoo_agerange OWNER TO "mikola-s";

--
-- Name: zoo_agerange_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.zoo_agerange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zoo_agerange_id_seq OWNER TO "mikola-s";

--
-- Name: zoo_agerange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.zoo_agerange_id_seq OWNED BY public.zoo_agerange.id;


--
-- Name: zoo_animal; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.zoo_animal (
    id integer NOT NULL,
    age smallint,
    name character varying(256) NOT NULL,
    incoming_time timestamp with time zone,
    animal_type_id integer,
    gender_id integer,
    CONSTRAINT zoo_animal_age_check CHECK ((age >= 0))
);


ALTER TABLE public.zoo_animal OWNER TO "mikola-s";

--
-- Name: zoo_animal_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.zoo_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zoo_animal_id_seq OWNER TO "mikola-s";

--
-- Name: zoo_animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.zoo_animal_id_seq OWNED BY public.zoo_animal.id;


--
-- Name: zoo_gender; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.zoo_gender (
    id integer NOT NULL,
    gender character varying(20) NOT NULL
);


ALTER TABLE public.zoo_gender OWNER TO "mikola-s";

--
-- Name: zoo_animalgender_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.zoo_animalgender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zoo_animalgender_id_seq OWNER TO "mikola-s";

--
-- Name: zoo_animalgender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.zoo_animalgender_id_seq OWNED BY public.zoo_gender.id;


--
-- Name: zoo_animaltype; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.zoo_animaltype (
    id integer NOT NULL,
    animal_type character varying(50) NOT NULL
);


ALTER TABLE public.zoo_animaltype OWNER TO "mikola-s";

--
-- Name: zoo_animaltype_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.zoo_animaltype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zoo_animaltype_id_seq OWNER TO "mikola-s";

--
-- Name: zoo_animaltype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.zoo_animaltype_id_seq OWNED BY public.zoo_animaltype.id;


--
-- Name: zoo_ticket; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.zoo_ticket (
    id integer NOT NULL,
    valid_until timestamp with time zone NOT NULL,
    age_range_id integer NOT NULL,
    visitor_id integer NOT NULL
);


ALTER TABLE public.zoo_ticket OWNER TO "mikola-s";

--
-- Name: zoo_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.zoo_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zoo_ticket_id_seq OWNER TO "mikola-s";

--
-- Name: zoo_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.zoo_ticket_id_seq OWNED BY public.zoo_ticket.id;


--
-- Name: zoo_visitinganimals; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.zoo_visitinganimals (
    id integer NOT NULL,
    visit_time timestamp with time zone NOT NULL,
    animal_id integer NOT NULL,
    visitor_id integer NOT NULL
);


ALTER TABLE public.zoo_visitinganimals OWNER TO "mikola-s";

--
-- Name: zoo_visitinganimals_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.zoo_visitinganimals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zoo_visitinganimals_id_seq OWNER TO "mikola-s";

--
-- Name: zoo_visitinganimals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.zoo_visitinganimals_id_seq OWNED BY public.zoo_visitinganimals.id;


--
-- Name: zoo_visitor; Type: TABLE; Schema: public; Owner: mikola-s
--

CREATE TABLE public.zoo_visitor (
    id integer NOT NULL,
    age smallint,
    user_id integer NOT NULL,
    gender_id integer,
    CONSTRAINT zoo_visitor_age_check CHECK ((age >= 0))
);


ALTER TABLE public.zoo_visitor OWNER TO "mikola-s";

--
-- Name: zoo_visitor_id_seq; Type: SEQUENCE; Schema: public; Owner: mikola-s
--

CREATE SEQUENCE public.zoo_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zoo_visitor_id_seq OWNER TO "mikola-s";

--
-- Name: zoo_visitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikola-s
--

ALTER SEQUENCE public.zoo_visitor_id_seq OWNED BY public.zoo_visitor.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: zoo_agerange id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_agerange ALTER COLUMN id SET DEFAULT nextval('public.zoo_agerange_id_seq'::regclass);


--
-- Name: zoo_animal id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_animal ALTER COLUMN id SET DEFAULT nextval('public.zoo_animal_id_seq'::regclass);


--
-- Name: zoo_animaltype id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_animaltype ALTER COLUMN id SET DEFAULT nextval('public.zoo_animaltype_id_seq'::regclass);


--
-- Name: zoo_gender id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_gender ALTER COLUMN id SET DEFAULT nextval('public.zoo_animalgender_id_seq'::regclass);


--
-- Name: zoo_ticket id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_ticket ALTER COLUMN id SET DEFAULT nextval('public.zoo_ticket_id_seq'::regclass);


--
-- Name: zoo_visitinganimals id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitinganimals ALTER COLUMN id SET DEFAULT nextval('public.zoo_visitinganimals_id_seq'::regclass);


--
-- Name: zoo_visitor id; Type: DEFAULT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitor ALTER COLUMN id SET DEFAULT nextval('public.zoo_visitor_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add age range	7	add_agerange
26	Can change age range	7	change_agerange
27	Can delete age range	7	delete_agerange
28	Can view age range	7	view_agerange
29	Can add animal	8	add_animal
30	Can change animal	8	change_animal
31	Can delete animal	8	delete_animal
32	Can view animal	8	view_animal
33	Can add animal gender	9	add_animalgender
34	Can change animal gender	9	change_animalgender
35	Can delete animal gender	9	delete_animalgender
36	Can view animal gender	9	view_animalgender
37	Can add animal type	10	add_animaltype
38	Can change animal type	10	change_animaltype
39	Can delete animal type	10	delete_animaltype
40	Can view animal type	10	view_animaltype
41	Can add visitor	11	add_visitor
42	Can change visitor	11	change_visitor
43	Can delete visitor	11	delete_visitor
44	Can view visitor	11	view_visitor
45	Can add visiting animals	12	add_visitinganimals
46	Can change visiting animals	12	change_visitinganimals
47	Can delete visiting animals	12	delete_visitinganimals
48	Can view visiting animals	12	view_visitinganimals
49	Can add ticket	13	add_ticket
50	Can change ticket	13	change_ticket
51	Can delete ticket	13	delete_ticket
52	Can view ticket	13	view_ticket
53	Can add gender	9	add_gender
54	Can change gender	9	change_gender
55	Can delete gender	9	delete_gender
56	Can view gender	9	view_gender
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$udgEbheKQdIf$DHiaGzcnjC782Dip0fmst1I44dEkAJNsZ81lcgO5exo=	2020-01-11 09:21:35.092412+02	t	mikola-s			test@test.com	t	t	2020-01-10 16:15:10+02
2	pbkdf2_sha256$150000$6NAcvVLyH2Do$P/GqnQm6RGAeqAbZMckCQuFdF6PVj3as13zEufhxx+8=	\N	f	visitor1				f	t	2020-01-11 09:38:58+02
3	pbkdf2_sha256$150000$HBzSo9qL7d9w$APq7XnC2Wzp7WThVMJWbIkUgOQkxlpeZQ4uZJwemwq4=	\N	f	visitor2				f	t	2020-01-11 09:43:40.595866+02
4	pbkdf2_sha256$150000$8m2lRMtvTfgZ$XS/L85CUIxz0fXfmQeI+t8w8vJlzsMWSkPZjZ0yaKzw=	\N	f	visitor3				f	t	2020-01-11 09:43:53.852181+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-01-11 09:19:56.329643+02	1	mikola-s	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
2	2020-01-11 09:38:58.940583+02	2	user1	1	[{"added": {}}]	4	1
3	2020-01-11 09:43:14.324194+02	2	visitor1	2	[{"changed": {"fields": ["username"]}}]	4	1
4	2020-01-11 09:43:40.714912+02	3	visitor2	1	[{"added": {}}]	4	1
5	2020-01-11 09:43:53.966949+02	4	visitor3	1	[{"added": {}}]	4	1
6	2020-01-11 09:47:08.633247+02	1	male	1	[{"added": {}}]	9	1
7	2020-01-11 09:47:13.900359+02	2	female	1	[{"added": {}}]	9	1
8	2020-01-11 09:47:23.227881+02	3	other	1	[{"added": {}}]	9	1
9	2020-01-11 09:47:43.848595+02	1	monkey	1	[{"added": {}}]	10	1
10	2020-01-11 09:47:51.04943+02	2	bear	1	[{"added": {}}]	10	1
11	2020-01-11 09:48:27.708234+02	3	badger	1	[{"added": {}}]	10	1
12	2020-01-11 10:39:17.616433+02	4	visitor3	2	[{"changed": {"fields": ["age", "gender"]}}]	11	1
13	2020-01-11 10:39:29.52528+02	2	visitor1	2	[{"changed": {"fields": ["age", "gender"]}}]	11	1
14	2020-01-11 11:05:21.853333+02	1	baby (from 0 to 2)	1	[{"added": {}}]	7	1
15	2020-01-11 11:05:42.549245+02	2	children (from 3 to 16)	1	[{"added": {}}]	7	1
16	2020-01-11 11:07:13.495041+02	3	young (from 17 to 30)	1	[{"added": {}}]	7	1
17	2020-01-11 11:07:34.933255+02	4	middle (from 31 to 45)	1	[{"added": {}}]	7	1
18	2020-01-11 11:07:37.503364+02	4	middle (from 31 to 45)	2	[]	7	1
19	2020-01-11 11:08:02.696124+02	5	all_age (from 45 to 122)	1	[{"added": {}}]	7	1
20	2020-01-11 11:09:03.793839+02	1	Chip (monkey)	1	[{"added": {}}]	8	1
21	2020-01-11 11:10:08.512768+02	2	Dale (monkey)	1	[{"added": {}}]	8	1
22	2020-01-11 11:10:29.548787+02	3	White (bear)	1	[{"added": {}}]	8	1
23	2020-01-11 11:10:48.480768+02	4	Black (bear)	1	[{"added": {}}]	8	1
24	2020-01-11 11:11:24.402152+02	5	Snork (badger)	1	[{"added": {}}]	8	1
25	2020-01-11 11:11:46.186021+02	6	Snorkfam (badger)	1	[{"added": {}}]	8	1
26	2020-01-11 11:12:45.033104+02	1	Ticket 1 visitor1 2020-01-12 10:33:38+02:00	1	[{"added": {}}]	13	1
27	2020-01-11 11:12:49.260672+02	2	Ticket 2 visitor3 2020-01-12 10:33:38+02:00	1	[{"added": {}}]	13	1
28	2020-01-11 11:12:59.09527+02	3	Ticket 3 visitor3 2020-01-12 10:33:38+02:00	1	[{"added": {}}]	13	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	zoo	agerange
8	zoo	animal
10	zoo	animaltype
11	zoo	visitor
12	zoo	visitinganimals
13	zoo	ticket
9	zoo	gender
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-01-10 16:14:15.415862+02
2	auth	0001_initial	2020-01-10 16:14:15.657768+02
3	admin	0001_initial	2020-01-10 16:14:16.051378+02
4	admin	0002_logentry_remove_auto_add	2020-01-10 16:14:16.124041+02
5	admin	0003_logentry_add_action_flag_choices	2020-01-10 16:14:16.145602+02
6	contenttypes	0002_remove_content_type_name	2020-01-10 16:14:16.176377+02
7	auth	0002_alter_permission_name_max_length	2020-01-10 16:14:16.191985+02
8	auth	0003_alter_user_email_max_length	2020-01-10 16:14:16.212684+02
9	auth	0004_alter_user_username_opts	2020-01-10 16:14:16.233588+02
10	auth	0005_alter_user_last_login_null	2020-01-10 16:14:16.260427+02
11	auth	0006_require_contenttypes_0002	2020-01-10 16:14:16.274011+02
12	auth	0007_alter_validators_add_error_messages	2020-01-10 16:14:16.298429+02
13	auth	0008_alter_user_username_max_length	2020-01-10 16:14:16.344342+02
14	auth	0009_alter_user_last_name_max_length	2020-01-10 16:14:16.37115+02
15	auth	0010_alter_group_name_max_length	2020-01-10 16:14:16.39451+02
16	auth	0011_update_proxy_permissions	2020-01-10 16:14:16.414133+02
17	sessions	0001_initial	2020-01-10 16:14:16.472536+02
18	zoo	0001_initial	2020-01-10 16:14:16.802021+02
19	zoo	0002_auto_20200111_1009	2020-01-11 10:12:52.336778+02
20	zoo	0003_auto_20200111_1013	2020-01-11 10:13:49.863278+02
21	zoo	0003_auto_20200111_1036	2020-01-11 10:36:40.822099+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1p8rnwylzso1mr8us3prrryxggy3e8uy	Y2EyMjM1MmY4NDhkYmExNGY2NzM2NmMwNzI2OGJlNzUwZDM5ZjEwYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYThiMzljNjYwMDFhMWMyY2E5MWYxMDI1M2NjNDVjZDVjZDJhZjNhIn0=	2020-01-25 09:21:35.119541+02
\.


--
-- Data for Name: zoo_agerange; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.zoo_agerange (id, name, age_from, age_to) FROM stdin;
1	baby	0	2
2	children	3	16
3	young	17	30
4	middle	31	45
5	all_age	45	122
\.


--
-- Data for Name: zoo_animal; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.zoo_animal (id, age, name, incoming_time, animal_type_id, gender_id) FROM stdin;
1	5	Chip	2020-01-11 11:08:31+02	1	1
2	5	Dale	2020-01-11 11:09:04+02	1	2
3	5	White	2020-01-11 11:10:08+02	2	1
4	5	Black	2020-01-11 11:10:29+02	2	2
5	5	Snork	2020-01-11 11:10:48+02	3	1
6	5	Snorkfam	2020-01-11 11:11:24+02	3	2
\.


--
-- Data for Name: zoo_animaltype; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.zoo_animaltype (id, animal_type) FROM stdin;
1	monkey
2	bear
3	badger
\.


--
-- Data for Name: zoo_gender; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.zoo_gender (id, gender) FROM stdin;
1	male
2	female
3	other
\.


--
-- Data for Name: zoo_ticket; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.zoo_ticket (id, valid_until, age_range_id, visitor_id) FROM stdin;
1	2020-01-12 10:33:38+02	1	2
2	2020-01-12 10:33:38+02	1	4
3	2020-01-12 10:33:38+02	1	4
\.


--
-- Data for Name: zoo_visitinganimals; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.zoo_visitinganimals (id, visit_time, animal_id, visitor_id) FROM stdin;
\.


--
-- Data for Name: zoo_visitor; Type: TABLE DATA; Schema: public; Owner: mikola-s
--

COPY public.zoo_visitor (id, age, user_id, gender_id) FROM stdin;
1	\N	1	\N
3	\N	3	\N
4	12	4	1
2	15	2	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 52, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 28, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: zoo_agerange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.zoo_agerange_id_seq', 5, true);


--
-- Name: zoo_animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.zoo_animal_id_seq', 6, true);


--
-- Name: zoo_animalgender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.zoo_animalgender_id_seq', 3, true);


--
-- Name: zoo_animaltype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.zoo_animaltype_id_seq', 3, true);


--
-- Name: zoo_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.zoo_ticket_id_seq', 3, true);


--
-- Name: zoo_visitinganimals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.zoo_visitinganimals_id_seq', 1, false);


--
-- Name: zoo_visitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikola-s
--

SELECT pg_catalog.setval('public.zoo_visitor_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: zoo_agerange zoo_agerange_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_agerange
    ADD CONSTRAINT zoo_agerange_pkey PRIMARY KEY (id);


--
-- Name: zoo_animal zoo_animal_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_animal
    ADD CONSTRAINT zoo_animal_pkey PRIMARY KEY (id);


--
-- Name: zoo_gender zoo_animalgender_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_gender
    ADD CONSTRAINT zoo_animalgender_pkey PRIMARY KEY (id);


--
-- Name: zoo_animaltype zoo_animaltype_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_animaltype
    ADD CONSTRAINT zoo_animaltype_pkey PRIMARY KEY (id);


--
-- Name: zoo_ticket zoo_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_ticket
    ADD CONSTRAINT zoo_ticket_pkey PRIMARY KEY (id);


--
-- Name: zoo_visitinganimals zoo_visitinganimals_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitinganimals
    ADD CONSTRAINT zoo_visitinganimals_pkey PRIMARY KEY (id);


--
-- Name: zoo_visitor zoo_visitor_pkey; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitor
    ADD CONSTRAINT zoo_visitor_pkey PRIMARY KEY (id);


--
-- Name: zoo_visitor zoo_visitor_user_id_key; Type: CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitor
    ADD CONSTRAINT zoo_visitor_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: zoo_animal_animal_type_id_49229b26; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX zoo_animal_animal_type_id_49229b26 ON public.zoo_animal USING btree (animal_type_id);


--
-- Name: zoo_animal_gender_id_87f8f861; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX zoo_animal_gender_id_87f8f861 ON public.zoo_animal USING btree (gender_id);


--
-- Name: zoo_ticket_age_range_id_6bf10647; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX zoo_ticket_age_range_id_6bf10647 ON public.zoo_ticket USING btree (age_range_id);


--
-- Name: zoo_ticket_visitor_id_b2b8e840; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX zoo_ticket_visitor_id_b2b8e840 ON public.zoo_ticket USING btree (visitor_id);


--
-- Name: zoo_visitinganimals_animal_id_20d26016; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX zoo_visitinganimals_animal_id_20d26016 ON public.zoo_visitinganimals USING btree (animal_id);


--
-- Name: zoo_visitinganimals_visitor_id_65d5c113; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX zoo_visitinganimals_visitor_id_65d5c113 ON public.zoo_visitinganimals USING btree (visitor_id);


--
-- Name: zoo_visitor_gender_id_808127e5; Type: INDEX; Schema: public; Owner: mikola-s
--

CREATE INDEX zoo_visitor_gender_id_808127e5 ON public.zoo_visitor USING btree (gender_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_animal zoo_animal_animal_type_id_49229b26_fk_zoo_animaltype_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_animal
    ADD CONSTRAINT zoo_animal_animal_type_id_49229b26_fk_zoo_animaltype_id FOREIGN KEY (animal_type_id) REFERENCES public.zoo_animaltype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_animal zoo_animal_gender_id_87f8f861_fk_zoo_gender_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_animal
    ADD CONSTRAINT zoo_animal_gender_id_87f8f861_fk_zoo_gender_id FOREIGN KEY (gender_id) REFERENCES public.zoo_gender(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_ticket zoo_ticket_age_range_id_6bf10647_fk_zoo_agerange_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_ticket
    ADD CONSTRAINT zoo_ticket_age_range_id_6bf10647_fk_zoo_agerange_id FOREIGN KEY (age_range_id) REFERENCES public.zoo_agerange(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_ticket zoo_ticket_visitor_id_b2b8e840_fk_zoo_visitor_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_ticket
    ADD CONSTRAINT zoo_ticket_visitor_id_b2b8e840_fk_zoo_visitor_id FOREIGN KEY (visitor_id) REFERENCES public.zoo_visitor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_visitinganimals zoo_visitinganimals_animal_id_20d26016_fk_zoo_animal_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitinganimals
    ADD CONSTRAINT zoo_visitinganimals_animal_id_20d26016_fk_zoo_animal_id FOREIGN KEY (animal_id) REFERENCES public.zoo_animal(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_visitinganimals zoo_visitinganimals_visitor_id_65d5c113_fk_zoo_visitor_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitinganimals
    ADD CONSTRAINT zoo_visitinganimals_visitor_id_65d5c113_fk_zoo_visitor_id FOREIGN KEY (visitor_id) REFERENCES public.zoo_visitor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_visitor zoo_visitor_gender_id_808127e5_fk_zoo_gender_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitor
    ADD CONSTRAINT zoo_visitor_gender_id_808127e5_fk_zoo_gender_id FOREIGN KEY (gender_id) REFERENCES public.zoo_gender(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zoo_visitor zoo_visitor_user_id_6a28c855_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: mikola-s
--

ALTER TABLE ONLY public.zoo_visitor
    ADD CONSTRAINT zoo_visitor_user_id_6a28c855_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

