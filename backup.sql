--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: generate_custom_id(text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_custom_id(sequence_name text, prefix text, zero_padding integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN prefix || lpad(nextval(sequence_name)::text, zero_padding, '0');
END;
$$;


ALTER FUNCTION public.generate_custom_id(sequence_name text, prefix text, zero_padding integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    id integer NOT NULL,
    nom character varying(500),
    description character varying(500),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- Name: categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorie_id_seq OWNER TO postgres;

--
-- Name: categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorie_id_seq OWNED BY public.categorie.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: etat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etat (
    id integer NOT NULL,
    nom character varying(500),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.etat OWNER TO postgres;

--
-- Name: etat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etat_id_seq OWNER TO postgres;

--
-- Name: etat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etat_id_seq OWNED BY public.etat.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: historique_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historique_action (
    id integer NOT NULL,
    ticket character varying(20),
    date_ajout timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.historique_action OWNER TO postgres;

--
-- Name: historique_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historique_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historique_action_id_seq OWNER TO postgres;

--
-- Name: historique_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historique_action_id_seq OWNED BY public.historique_action.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: note_technicien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note_technicien (
    id integer NOT NULL,
    ticket character varying(20),
    note integer,
    date_notation timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.note_technicien OWNER TO postgres;

--
-- Name: note_technicien_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.note_technicien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.note_technicien_id_seq OWNER TO postgres;

--
-- Name: note_technicien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.note_technicien_id_seq OWNED BY public.note_technicien.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: poste; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poste (
    id integer NOT NULL,
    nom character varying(500),
    description character varying(500),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.poste OWNER TO postgres;

--
-- Name: poste_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poste_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.poste_id_seq OWNER TO postgres;

--
-- Name: poste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poste_id_seq OWNED BY public.poste.id;


--
-- Name: priorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.priorite (
    id integer NOT NULL,
    nom character varying(500),
    description character varying(500),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.priorite OWNER TO postgres;

--
-- Name: priorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.priorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.priorite_id_seq OWNER TO postgres;

--
-- Name: priorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.priorite_id_seq OWNED BY public.priorite.id;


--
-- Name: rapport_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rapport_ticket (
    id integer NOT NULL,
    ticket character varying(20),
    rapport character varying(1500),
    date_rapport timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rapport_ticket OWNER TO postgres;

--
-- Name: rapport_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rapport_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rapport_ticket_id_seq OWNER TO postgres;

--
-- Name: rapport_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rapport_ticket_id_seq OWNED BY public.rapport_ticket.id;


--
-- Name: reouverture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reouverture (
    id integer NOT NULL,
    ticket character varying(20),
    raison character varying(1500),
    date_reouverture timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.reouverture OWNER TO postgres;

--
-- Name: reouverture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reouverture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reouverture_id_seq OWNER TO postgres;

--
-- Name: reouverture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reouverture_id_seq OWNED BY public.reouverture.id;


--
-- Name: seq_ticket_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_ticket_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_ticket_id OWNER TO postgres;

--
-- Name: seq_utilisateur_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_utilisateur_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_utilisateur_id OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    id character varying(20) NOT NULL,
    titre character varying(500),
    description character varying(1500),
    etat integer,
    date_creation timestamp without time zone,
    date_deadline timestamp without time zone,
    date_debut_activite timestamp without time zone,
    date_resolution timestamp without time zone,
    categorie integer,
    priorite integer,
    utilisateur character varying(20),
    technicien character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id character varying(20) NOT NULL,
    nom character varying(500),
    email character varying(50),
    mot_de_passe character varying(100),
    role integer,
    date_creation timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- Name: ticket_details; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ticket_details AS
 SELECT ticket.id,
    ticket.titre,
    ticket.description,
    etat.nom AS etat,
    ticket.date_creation,
    ticket.date_deadline,
    ticket.date_debut_activite,
    ticket.date_resolution,
    categorie.nom AS categorie,
    priorite.nom AS priorite,
    utilisateur.nom AS utilisateur,
    poste.nom AS poste,
    utilisateur.id AS id_utilisateur,
    utilisateur1.nom AS technicien,
    utilisateur1.id AS id_technicien
   FROM ((((((public.ticket
     LEFT JOIN public.categorie ON ((ticket.categorie = categorie.id)))
     LEFT JOIN public.etat ON ((ticket.etat = etat.id)))
     LEFT JOIN public.priorite ON ((ticket.priorite = priorite.id)))
     LEFT JOIN public.utilisateur ON (((ticket.utilisateur)::text = (utilisateur.id)::text)))
     LEFT JOIN public.poste ON ((utilisateur.role = poste.id)))
     LEFT JOIN public.utilisateur utilisateur1 ON (((ticket.technicien)::text = (utilisateur1.id)::text)));


ALTER VIEW public.ticket_details OWNER TO postgres;

--
-- Name: ticket_rapport_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ticket_rapport_view AS
 SELECT t.id AS ticket_id,
    t.titre AS ticket_titre,
    t.categorie AS ticket_categorie,
    t.description AS ticket_description,
    t.priorite AS ticket_priorite,
    t.date_deadline AS ticket_deadline,
    t.date_resolution AS ticket_date_resolution,
    u.id AS utilisateur_id,
    u.nom AS utilisateur_nom,
    u.role AS utilisateur_poste,
    tec.id AS technicien_id,
    tec.nom AS technicien_nom,
    tec.role AS technicien_poste,
    rt.id AS rapport_id,
    rt.rapport AS rapport_texte,
    rt.date_rapport AS rapport_date,
    rt.created_at AS rapport_created_at,
    rt.updated_at AS rapport_updated_at
   FROM (((public.ticket t
     LEFT JOIN public.utilisateur u ON (((t.id)::text = (u.id)::text)))
     LEFT JOIN public.utilisateur tec ON (((t.id)::text = (tec.id)::text)))
     LEFT JOIN public.rapport_ticket rt ON (((t.id)::text = (rt.ticket)::text)));


ALTER VIEW public.ticket_rapport_view OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categorie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id SET DEFAULT nextval('public.categorie_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: etat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etat ALTER COLUMN id SET DEFAULT nextval('public.etat_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: historique_action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historique_action ALTER COLUMN id SET DEFAULT nextval('public.historique_action_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: note_technicien id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note_technicien ALTER COLUMN id SET DEFAULT nextval('public.note_technicien_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: poste id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poste ALTER COLUMN id SET DEFAULT nextval('public.poste_id_seq'::regclass);


--
-- Name: priorite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorite ALTER COLUMN id SET DEFAULT nextval('public.priorite_id_seq'::regclass);


--
-- Name: rapport_ticket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rapport_ticket ALTER COLUMN id SET DEFAULT nextval('public.rapport_ticket_id_seq'::regclass);


--
-- Name: reouverture id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reouverture ALTER COLUMN id SET DEFAULT nextval('public.reouverture_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (id, nom, description, created_at, updated_at) FROM stdin;
1	Maintenance	Gestion de la maintenance et prise en mains des matériaux.	2024-11-26 12:52:02	2024-11-26 12:57:36
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: etat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etat (id, nom, created_at, updated_at) FROM stdin;
1	En cours	\N	\N
2	Ouvert	\N	\N
3	Fini	\N	\N
4	Ferme	\N	\N
5	0	\N	\N
6	5	\N	\N
7	10	\N	\N
8	15	\N	\N
9	20	\N	\N
10	25	\N	\N
11	30	\N	\N
12	35	\N	\N
13	40	\N	\N
14	45	\N	\N
15	50	\N	\N
16	55	\N	\N
17	60	\N	\N
18	65	\N	\N
19	70	\N	\N
20	75	\N	\N
21	80	\N	\N
22	85	\N	\N
23	90	\N	\N
24	95	\N	\N
25	100	\N	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: historique_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historique_action (id, ticket, date_ajout, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2019_12_14_000001_create_personal_access_tokens_table	1
2	2024_12_27_073642_sync_categorie_table	2
3	2024_12_27_074125_create_categories_table	3
4	2024_12_27_074603_categorie	4
5	0001_01_01_000000_create_users_table	5
6	0001_01_01_000001_create_cache_table	5
7	0001_01_01_000002_create_jobs_table	5
\.


--
-- Data for Name: note_technicien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.note_technicien (id, ticket, note, date_notation, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: poste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poste (id, nom, description, created_at, updated_at) FROM stdin;
1	Technicien	Traiteur des tickets des employ‚s dans le d‚partement IT	\N	\N
3	Adminstrateur	Super utilsateur qui peut g‚rer toute action des utilisateurs	\N	\N
2	Employes	Utilisateur qui envoye les tickets	\N	\N
\.


--
-- Data for Name: priorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.priorite (id, nom, description, created_at, updated_at) FROM stdin;
2	Major	Priorités majeur	2024-11-26 13:19:43	2024-11-26 13:19:43
3	Critical	Cas critique	2024-11-26 13:19:57	2024-11-26 13:19:57
4	High	Eleve	2024-11-26 13:20:09	2024-11-26 13:20:09
\.


--
-- Data for Name: rapport_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rapport_ticket (id, ticket, rapport, date_rapport, created_at, updated_at) FROM stdin;
1	T0005	<p>xsdcfv</p>	2024-11-27 17:22:37	2024-11-27 17:22:47	2024-11-27 17:22:47
2	T0005	<p>sdefrgthyjunhgfbder't(gfbvdef</p>	2024-11-27 17:23:14	2024-11-27 17:23:21	2024-11-27 17:23:21
3	T0005	<p>ok</p>	2024-11-27 17:29:38	2024-11-27 17:29:57	2024-11-27 17:29:57
\.


--
-- Data for Name: reouverture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reouverture (id, ticket, raison, date_reouverture, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
l5HUYIdzOxWHwKhmTBZkSuNeMKlvLkV2OYyLxp4T	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSlhHeEpJaDFmaXFKNmJ4VHNoQUtiYmlnbzlhTzB5N09JNkJVUmh5RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yYXBwb3J0L3VzZXIvdWktZm9ybXMuaHRtbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6ImFkbWluc3RyYXRldXIiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjg6e3M6MjoiaWQiO3M6NzoiRU1QMDAwMSI7czozOiJub20iO3M6MzU6IlJBWkFGSU1BTkpBVE8gSGFpbmdvbmlhaW5hIEFkcmllbm5lIjtzOjU6ImVtYWlsIjtzOjIzOiJyYXphZmltYW5qYXRvQGdtYWlsLmNvbSI7czoxMjoibW90X2RlX3Bhc3NlIjtzOjY6IjEyMzQ1NiI7czo0OiJyb2xlIjtpOjM7czoxMzoiZGF0ZV9jcmVhdGlvbiI7czoxOToiMjAyNC0xMS0yNiAwMzoxMjo1NCI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNC0xMS0yNiAwMjoxMDoxNSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNC0xMS0yNiAwMjoxMDoxNSI7fX1zOjExOiJ0ZWNobmljaWVudCI7YjowO3M6ODoiZW1wbG95ZXMiO2I6MDt9	1735499601
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket (id, titre, description, etat, date_creation, date_deadline, date_debut_activite, date_resolution, categorie, priorite, utilisateur, technicien, created_at, updated_at) FROM stdin;
T0006	xsdgrtyuji	qszdefgtryujilmhgj,nbgtrfegtrdu	5	2024-11-27 15:02:16	2024-10-28 16:02:00	2024-11-27 15:03:48	\N	1	4	EMP0002	EMP0002	2024-11-27 15:02:16	2024-11-27 15:02:16
T0005	sazd	szdc	4	2024-11-27 12:35:33	2024-11-01 13:35:00	\N	2024-11-27 16:31:28	1	2	EMP0002	EMP0002	2024-11-27 12:35:33	2024-11-27 12:35:33
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id, nom, email, mot_de_passe, role, date_creation, created_at, updated_at) FROM stdin;
EMP0002	RAZAFIMANJATO Maevasoa Irina Gabriella	razafi.maeva.gabriella@gmail.com	123456789	2	2024-11-26 02:13:48	2024-11-26 02:13:48	2024-11-26 02:13:48
EMP0001	RAZAFIMANJATO Haingoniaina Adrienne	razafimanjato@gmail.com	123456	3	2024-11-26 03:12:54	2024-11-26 02:10:15	2024-11-26 02:10:15
\.


--
-- Name: categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorie_id_seq', 2, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: etat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etat_id_seq', 25, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: historique_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historique_action_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- Name: note_technicien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.note_technicien_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: poste_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poste_id_seq', 3, true);


--
-- Name: priorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.priorite_id_seq', 4, true);


--
-- Name: rapport_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rapport_ticket_id_seq', 3, true);


--
-- Name: reouverture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reouverture_id_seq', 1, false);


--
-- Name: seq_ticket_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_ticket_id', 6, true);


--
-- Name: seq_utilisateur_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_utilisateur_id', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: utilisateur email_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT email_pk UNIQUE (email);


--
-- Name: etat etat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etat
    ADD CONSTRAINT etat_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: historique_action historique_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historique_action
    ADD CONSTRAINT historique_action_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: note_technicien note_technicien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note_technicien
    ADD CONSTRAINT note_technicien_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: poste poste_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poste
    ADD CONSTRAINT poste_pkey PRIMARY KEY (id);


--
-- Name: priorite priorite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.priorite
    ADD CONSTRAINT priorite_pkey PRIMARY KEY (id);


--
-- Name: rapport_ticket rapport_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rapport_ticket
    ADD CONSTRAINT rapport_ticket_pkey PRIMARY KEY (id);


--
-- Name: reouverture reouverture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reouverture
    ADD CONSTRAINT reouverture_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: historique_action historique_action_ticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historique_action
    ADD CONSTRAINT historique_action_ticket_fkey FOREIGN KEY (ticket) REFERENCES public.ticket(id);


--
-- Name: note_technicien note_technicien_ticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note_technicien
    ADD CONSTRAINT note_technicien_ticket_fkey FOREIGN KEY (ticket) REFERENCES public.ticket(id);


--
-- Name: rapport_ticket rapport_ticket_ticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rapport_ticket
    ADD CONSTRAINT rapport_ticket_ticket_fkey FOREIGN KEY (ticket) REFERENCES public.ticket(id);


--
-- Name: reouverture reouverture_ticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reouverture
    ADD CONSTRAINT reouverture_ticket_fkey FOREIGN KEY (ticket) REFERENCES public.ticket(id);


--
-- Name: ticket ticket_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_categorie_fkey FOREIGN KEY (categorie) REFERENCES public.categorie(id);


--
-- Name: ticket ticket_etat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_etat_fkey FOREIGN KEY (etat) REFERENCES public.etat(id);


--
-- Name: ticket ticket_priorite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_priorite_fkey FOREIGN KEY (priorite) REFERENCES public.priorite(id);


--
-- Name: ticket ticket_technicien_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_technicien_fkey FOREIGN KEY (technicien) REFERENCES public.utilisateur(id);


--
-- Name: ticket ticket_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_utilisateur_fkey FOREIGN KEY (utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: utilisateur utilisateur_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_role_fkey FOREIGN KEY (role) REFERENCES public.poste(id);


--
-- PostgreSQL database dump complete
--

