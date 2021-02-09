--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO real_clear;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO real_clear;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO real_clear;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO real_clear;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO real_clear;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO real_clear;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO real_clear;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO real_clear;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO real_clear;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO real_clear;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO real_clear;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO real_clear;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: real_clear
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


ALTER TABLE public.django_admin_log OWNER TO real_clear;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO real_clear;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO real_clear;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO real_clear;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO real_clear;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO real_clear;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO real_clear;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO real_clear;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO real_clear;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: forms_associationtype; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_associationtype (
    id integer NOT NULL,
    label character varying(100) NOT NULL,
    asterisk character varying(100),
    "order" integer NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.forms_associationtype OWNER TO real_clear;

--
-- Name: forms_associationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_associationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_associationtype_id_seq OWNER TO real_clear;

--
-- Name: forms_associationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_associationtype_id_seq OWNED BY public.forms_associationtype.id;


--
-- Name: forms_collectionprocess; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_collectionprocess (
    id integer NOT NULL,
    label character varying(100) NOT NULL,
    "order" integer NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.forms_collectionprocess OWNER TO real_clear;

--
-- Name: forms_collectionprocess_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_collectionprocess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_collectionprocess_id_seq OWNER TO real_clear;

--
-- Name: forms_collectionprocess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_collectionprocess_id_seq OWNED BY public.forms_collectionprocess.id;


--
-- Name: forms_commonproperty; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_commonproperty (
    id integer NOT NULL,
    label character varying(100) NOT NULL,
    "order" integer NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.forms_commonproperty OWNER TO real_clear;

--
-- Name: forms_commonproperty_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_commonproperty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_commonproperty_id_seq OWNER TO real_clear;

--
-- Name: forms_commonproperty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_commonproperty_id_seq OWNED BY public.forms_commonproperty.id;


--
-- Name: forms_contactlead; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_contactlead (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone character varying(100),
    email character varying(200) NOT NULL,
    preferred_method character varying(50) NOT NULL,
    message text NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.forms_contactlead OWNER TO real_clear;

--
-- Name: forms_contactlead_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_contactlead_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_contactlead_id_seq OWNER TO real_clear;

--
-- Name: forms_contactlead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_contactlead_id_seq OWNED BY public.forms_contactlead.id;


--
-- Name: forms_meetingfrequency; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_meetingfrequency (
    id integer NOT NULL,
    label character varying(100) NOT NULL,
    "order" integer NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.forms_meetingfrequency OWNER TO real_clear;

--
-- Name: forms_meetingfrequency_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_meetingfrequency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_meetingfrequency_id_seq OWNER TO real_clear;

--
-- Name: forms_meetingfrequency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_meetingfrequency_id_seq OWNED BY public.forms_meetingfrequency.id;


--
-- Name: forms_proposalrequest; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_proposalrequest (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone character varying(100),
    email character varying(200) NOT NULL,
    preferred_method character varying(50) NOT NULL,
    subdivision character varying(100) NOT NULL,
    association_name character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    zip character varying(100) NOT NULL,
    number_of_homes character varying(100) NOT NULL,
    meeting_frequency character varying(100) NOT NULL,
    fee_collection character varying(100) NOT NULL,
    same_assessment character varying(100) NOT NULL,
    board_member character varying(100) NOT NULL,
    board_requested character varying(100) NOT NULL,
    reserve_study character varying(100) NOT NULL,
    transition_date character varying(100) NOT NULL,
    proposal_due_date character varying(100) NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.forms_proposalrequest OWNER TO real_clear;

--
-- Name: forms_proposalrequest_association_types; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_proposalrequest_association_types (
    id integer NOT NULL,
    proposalrequest_id integer NOT NULL,
    associationtype_id integer NOT NULL
);


ALTER TABLE public.forms_proposalrequest_association_types OWNER TO real_clear;

--
-- Name: forms_proposalrequest_association_types_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_proposalrequest_association_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_proposalrequest_association_types_id_seq OWNER TO real_clear;

--
-- Name: forms_proposalrequest_association_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_proposalrequest_association_types_id_seq OWNED BY public.forms_proposalrequest_association_types.id;


--
-- Name: forms_proposalrequest_common_properties; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.forms_proposalrequest_common_properties (
    id integer NOT NULL,
    proposalrequest_id integer NOT NULL,
    commonproperty_id integer NOT NULL
);


ALTER TABLE public.forms_proposalrequest_common_properties OWNER TO real_clear;

--
-- Name: forms_proposalrequest_common_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_proposalrequest_common_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_proposalrequest_common_properties_id_seq OWNER TO real_clear;

--
-- Name: forms_proposalrequest_common_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_proposalrequest_common_properties_id_seq OWNED BY public.forms_proposalrequest_common_properties.id;


--
-- Name: forms_proposalrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.forms_proposalrequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forms_proposalrequest_id_seq OWNER TO real_clear;

--
-- Name: forms_proposalrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.forms_proposalrequest_id_seq OWNED BY public.forms_proposalrequest.id;


--
-- Name: front_placeholder; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.front_placeholder (
    key character varying(40) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.front_placeholder OWNER TO real_clear;

--
-- Name: front_placeholderhistory; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.front_placeholderhistory (
    id integer NOT NULL,
    placeholder_id character varying(40) NOT NULL,
    value text NOT NULL,
    saved timestamp with time zone NOT NULL
);


ALTER TABLE public.front_placeholderhistory OWNER TO real_clear;

--
-- Name: front_placeholderhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.front_placeholderhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.front_placeholderhistory_id_seq OWNER TO real_clear;

--
-- Name: front_placeholderhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.front_placeholderhistory_id_seq OWNED BY public.front_placeholderhistory.id;


--
-- Name: home_content_benefitgroup; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.home_content_benefitgroup (
    id integer NOT NULL,
    label character varying(200) NOT NULL,
    image character varying(200),
    is_published boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.home_content_benefitgroup OWNER TO real_clear;

--
-- Name: home_content_benefitgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.home_content_benefitgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_content_benefitgroup_id_seq OWNER TO real_clear;

--
-- Name: home_content_benefitgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.home_content_benefitgroup_id_seq OWNED BY public.home_content_benefitgroup.id;


--
-- Name: home_content_billboard; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.home_content_billboard (
    id integer NOT NULL,
    label character varying(200) NOT NULL,
    image character varying(200) NOT NULL,
    header character varying(35),
    sub_header character varying(100),
    link character varying(200),
    is_published boolean NOT NULL,
    publish_date date NOT NULL,
    expire_date date,
    "order" integer NOT NULL
);


ALTER TABLE public.home_content_billboard OWNER TO real_clear;

--
-- Name: home_content_billboard_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.home_content_billboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_content_billboard_id_seq OWNER TO real_clear;

--
-- Name: home_content_billboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.home_content_billboard_id_seq OWNED BY public.home_content_billboard.id;


--
-- Name: home_content_homesection; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.home_content_homesection (
    id integer NOT NULL,
    label character varying(200) NOT NULL,
    template character varying(50) NOT NULL,
    image_background character varying(200),
    background_size character varying(50) NOT NULL,
    slide_position character varying(50) NOT NULL,
    is_published boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.home_content_homesection OWNER TO real_clear;

--
-- Name: home_content_homesection_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.home_content_homesection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_content_homesection_id_seq OWNER TO real_clear;

--
-- Name: home_content_homesection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.home_content_homesection_id_seq OWNED BY public.home_content_homesection.id;


--
-- Name: home_content_minibillboard; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.home_content_minibillboard (
    id integer NOT NULL,
    label character varying(200) NOT NULL,
    image character varying(200),
    link character varying(200),
    is_published boolean NOT NULL,
    publish_date date NOT NULL,
    expire_date date,
    "order" integer NOT NULL
);


ALTER TABLE public.home_content_minibillboard OWNER TO real_clear;

--
-- Name: home_content_minibillboard_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.home_content_minibillboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_content_minibillboard_id_seq OWNER TO real_clear;

--
-- Name: home_content_minibillboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.home_content_minibillboard_id_seq OWNED BY public.home_content_minibillboard.id;


--
-- Name: home_content_sectionslideshowimage; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.home_content_sectionslideshowimage (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    label character varying(200) NOT NULL,
    image character varying(400) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.home_content_sectionslideshowimage OWNER TO real_clear;

--
-- Name: home_content_sectionslideshowimage_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.home_content_sectionslideshowimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_content_sectionslideshowimage_id_seq OWNER TO real_clear;

--
-- Name: home_content_sectionslideshowimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.home_content_sectionslideshowimage_id_seq OWNED BY public.home_content_sectionslideshowimage.id;


--
-- Name: navigation_primarynavigation; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.navigation_primarynavigation (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    link_type character varying(50),
    page_id integer,
    link character varying(200),
    is_published boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.navigation_primarynavigation OWNER TO real_clear;

--
-- Name: navigation_primarynavigation_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.navigation_primarynavigation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_primarynavigation_id_seq OWNER TO real_clear;

--
-- Name: navigation_primarynavigation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.navigation_primarynavigation_id_seq OWNED BY public.navigation_primarynavigation.id;


--
-- Name: navigation_subprimarynavigation; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.navigation_subprimarynavigation (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    title character varying(100) NOT NULL,
    page_id integer,
    link character varying(200),
    is_published boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.navigation_subprimarynavigation OWNER TO real_clear;

--
-- Name: navigation_subprimarynavigation_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.navigation_subprimarynavigation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.navigation_subprimarynavigation_id_seq OWNER TO real_clear;

--
-- Name: navigation_subprimarynavigation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.navigation_subprimarynavigation_id_seq OWNED BY public.navigation_subprimarynavigation.id;


--
-- Name: news_article; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.news_article (
    id integer NOT NULL,
    label character varying(200) NOT NULL,
    author character varying(200) NOT NULL,
    meta_title character varying(100),
    meta_description character varying(500),
    meta_tags character varying(500),
    slug character varying(50) NOT NULL,
    image character varying(200) NOT NULL,
    teaser character varying(400) NOT NULL,
    content text NOT NULL,
    publish_date date NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.news_article OWNER TO real_clear;

--
-- Name: news_article_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.news_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_article_id_seq OWNER TO real_clear;

--
-- Name: news_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.news_article_id_seq OWNED BY public.news_article.id;


--
-- Name: news_article_tags; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.news_article_tags (
    id integer NOT NULL,
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.news_article_tags OWNER TO real_clear;

--
-- Name: news_article_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.news_article_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_article_tags_id_seq OWNER TO real_clear;

--
-- Name: news_article_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.news_article_tags_id_seq OWNED BY public.news_article_tags.id;


--
-- Name: news_tag; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.news_tag (
    id integer NOT NULL,
    label character varying(100) NOT NULL,
    meta_title character varying(100),
    meta_description character varying(500),
    meta_tags character varying(500),
    slug character varying(50) NOT NULL,
    "order" integer NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.news_tag OWNER TO real_clear;

--
-- Name: news_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.news_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_tag_id_seq OWNER TO real_clear;

--
-- Name: news_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.news_tag_id_seq OWNED BY public.news_tag.id;


--
-- Name: page_content_faq; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.page_content_faq (
    id integer NOT NULL,
    label character varying(200) NOT NULL,
    question character varying(400) NOT NULL,
    answer character varying(400) NOT NULL,
    "order" integer NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.page_content_faq OWNER TO real_clear;

--
-- Name: page_content_faq_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.page_content_faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_content_faq_id_seq OWNER TO real_clear;

--
-- Name: page_content_faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.page_content_faq_id_seq OWNED BY public.page_content_faq.id;


--
-- Name: page_content_footer; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.page_content_footer (
    id integer NOT NULL,
    site_id integer NOT NULL,
    label character varying(100) NOT NULL
);


ALTER TABLE public.page_content_footer OWNER TO real_clear;

--
-- Name: page_content_footer_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.page_content_footer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_content_footer_id_seq OWNER TO real_clear;

--
-- Name: page_content_footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.page_content_footer_id_seq OWNED BY public.page_content_footer.id;


--
-- Name: page_content_footersociallink; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.page_content_footersociallink (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    label character varying(200) NOT NULL,
    image character varying(400) NOT NULL,
    link character varying(200) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.page_content_footersociallink OWNER TO real_clear;

--
-- Name: page_content_footersociallink_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.page_content_footersociallink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_content_footersociallink_id_seq OWNER TO real_clear;

--
-- Name: page_content_footersociallink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.page_content_footersociallink_id_seq OWNED BY public.page_content_footersociallink.id;


--
-- Name: page_content_logo; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.page_content_logo (
    id integer NOT NULL,
    site_id integer NOT NULL,
    label character varying(100) NOT NULL,
    image character varying(400)
);


ALTER TABLE public.page_content_logo OWNER TO real_clear;

--
-- Name: page_content_logo_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.page_content_logo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_content_logo_id_seq OWNER TO real_clear;

--
-- Name: page_content_logo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.page_content_logo_id_seq OWNED BY public.page_content_logo.id;


--
-- Name: page_content_pagesection; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.page_content_pagesection (
    id integer NOT NULL,
    page_id integer NOT NULL,
    label character varying(400) NOT NULL,
    image character varying(400),
    display_order integer NOT NULL,
    is_published boolean NOT NULL
);


ALTER TABLE public.page_content_pagesection OWNER TO real_clear;

--
-- Name: page_content_pagesection_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.page_content_pagesection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_content_pagesection_id_seq OWNER TO real_clear;

--
-- Name: page_content_pagesection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.page_content_pagesection_id_seq OWNED BY public.page_content_pagesection.id;


--
-- Name: page_content_webpage; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.page_content_webpage (
    id integer NOT NULL,
    template_choice character varying(50),
    template_addon character varying(50),
    label character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    meta_title character varying(100),
    meta_description character varying(500),
    meta_tags character varying(500),
    image_cover character varying(400),
    is_published boolean NOT NULL,
    create_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL
);


ALTER TABLE public.page_content_webpage OWNER TO real_clear;

--
-- Name: page_content_webpage_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.page_content_webpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_content_webpage_id_seq OWNER TO real_clear;

--
-- Name: page_content_webpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.page_content_webpage_id_seq OWNED BY public.page_content_webpage.id;


--
-- Name: questions_community; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.questions_community (
    id integer NOT NULL,
    name character varying(256)
);


ALTER TABLE public.questions_community OWNER TO real_clear;

--
-- Name: questions_community_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.questions_community_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_community_id_seq OWNER TO real_clear;

--
-- Name: questions_community_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.questions_community_id_seq OWNED BY public.questions_community.id;


--
-- Name: questions_question; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.questions_question (
    id integer NOT NULL,
    type character varying(256),
    info character varying(256),
    name character varying(256),
    address character varying(256),
    phone character varying(256),
    email character varying(256),
    created_at timestamp with time zone,
    is_resolved boolean NOT NULL,
    assigned_admin_id integer,
    neighborhood_id integer
);


ALTER TABLE public.questions_question OWNER TO real_clear;

--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO real_clear;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions_question.id;


--
-- Name: questions_question_questions; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.questions_question_questions (
    id integer NOT NULL,
    question_id integer NOT NULL,
    questionpart_id integer NOT NULL
);


ALTER TABLE public.questions_question_questions OWNER TO real_clear;

--
-- Name: questions_question_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.questions_question_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_questions_id_seq OWNER TO real_clear;

--
-- Name: questions_question_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.questions_question_questions_id_seq OWNED BY public.questions_question_questions.id;


--
-- Name: questions_questionpart; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.questions_questionpart (
    id integer NOT NULL,
    question character varying(512),
    answer text
);


ALTER TABLE public.questions_questionpart OWNER TO real_clear;

--
-- Name: questions_questionpart_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.questions_questionpart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_questionpart_id_seq OWNER TO real_clear;

--
-- Name: questions_questionpart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.questions_questionpart_id_seq OWNED BY public.questions_questionpart.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.reversion_revision (
    id integer NOT NULL,
    manager_slug character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer,
    comment text NOT NULL
);


ALTER TABLE public.reversion_revision OWNER TO real_clear;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.reversion_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO real_clear;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.reversion_revision_id_seq OWNED BY public.reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.reversion_version (
    id integer NOT NULL,
    revision_id integer NOT NULL,
    object_id text NOT NULL,
    object_id_int integer,
    content_type_id integer NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL
);


ALTER TABLE public.reversion_version OWNER TO real_clear;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.reversion_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO real_clear;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.reversion_version_id_seq OWNED BY public.reversion_version.id;


--
-- Name: staff_member; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.staff_member (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    "position" character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    meta_title character varying(100),
    meta_description character varying(500),
    meta_tags character varying(500),
    image character varying(1000) NOT NULL,
    teaser character varying(100) NOT NULL,
    bio text NOT NULL,
    is_published boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.staff_member OWNER TO real_clear;

--
-- Name: staff_member_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.staff_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_member_id_seq OWNER TO real_clear;

--
-- Name: staff_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.staff_member_id_seq OWNED BY public.staff_member.id;


--
-- Name: staff_membersociallink; Type: TABLE; Schema: public; Owner: real_clear
--

CREATE TABLE public.staff_membersociallink (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    label character varying(200) NOT NULL,
    image character varying(400) NOT NULL,
    link character varying(200) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.staff_membersociallink OWNER TO real_clear;

--
-- Name: staff_membersociallink_id_seq; Type: SEQUENCE; Schema: public; Owner: real_clear
--

CREATE SEQUENCE public.staff_membersociallink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_membersociallink_id_seq OWNER TO real_clear;

--
-- Name: staff_membersociallink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: real_clear
--

ALTER SEQUENCE public.staff_membersociallink_id_seq OWNED BY public.staff_membersociallink.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: forms_associationtype id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_associationtype ALTER COLUMN id SET DEFAULT nextval('public.forms_associationtype_id_seq'::regclass);


--
-- Name: forms_collectionprocess id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_collectionprocess ALTER COLUMN id SET DEFAULT nextval('public.forms_collectionprocess_id_seq'::regclass);


--
-- Name: forms_commonproperty id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_commonproperty ALTER COLUMN id SET DEFAULT nextval('public.forms_commonproperty_id_seq'::regclass);


--
-- Name: forms_contactlead id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_contactlead ALTER COLUMN id SET DEFAULT nextval('public.forms_contactlead_id_seq'::regclass);


--
-- Name: forms_meetingfrequency id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_meetingfrequency ALTER COLUMN id SET DEFAULT nextval('public.forms_meetingfrequency_id_seq'::regclass);


--
-- Name: forms_proposalrequest id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest ALTER COLUMN id SET DEFAULT nextval('public.forms_proposalrequest_id_seq'::regclass);


--
-- Name: forms_proposalrequest_association_types id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_association_types ALTER COLUMN id SET DEFAULT nextval('public.forms_proposalrequest_association_types_id_seq'::regclass);


--
-- Name: forms_proposalrequest_common_properties id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_common_properties ALTER COLUMN id SET DEFAULT nextval('public.forms_proposalrequest_common_properties_id_seq'::regclass);


--
-- Name: front_placeholderhistory id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.front_placeholderhistory ALTER COLUMN id SET DEFAULT nextval('public.front_placeholderhistory_id_seq'::regclass);


--
-- Name: home_content_benefitgroup id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_benefitgroup ALTER COLUMN id SET DEFAULT nextval('public.home_content_benefitgroup_id_seq'::regclass);


--
-- Name: home_content_billboard id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_billboard ALTER COLUMN id SET DEFAULT nextval('public.home_content_billboard_id_seq'::regclass);


--
-- Name: home_content_homesection id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_homesection ALTER COLUMN id SET DEFAULT nextval('public.home_content_homesection_id_seq'::regclass);


--
-- Name: home_content_minibillboard id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_minibillboard ALTER COLUMN id SET DEFAULT nextval('public.home_content_minibillboard_id_seq'::regclass);


--
-- Name: home_content_sectionslideshowimage id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_sectionslideshowimage ALTER COLUMN id SET DEFAULT nextval('public.home_content_sectionslideshowimage_id_seq'::regclass);


--
-- Name: navigation_primarynavigation id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.navigation_primarynavigation ALTER COLUMN id SET DEFAULT nextval('public.navigation_primarynavigation_id_seq'::regclass);


--
-- Name: navigation_subprimarynavigation id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.navigation_subprimarynavigation ALTER COLUMN id SET DEFAULT nextval('public.navigation_subprimarynavigation_id_seq'::regclass);


--
-- Name: news_article id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article ALTER COLUMN id SET DEFAULT nextval('public.news_article_id_seq'::regclass);


--
-- Name: news_article_tags id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article_tags ALTER COLUMN id SET DEFAULT nextval('public.news_article_tags_id_seq'::regclass);


--
-- Name: news_tag id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_tag ALTER COLUMN id SET DEFAULT nextval('public.news_tag_id_seq'::regclass);


--
-- Name: page_content_faq id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_faq ALTER COLUMN id SET DEFAULT nextval('public.page_content_faq_id_seq'::regclass);


--
-- Name: page_content_footer id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_footer ALTER COLUMN id SET DEFAULT nextval('public.page_content_footer_id_seq'::regclass);


--
-- Name: page_content_footersociallink id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_footersociallink ALTER COLUMN id SET DEFAULT nextval('public.page_content_footersociallink_id_seq'::regclass);


--
-- Name: page_content_logo id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_logo ALTER COLUMN id SET DEFAULT nextval('public.page_content_logo_id_seq'::regclass);


--
-- Name: page_content_pagesection id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_pagesection ALTER COLUMN id SET DEFAULT nextval('public.page_content_pagesection_id_seq'::regclass);


--
-- Name: page_content_webpage id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_webpage ALTER COLUMN id SET DEFAULT nextval('public.page_content_webpage_id_seq'::regclass);


--
-- Name: questions_community id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_community ALTER COLUMN id SET DEFAULT nextval('public.questions_community_id_seq'::regclass);


--
-- Name: questions_question id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question ALTER COLUMN id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: questions_question_questions id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question_questions ALTER COLUMN id SET DEFAULT nextval('public.questions_question_questions_id_seq'::regclass);


--
-- Name: questions_questionpart id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_questionpart ALTER COLUMN id SET DEFAULT nextval('public.questions_questionpart_id_seq'::regclass);


--
-- Name: reversion_revision id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.reversion_revision ALTER COLUMN id SET DEFAULT nextval('public.reversion_revision_id_seq'::regclass);


--
-- Name: reversion_version id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.reversion_version ALTER COLUMN id SET DEFAULT nextval('public.reversion_version_id_seq'::regclass);


--
-- Name: staff_member id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.staff_member ALTER COLUMN id SET DEFAULT nextval('public.staff_member_id_seq'::regclass);


--
-- Name: staff_membersociallink id; Type: DEFAULT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.staff_membersociallink ALTER COLUMN id SET DEFAULT nextval('public.staff_membersociallink_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.auth_group (id, name) FROM stdin;
1	General Administration
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	46
2	1	47
3	1	48
4	1	49
5	1	50
6	1	51
7	1	52
8	1	53
9	1	54
10	1	55
11	1	56
12	1	57
13	1	58
14	1	59
15	1	60
16	1	61
17	1	62
18	1	63
19	1	64
20	1	65
21	1	66
22	1	67
23	1	68
24	1	69
25	1	70
26	1	71
27	1	72
28	1	73
29	1	74
30	1	75
31	1	76
32	1	77
33	1	78
34	1	79
35	1	80
36	1	81
37	1	82
38	1	83
39	1	84
40	1	85
41	1	86
42	1	87
43	1	88
44	1	89
45	1	90
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add placeholder	8	add_placeholder
23	Can change placeholder	8	change_placeholder
24	Can delete placeholder	8	delete_placeholder
25	Can add placeholder history	9	add_placeholderhistory
26	Can change placeholder history	9	change_placeholderhistory
27	Can delete placeholder history	9	delete_placeholderhistory
28	Can add Contact Lead	10	add_contactlead
29	Can change Contact Lead	10	change_contactlead
30	Can delete Contact Lead	10	delete_contactlead
31	Can add Meeting Frequency	11	add_meetingfrequency
32	Can change Meeting Frequency	11	change_meetingfrequency
33	Can delete Meeting Frequency	11	delete_meetingfrequency
34	Can add Collection Process	12	add_collectionprocess
35	Can change Collection Process	12	change_collectionprocess
36	Can delete Collection Process	12	delete_collectionprocess
37	Can add Association Type	13	add_associationtype
38	Can change Association Type	13	change_associationtype
39	Can delete Association Type	13	delete_associationtype
40	Can add Common Property	14	add_commonproperty
41	Can change Common Property	14	change_commonproperty
42	Can delete Common Property	14	delete_commonproperty
43	Can add Proposal Request	15	add_proposalrequest
44	Can change Proposal Request	15	change_proposalrequest
45	Can delete Proposal Request	15	delete_proposalrequest
46	Can add Section	16	add_homesection
47	Can change Section	16	change_homesection
48	Can delete Section	16	delete_homesection
49	Can add Slide Show Image	17	add_sectionslideshowimage
50	Can change Slide Show Image	17	change_sectionslideshowimage
51	Can delete Slide Show Image	17	delete_sectionslideshowimage
52	Can add Billboard	18	add_billboard
53	Can change Billboard	18	change_billboard
54	Can delete Billboard	18	delete_billboard
55	Can add Mini Billboard	19	add_minibillboard
56	Can change Mini Billboard	19	change_minibillboard
57	Can delete Mini Billboard	19	delete_minibillboard
58	Can add Benefit Group	20	add_benefitgroup
59	Can change Benefit Group	20	change_benefitgroup
60	Can delete Benefit Group	20	delete_benefitgroup
61	Can add Primary Navigation	21	add_primarynavigation
62	Can change Primary Navigation	21	change_primarynavigation
63	Can delete Primary Navigation	21	delete_primarynavigation
64	Can add Sub Primary Navigation	22	add_subprimarynavigation
65	Can change Sub Primary Navigation	22	change_subprimarynavigation
66	Can delete Sub Primary Navigation	22	delete_subprimarynavigation
67	Can add Tag	23	add_tag
68	Can change Tag	23	change_tag
69	Can delete Tag	23	delete_tag
70	Can add Article	24	add_article
71	Can change Article	24	change_article
72	Can delete Article	24	delete_article
73	Can add Logo	25	add_logo
74	Can change Logo	25	change_logo
75	Can delete Logo	25	delete_logo
76	Can add FAQ	26	add_faq
77	Can change FAQ	26	change_faq
78	Can delete FAQ	26	delete_faq
79	Can add Page	27	add_webpage
80	Can change Page	27	change_webpage
81	Can delete Page	27	delete_webpage
82	Can add Section	28	add_pagesection
83	Can change Section	28	change_pagesection
84	Can delete Section	28	delete_pagesection
85	Can add Footer	29	add_footer
86	Can change Footer	29	change_footer
87	Can delete Footer	29	delete_footer
88	Can add Social Link	30	add_footersociallink
89	Can change Social Link	30	change_footersociallink
90	Can delete Social Link	30	delete_footersociallink
91	Can add Staff Member	31	add_member
92	Can change Staff Member	31	change_member
93	Can delete Staff Member	31	delete_member
94	Can add Social Link	32	add_membersociallink
95	Can change Social Link	32	change_membersociallink
96	Can delete Social Link	32	delete_membersociallink
97	Can add revision	33	add_revision
98	Can change revision	33	change_revision
99	Can delete revision	33	delete_revision
100	Can add version	34	add_version
101	Can change version	34	change_version
102	Can delete version	34	delete_version
103	Can add community	35	add_community
104	Can change community	35	change_community
105	Can delete community	35	delete_community
106	Can add question part	36	add_questionpart
107	Can change question part	36	change_questionpart
108	Can delete question part	36	delete_questionpart
109	Can add Question	37	add_question
110	Can change Question	37	change_question
111	Can delete Question	37	delete_question
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$15000$NP11OQGKSCQ3$U2MeiXQEwJ11b8K+w9bPHA58Wuxwx5ysMb3b/nHI4jo=	2015-03-23 20:08:36.711376+02	t	kellym	Kelly	Miller		t	t	2015-02-27 17:32:34+02
10	pbkdf2_sha256$15000$1aVoZimk0grc$pQ/Uw5V66EWYh2/iA+qlGXyK0fBOT6gso2dm4W+oJGU=	2015-04-28 22:14:51.286489+03	t	nathanl	Nathan	LeBert	nathanl@millcreeksoftware.biz	t	t	2015-04-24 00:35:59+03
8	pbkdf2_sha256$15000$XJMMTfr0KB8E$gKpTZv0Oygss6MaLHcqmqCzN5SP/Kxhwvlfr0oh/4nk=	2015-04-08 19:24:39+03	f	Andy	Andy	Hague	andy@realclearneighborhooods.com	t	t	2015-04-08 19:24:39+03
2	pbkdf2_sha256$15000$ofTjqwuK2e3B$dIHWAeEJ2C11PKzDegv9uwXnEZFQEgllxatsCK5LSIE=	2015-10-23 17:48:58.329329+03	t	dcrum	Dale	Crum	dcrum@doc4design.com	t	t	2015-02-18 19:11:36+02
6	pbkdf2_sha256$15000$vVrGpkHncUOz$STbHiOfk6QMjtlBhvgKYoSXp6Ark4BdIiVSCJ/ggQso=	2015-03-08 20:55:15+02	f	waterford-test	John	Doe	john@waterford.com	f	f	2015-03-08 20:55:15+02
7	pbkdf2_sha256$15000$LD3lzAwIcsCl$Qnl8KqZsGW4vtdWGjqx2tcQLTcOWG5hxyfbF77tJXko=	2015-03-25 23:08:36+02	f	rcn				f	f	2015-03-25 19:14:53+02
1	pbkdf2_sha256$15000$q4clc2oWwxYT$tXY6wVkOZTf2MYQ2Af3XJxwArfBW0ipi/IjGV1950ew=	2016-01-05 00:30:43.959608+02	t	davidw			davidw@millcreeksoftware.biz	t	t	2015-02-17 03:48:22.830781+02
3	pbkdf2_sha256$15000$R9WRCiLnI8zY$Lxfufd0N+xyAfwTADIEmyxOKBmwm/df0wvU9Gi/Fo1o=	2016-01-05 21:45:23.396634+02	t	mwhite	Michael	White	mwhite@doc4design.com	t	t	2015-02-18 19:12:04+02
9	pbkdf2_sha256$15000$dAgM989vq5N5$UHTq56FpXNz8HJjFgunNk7ttoR5jyz1yAjz2kL2RlFU=	2015-04-15 19:10:52+03	t	doc4rcn			admin@admin.com	t	f	2015-04-15 19:10:40+03
11	pbkdf2_sha256$15000$xPfhV8alAlf4$GtqSOTMP0qyX0ca6VX7xJGOliRaE458C+qv6mEJ+2+Q=	2015-07-18 00:54:45.94018+03	t	benj	Ben	Johnson	benj@millcreeksoftware.biz	t	t	2015-07-16 00:26:37+03
12	pbkdf2_sha256$15000$WFO67PFhPEVz$syCrKuRMhjoS5HaP5awCrMqO1Y2u/PdUEL251zq+yfI=	2018-12-21 21:49:34.509584+02	t	jake@smallworldus.com	Jake	Curreri	jake@smallworldus.com	t	t	2017-04-13 20:49:00+03
5	pbkdf2_sha256$15000$0UnAi22Fj2hO$y8PFjuCtPm0UCndn4fA5lAanWb69yL+AqjAE2FjScig=	2018-12-12 19:21:49.395487+02	t	ryan	Ryan	Hodson	ryan@realclearneighborhoods.com	t	t	2015-02-28 00:58:41+02
13	pbkdf2_sha256$15000$fDL8kp8aV71H$5RVswbmX8qca5aBFSRrob6ejTc+YiLDrzu/KOCW/i0E=	2018-12-22 14:13:43.536433+02	t	m.plaksia@hotmail.com				t	t	2018-12-11 19:26:02+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	8	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-02-17 18:41:05.755376+02	7	Solutions: Association Management	1		27	1
2	2015-02-17 18:41:39.402452+02	8	Solutions: Community Resources	1		27	1
3	2015-02-17 18:42:03.582246+02	9	Solutions: Financial Management	1		27	1
4	2015-02-17 18:42:30.437853+02	3	Solutions	2	Changed page for Sub Primary Navigation "Association Management". Changed page and order for Sub Primary Navigation "Community Resources". Changed order for Sub Primary Navigation "Document Management". Changed page and order for Sub Primary Navigation "Financial Management".	21	1
5	2015-02-18 19:11:36.170524+02	2	dcrum	1		3	1
6	2015-02-18 19:11:52.261245+02	2	dcrum	2	Changed first_name, last_name, email, is_staff and is_superuser.	3	1
7	2015-02-18 19:12:04.226314+02	3	mwhite	1		3	1
8	2015-02-18 19:12:18.090861+02	3	mwhite	2	Changed first_name, last_name, email, is_staff and is_superuser.	3	1
9	2015-02-18 19:13:03.584975+02	1	Association Management	2	Changed image and link.	19	1
10	2015-02-18 19:13:24.539112+02	2	Document Management	2	Changed image and link.	19	1
11	2015-02-18 19:13:38.538814+02	3	Community Resources	2	Changed image and link.	19	1
12	2015-02-18 19:15:29.725484+02	10	What We Do	1		27	1
13	2015-02-18 19:15:41.327842+02	2	What We Do	2	Changed page.	21	1
14	2015-02-18 19:15:54.939522+02	10	What We Do	2	Changed template_choice and image_cover.	27	1
15	2015-02-18 19:17:39.302207+02	1	Asoc. President	2	Changed image.	20	1
16	2015-02-18 19:17:43.636385+02	2	New Neighbors	2	Changed image.	20	1
17	2015-02-18 19:17:47.207547+02	3	Stay-At-Home Mom	2	Changed image.	20	1
18	2015-02-18 19:19:04.160567+02	1	Asoc. President	2	Changed image.	20	1
19	2015-02-18 19:19:35.636241+02	1	Welcome	2	Changed image.	18	1
20	2015-02-18 19:27:52.031421+02	1	Ryan Hodson	2	Changed image. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	31	1
21	2015-02-18 19:29:15.455921+02	2	Ryan Hodson	1		31	1
22	2015-02-18 21:56:19.99855+02	3	Vestibulum Ante Ipsum Primis by Ryan Hodson	2	Changed label, image and content.	24	2
23	2015-02-18 21:57:24.526921+02	2	Phasellus Molestie Magna by Ryan Hodson	2	Changed label, image and content.	24	2
24	2015-02-18 21:58:01.909769+02	1	Sed Molestie Augue Sit Amet Leo by Ryan Hodson	2	Changed label, image and content.	24	2
25	2015-02-18 22:19:55.223337+02	1	Real Clear Corporate	2	Changed image and link for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	29	1
26	2015-02-18 22:23:06.268329+02	1	Real Clear Corporate	2	Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image and link for Social Link "LinkedIn".	29	1
27	2015-02-18 22:25:05.012304+02	1	Real Clear Corporate	2	Changed image for Social Link "Facebook". Changed image for Social Link "LinkedIn". Deleted Social Link "Twitter".	29	2
28	2015-02-18 22:43:20.255618+02	3	Built For Residents	2	Changed image_background. Changed image for Slide Show Image "Ipad". Changed image for Slide Show Image "Macbook".	16	2
29	2015-02-18 22:43:55.779647+02	1	Social Medai	2	Changed label. Changed image for Social Link "Facebook". Changed image for Social Link "LinkedIn".	29	2
30	2015-02-18 22:44:04.03085+02	1	Social Media	2	Changed label. Changed image for Social Link "Facebook". Changed image for Social Link "LinkedIn".	29	2
31	2015-02-18 22:46:22.300164+02	4	Great For Presidents	2	Changed image for Slide Show Image "Macbook". Changed image for Slide Show Image "iPad".	16	2
32	2015-02-18 22:48:39.737752+02	3	Built For Residents	2	Changed image_background. Changed image for Slide Show Image "Ipad". Changed image and order for Slide Show Image "Macbook".	16	2
33	2015-02-18 22:56:19.610359+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	1		24	2
34	2015-02-18 22:57:34.202919+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and teaser.	24	2
35	2015-02-18 23:14:34.765584+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and teaser.	24	1
36	2015-02-18 23:52:06.093605+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
37	2015-02-18 23:57:52.283342+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
38	2015-02-18 23:58:14.743427+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
39	2015-02-18 23:59:32.593691+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
40	2015-02-19 00:00:15.36196+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
41	2015-02-19 00:09:06.348628+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
42	2015-02-19 00:09:39.299179+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
43	2015-02-19 00:14:35.608653+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
44	2015-02-19 00:14:53.847687+02	4	Nunc Eu Ullamcorper Orci. Quisque Eget by Ryan Hodson	2	Changed image and content.	24	2
45	2015-02-27 17:32:34.429523+02	4	kellym	1		3	1
46	2015-02-27 17:32:45.577174+02	4	kellym	2	Changed first_name, last_name, is_staff and is_superuser.	3	1
47	2015-02-28 00:58:41.679341+02	5	ryan	1		3	4
48	2015-02-28 00:58:54.032882+02	5	ryan	2	Changed first_name, last_name, is_staff and is_superuser.	3	4
49	2015-03-08 20:47:39.313806+02	1	Welcome	2	Changed image.	18	5
50	2015-03-08 20:48:26.062598+02	1	Welcome	2	Changed image.	18	5
51	2015-03-08 20:48:50.96047+02	1	Welcome	2	Changed image, header and publish_date.	18	5
52	2015-03-08 20:55:16.071407+02	6	waterford-test	1		3	5
53	2015-03-08 20:57:15.175691+02	6	waterford-test	2	Changed is_active.	3	5
54	2015-03-08 20:58:20.617862+02	6	waterford-test	2	Changed first_name, last_name, email and is_active.	3	5
55	2015-03-08 21:18:51.619564+02	1	Billboards	2	Changed image_background.	16	5
56	2015-03-08 21:19:13.084906+02	2	Mini Billboards	2	Changed image_background.	16	5
57	2015-03-08 21:20:18.217462+02	2	Mini Billboards	2	Changed image_background.	16	5
58	2015-03-08 21:22:46.499679+02	1	Welcome	2	Changed image.	18	5
59	2015-03-08 21:24:59.750733+02	11	test	1		27	5
60	2015-03-08 21:27:15.747651+02	11	test	3		27	5
61	2015-03-09 13:34:21.297769+02	1	Solutions: Landing Page	2	Changed image_cover. Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed image for Section "Community Resources".	27	5
62	2015-03-09 15:24:44.833784+02	1	Billboards	2	Changed image_background.	16	5
126	2015-04-02 16:37:13.453855+03	1	Real Clear Corporate	2	Changed image.	25	5
127	2015-04-02 16:37:47.216583+03	1	Real Clear Corporate	2	Changed image.	25	5
128	2015-04-02 22:33:22.271314+03	1	Real Clear Corporate	2	Changed image.	25	5
63	2015-03-12 18:33:14.043961+02	1	Solutions: Landing Page	2	Changed image_cover. Added Section "error". Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Deleted Section "Community Resources".	27	5
64	2015-03-12 18:34:03.473749+02	1	Solutions: Landing Page	2	Changed image_cover. Added Section "error". Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed label, image, display_order and is_published for Section "Community Resources".	27	5
65	2015-03-12 18:34:18.985461+02	1	Solutions: Landing Page	2	Changed image_cover. Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed image for Section "Community Resources". Deleted Section "error".	27	5
66	2015-03-12 18:34:25.384477+02	1	Solutions: Landing Page	2	Changed image_cover. Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed image for Section "Community Resources".	27	5
67	2015-03-12 21:41:59.809255+02	1	Welcome	2	Changed image.	18	5
68	2015-03-15 16:37:50.006053+02	1	community.realclearneighborhoods.com/mission-hills-estates	2	Changed domain and name.	6	5
69	2015-03-15 16:38:07.971195+02	2	community.realclearneighborhoods.com/waterford-estates	1		6	5
70	2015-03-15 16:38:25.879137+02	3	community.realclearneighborhoods.com/sunbridge-villas	1		6	5
71	2015-03-16 08:01:42.33081+02	1	Association Management	2	Changed image.	19	5
72	2015-03-16 08:02:12.581878+02	2	Document Management	2	Changed image.	19	5
73	2015-03-16 08:03:24.705731+02	3	Community Resources	2	Changed image.	19	5
74	2015-03-16 08:06:19.662866+02	4	Financial Management	1		19	5
75	2015-03-16 16:28:17.089771+02	3	Community Resources	2	Changed is_published.	19	5
76	2015-03-18 06:43:32.061814+02	1	Billboards	2	Changed image_background.	16	5
77	2015-03-18 06:44:07.52637+02	1	Welcome	2	Changed image.	18	5
78	2015-03-18 12:50:14.224712+02	1	Welcome	2	Changed image and sub_header.	18	5
79	2015-03-18 12:50:57.506246+02	1	Welcome	2	Changed image and header.	18	5
80	2015-03-19 06:05:59.897847+02	3	Built For Homeowners	2	Changed label and image_background. Changed image for Slide Show Image "Ipad". Changed image for Slide Show Image "Macbook".	16	5
81	2015-03-22 05:27:18.961785+02	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Ipad". Changed image for Slide Show Image "Macbook".	16	5
82	2015-03-22 05:27:54.350811+02	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Ipad". Changed image for Slide Show Image "Macbook".	16	5
83	2015-03-22 05:29:02.446752+02	2	Mini Billboards	2	Changed image_background and background_size.	16	5
84	2015-03-22 05:29:38.592387+02	2	Mini Billboards	2	Changed image_background.	16	5
85	2015-03-22 05:30:09.515234+02	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Ipad". Changed image for Slide Show Image "Macbook".	16	5
86	2015-03-22 05:30:36.589855+02	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Ipad". Changed image for Slide Show Image "Macbook".	16	5
87	2015-03-22 15:54:09.154265+02	2	realclearneighborhoods.com/waterford-estates	2	Changed domain.	6	5
88	2015-03-22 23:44:21.62326+02	4	Collective Intelligence	2	Changed label. Changed image for Slide Show Image "Macbook". Changed image for Slide Show Image "iPad".	16	5
89	2015-03-23 02:50:51.790614+02	2	Mini Billboards	2	Changed order.	16	5
90	2015-03-23 02:50:52.251265+02	3	Built For Homeowners	2	Changed order.	16	5
91	2015-03-23 02:50:52.296699+02	4	Collective Intelligence	2	Changed order.	16	5
92	2015-03-23 02:50:52.298598+02	5	Work Together	2	Changed order.	16	5
93	2015-03-23 02:51:33.947027+02	5	Work Together	2	Changed order.	16	5
94	2015-03-23 02:51:33.950963+02	2	Mini Billboards	2	Changed order.	16	5
95	2015-03-23 02:52:28.340622+02	5	Work Together	2	Changed order.	16	5
96	2015-03-23 02:52:28.343416+02	3	Built For Homeowners	2	Changed order.	16	5
97	2015-03-23 02:52:28.345269+02	4	Collective Intelligence	2	Changed order.	16	5
98	2015-03-23 02:52:42.222369+02	5	The RCN Difference	2	Changed label and image_background.	16	5
99	2015-03-23 05:24:04.545402+02	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Ipad". Changed image for Slide Show Image "Macbook".	16	5
100	2015-03-23 05:32:49.881868+02	3	Built For Homeowners	2	Changed image_background. Deleted Slide Show Image "Ipad". Deleted Slide Show Image "Macbook".	16	5
101	2015-03-23 05:34:34.591968+02	3	Built For Homeowners	2	Changed image_background. Added Slide Show Image "Homeowners".	16	5
102	2015-03-23 05:35:08.068987+02	3	Built For Homeowners	2	Changed image_background. Added Slide Show Image "ipad_screen2". Changed image for Slide Show Image "Homeowners".	16	5
103	2015-03-25 16:58:03.302558+02	5	ryan	2	Changed email.	3	5
104	2015-03-25 19:14:53.845709+02	7	rcn	1		3	1
105	2015-03-25 19:15:01.417931+02	7	rcn	2	Changed is_staff and is_superuser.	3	1
106	2015-03-25 19:37:50.103254+02	10	David Wilson	3		15	1
107	2015-03-25 19:37:50.199378+02	9	David Wilson	3		15	1
108	2015-03-25 19:37:50.200579+02	8	David Wilson	3		15	1
109	2015-03-25 19:37:50.217116+02	7	David Wilson	3		15	1
110	2015-03-25 19:37:50.218191+02	6	David Wilson	3		15	1
111	2015-03-25 19:37:50.219159+02	5	David Wilson	3		15	1
112	2015-03-25 19:37:50.220102+02	4	David Wilson	3		15	1
113	2015-03-25 19:37:50.220981+02	3	David Wilson	3		15	1
114	2015-03-25 19:37:50.221805+02	2	David Wilson	3		15	1
115	2015-03-25 19:37:50.222599+02	1	David Wilson	3		15	1
116	2015-03-25 19:38:13.294835+02	34	David Wilson	3		10	1
117	2015-03-25 19:38:13.301383+02	33	David Wilson	3		10	1
118	2015-03-25 19:38:13.302313+02	32	David Wilson	3		10	1
119	2015-03-26 19:16:05.166558+02	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Homeowners". Changed image for Slide Show Image "ipad_screen2".	16	5
120	2015-03-26 19:16:33.940532+02	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Homeowners". Changed image and order for Slide Show Image "ipad_screen2".	16	5
121	2015-03-26 19:17:20.517935+02	4	Collective Intelligence	2	Changed image for Slide Show Image "Macbook". Changed image for Slide Show Image "iPad".	16	5
122	2015-04-01 06:44:38.115354+03	3	Community Resources	2	Changed order.	19	5
123	2015-04-01 06:44:38.287351+03	4	Financial Management	2	Changed order.	19	5
124	2015-04-02 16:34:20.184493+03	1	Real Clear Corporate	2	Changed image.	25	5
125	2015-04-02 16:35:57.168565+03	1	Real Clear Corporate	2	Changed image.	25	5
129	2015-04-02 22:34:25.954947+03	1	Real Clear Corporate	2	Changed image.	25	5
130	2015-04-02 22:34:44.736083+03	1	Real Clear Corporate	2	Changed image.	25	5
131	2015-04-08 19:24:40.115719+03	8	Andy	1		3	5
132	2015-04-08 19:25:44.512529+03	8	Andy	2	Changed first_name, last_name, email, is_staff and is_superuser.	3	5
133	2015-04-08 19:41:27.548354+03	4	Conflicting Interests by Ryan Hodson	2	Changed label, image and content.	24	5
134	2015-04-08 19:44:04.441073+03	2	What is a Homeowner Association? by Ryan Hodson	2	Changed label, image and content.	24	5
135	2015-04-08 19:44:14.785735+03	1	Sed Molestie Augue Sit Amet Leo by Ryan Hodson	3		24	5
136	2015-04-08 19:44:14.787494+03	3	Vestibulum Ante Ipsum Primis by Ryan Hodson	3		24	5
137	2015-04-08 20:00:37.676447+03	4	DIY	1		23	5
138	2015-04-08 20:00:45.485657+03	5	Financial	1		23	5
139	2015-04-08 20:00:53.612733+03	5	Financial	2	Changed order.	23	5
140	2015-04-08 20:01:08.969627+03	3	Home Projects	2	Changed label.	23	5
141	2015-04-08 20:12:46.43479+03	1	Community	2	Changed label.	23	5
142	2015-04-08 20:12:56.435682+03	2	News	2	Changed label.	23	5
143	2015-04-08 20:13:05.170954+03	3	Home Projects	2	No fields changed.	23	5
144	2015-04-08 20:13:33.565155+03	6	Neighbors	1		23	5
145	2015-04-08 20:13:36.879317+03	5	Financial	2	Changed order.	23	5
146	2015-04-08 20:13:50.998822+03	7	Cooking	1		23	5
147	2015-04-08 20:13:59.819632+03	8	Holidays	1		23	5
148	2015-04-08 20:14:06.115384+03	8	Holidays	2	Changed order.	23	5
149	2015-04-08 20:14:15.500647+03	9	Kids	1		23	5
150	2015-04-13 21:44:31.497159+03	5	ryan	2	No fields changed.	3	5
151	2015-04-13 21:55:19.841056+03	5	ryan	2	Changed password.	3	5
152	2015-04-13 21:57:18.102188+03	6	waterford-test	2	Changed is_active.	3	5
153	2015-04-13 21:57:28.365673+03	7	rcn	2	Changed is_active, is_staff and is_superuser.	3	5
154	2015-04-13 22:59:56.595949+03	5	ryan	2	Changed is_active, is_staff and is_superuser.	3	5
155	2015-04-15 19:11:23.611207+03	5	ryan	2	Changed is_active, is_staff and is_superuser.	3	9
156	2015-04-15 19:13:26.211203+03	9	doc4rcn	2	Changed is_active.	3	9
157	2015-04-15 19:16:02.807597+03	2	RCN header logo white	1		25	5
158	2015-04-15 19:29:01.233942+03	1	Welcome	2	Changed image.	18	5
159	2015-04-16 03:02:41.730541+03	6	News	2	Changed image_cover.	27	5
160	2015-04-16 03:06:21.420138+03	1	Welcome	2	Changed image.	18	5
161	2015-04-16 11:17:03.24666+03	2	communities/realclearneighborhoods.com/waterford-estates	2	Changed domain.	6	5
162	2015-04-16 11:17:15.346207+03	2	community/realclearneighborhoods.com/waterford-estates	2	Changed domain.	6	5
163	2015-04-20 05:34:03.051136+03	1	Social Media	2	Added Social Link "Twitter". Changed image for Social Link "Facebook". Changed image for Social Link "LinkedIn".	29	5
164	2015-04-20 05:34:26.823667+03	1	Social Media	2	Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	29	5
165	2015-04-20 05:38:10.147984+03	1	Social Media	2	Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	29	5
166	2015-04-20 05:40:05.110889+03	1	Social Media	2	Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	29	5
167	2015-04-20 05:46:27.449749+03	4	community/realclearneighborhoods.com	1		6	5
168	2015-04-20 05:47:11.675123+03	5	waterford-estates	1		6	5
169	2015-04-20 05:48:47.349193+03	2	RCN header logo white	2	Changed site and image.	25	5
170	2015-04-20 05:48:59.565596+03	1	Real Clear Corporate	2	Changed site and image.	25	5
171	2015-04-20 05:56:15.264925+03	4	community/realclearneighborhoods.com	3		6	5
172	2015-04-20 05:56:15.266688+03	1	community.realclearneighborhoods.com/mission-hills-estates	3		6	5
173	2015-04-20 05:56:15.267323+03	3	community.realclearneighborhoods.com/sunbridge-villas	3		6	5
174	2015-04-20 05:56:15.267923+03	5	waterford-estates	3		6	5
175	2015-04-20 05:56:22.40914+03	2	community/realclearneighborhoods.com/waterford-estates	2	No fields changed.	6	5
176	2015-04-20 05:57:00.923801+03	2	community/realclearneighborhoods.com/waterford-estates	2	No fields changed.	6	5
177	2015-04-20 05:57:23.802267+03	6	Neighbors	3		23	5
178	2015-04-20 05:57:23.814927+03	5	Financial	3		23	5
179	2015-04-20 05:57:23.815897+03	7	Cooking	3		23	5
180	2015-04-20 05:57:23.816716+03	8	Holidays	3		23	5
181	2015-04-20 05:59:35.689664+03	2	waterford-estates	2	Changed domain.	6	5
182	2015-04-20 06:18:54.604627+03	6	realclearneighborhoods.com	1		6	5
183	2015-04-20 06:19:05.458824+03	3	RCN header logo white	1		25	5
184	2015-04-20 06:19:34.104023+03	7	http://doc4rcn.webfactional.com	1		6	5
185	2015-04-20 06:27:36.98923+03	8	/www.realclearneighborhoods.com/	1		6	5
186	2015-04-20 06:27:43.960763+03	3	RCN header logo white	2	Changed site and image.	25	5
187	2015-04-20 06:30:07.235061+03	2	fuck	1		29	5
188	2015-04-20 06:31:48.087049+03	7	http://doc4rcn.webfactional.com	3		6	5
189	2015-04-20 06:31:48.093025+03	6	realclearneighborhoods.com	3		6	5
190	2015-04-20 06:31:48.093987+03	8	/www.realclearneighborhoods.com/	3		6	5
191	2015-04-20 06:32:02.69478+03	9	example	1		6	5
192	2015-04-20 06:33:23.047927+03	4	fuck this	1		25	5
193	2015-04-20 06:57:10.649744+03	9	example.com	2	Changed domain and name.	6	5
194	2015-04-20 06:58:25.392447+03	2	Social Media	2	Changed site and label. Added Social Link "twitter". Changed image for Social Link "facebook".	29	5
195	2015-04-20 08:57:08.671194+03	4	Real Clear Corporate	2	Changed label and image.	25	5
196	2015-04-20 09:00:26.499565+03	2	Social Media	2	Added Social Link "linkedin". Changed image for Social Link "facebook". Changed image for Social Link "twitter".	29	5
197	2015-04-20 09:04:35.541887+03	2	http://community.realclearneighborhoods.com/waterford-estates	2	Changed domain.	6	5
198	2015-04-20 09:05:18.670215+03	10	http://community.realclearneighborhoods.com/sunbridge-villas	1		6	5
199	2015-04-20 09:05:31.036219+03	11	http://community.realclearneighborhoods.com	1		6	5
200	2015-04-20 14:44:17.146799+03	11	http://community.realclearneighborhoods.com	3		6	5
201	2015-04-20 14:44:17.232822+03	10	http://community.realclearneighborhoods.com/sunbridge-villas	3		6	5
202	2015-04-20 14:44:17.233958+03	2	http://community.realclearneighborhoods.com/waterford-estates	3		6	5
203	2015-04-20 14:44:29.587198+03	4	Real Clear Corporate	2	Changed image.	25	5
204	2015-04-20 15:10:20.451008+03	9	example.com	3		6	5
205	2015-04-20 15:11:06.677354+03	12	doc4rcn.webfactional.com	1		6	5
206	2015-04-20 15:12:42.179905+03	3	Social Media	1		29	5
207	2015-04-20 15:13:01.728449+03	5	RCN Corporate Logo	1		25	5
208	2015-04-20 15:13:31.735679+03	12	example.com	2	Changed domain and name.	6	5
209	2015-04-20 15:13:40.892358+03	5	RCN Corporate Logo	2	Changed image.	25	5
210	2015-04-20 15:13:45.546779+03	3	Social Media	2	Changed image for Social Link "facebook".	29	5
211	2015-04-20 17:56:21.926411+03	3	Social Media	2	Added Social Link "twitter". Changed image for Social Link "facebook".	29	5
212	2015-04-20 17:56:29.841348+03	3	Social Media	2	Changed image for Social Link "facebook". Changed image for Social Link "twitter".	29	5
213	2015-04-20 17:56:51.98605+03	3	Social Media	2	Added Social Link "linkedin". Changed image for Social Link "facebook". Changed image for Social Link "twitter".	29	5
214	2015-04-20 17:58:27.408614+03	13	http://community.realclearneighborhoods.com/waterford-estates	1		6	5
215	2015-04-20 17:58:46.391373+03	13	realclearneighborhoods.com/waterford-estates	2	Changed domain.	6	5
216	2015-04-20 17:59:07.525508+03	14	realclearneighborhoods.com/sunbridge-villas	1		6	5
217	2015-04-20 17:59:48.0365+03	15	realclearneighborhoods.com/mission-hills	1		6	5
218	2015-04-20 18:00:08.842755+03	13	realclearneighborhoods.com/waterford-estates	2	No fields changed.	6	5
219	2015-04-20 18:01:19.61235+03	12	Welcome	1		27	5
220	2015-04-20 18:01:42.113493+03	12	Welcome	3		27	5
221	2015-04-24 00:40:12.622803+03	10	nathanl	2	Changed first_name and last_name.	3	10
222	2015-04-24 00:41:25.634251+03	3	Social Media	2	Changed site. Changed image for Social Link "facebook". Changed image for Social Link "twitter". Changed image for Social Link "linkedin".	29	10
223	2015-04-24 00:41:51.182607+03	3	Social Media	2	Changed site. Changed image for Social Link "facebook". Changed image for Social Link "twitter". Changed image for Social Link "linkedin".	29	10
224	2015-04-24 00:42:35.504348+03	3	Social Media	2	Changed site. Changed image for Social Link "facebook". Changed image for Social Link "twitter". Changed image for Social Link "linkedin".	29	10
225	2015-04-26 02:28:57.637841+03	5	RCN Corporate Logo	2	Changed site and image.	25	5
226	2015-04-26 02:50:41.145774+03	3	Social Media	2	Changed image for Social Link "facebook". Changed image for Social Link "twitter". Changed image for Social Link "linkedin".	29	5
227	2015-04-26 02:51:04.72445+03	3	Social Media	2	Changed image for Social Link "facebook". Changed image for Social Link "twitter". Changed image for Social Link "linkedin".	29	5
228	2015-04-26 03:34:06.463534+03	3	About Us	2	Changed template_choice, template_addon and image_cover.	27	5
229	2015-04-26 03:34:22.80937+03	3	About Us	2	Changed template_choice, template_addon and image_cover.	27	5
230	2015-04-26 03:35:10.101298+03	3	About Us	2	Changed template_addon and image_cover.	27	5
231	2015-04-26 03:51:47.044411+03	1	WHAT WE DO	2	Changed label, question and answer.	26	5
232	2015-04-26 03:52:18.580847+03	2	Why We Do It?	2	Changed label, question and answer.	26	5
233	2015-04-26 03:52:47.612573+03	3	Our Philosophy?	2	Changed label, question and answer.	26	5
234	2015-04-26 03:53:05.897259+03	1	What We Do	2	Changed label.	26	5
235	2015-04-26 03:54:18.029297+03	4	About Us - FAQs	2	Changed image_cover.	27	5
236	2015-04-26 03:54:43.389323+03	3	About Us	2	Changed image_cover.	27	5
237	2015-04-26 03:55:07.210637+03	10	What We Do	2	Changed image_cover.	27	5
238	2015-04-26 03:55:46.968973+03	1	Solutions: Landing Page	2	Changed image_cover. Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed image for Section "Community Resources".	27	5
239	2015-04-26 03:56:13.16078+03	1	Solutions: Landing Page	2	Changed image_cover. Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed image for Section "Community Resources".	27	5
240	2015-04-26 03:57:14.213272+03	1	Solutions: Landing Page	2	Changed image_cover. Changed image for Section "Document Management". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed image for Section "Community Resources".	27	5
241	2015-04-26 03:58:15.640291+03	6	News	2	Changed image_cover.	27	5
242	2015-04-26 04:00:16.555423+03	4	Conflicting Interests by Ryan Hodson	2	Changed image, teaser and content.	24	5
243	2015-04-26 04:00:46.14898+03	4	Conflicting Interests by Ryan Hodson	2	Changed image.	24	5
244	2015-04-26 04:02:45.307825+03	2	What is a Homeowner Association? by Ryan Hodson	2	Changed image, teaser and content.	24	5
245	2015-04-27 21:13:08.407257+03	4	Association Management	2	Changed parent.	22	5
246	2015-04-27 21:13:14.735091+03	6	Community Resources	2	Changed parent.	22	5
247	2015-04-27 21:13:19.210116+03	3	Document Management	2	Changed parent.	22	5
248	2015-04-27 21:13:22.822222+03	5	Financial Management	2	Changed parent.	22	5
249	2015-04-27 21:13:31.146517+03	7	FAQs	2	Changed parent.	22	5
250	2015-04-27 23:21:17.822756+03	4	Collective Intelligence	2	Added Slide Show Image "ipad at angle". Changed image and order for Slide Show Image "Macbook". Changed image and order for Slide Show Image "iPad".	16	5
251	2015-04-28 18:29:51.592914+03	3	Social Media	2	Changed image for Social Link "facebook". Changed image for Social Link "twitter". Changed image for Social Link "linkedin".	29	5
252	2015-04-28 18:30:14.499818+03	3	Social Media	2	Changed image for Social Link "facebook". Changed image for Social Link "twitter". Changed image for Social Link "linkedin".	29	5
253	2015-04-28 18:31:03.95159+03	3	Home Improvement	2	Changed label.	23	5
254	2015-04-28 18:31:18.707045+03	9	Kids	2	Changed order.	23	5
255	2015-04-28 18:31:46.728092+03	1	Community	2	Changed order.	23	5
256	2015-04-28 18:31:46.730445+03	2	News	2	Changed order.	23	5
257	2015-04-28 18:31:46.732027+03	3	Home Improvement	2	Changed order.	23	5
258	2015-04-28 18:31:46.733592+03	9	Kids	2	Changed order.	23	5
259	2015-04-28 22:22:20.122145+03	1	General Administration	1		2	10
260	2015-04-28 22:22:35.834415+03	8	Andy	2	Changed is_superuser and groups.	3	10
261	2015-05-21 01:05:21.458062+03	1	Welcome	2	Changed image.	18	5
262	2015-05-21 01:08:46.629581+03	1	Welcome	2	Changed image.	18	5
263	2015-05-23 07:00:30.504444+03	3	About Us	2	Changed template_choice, template_addon and image_cover.	27	5
264	2015-05-23 07:01:02.536005+03	3	About Us	2	Changed template_choice, template_addon and image_cover.	27	5
265	2015-05-28 17:55:41.550803+03	1	Welcome	2	Changed image.	18	5
266	2015-05-29 09:20:26.404023+03	1	Welcome	2	Changed image.	18	5
267	2015-05-30 19:55:48.512894+03	2	banner test-1	1		18	5
268	2015-05-30 19:56:33.11534+03	3	banner test-2	1		18	5
269	2015-05-30 19:57:22.785792+03	4	banner test-3	1		18	5
270	2015-05-30 19:58:05.178914+03	1	Welcome	2	Changed order.	18	5
271	2015-06-05 17:09:54.808188+03	2	banner test-1	3		18	5
272	2015-06-05 17:09:55.037793+03	3	banner test-2	3		18	5
273	2015-06-05 17:09:55.039023+03	4	banner test-3	3		18	5
274	2015-06-05 17:09:54.920558+03	2	banner test-1	3		18	5
275	2015-06-05 17:09:55.216501+03	3	banner test-2	3		18	5
276	2015-06-05 17:09:55.262765+03	4	banner test-3	3		18	5
277	2015-06-05 17:12:45.569164+03	5	RCN Network	1		18	5
278	2015-06-05 18:38:16.245336+03	6	RCN Network banner 2	1		18	5
279	2015-06-05 18:38:29.732532+03	5	RCN Network	2	Changed order.	18	5
280	2015-06-05 18:38:29.737175+03	1	Welcome	2	Changed is_published.	18	5
281	2015-06-05 18:39:20.434321+03	7	RCN Network banner 3	1		18	5
282	2015-06-08 21:25:08.145343+03	10	What We Do	2	Changed template_choice and image_cover.	27	5
283	2015-06-08 21:26:34.244756+03	10	What We Do	2	Changed image_cover. Added Section "Association Management".	27	5
284	2015-06-08 21:27:09.092441+03	10	What We Do	2	Changed image_cover. Added Section "Document Management". Changed image for Section "Association Management".	27	5
285	2015-06-08 21:27:47.481017+03	10	What We Do	2	Changed image_cover. Added Section "Financial Management". Changed image for Section "Association Management". Changed image for Section "Document Management".	27	5
286	2015-06-08 21:28:24.914151+03	10	What We Do	2	Changed image_cover. Added Section "Community Resources". Changed image for Section "Association Management". Changed image for Section "Financial Management". Changed image and display_order for Section "Document Management".	27	5
287	2015-06-08 21:30:44.130103+03	1	Solutions: Landing Page	2	Changed image_cover. Deleted Section "Document Management". Deleted Section "Association Management". Deleted Section "Financial Management". Deleted Section "Community Resources".	27	5
288	2015-06-08 21:31:03.272261+03	1	Solutions 	2	Changed template_choice, label and image_cover.	27	5
289	2015-06-08 21:31:46.252406+03	1	Solutions 	2	Changed template_choice, template_addon and image_cover.	27	5
290	2015-06-08 21:31:57.142648+03	1	Solutions 	2	Changed template_choice and image_cover.	27	5
291	2015-06-08 21:32:16.901852+03	1	Solutions 	2	Changed template_choice and image_cover.	27	5
292	2015-06-08 21:32:41.201862+03	1	Solutions 	2	Changed template_choice and image_cover.	27	5
293	2015-06-08 21:37:32.240606+03	1	Solutions 	2	Changed template_choice and image_cover.	27	5
294	2015-06-08 21:40:36.219203+03	7	Solutions: Association Management	2	Changed image_cover and slug.	27	5
295	2015-06-08 21:40:45.924726+03	7	What We Do: Association Management	2	Changed label and image_cover.	27	5
296	2015-06-08 21:41:29.356862+03	9	Solutions: Financial Management	2	Changed image_cover and slug.	27	5
297	2015-06-08 21:41:40.385026+03	9	What We Do: Financial Management	2	Changed label and image_cover.	27	5
298	2015-06-08 21:41:56.583516+03	2	What We Do: Document Management	2	Changed label and image_cover.	27	5
299	2015-06-08 21:42:06.711354+03	2	What We Do: Document Management	2	Changed image_cover and slug.	27	5
300	2015-06-08 21:42:29.753541+03	8	What We Do: Community Resources	2	Changed label, image_cover and slug.	27	5
301	2015-06-08 21:46:27.108541+03	1	Solutions 	2	Changed template_choice and image_cover.	27	5
302	2015-06-08 21:46:40.281301+03	1	Solutions 	2	Changed template_choice and image_cover.	27	5
303	2015-06-09 23:06:55.24893+03	5	RCN Network	2	Changed image.	18	5
304	2015-06-12 17:17:46.304641+03	5	RCN Network	2	Changed image.	18	5
305	2015-06-12 17:29:06.737384+03	5	RCN Network	2	Changed image.	18	5
306	2015-06-12 17:29:48.939883+03	6	RCN Network banner 2	3		18	5
307	2015-06-12 17:29:48.993916+03	7	RCN Network banner 3	3		18	5
308	2015-06-12 17:29:48.994671+03	1	Welcome	3		18	5
309	2015-06-13 18:12:53.471687+03	8	size x scale x area of focus banner test	1		18	5
310	2015-06-13 18:13:20.459816+03	5	RCN Network	2	Changed is_published.	18	5
311	2015-06-14 18:36:37.190107+03	9	banner-shadow-depth-mockup-1750x484-1	1		18	5
312	2015-06-14 18:36:49.591338+03	10	banner-shadow-depth-mockup-1750x484-1	1		18	5
313	2015-06-14 18:37:19.3192+03	9	banner-shadow-depth-mockup-1750x484-1	2	Changed is_published.	18	5
314	2015-06-14 18:37:19.3579+03	8	size x scale x area of focus banner test	2	Changed is_published.	18	5
315	2015-06-14 18:38:47.896739+03	11	shadow	1		18	5
316	2015-06-14 18:39:19.882804+03	12	shadow 3	1		18	5
317	2015-06-14 18:39:34.139315+03	10	banner-shadow-depth-mockup-1750x484-1	2	Changed order.	18	5
318	2015-06-14 18:39:34.141821+03	11	shadow	2	Changed order.	18	5
319	2015-06-14 18:39:34.143637+03	12	shadow 3	2	Changed order.	18	5
320	2015-06-14 18:39:49.255393+03	9	banner-shadow-depth-mockup-1750x484-1	3		18	5
321	2015-06-14 18:39:49.262937+03	5	RCN Network	3		18	5
322	2015-06-14 18:39:49.263605+03	8	size x scale x area of focus banner test	3		18	5
323	2015-06-14 18:40:28.979302+03	13	size-and-scale-test-1750x458	1		18	5
324	2015-06-23 15:48:03.803645+03	13	size-and-scale-test-1750x458	2	Changed image.	18	5
325	2015-06-23 15:48:34.937645+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed label and image.	18	5
326	2015-06-23 15:49:36.100987+03	10	banner-rcn-network	2	Changed label and image.	18	5
327	2015-06-23 15:50:24.961848+03	11	rcn-billboard-icon-shadow	2	Changed label and image.	18	5
328	2015-06-23 15:50:35.872761+03	12	shadow 3	3		18	5
329	2015-06-23 15:51:26.496134+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image, header and sub_header.	18	5
330	2015-06-23 15:52:13.476071+03	10	banner-rcn-network	2	Changed image, header and sub_header.	18	5
331	2015-06-23 15:52:29.4335+03	11	rcn-billboard-icon-shadow	2	Changed image, header and sub_header.	18	5
332	2015-06-23 17:51:33.960174+03	11	green-neighborhood-banner-rcn	2	Changed label, image and header.	18	5
333	2015-06-23 17:51:45.92266+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed order.	18	5
334	2015-06-23 17:51:45.92475+03	11	green-neighborhood-banner-rcn	2	Changed order.	18	5
335	2015-06-23 17:52:26.11753+03	11	green-neighborhood-banner-rcn	2	Changed is_published.	18	5
336	2015-06-23 17:52:26.119941+03	10	banner-rcn-network	2	Changed is_published.	18	5
337	2015-06-23 18:11:37.745406+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image, header and sub_header.	18	5
338	2015-06-26 17:29:40.671014+03	2	New Neighbors	2	Changed image.	20	5
339	2015-06-26 17:29:52.3437+03	2	Developers	2	Changed label and image.	20	5
340	2015-06-26 17:40:09.924237+03	1	Homeowners	2	Changed label and image.	20	5
341	2015-06-26 17:57:11.177901+03	3	Local Business	2	Changed label and image.	20	5
342	2015-06-26 18:22:57.354182+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle". Changed image for Slide Show Image "Macbook". Changed image for Slide Show Image "iPad".	16	5
343	2015-06-26 18:23:09.078011+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle". Deleted Slide Show Image "Macbook". Deleted Slide Show Image "iPad".	16	5
344	2015-06-26 18:23:19.807826+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
345	2015-06-26 18:26:50.372945+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
346	2015-06-26 18:30:07.856656+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
347	2015-07-13 15:55:17.44698+03	1	Association Management	2	Changed image and link.	19	5
348	2015-07-13 15:56:05.33664+03	2	Document Management	2	Changed image and link.	19	5
349	2015-07-13 15:56:28.138099+03	4	Financial Management	2	Changed image and link.	19	5
350	2015-07-13 15:57:30.858762+03	4	Financial Management	2	Changed image and link.	19	5
351	2015-07-15 00:04:09.754683+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "Homeowners". Changed image for Slide Show Image "ipad_screen2".	16	5
352	2015-07-15 00:06:15.03563+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
353	2015-07-15 00:06:39.649072+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "ipad_screen2". Deleted Slide Show Image "Homeowners".	16	5
354	2015-07-15 10:48:15.292354+03	3	Built For Homeowners	2	Changed image_background. Changed label, image and order for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
355	2015-07-15 10:50:07.489938+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
356	2015-07-15 10:52:41.455498+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
357	2015-07-15 10:54:55.109696+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
358	2015-07-15 10:56:01.727747+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
359	2015-07-15 10:57:18.17986+03	3	Built For Homeowners	2	Changed image_background and background_size. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
360	2015-07-15 10:57:34.589919+03	3	Built For Homeowners	2	Changed image_background and background_size. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
361	2015-07-15 10:57:54.301204+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
362	2015-07-15 11:01:03.145759+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
363	2015-07-15 11:01:21.968927+03	3	Built For Homeowners	2	Changed image_background and background_size. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
364	2015-07-15 11:01:46.860995+03	3	Built For Homeowners	2	Changed image_background and background_size. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
365	2015-07-15 11:05:53.670429+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
366	2015-07-15 11:06:38.827118+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
367	2015-07-15 11:08:17.122835+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
368	2015-07-15 11:14:05.891681+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
369	2015-07-15 11:15:35.125064+03	5	The RCN Difference	2	Changed image_background.	16	5
370	2015-07-15 11:16:00.760603+03	3	Built For Homeowners	2	Changed image_background. Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
371	2015-07-15 11:19:41.425699+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
372	2015-07-15 11:22:46.740403+03	6	Who We Benefit The Most	2	Changed image_background.	16	5
373	2015-07-16 00:27:09.518594+03	11	benj	2	Changed first_name and last_name.	3	11
374	2015-07-19 17:42:45.32613+03	3	Built For Homeowners	2	Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
375	2015-07-19 18:05:04.389899+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
376	2015-07-19 18:10:03.047112+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
377	2015-07-19 18:17:07.922609+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
378	2015-07-19 18:17:50.139828+03	3	Built For Homeowners	2	Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
379	2015-07-19 18:18:31.887686+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
380	2015-07-19 18:19:53.66221+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
381	2015-07-19 18:20:16.691557+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
382	2015-07-19 18:20:48.334224+03	4	Collective Intelligence	2	Changed image for Slide Show Image "ipad at angle".	16	5
383	2015-07-20 04:10:40.813324+03	3	Built For Homeowners	2	Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
384	2015-07-20 04:10:48.55683+03	3	Built For Homeowners	2	Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
385	2015-07-20 04:16:03.560087+03	3	Built For Homeowners	2	Changed image for Slide Show Image "circle and house made of people Real Clear Neighborhoods".	16	5
386	2015-07-20 14:37:19.141424+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image.	18	5
387	2015-07-20 14:42:17.729191+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image.	18	5
388	2015-07-21 02:01:28.345516+03	10	banner-rcn-network	2	Changed image, publish_date and is_published.	18	5
389	2015-07-21 02:21:26.985872+03	11	green-neighborhood-banner-rcn	2	Changed image, publish_date and is_published.	18	5
390	2015-07-21 02:25:02.008471+03	11	green-neighborhood-banner-rcn	2	Changed image.	18	5
391	2015-07-21 05:44:39.985218+03	11	green-neighborhood-banner-rcn	2	Changed is_published.	18	5
392	2015-07-21 05:44:40.094251+03	10	banner-rcn-network	2	Changed is_published.	18	5
393	2015-07-22 03:17:42.208115+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image.	18	5
394	2015-07-22 03:19:05.330375+03	10	banner-rcn-network	2	Changed image and is_published.	18	5
395	2015-07-22 03:20:37.940488+03	11	green-neighborhood-banner-rcn	2	Changed image.	18	5
396	2015-07-22 03:20:45.942664+03	11	green-neighborhood-banner-rcn	2	Changed image and is_published.	18	5
397	2015-07-22 17:58:47.883553+03	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed label, image, header, sub_header and publish_date.	18	5
398	2015-07-22 18:00:37.199004+03	10	banner-rcn-network	2	Changed is_published.	18	5
399	2015-07-22 18:00:37.201464+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed is_published.	18	5
400	2015-07-22 19:09:07.821494+03	10	banner-rcn-network	2	Changed is_published.	18	5
401	2015-07-27 16:33:55.885263+03	2	Andy Hague	2	Changed name, position, order, image and is_published. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter".	31	5
402	2015-07-27 16:33:58.711102+03	2	Andy Hague	2	Changed image. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter".	31	5
403	2015-07-27 16:34:16.420358+03	1	Ryan Hodson	2	Changed position, order, image and is_published. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	31	5
404	2015-07-27 16:34:24.182871+03	1	Ryan Hodson	2	Changed image. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	31	5
405	2015-07-29 18:24:16.143393+03	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image.	18	5
406	2015-07-29 18:44:40.122969+03	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image.	18	5
407	2015-07-29 18:58:38.006373+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image, publish_date and is_published.	18	5
408	2015-08-14 01:24:47.116231+03	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image.	18	5
409	2015-08-14 01:28:05.830487+03	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image.	18	5
410	2015-08-14 01:28:13.961348+03	10	banner-rcn-network	2	Changed image.	18	5
411	2015-08-14 01:28:20.518536+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image.	18	5
412	2015-08-14 01:28:54.844782+03	13	rcp-green-neighborhood-banner-main-landing	2	Changed image.	18	5
413	2015-10-01 06:12:52.485901+03	2	dcrum	2	Changed password.	3	2
414	2016-02-06 21:02:49.420002+02	2	Andy Hague	2	Changed image and is_published. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter".	31	5
415	2016-02-06 21:02:59.397506+02	2	Andy Hague	2	Changed image. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter".	31	5
416	2016-02-08 16:29:31.346774+02	1	Ryan Hodson	2	Changed image and is_published. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	31	5
417	2016-02-08 16:47:50.285763+02	3	Carolina Caldera	1		31	5
418	2016-02-08 16:50:19.78765+02	2	Andy	2	Changed name, image, teaser and bio. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter".	31	5
419	2016-02-08 16:54:27.343083+02	1	Ryan	2	Changed name, image, teaser and bio. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	31	5
420	2016-02-08 16:55:14.635665+02	3	Carolina	2	Changed name, image, teaser and bio.	31	5
421	2016-02-08 17:03:13.993837+02	2	Andy	2	Changed image. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter".	31	5
422	2016-02-08 17:03:29.70293+02	1	Ryan	2	Changed image. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	31	5
423	2016-02-08 17:03:45.42807+02	3	Carolina	2	Changed image.	31	5
424	2016-02-08 20:47:10.032553+02	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image.	18	5
425	2016-02-08 20:48:39.918923+02	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image.	18	5
426	2016-02-08 20:49:05.951204+02	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image.	18	5
427	2016-02-08 20:49:38.500351+02	11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	2	Changed image, header and sub_header.	18	5
428	2016-02-08 20:49:47.946574+02	10	banner-rcn-network	2	Changed image and header.	18	5
429	2016-02-08 20:49:56.878264+02	13	rcp-green-neighborhood-banner-main-landing	2	Changed image, header and sub_header.	18	5
430	2016-05-19 23:38:42.422514+03	9	What We Do: Financial Management	2	Changed image_cover.	27	5
431	2016-05-19 23:44:21.940414+03	2	What We Do: Document Management	2	Changed image_cover.	27	5
432	2016-05-19 23:44:53.21367+03	7	What We Do: Association Management	2	Changed image_cover.	27	5
433	2016-05-20 20:20:05.620267+03	1	Ryan	2	Changed image. Changed image for Social Link "Facebook". Changed image for Social Link "Twitter". Changed image for Social Link "LinkedIn".	31	5
434	2016-05-20 20:22:07.578295+03	4	Conflicting Interests by Ryan Hodson	2	Changed image.	24	5
435	2016-05-20 20:25:28.832763+03	4	Conflicting Interests by Ryan Hodson	2	Changed image.	24	5
436	2016-05-20 20:37:09.979493+03	4	Conflicting Interests by Ryan Hodson	2	Changed image.	24	5
437	2016-05-20 20:43:48.803525+03	2	What is a Homeowner Association? by Ryan Hodson	2	Changed image.	24	5
438	2016-05-20 22:38:40.340096+03	16	realclearneighborhoods.com/silo-falls	1		6	5
439	2016-08-09 07:47:09.772902+03	17	realclearneighborhoods.com/brighton-heights	1		6	5
440	2016-08-09 07:49:42.85916+03	17	realclearneighborhoods.com/brighton-heights	2	No fields changed.	6	5
441	2016-09-01 19:22:03.396047+03	5	Contact Us	2	Changed image_cover.	27	5
442	2016-09-08 00:07:35.200312+03	18	/clabber-creek-3	1		6	5
443	2016-09-08 00:07:46.757201+03	18	realclearneighborhoods.com/clabber-creek-3	2	Changed domain.	6	5
444	2016-09-08 17:19:58.306984+03	19	realclearneighborhoods.com/brentwood	1		6	5
445	2016-09-08 17:20:15.195197+03	20	realclearneighborhoods.com/bridgewater-estates	1		6	5
446	2016-09-08 17:20:37.162503+03	21	realclearneighborhoods.com/brighton-cottages	1		6	5
447	2016-09-08 17:21:05.543743+03	22	realclearneighborhoods.com/central-park-phase-4	1		6	5
448	2016-09-08 17:22:08.755448+03	23	realclearneighborhoods.com/copper-creek	1		6	5
449	2016-09-08 17:22:27.279264+03	24	realclearneighborhoods.com/cottages-at-old-wire	1		6	5
450	2016-09-08 17:22:46.038458+03	25	realclearneighborhoods.com/creek-meadows	1		6	5
451	2016-09-08 17:23:02.194751+03	26	realclearneighborhoods.com/sloan-estates	1		6	5
452	2016-09-08 17:23:19.291211+03	27	realclearneighborhoods.com/woodbury	1		6	5
453	2016-09-08 17:23:35.472959+03	28	realclearneighborhoods.com/lexington	1		6	5
454	2017-04-13 20:49:00.20841+03	12	jake@smallworldus.com	1		3	5
455	2017-04-13 20:49:44.895747+03	12	jake@smallworldus.com	2	Changed first_name, last_name, email, is_staff and is_superuser.	3	5
456	2017-05-11 23:48:31.924696+03	29	realclearneighborhoods.com/copper-creek	1		6	5
457	2017-06-14 23:46:22.439481+03	30	rcn-office	1		6	5
458	2018-12-11 19:26:02.388552+02	13	m.plaksia@hotmail.com	1		3	12
459	2018-12-11 19:26:26.531112+02	13	m.plaksia@hotmail.com	2	Changed is_staff and is_superuser.	3	12
460	2018-12-11 21:19:31.738129+02	51	Chris Allen	2	No fields changed.	10	13
461	2018-12-12 17:32:04.428473+02	13	Homeowners	1		27	12
462	2018-12-12 17:46:26.054924+02	13	Homeowners	2	Changed template_choice and image_cover. Added Section "Report a Violation".	27	12
463	2018-12-12 18:01:30.845924+02	14	Homeowners: Report a Violation	1		27	12
464	2018-12-12 18:04:03.469454+02	15	Homeowners: Maintenance Request	1		27	12
465	2018-12-12 18:04:50.471493+02	16	Architectural Review	1		27	12
466	2018-12-12 18:05:31.18228+02	16	Homeowners: Architectural Review	2	Changed label and image_cover.	27	12
467	2018-12-12 18:07:14.358043+02	3	Homeowners	2	Changed title and page. Added Sub Primary Navigation "Work Request". Added Sub Primary Navigation "Architectural Review". Changed title and page for Sub Primary Navigation "Report a Violation".	21	12
468	2018-12-12 18:08:42.820102+02	17	Homeowners: Find Your Neighborhood	1		27	12
469	2018-12-12 18:09:16.979394+02	3	Homeowners	2	Added Sub Primary Navigation "Find Your Neighborhood". Changed order for Sub Primary Navigation "Report a Violation". Changed order for Sub Primary Navigation "Work Request". Changed order for Sub Primary Navigation "Architectural Review".	21	12
470	2018-12-12 18:09:37.890987+02	17	Homeowners: Find Your Neighborhood	2	Changed template_choice and image_cover.	27	12
471	2018-12-12 18:11:19.548214+02	13	Homeowners	2	Changed image_cover.	27	12
472	2018-12-12 18:16:24.790965+02	18	Townhomes at the Arbors	1		27	12
473	2018-12-12 18:18:01.397144+02	13	Homeowners	2	Changed template_choice and image_cover.	27	12
474	2018-12-12 18:18:39.63419+02	13	Homeowners	2	Changed template_choice and image_cover.	27	12
475	2018-12-12 18:30:59.237844+02	17	Homeowners: Find Your Neighborhood	2	Changed image_cover. Added Section "The Townhomes at the Arbors".	27	12
476	2018-12-12 19:21:59.019974+02	17	Homeowners: Find Your Neighborhood	2	Changed template_choice and image_cover.	27	5
477	2018-12-12 19:22:22.1399+02	17	Homeowners: Find Your Neighborhood	2	Changed template_choice and image_cover.	27	5
478	2018-12-12 19:22:51.43507+02	17	Homeowners: Find Your Neighborhood	2	Changed template_choice and image_cover.	27	5
479	2018-12-12 19:31:30.990144+02	13	Homeowners	2	Changed image_cover. Changed label and image for Section "Find Your Neighborhood".	27	5
480	2018-12-12 19:40:39.134909+02	17	Homeowners: Find Your Neighborhood	2	Changed image_cover. Deleted Section "The Townhomes at the Arbors".	27	5
481	2018-12-12 19:43:03.882133+02	13	Homeowners	2	Changed image_cover. Added Section "Report a Violation". Added Section "Work Request". Added Section "Architectural Review". Changed image for Section "Find Your Neighborhood".	27	5
482	2018-12-12 19:43:35.112878+02	13	Homeowners	2	Changed image_cover. Changed display_order for Section "Architectural Review". Changed image for Section "Find Your Neighborhood". Changed display_order for Section "Work Request".	27	5
483	2018-12-12 19:45:10.335122+02	19	Neighborhoods	1		27	5
484	2018-12-12 19:58:01.442163+02	13	Homeowners	2	Changed image_cover. Changed image for Section "Find Your Neighborhood". Changed image for Section "Report a Violation".	27	5
485	2018-12-12 22:42:14.412572+02	3	Homeowners	2	Changed title for Sub Primary Navigation "Neighborhoods".	21	12
486	2018-12-12 22:42:39.99038+02	17	Homeowners: Find Your Neighborhood	2	Changed template_choice and image_cover.	27	12
487	2018-12-12 22:52:34.767325+02	18	Townhomes at the Arbors	2	Changed template_choice and image_cover.	27	12
488	2018-12-12 22:55:10.203522+02	20	Report Violation	1		27	12
489	2018-12-12 22:55:37.022772+02	21	Work Request	1		27	12
490	2018-12-12 22:56:05.250493+02	22	Architectural Review	1		27	12
491	2018-12-12 22:57:22.524639+02	19	Neighborhoods	2	Changed image_cover and meta_title.	27	12
492	2018-12-12 22:57:27.011469+02	22	Architectural Review	2	Changed image_cover.	27	12
493	2018-12-12 22:58:23.274095+02	17	Homeowners: Neighborhoods	2	Changed template_choice, label, image_cover, meta_title and slug.	27	12
494	2018-12-12 22:58:44.413286+02	19	Neighborhoods	3		27	12
495	2018-12-12 22:59:28.040778+02	23	Homeowners: Neighborhoods	1		27	12
496	2018-12-12 23:02:15.787656+02	18	Townhomes at the Arbors	3		27	12
497	2018-12-12 23:02:47.981746+02	24	Townhomes at the Arbors	1		27	12
498	2018-12-12 23:05:15.525634+02	11	Townhomes at the Arbors	1		22	12
499	2018-12-12 23:05:49.487365+02	11	Townhomes at the Arbors	3		22	12
500	2018-12-12 23:06:42.458124+02	24	Neighborhoods: Townhomes at the Arbors	2	Changed label, image_cover and slug.	27	12
501	2018-12-12 23:13:29.937833+02	8	What We Do: Community Resources	2	Changed image_cover.	27	12
502	2018-12-12 23:14:29.845038+02	8	What We Do: Landscape Maintenance	2	Changed label, image_cover, meta_title and slug.	27	12
503	2018-12-12 23:15:32.525407+02	22	Architectural Review	3		27	12
504	2018-12-12 23:15:32.527535+02	17	Homeowners: Neighborhoods	3		27	12
505	2018-12-12 23:15:32.528742+02	24	Neighborhoods: Townhomes at the Arbors	3		27	12
506	2018-12-12 23:15:32.529939+02	20	Report Violation	3		27	12
507	2018-12-12 23:15:32.530898+02	21	Work Request	3		27	12
508	2018-12-12 23:15:52.465325+02	6	News	2	Changed is_published.	27	12
509	2018-12-12 23:15:52.469994+02	1	Solutions 	2	Changed is_published.	27	12
510	2018-12-12 23:16:04.834066+02	6	News	2	Changed is_published.	27	12
511	2018-12-12 23:17:17.450067+02	3	Homeowners	2	Added Sub Primary Navigation "Neighborhoods".	21	12
512	2018-12-12 23:28:07.239564+02	25	Townhomes at the Arbors	1		27	12
513	2018-12-12 23:31:25.844947+02	25	Townhomes at the Arbors	3		27	12
514	2018-12-12 23:32:59.925467+02	23	Homeowners: Neighborhoods	2	Changed template_choice and image_cover.	27	12
515	2018-12-12 23:33:44.785667+02	23	Homeowners: Neighborhoods	2	Changed image_cover. Added Section "The Townhomes at the Arbors".	27	12
516	2018-12-12 23:35:59.164313+02	26	Townhomes at the Arbors	1		27	12
517	2018-12-12 23:37:10.402906+02	26	Homeowners: Neighborhoods: Townhomes at the Arbors	2	Changed label and image_cover.	27	12
518	2018-12-12 23:38:03.585571+02	26	Homeowners: Neighborhoods: Townhomes at the Arbors	3		27	12
519	2018-12-12 23:41:28.681677+02	1	Report Violation	2	Changed label, image and link.	19	12
520	2018-12-12 23:42:05.598251+02	2	Work Request	2	Changed label, image and link.	19	12
521	2018-12-12 23:42:15.930591+02	1	Report Violation	2	Changed image and link.	19	12
522	2018-12-12 23:43:42.412448+02	4	ARC Review	2	Changed label, image and link.	19	12
523	2018-12-12 23:44:45.756975+02	2	Work Request	2	Changed image and link.	19	12
524	2018-12-12 23:46:20.423131+02	27	Homeowners: Townhomes at the Arbors	1		27	12
525	2018-12-12 23:50:24.111291+02	27	Homeowners: Townhomes at the Arbors	2	Changed template_choice and image_cover.	27	12
526	2018-12-13 00:07:30.910532+02	13	Homeowners	2	Changed image_cover. Changed image for Section "Find Your Neighborhood". Changed image for Section "Report a Violation". Changed image for Section "Work Request". Changed image for Section "Architectural Review".	27	12
527	2018-12-19 19:03:30.310496+02	23	Homeowners: Neighborhoods	2	Changed image_cover. Added Section "Neighborhoods Managed by Real Clear Neighborhoods". Changed image and display_order for Section "The Townhomes at the Arbors".	27	12
528	2018-12-19 19:04:32.815004+02	23	Homeowners: Neighborhoods	2	Changed image_cover. Changed image and display_order for Section "The Townhomes at the Arbors". Deleted Section "Neighborhoods Managed by Real Clear Neighborhoods".	27	12
529	2018-12-22 03:09:23.965168+02	1	Boa	1		35	13
530	2018-12-22 03:27:00.713597+02	1	Report Violation	2	Changed image and link.	19	13
531	2018-12-22 03:27:15.013574+02	2	Work Request	2	Changed image and link.	19	13
532	2018-12-22 03:27:26.67728+02	4	ARC Review	2	Changed image and link.	19	13
533	2018-12-22 14:14:49.528532+02	3	Homeowners	2	Changed link for Sub Primary Navigation "Report a Violation".	21	13
534	2018-12-22 14:18:13.408253+02	3	Homeowners	2	Changed page and link for Sub Primary Navigation "Neighborhoods". Changed page for Sub Primary Navigation "Report a Violation". Changed page and link for Sub Primary Navigation "Work Request". Changed page and link for Sub Primary Navigation "Architectural Review".	21	13
535	2018-12-22 14:19:32.490652+02	3	Homeowners	2	Changed page and link for Sub Primary Navigation "Neighborhoods". Changed link for Sub Primary Navigation "Report a Violation". Changed link for Sub Primary Navigation "Work Request". Changed link for Sub Primary Navigation "Architectural Review".	21	13
536	2018-12-22 14:34:29.409253+02	16	Homeowners: Architectural Review	3		27	13
537	2018-12-22 14:34:29.416902+02	15	Homeowners: Maintenance Request	3		27	13
538	2018-12-22 14:34:29.420866+02	23	Homeowners: Neighborhoods	3		27	13
539	2018-12-22 14:34:29.424909+02	14	Homeowners: Report a Violation	3		27	13
540	2018-12-22 14:45:14.184297+02	28	Homeowners: Neighborhoods	1		27	13
541	2018-12-22 14:45:48.456651+02	3	Homeowners	2	Added Sub Primary Navigation "Neighborhoods".	21	13
542	2018-12-22 14:49:12.879562+02	1	Report Violation	2	Changed image and link.	19	13
543	2018-12-22 14:49:22.256283+02	2	Work Request	2	Changed image and link.	19	13
544	2018-12-22 14:49:31.259255+02	4	ARC Review	2	Changed image and link.	19	13
545	2018-12-22 14:49:59.63267+02	3	Homeowners	2	Changed link for Sub Primary Navigation "Report a Violation". Changed link for Sub Primary Navigation "Work Request". Changed link for Sub Primary Navigation "Architectural Review".	21	13
546	2018-12-22 14:52:25.23734+02	1	fdsfs	2	Changed assigned_admin and is_resolved.	37	13
547	2018-12-22 14:56:39.441892+02	3	Homeowners	2	Added Sub Primary Navigation "New Owner Request".	21	13
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	placeholder	front	placeholder
9	placeholder history	front	placeholderhistory
10	Contact Lead	forms	contactlead
11	Meeting Frequency	forms	meetingfrequency
12	Collection Process	forms	collectionprocess
13	Association Type	forms	associationtype
14	Common Property	forms	commonproperty
15	Proposal Request	forms	proposalrequest
16	Section	home_content	homesection
17	Slide Show Image	home_content	sectionslideshowimage
18	Billboard	home_content	billboard
19	Mini Billboard	home_content	minibillboard
20	Benefit Group	home_content	benefitgroup
21	Primary Navigation	navigation	primarynavigation
22	Sub Primary Navigation	navigation	subprimarynavigation
23	Tag	news	tag
24	Article	news	article
25	Logo	page_content	logo
26	FAQ	page_content	faq
27	Page	page_content	webpage
28	Section	page_content	pagesection
29	Footer	page_content	footer
30	Social Link	page_content	footersociallink
31	Staff Member	staff	member
32	Social Link	staff	membersociallink
33	revision	reversion	revision
34	version	reversion	version
35	community	questions	community
36	question part	questions	questionpart
37	Question	questions	question
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-02-17 03:48:00.981996+02
2	auth	0001_initial	2015-02-17 03:48:01.741109+02
3	admin	0001_initial	2015-02-17 03:48:03.19122+02
4	sessions	0001_initial	2015-02-17 03:48:03.573067+02
5	sites	0001_initial	2015-02-17 03:48:03.734376+02
6	questions	0001_initial	2018-12-22 02:17:07.137462+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1owx4awep5f1v5s2wmirsni69q48lutj	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-17 05:24:39.466051+02
mii8ljupmqy3mxyi3vvfrokn98wr69f2	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-08 21:28:36.377815+02
tqfaks4bdtjjvdpd5anfkrnancfeujwj	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-17 19:38:04.399052+02
ewnek6oo01xgqh3iq1tyes2n92gemqbo	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-18 20:11:05.223801+02
0yzcpaf7hw5luuzbsy9lr2ru2t6mof6b	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-08 22:08:54.544828+02
qytb6uq61fobm8jyt98lkaxkv0bhiun1	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-18 22:28:40.621599+02
w33wfhioiyq8bexexhno79b6ipuuw123	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-08 22:29:44.090154+02
xfpdcfvvotv967mxhkipvmoyu3ayga5j	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-09 13:40:11.478176+02
ejf65l1lg8ckycqf68a2hcx93c4w5jb4	M2Q5OWJmNDczYWRlNTI1ZWI2YWM1Nzk5MWY3MWIxYWQzMTU3MTI0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjYxZjBkYTU5YmQ2OWJmNTY0MzA2ZTkxZWI5ZmE3ZjExNjhkZWU3Y2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-18 23:12:13.204072+02
gtx431wr1b0b3jkm8txhf1tkhz7dytpi	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-09 14:43:05.902315+02
j8cs55bv2ln9j4a8ysmefe508gqmkxy4	M2Q5OWJmNDczYWRlNTI1ZWI2YWM1Nzk5MWY3MWIxYWQzMTU3MTI0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjYxZjBkYTU5YmQ2OWJmNTY0MzA2ZTkxZWI5ZmE3ZjExNjhkZWU3Y2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-18 23:37:00.237268+02
pxlviw9q5wtpinwjb2608ff1htbio7qv	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-19 00:05:04.922566+02
i7as6dm5ce3kqzvgf5khyiv1oybajc9u	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-02-19 00:27:09.283558+02
dm3q6dx5a6p3b3gzrd8k2brvicrx1jvk	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-09 17:05:21.472481+02
3gmy7gomrmvkps42dbe8jpxk91wdumku	M2Q5OWJmNDczYWRlNTI1ZWI2YWM1Nzk5MWY3MWIxYWQzMTU3MTI0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjYxZjBkYTU5YmQ2OWJmNTY0MzA2ZTkxZWI5ZmE3ZjExNjhkZWU3Y2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-19 00:49:57.766007+02
cs3lemz8ebriwqciqeqwxykwjkkmtkxl	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-19 01:46:09.955129+02
28l4wsh72um7marxv2vj7h44jih61kj4	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-02-19 01:51:48.755408+02
yugj22ocf9tgpxy2nunvs9qkggau0wr7	M2Q5OWJmNDczYWRlNTI1ZWI2YWM1Nzk5MWY3MWIxYWQzMTU3MTI0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjYxZjBkYTU5YmQ2OWJmNTY0MzA2ZTkxZWI5ZmE3ZjExNjhkZWU3Y2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-02-19 19:50:56.724702+02
eidrqudjqxu9shrepy55ia7brfwd7saq	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-19 20:14:34.256097+02
a4wnbuxq9xr7pxyc9dxbdu89ijtwa6ig	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-02-19 21:58:06.384885+02
0ira7c56m5oqxdjpu5k8p4kjc5cf6947	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-02-19 22:41:44.211665+02
2w21rf70bqog9fq34bk78ue6yt5mabsh	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-25 23:59:50.798187+02
y1u8dqz58stb68xdrp28tnaxjyb767y8	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-02-27 18:33:12.003024+02
466yd26snimi51c53xgrhjvrq7fi4eqc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-02-27 18:49:43.783659+02
dwl5hh621fmuzgycryy7xt16nlw5pta3	Yzg0N2E4MzJhOGNiMDRmZjcxMjI1OTk2Mjk5YzcxMWI4ZTM3ZmEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMxZWEzMjg3YWY3ODA1MzUyMzM3ZjAwNDUyOGRiNjA1ZTczNTQwNDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-02-27 19:14:12.690987+02
whzpw9s3povrenpdj3qhfcg0ti3tftd0	Yzg0N2E4MzJhOGNiMDRmZjcxMjI1OTk2Mjk5YzcxMWI4ZTM3ZmEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMxZWEzMjg3YWY3ODA1MzUyMzM3ZjAwNDUyOGRiNjA1ZTczNTQwNDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-02-28 01:52:53.434224+02
zldq0hzc9jpltps3nz73206s25jipovt	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-02 22:34:16.321976+02
rbu6gx4ympl6v8cqbxbzle3devdnvnve	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-03 21:39:05.612309+02
r6y157migwlj10hgs8smjvri2h7v4ae0	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-06 01:23:55.139927+02
h2sza5nkcjza919h7szkyfpq5zsn5u61	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-06 01:23:56.817737+02
zi371a8f1n3zpvjr9bupwcc2g88wvvpu	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-06 01:24:51.686916+02
mf8zhngiy2hr6ea7c8yh8ar22538hb8p	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-06 02:29:58.770658+02
4hp6q22wctklwvd1mviow5x5z1fddt43	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-06 02:41:06.826148+02
mqo1kf7cvvs0gdqarbdp2ytwdtz6kapu	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-09 13:41:01.210892+02
uy9wmco4nxe0gzln57ndcp93tyyz67uc	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-17 22:06:24.076306+02
jkqh87qpltc429hce79p89s93v3gi924	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-17 22:32:41.645999+02
hgb6vtkl5yd7ianrml36je1y6qavhntu	MGQ5YjMyOTk4YWYxNTYxOTUyNWM4OTAzZjViYTFkZmNlYjk4OTRlNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3NjYxYzY2YjI4NmYxODI4ZmI4YTlhYjYwNGQ3ZDQ1ODNjMzg0ZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 23:03:34.468754+02
qjihssfteju6wbs08zpdkgcu92bmlhgd	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-09 19:37:51.455566+03
6lzj0c1icyq2bvqk1rvzp1uwq9jei5uc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-23 00:06:15.16553+03
9usdbkng4mdqknfy37th64nrpi1q8oz2	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-23 23:30:33.618689+03
dcx7dit3zxfqy49hmdzo210cx4srtg8h	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-15 21:24:00.598314+03
sv4y4ja5ciuxmqkp7wisygxo7pos0r8x	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-06 21:39:50.29234+03
3r33gfloadeax30ge48buur8a0uz76i4	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-15 21:52:46.536785+03
tze6hmvq3216g27utu607fnasioii9zc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-28 19:52:56.581322+03
zv120sl82wt9gqgjkpjy26polnga5x31	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-15 23:02:38.351036+03
1gjmdqhkbxv79ctnhjgbvddsdhfq3e3i	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-24 01:56:21.108232+03
uxob6d9rb1ebggdyt30i8du6nnx9p8v3	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-16 04:10:16.237757+03
ey2q880ww1yh4njevpado03l70bmmya0	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-24 21:12:52.142301+03
gn0koxwda27p1puybms049ia94xypd79	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-16 12:54:19.215761+03
krtps77jy9a6jk786siqksf9uuwm5vf7	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-16 18:31:52.481871+03
it7p4zrxab6m1dv54f398o91pmwc3g3r	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-26 01:10:41.515338+03
w7n1fwztovjp602upiualjajznl9f1lo	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-26 03:22:48.513856+03
7fk7o0pg07mum6zzo6e4rvhn1p8ua6wh	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-16 22:16:00.022398+03
7vq7y6mu8tqnwrb3sf78puvfbneywugz	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-17 01:22:25.09153+03
jrzzd47p4ez0ju1ifvutao51u9s1eyg5	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-19 16:46:30.27778+03
1qe3uy3rde0c47a7brcany20dj48oar3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-26 04:26:41.252693+03
841kssvr01a3zhk32v3qr0gxswqr0d7i	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-19 19:37:40.811153+03
138a7t5o5te593q7t2f6zf30ci300tr2	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-20 02:38:04.933376+03
q7y22pd70be5omif2auzkzwlu6w61sor	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-20 06:01:33.127684+03
ihv75vkiv78utahpiir3dxwq4hlel4y6	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-26 05:05:20.940499+03
0jhnf9uzmkkloypl6jdn9y8fgzvjhavc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-26 05:12:15.520465+03
50g8w6cewfvqwm6lb4c6mhtkm4jtdrmo	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 07:46:07.873918+03
iceu1frniiweujfl2q9ocpoug01u1x2t	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-27 22:26:29.057843+03
67c786rl42llwcomxt819ttqgrlalhmx	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 08:00:52.485607+03
vgphzfqdck70egzcdufss2y5s2l7z9ky	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-20 09:24:39.141819+03
behjpeu5bjoln7h75bkxzmwcwqsqvg9m	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-28 00:37:02.391181+03
rdsp95zoo2g6267j19cn5lk9lsokb5sm	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 10:42:26.136465+03
x5hytr78yhgrtb9ht5zqrd0azyi5mfd8	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 16:15:17.094252+03
laq952btt4g30plmfdweh1bhurfwgxc7	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-28 16:31:28.218749+03
kszozsxpvpzmcyk4hcfsnw75nutqkgfi	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 17:40:49.277069+03
6za8ekl336nel0m51h8fdbywrykmw29r	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-28 19:39:44.555546+03
pnuxpi3f6qb776mp001ilxefe7htd0cn	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 17:44:53.441199+03
lb7chcexqswrtpkvleybyol7mlauceky	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-20 17:45:52.8336+03
39to8bp5ljrczex93b9ed0kouwarcun3	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 18:54:36.941537+03
2wxqmkecntv6ihivywzpg1i1dyd5qtbl	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-20 19:03:59.059635+03
3dguvw1yazsdrsjgdnmfpkcp8w5odvse	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-21 19:46:41.641446+03
axnfdzqc01xf1fh3uo38yrlq7smc1icq	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-09 15:55:04.175953+02
z3qesgi5zbe0q2e7c2a1y9lwbjnveagb	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-23 21:16:21.744475+03
k7trbq9gw5em9wxepewerwi2jkmeio5q	MGQ5YjMyOTk4YWYxNTYxOTUyNWM4OTAzZjViYTFkZmNlYjk4OTRlNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3NjYxYzY2YjI4NmYxODI4ZmI4YTlhYjYwNGQ3ZDQ1ODNjMzg0ZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-26 00:08:37.116003+02
wxi12s63txy2c7qycwto2c1qwqh8upjx	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-18 06:16:53.145387+02
mtfztuusz6eu58y0n6y8iojetu69fztt	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-18 06:17:20.61052+02
2wsfjjlz69qpzsj2ab8b3typ3fz710sp	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-26 15:21:28.605259+02
lxzseebjv3mqygktorzlba075e3ihet1	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-18 07:46:29.784959+02
plqlrufp7t21hoe8cqdri87satcb06wu	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-18 10:36:11.113688+02
6spje3crz5wbkipjxtoms25phffl95yx	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-18 13:35:22.724138+02
x9cobqpdqjhdfrz4ylhmtjhn6cswuhvu	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-18 14:40:08.000916+02
k9dh2tjnqa9yduya2gyfr6i5apmm82zl	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-18 21:22:35.322706+02
m06yry3b4o93obl7ggacw0sy971el1pd	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-19 00:36:08.46628+02
bukagn8763tgqm2ykleej9tiwesdg856	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-19 01:07:56.581373+02
9u27vzua9xds5olw8luj44gbm55jkztr	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-19 01:16:04.615947+02
sbnne6ncwr0qizmap45j9rx6hj2pnrmk	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-19 02:06:34.262915+02
f1pwlrrq33zwspgwzp4osaths6k16f9w	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-19 07:14:12.774712+02
7nt1uvtyccz2zhb3lgynbrwhc9pid1xz	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-19 17:53:07.911902+02
bqlsl7z37pm84cyywq8giq11pzsn4wyg	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-19 18:00:08.573832+02
um8l5ygkmvhdvmjmo2bw6znd5q1est54	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-19 20:09:16.713995+02
nopnzlj4w4vb2tz4cj39ki5gujkb3eyn	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-19 20:12:46.309734+02
yylc6b2c2hzi2k08m6zfu20222veksi2	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-20 15:54:13.971722+02
i460ugwqqu6q6kzslde25hfb2z6wozjo	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-20 17:07:54.127175+02
fcwc90chihe3t0kqq97zdtzz7nbtpyvs	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-20 22:28:10.400079+02
msrixu9k3776vnsiydyn48j16dn4crg2	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-22 06:59:41.274225+02
mo12d4o3yy3ihyx8gww9lta57enx2f5p	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-22 16:20:42.744702+02
io2g11ag8rg9pgesai6watq36bamrge7	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-22 17:24:32.745623+02
91p8upwyg6uaksrn5mz5mquu2fetrbuc	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-22 22:08:11.272917+02
33d119gc10d63jqmwlombt7m2wagcin3	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-22 22:48:57.633919+02
us4an9vqqzr8bp3vv7rbotsaisuhoot3	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-23 01:14:58.519927+02
oyknojkxb1ysvwybplqrefal2i895w5g	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-23 03:59:27.749322+02
painihxsx8v3aqm4yqoh8zb28spv5ilk	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-23 06:38:30.583299+02
yi5sb5s8rwxksvmpml1cyzqpipt3hqhm	Yzg0N2E4MzJhOGNiMDRmZjcxMjI1OTk2Mjk5YzcxMWI4ZTM3ZmEyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjMxZWEzMjg3YWY3ODA1MzUyMzM3ZjAwNDUyOGRiNjA1ZTczNTQwNDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9	2015-03-23 21:08:36.816262+02
ewwiyh84i2k0pbgpb7lft4tvyg2popuj	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-25 17:55:13.842497+02
tvu0n3nf1h8xljby1ct8khuyqz6urn1x	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-25 18:23:15.607374+02
h550c8bi2fzp7icqdb08323yq67qgt1z	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-25 19:52:54.6537+02
6dupj5bz7993ujv8aiir4mv67t4pg4m5	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-03-25 20:14:13.532193+02
xvrpnt4vrcrpsknwqfw4qyv6mlyfa89m	MGQ5YjMyOTk4YWYxNTYxOTUyNWM4OTAzZjViYTFkZmNlYjk4OTRlNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3NjYxYzY2YjI4NmYxODI4ZmI4YTlhYjYwNGQ3ZDQ1ODNjMzg0ZmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9	2015-03-25 20:16:04.602832+02
5r0vifwqqqof1idvumbftpktna3iiqd5	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-09 15:55:58.979458+02
4rxkh3xmqn1g4iqstaaabpj22vqburep	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-23 00:10:09.325384+02
zxqrmomznc52h6itfu9mevsbet5rbdgj	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-10 20:20:29.366723+03
n7gxhsynw9elurhr49uhfholmkvhqvpl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-06 20:25:04.353772+03
c77dsfk2br9er4yoawgwe9nleqog8zhk	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-07 01:58:27.102806+03
7b8g4b6pgjdepr8hrxyb4hmd45hd1n1o	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-28 22:27:06.442301+03
3jrmnsfrfixyi2177shxlx8ymsqc39vp	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-05-07 20:11:06.61166+03
tch597bs8pncqxvcwf0uq0ljqokgcv3x	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-28 23:11:03.725051+03
5290ma5ygdzmmi76joi0assdh3gadrex	Mzk3NGM2YWUwMTE2NzlhNWIxNzZhZjYxNzAxZTNmMTE1MWIzMDdjMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNWEwNjk3M2QzYWU1YWY1ZGY0M2FhNTZhMmJiNzBhNzliOTgzMjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwfQ==	2015-04-28 23:14:51.319546+03
nfloo08toyhal9132fvigfbwcufk8zhm	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-29 05:42:14.901824+03
rhb9vz19bm7kh97vgrgn43t23g1m7cn3	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-09 17:47:07.360975+03
iwu3s3f905706auwe18vo6lc1h45bcf8	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-11 22:39:41.775967+03
j8zmif3he29s6kgs1qo49uxn3y366yky	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-11 23:44:05.666981+03
ycvl6uojetq6dysh1jcsmde9zqohsrf4	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-29 09:51:38.727885+03
odwq2gsda3oybalpv0phkpi5j0xydkv9	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-12 15:31:58.772479+03
de6vk0mylzk57nlb10kxlrjpwda468f0	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-12 16:33:13.499985+03
xb0xnm6m9zkcmzfa7999n5gdt0tmitlv	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-30 18:17:16.944969+03
vrfa8psxbxgxxwglubcvbs81uhcxahwe	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-12 17:24:15.750308+03
tlow737p9k7eiwvka46cm3pcmfcm3ex9	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-01 06:43:45.386578+03
qkw8lrz6up4y8adweh0qxk3ndcoskkrb	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-12 18:25:35.80281+03
ojg1komx0l2knyk9kj1nj8j1e1t7vzdf	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-05 06:44:25.384125+03
t4h0p48jbkjlrnhd1a7lfeh40tbjwspq	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-13 22:50:30.281529+03
ok9a9zlsk6w5lnzk4zbkcdgres9z55cp	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-05 07:03:47.530647+03
ejvi2h443mumzqbvbrt9s2627j4979zz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-14 18:46:35.255444+03
k2yabnb83ymjzgslhgssvkr46iyrpywn	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-05 18:33:40.291277+03
n76omp98h7odw5h5tyw4mn06nqa0qzd2	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-05 20:43:10.696483+03
a1es9pf62iw5sr2g4zjdrq5mta90gde1	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-15 08:32:14.790712+03
3rliam1c6w6majacfoh09pl630h93vo4	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-05 23:15:27.685888+03
bu89ggit36l3zh4vzbowapiu27g0nqtq	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-15 18:06:51.8134+03
i97z8hm4okyifubci94h3tpw6adimah3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-15 19:42:47.227602+03
px95ykooeelmhssekrc2g92aqwaeod29	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-05 23:34:54.269822+03
e6cxrkk3mqpgar53cida41jxla7yy9ia	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-15 21:10:42.225832+03
uufmkxivajp8mb3y43zywucnx08ale88	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-18 20:14:44.131474+03
wgmkq6ni2g910cah81cxddwp9i5noj3x	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-18 21:43:21.825715+03
h8xewy8e7j1i9azxgwoxnypgrken7m8j	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-20 20:34:40.672254+03
kh0m7iaas4lolyx6oxa7vxet2lp9o72j	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-20 21:09:41.116712+03
6vdhfcx66sh16l66i63ry0ijip6s785c	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-21 02:08:53.667131+03
m9j847yhg1snuhz8aiqt2hzzqlyi267g	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-21 07:00:27.094506+03
tz1on8j3ilnubw1bwpd11oh84m904ak6	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-23 08:16:37.251256+03
22hf5s8df5ysoihw7yrwn7r54lw4s56q	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-27 21:02:06.160712+03
tzevsebzhbie6jdmroy0kudcuno4zebz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-28 18:50:09.560993+03
zut5v3ugvp6vfihg2mxvl0rvb3r3bzcn	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-29 08:53:41.613741+03
d024zmufau3y5j0xia056tp162bvjj4y	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-08 16:58:13.449645+03
a3ca9w9qkob7j6iy3u8e7q6ejmgbtq5r	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-12 05:59:51.01918+03
18nrv2b75jv141w5oiltmizalm8xkslq	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-13 17:23:00.14882+03
5p4oslr1kech919udeycut557mgb5gzf	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-26 20:41:55.144742+02
hdbbljs39ys3by0n0aoz33caa5iwftl3	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-13 19:02:11.18915+03
vdw50u6u2l25sm3clk8e1ovuadqyyme7	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-28 21:53:03.27549+03
4zbtilxi88gzreopcdbf54urab4r2r9k	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-13 21:24:08.280275+03
voj63fbxwkwm7rntkelc72dphxwtet2r	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-26 21:15:05.074166+02
k6krzh4szq6v5gs5qs0uodm90a59spza	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-31 21:22:46.938761+03
xp1652pcbri21ke90q4xgrttkphs7i6p	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-31 23:42:50.040741+03
u7bxmsx9si540qq9citrx2eocicn6xev	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-13 22:44:10.828594+03
sp4ugejphhl1urbdwfhnx7ml4v8ceg3n	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-01 08:24:09.404015+03
72gux8a0038vh4zru03o58n0hg3i9tjy	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-01 22:41:52.000076+03
sijty36lp2g3xrvu4vyag6wtddwvi4lz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-01 23:46:25.745816+03
nbdtf4hdl5sd8xvybb9zpfqx2wv1r8l6	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-02 03:10:09.348636+03
ssqxp81dhsr28p4pxr8p0dao7s5iq3xn	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-02 06:10:31.380155+03
so9dp82umfwf5vz8dbcwifvlv1g5bddw	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-02 08:03:07.571703+03
kczflohdu72tp55cb147eb5sgm0ie3xq	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-13 22:56:31.578941+03
xjxsg7lw9dsc4q731khejdu97gnct5ln	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-02 17:25:32.06382+03
cuydy53huxiet4k2hvcg3g9jcz58a209	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-13 23:42:46.09278+03
916tf5bzcwlrcqilx85is8cpmss8p8wk	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-13 23:43:24.470357+03
m6lxwubnw22eapfik2raz2c5kvb6f7wh	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-02 19:14:48.341189+03
ylrq7dvg9bqhzzehmyg31y35esxbekse	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-13 23:55:39.115913+03
d0tup6s9cj1vbfkgqx2pkr3hgv2ao830	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-14 01:56:14.488941+03
ztouctr00f6ivwhqukqmlfsppgpfxd1x	OGExZWYwODkzZDZiNmQzMjFiYzA2MWNiYTgxZDcyYzRkOTg4NjY5ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA4ZmJhOWY0ODU3ZTA0YjZlZDU2YmFmMWFmYzQ2YjQ3NmE0NzgzODQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjl9	2015-04-15 20:10:52.284844+03
9qxmlj337a9osh6qa874rcza1qhisr7o	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-02 23:55:09.784106+03
15ydmss4umyq7vms8jvsuuoexne2aqvd	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-15 20:13:46.731305+03
u6iyhlvxvlex8lk229dpqvws4tn6mjnz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-03 16:05:35.775022+03
kmou8ju8tonageaok7bhchfvvi8mjx8v	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-04 09:41:10.493585+03
hng1yhyg8zcpzq0pe5xxbha2trr2z289	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-06 09:13:48.754478+03
wxpolr7kz1g0f5wkemvq3vant7qp6ikq	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-07 07:57:15.514936+03
gbcud1ddz5bppbt3lwmjvurbwivx0i0z	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-07 09:17:10.441477+03
17lozssgb11hcm7ndoo3wfir0oflsgyb	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-07 19:51:27.959654+03
6igv1wq83u2wcmpgvmtmxghyuzeh9zs0	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-08 09:15:52.626449+03
f3s3r765kliwzs1ck74zvklsxkbn7u0o	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-08 20:22:40.412786+03
il3pkqchyp3uewf6zwafo2eqtw4cfba5	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-08 22:11:18.128329+03
fnhirl3jfwzwq9zwnqgrmmn0va2gxz3s	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-04-08 22:50:33.177891+03
5uvld41gdl6q6jcae11vobsr5qhgij8s	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-10 16:56:42.808502+02
saob6c5c0p2y2l3wfmpwplrsmrx7lsp7	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-23 21:16:33.173336+03
gnfp6k8idoyxots7r959172mliatpf16	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-04-03 01:33:55.601466+03
z7co08la0euvlw9qgedziphy742kj695	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-20 08:30:46.600736+03
xzjbbnflfzivvfqdek485ak7fj8rg99a	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-11 18:16:52.207046+02
9cbpsgrqze8b0ye13m1bjly410xfo4d7	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-12 15:30:00.412199+02
fqhni3upimecnmq2gjkz4t1lxvf7abgm	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-12 19:12:04.365824+02
y7dhnx6aud04rt9o01q3orvzrhlxpzz5	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-12 19:36:53.471509+02
bgrt8cj8jg0k11e99rndua9d6knd5igg	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-12 22:30:25.492622+02
xgcmsxm45lf4hmg7uy4npzu6mcn1j8rp	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-12 22:41:04.778943+02
t82qhd0l7cy131l77mapi2omb2pmp38c	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-12 23:42:21.693679+02
3i30yf59vinhxagryy4rblymgnlu4abk	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-12 23:46:03.920686+02
i79wvvpgxwsni972pa3pajzb6dsv2j1o	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-13 01:09:58.179899+02
rk0lcc4f0hgy1wli9n2tz2nrgmnhrofx	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-13 01:14:03.873959+02
f0j7zs76m4a0rvpnvptdov9yynsplw2b	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-13 01:39:32.768129+02
9dcd6qsfzltz8rxgjr2476s792wslgw2	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-15 05:51:30.630481+02
vfd9ooo4w1cupydzli1e811seatkb0hx	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-15 05:59:59.347166+02
0cf45ern0gxqgl4ey1venles63ip3y4f	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-15 17:12:31.424079+02
1rhn7hzyvdf996ifyisaoc33ch8duhxh	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-15 17:12:31.492885+02
7c8jlnajsel5j99qkvgdp83xoocskjvf	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-15 18:28:33.407174+02
2n1zj1ddwjbvqzjkmbckd0whvx7bizep	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-16 07:22:46.422641+02
vorjqamz61suqjakzydb62tbot3bf2jx	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 09:27:14.499745+02
4on3uey1byx3o2d9nltqawndzi5vpra0	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 14:59:14.703201+02
yniofykguqfwubqlqps7eoupul59zr8e	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-16 17:23:20.887445+02
g1tf80inoygx9b0cijue5doqrzz886oi	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 18:04:39.521373+02
gvi21l5n11pw9olvy4wx6hw2kt91iii6	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-16 19:11:30.119156+02
h9hzfkij1mjkbvcptrjww1xp7qsfe43f	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 20:05:30.239501+02
5hiqkmk6e31mqi90x5qjlwxs6ac4pdf3	ODk1NjY0ODUyYTU1NTFiY2Y0MTMwYTVkZjgyNzVlN2VjODhjNjE4Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjI4ODc0YzViZmFlNmRkMDU3MGIxNGUyYmFkMGNhZDk5M2YwNTE4ODkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-03-16 23:23:26.654372+02
dgvrnmthwmo5taeyrhix2q52t2me4qc5	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.169322+02
ju2lam7cpgoea8xfp601ya3zu07i31mc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.283475+02
8ysfgai7o3p650mkp72m3fi2o0rcp44j	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.28702+02
vhwbsaof8gllfug7bf6a577xgtb6swuc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.394544+02
a0bm707i663obtrtrey59858rosp400n	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.537749+02
w7z2ot07itjo1e36eige36igmsruemvz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.577353+02
awmhwjpzww1jfqe4dsmekxwepnow79jn	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.679984+02
nw830zqsfwvill1779ero5m8bjm7a3cc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.726404+02
gaxotypedqs0nbhwc6br2aejo87p4x6p	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:52.730285+02
e8nsx4y680b9v28ui2dzske7l4gy6oa5	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:27:54.769224+02
6n5fv0wugm4bl1ytzy85rvj8k9xwgczg	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-16 23:57:53.229442+02
6vpcoecygznxeg8cxk22qqj6o2tpelqa	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-03-17 00:00:40.311503+02
94tjkd2u4krxpn8nc7qiazuwkp8uyxwn	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-27 21:02:06.227739+03
xveu4xii7fwczuhva2t4bcvhh88od1qf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-08 08:29:25.700673+03
2rfpx5bkv35gqwiv7e4t3oj0kafhgp2h	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-08-09 21:28:50.972708+03
v2h4i8974xke2emtxcbe1fanz395a309	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-08 23:06:39.032144+03
7hkok3ob9twpb5m0mr6zoxfihe9oc4bj	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-26 18:01:23.294312+03
gf6c4jt2srqrhmji8c04318mrtet9lh2	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-26 19:22:09.743619+03
yrpiz79injcew9deyiinhvmqbvxej061	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-28 21:46:01.381875+03
e7bhhkc4ktytu3w46hidzqh6g5dcxaqf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-29 02:04:23.528794+03
u9fnjzaizb2puxwx77nxr6mdk0mgm3pl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-01 10:20:14.817475+03
dd3ub9dp4l31t97dd5f1ww3ibbubactq	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-13 16:51:07.007004+03
1s8h8mo9jtuguezcc5hirxa8lz5jdksb	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-15 01:07:27.662905+03
njjz8cwfgvq3upx6sc6gtco6g0se1zul	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 09:10:47.390234+03
9j5t4lqcs7b4mwruo8yv3r20r1swaoc4	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-15 09:50:29.720548+03
ptyr8ffnw6r4ed03gpzs4aljcuwrnz1f	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 11:10:28.362829+03
ekwgs1k6vox63jny77ehohyj9s8ih5up	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 12:13:35.280701+03
39ke9j2asv2gxzok0ri9d9viv9ewbzzv	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 15:48:01.26486+03
6vafntruqxo01b4p9f65v1m9do56is8i	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-15 16:55:55.582534+03
p0wqsotayx5sjv548qx8aewvrohyu0em	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 17:55:56.309207+03
2tlq9t2jmtr9b9fc4jldavymcvkkly9x	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-15 19:40:14.692876+03
djwtqcq1lo6xkaawsjcvk0tdwm58gxb8	ZDkzZTY2ZmQwYzVmODk0NTRhZmE2NGE1YTNlNjg0ZTMwMWU5ZTAxMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0ODAyZmY5Nzk4Y2FkM2I5MmNmYTUwYWY1MDU5ZmY1YWVhZTU1YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjExfQ==	2015-07-16 01:26:45.225034+03
8o0m85x851dffgrpmw8fw4n0zdvzvh10	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-16 16:20:27.516012+03
uy36a6cpx5iulf60gqz8xj1stg5qsqtl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-16 19:56:08.272626+03
h08qexjxhrgqrs55aeghqix50hzvtsn2	ZDkzZTY2ZmQwYzVmODk0NTRhZmE2NGE1YTNlNjg0ZTMwMWU5ZTAxMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0ODAyZmY5Nzk4Y2FkM2I5MmNmYTUwYWY1MDU5ZmY1YWVhZTU1YTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjExfQ==	2015-07-18 01:54:45.997215+03
uepoogl8fx6fiz2250d6h193p4xvmqa8	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-19 17:00:17.399033+03
iofplx2wuywvzw586j4vvhg49fyonosc	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-19 19:08:56.046465+03
99mv16gnbffberjryp33y6bahnpmqvvm	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-19 19:09:18.301646+03
t2lcj6h3pvlsef67o0i4t3kp4kpv2ft8	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-20 05:09:59.695796+03
ams1cq382q5cpg8p5koj426e3lrfnjbe	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-20 05:48:51.527508+03
0hqauraymh8wbn5cvx9dvzd7t4cbir6x	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-20 15:36:18.895295+03
v123oubt2gu91bw1jrrixdo17kbp2syf	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-09 02:23:33.179826+03
9r0c9w7r9l33kw1hnrkr7bnjkit06qbt	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-10 00:12:22.849848+03
k4azmtpldeyyltynk9pofjrz5ixydz40	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-11 08:19:19.462206+03
3b45he59de2htj4lbdyrc8jy9l2jbuti	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-11 09:41:09.322068+03
gq02yus7g1of0vob6gddw8fgxi0psm0h	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-11 18:54:09.792656+03
wn9n9bcp66251mikednno8oo6v5wlfsj	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-12 18:16:30.985275+03
xsoxf3ocpdn0rktjhdzuqplj9zwomv90	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-13 00:06:07.975258+03
amkjh0pjn1xa56yueyqshsmdnzlcjgj5	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-13 18:36:33.105333+03
fs3qn7fn61pm5scfb20clajh24llm97u	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-14 19:32:16.573081+03
n098w9oructu7r52oz2kfn9y71u48759	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-14 22:49:09.332581+03
od7bf9f8ye846k1p53lxqz1lraxamu3f	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-15 15:24:02.655823+03
p772z1xl6xr9b5p9sgiyvn7z2nnxxi8l	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-15 17:04:32.696814+03
ovjf208uwbrt4hf25p5pcgea2pl2cyx1	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-15 21:20:40.743109+03
6gdjjephjdbt0lus36qw65wec2wo0b7t	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-15 21:56:05.992668+03
talvvysikuzmv1j3o2a9edvlm3nlvh7k	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-16 02:17:41.058575+03
f1p0llxs4f4t6jvc5xy5kii03z7e6ndj	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-16 19:02:19.292858+03
fwf4j2qqn8xqet634omyvbo9a3arkkdi	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-22 02:14:53.121498+03
yihxjcud7rymse9dyp24wnurn2deqnog	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-22 05:03:09.463352+03
p08o8iblr4o97eciylba4kyq60txghhs	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-22 17:26:58.425949+03
3981cds2eyivewtsvbrhdojkd0vpsduo	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-22 19:02:37.156748+03
9shz3icudu7zo4h809wbxhkq6m0juf1d	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-22 20:10:07.093725+03
5xcbrf8pqm5dqpxv35p6frfzdgsvtmmx	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-23 16:19:56.054564+03
h3rxrwrr51f2w5jgfstx3qlx3dbvoq4c	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-23 18:22:07.846948+03
1lbulfvqcc8sziaybrh9t3aw7fezizr2	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-23 20:06:28.234706+03
3ve6h9hrvlcjgjyn1mj3oimqmki96dnp	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-24 14:49:09.175991+03
23q2u54c3s1unmemls77tyngguhmdsxx	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-24 15:50:54.138935+03
7pwpxkp7eey3dibxyiyul0m21ugfy0s5	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-24 17:48:58.017945+03
03qlxtmksilg6ro6lftu3z49kpygajs7	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-24 20:45:39.164676+03
5vxvvwj48sk6re07ozsrsi6s2pn03gmz	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-25 18:56:14.147265+03
gj0e5rnay9fnqebqszgkyfb921ygysnr	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-29 10:19:47.246991+03
srenjaq32wcc88qq8drmor3g1wtgfll9	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-01 10:20:14.886891+03
l0sw6xncmcu2o31vqfrg4gphltf7sd9r	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-29 16:41:50.964738+03
wqfw3wa2n06ufwibnzx61lgg2lqk6kxr	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 09:10:47.279182+03
1krkuig5a4qapynyw7gnawq7d6ur61i5	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-05-29 18:11:50.58974+03
fqp30ciymq7bmrkrcoqivlk7v4p1nxx1	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-13 04:48:19.364713+02
7pvgna07w67vep79bqzpb1t9iyuby8mr	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 09:10:47.344478+03
pmrykulcccsi9os5fnk3vm3wu5xwnvqq	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-20 16:11:29.569467+03
cypkqnfapvymspv17yeg16gvfqyphz34	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-15 09:50:31.688879+03
1apknf2u0mp504ifnk1g963oc4uicc3c	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-05-30 21:07:55.541065+03
r8x0h0mf81e7txjpf0oq0xzjiujha6p4	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-15 12:13:35.219974+03
383r9j2b1iget47jb56e9mayc9fwhfe6	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-20 20:18:11.495622+03
i4he5a6ab2hwjbfgdyxeuj0ymq8tr9w9	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-01 08:39:53.692375+03
94eboz9n7sb8e8ipf8virgpr1owisrz0	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-15 19:40:14.719797+03
i0onwqmjg57v75mojam8togxzgcmywgf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-19 19:08:55.974672+03
xx3zvyhv6zb2jwkq1mp8jgjrlavhyo4s	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-01 21:16:35.90193+03
1w5eh4buexacsrh7mrblid2cndnhl0js	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-21 03:00:01.35581+03
a8zmnpr8rc2wtlpaaki393fm7fm6oijf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-21 03:00:34.639819+03
g5zg74x9ipkscy93j44kuhktrxskee92	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-02 01:08:05.248465+03
xh97f9v0jni3fyiwm16dvl8w38pvpco3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-02 17:44:29.987809+03
jd697kpwn80y12e521an6e7lpuhq4msr	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-21 03:20:46.79843+03
q45npa9nuopp56nrkk2yq4rj0svaeu4l	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-03 05:02:55.40417+03
e123si1kfa4lvbehv29zv9nyngw76x3p	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-21 03:26:23.34639+03
wixumx7ec33gfi399ik2nkca8t2q1cp8	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-03 09:35:51.536167+03
fftxjvomvjyhzaj9l7pt92r5tns9dufs	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-21 06:43:06.545608+03
uwzjyhvhwnlrdyqanr2exhx7vku3wz7n	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-04 15:44:24.073132+03
phd7ovcyey5nqu6csfp6bcnl5u44a0pf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-04 18:18:51.462498+03
cq4sn05hd18icudox027cbz1yvyb0kdx	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-22 04:16:30.990424+03
9quhkf2s440fsz51hf75oko2b9xgu47d	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-06-05 17:50:43.457792+03
3akxmy5wg8iemjbp361avt8ziocufrov	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-22 04:18:15.349589+03
dk53bqd12fafnk9a1wefno8vulrsv5i5	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-22 07:30:12.595221+03
pj2903zvuzad5no9ff9p54tc1stdvrqr	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-06-05 19:44:08.757479+03
tmi2vxoy3c5sb3pjtg5hv49pqc1j9vbl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-22 07:30:12.60157+03
njwvjtxq7qad9xvuc4zbnno1bg46xdnz	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-22 18:44:19.523213+03
f16pbc5g8j6qvu2e15ni1xwmh4kr32tz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-22 19:08:52.98752+03
pudg435pwypl18wxil3fux2py732yh22	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-22 20:37:16.580414+03
aus9d5a79t3vhcdszw3hmw6te4yul7bi	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-22 20:39:15.087204+03
mwpff0af4fyr9b1g8pmnf0wxqvect06o	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-27 17:42:05.670777+03
qu1mpohrar7yiuwjos28k0b2jl0ezib2	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-07-29 19:22:03.546114+03
rd1pffufp3ztyra8c91wi5co4fgu2nyt	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-29 19:22:36.133055+03
jue158qn8c6enra9tf220l064wd7krsu	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-07-31 20:46:07.784315+03
l7agcsrdjk4ih130jdgjpx74419turk3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-08-03 22:22:27.791462+03
hd614z6behhr7c3fgei25dmfy9mt9w2g	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-08-03 22:23:35.539778+03
15p8nrwq2ey17yblibcdihddosobiptw	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-08-12 19:06:51.534456+03
q59xls0fp8enq1vd0gec4du2qp12gbie	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-08-12 20:16:36.953744+03
de2c2jfgm7lf5g6lh3wox9da2vqje4ch	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-08-14 02:59:48.445745+03
oh2z3fvsz2g1hids6kegp2qy7chedi8m	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-08-17 23:02:05.769374+03
yw8jn99zi84nyelzr20p20547w19lc3j	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-08-18 23:26:18.892378+03
q8vhhmqo27so82add517p69v4pavftll	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-08-28 20:08:32.200355+03
mxlof962mp7zvsji05pk8769jiqwrgll	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-09-10 07:05:51.575965+03
gx6puv8n1k5smjdwltjzq52znddy9hm1	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-09-11 19:37:56.147528+03
gpzqgiyyxqp4raion2jaerf0tgodsc0d	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-09-12 00:28:57.926881+03
nis4951bko4rim8a9jy2xwdwgf0kt5fa	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-09-13 02:42:18.129486+03
62zr6dz3zgxzayrveqc8r586z26mgigo	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-10-01 07:13:08.781671+03
fyase7kw77vewpobxcd3vvjlzze2yxtk	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-10-07 07:48:54.813633+03
sgdmglgjoec8pfz9offdz740hxhin4p6	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-10-10 07:30:38.055572+03
cxy91051wnoagibga1vi0j1w9gq39x4n	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-10-13 15:15:14.041891+03
0xu8qubp2jntqewl74zr1ckv2upucwj3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-10-14 00:46:41.465527+03
ac3hfpnphovdf3xcmmci8m6ryurgv4nt	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-10-14 06:12:22.721488+03
ek756ki3cx3i0p0vq3br4w0jcs1koskb	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-10-14 17:39:28.704097+03
6n7qmbup9lcjijda6b3rehyc52t6a8d0	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-10-14 19:22:54.101365+03
9kn9m0lc3xnlpj7gy306926026lqzdew	MzlhZGVmNGFlN2RlYzhlNzkwZmZjOWU4ZTBkODE5NmJiMTc4NTg4NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjllOWZiNDE2ODUzN2UyZjJkYWVjOGY1ZDRhNTM3ZDY4NjM1ZTVmMTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjJ9	2015-10-23 18:48:58.445569+03
x9ad6q8bh1pc3wycduqhq5al38v78pme	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-11-11 17:44:59.807014+02
dwk5vfvbn1wrdz8cqelwllz6byuvbvgf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-12-10 07:39:44.416863+02
hnng7hia3qmr4bttito0a5fg41v2ysoe	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-12-17 23:24:40.412322+02
uq74nxdo2usapbmltvix1e0gkbsa2hzj	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2015-12-18 01:55:53.633849+02
e8e7dbpvitdidg0hnkitdtb2o0bu0pyp	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2015-12-18 02:23:34.243813+02
x1xpu4m7fs1u6jrxlpz5r92zwam3toyl	YzdiNzVhMjcyNGQ5NTExM2VhMmJkNTc1MmZjMzYyNTY3ZWMwNDUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwMWI1NzU4NmM5MGYxMDE0MmE0Y2M4NzA2MWE4Y2IyYjBiMDRlMjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2016-01-05 01:30:44.089379+02
ke8773qf7ukrxpfulk4no8ex2jd5mmyg	ODg2OWZhYTg1MTNhYjUzMGNhNmUxMTM0NTQwMDJkMjRkY2Q4YmVjMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImFmODc4MjUzYzM0YmZmMmM0MGMxOTI2ZDczMzQ5MzQ0YWEyNjIxMmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9	2016-01-05 22:45:23.46578+02
iuwh04lasuwowq5efk019c8p9a3l5gx8	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-01-12 18:16:01.653847+02
3lxlwvmk8iz96z430p2rx7x6ia839jpr	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-01-14 21:23:55.040262+02
p1w8rjuk09ggxcbupg8lxva1f1rldoqk	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-02-04 00:24:37.327699+02
lz4p3xzxgwsgw0dq9e63u9lry7m99ttp	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-02-06 22:19:48.357613+02
qzp7t8eu0fj1yxb1ql9tu282s6bwvb7d	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-02-07 02:43:13.799517+02
oaqv7n2up5ufjdxbyfkwfijetj2ejfj9	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-02-08 17:27:07.543403+02
rc0vauifnjl66kfy5owwbu8270zi5wmh	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-02-08 17:28:16.969938+02
u017e8v4ukqu9o62v0ik2lqsu913l709	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-02-08 21:00:38.029347+02
2ob1i20jkyq9hi11t45v8nppa9gpjcfl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-02-08 21:46:21.245393+02
dlyvd7rvjsmtrcytwqgtbd0wx1j9c33r	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-02-09 02:17:26.019404+02
1efaz0ek4nfdxcij8037d1ncftyxj292	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-02-12 23:52:34.455543+02
o0yuxm4suk7oyrv7skvuua2jlcjmibl5	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-03-09 06:30:41.760718+02
bg0bx4zzibcwn7nx9g4kyuznny8xw7td	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-03-09 16:51:48.226182+02
y0rw2klvcfocftjkng83xjn0h9nzjeai	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-03-15 01:14:41.927974+02
ptrm59kvvk36fym9vcpgngcmr1x3xccq	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-05-18 02:18:19.775308+03
5789q0wpdm5ybg2155v6811e64a8c7a9	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-05-19 18:50:22.016189+03
khukjvm15y4huf79ljg21qyia2erj3qa	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-05-19 19:55:01.893148+03
m0cqpgeczyscjim6m4812y0twez9f02m	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-05-19 23:58:11.624019+03
1pow14azbsj65eyb0xkhjzdey21njar0	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-05-20 21:16:34.958565+03
j3mx6d01plf2pmfda6bqkjl03xwbf5tl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-05-20 21:34:29.222622+03
bdlnrty90ov31wcv6fc6upad5bxanq79	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-05-20 23:36:44.998092+03
5ncnfhntuddaxfo86qwln7zw6e9zagkq	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-05-21 01:01:18.709934+03
0p2ibkogjn6t0nexh8qtahfxpueopoqu	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-06-01 01:49:08.470301+03
ceiqk1s71xgt5m9bovkkwc9gnzt8xcc7	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-09 20:17:56.766336+03
pnmc9yjr6i4gci3r1e5w9uf9yhvt8ybc	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-06-01 05:38:40.909497+03
vqqf8k6zv7i9jsuz480uv7zwx1rz5dtk	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-10 17:06:08.025603+03
ci09ocwh6w2ea6j2vmz16uaxedf0bf1z	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-06-01 20:43:05.171838+03
yix5f9grgjclq7ngexa05rkf1cl9tfz3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-10 20:05:04.224028+03
ebv36hop56tejfbclxu48osgfl2f9x9w	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-06-06 03:43:22.790719+03
48zpn558e1clybgl5zkzgccr6gzr8bdr	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-11 23:31:37.148503+03
n28x8r7lc7qpkjhwrvvuf1t3lk6ljwz4	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-06-17 09:22:37.523996+03
9vdrkqoabwl13iir5sndhr3x0e8o8nze	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-11 23:46:07.389317+03
oxdz8yt3mlrwc2cbheaefxa0aq4fwegp	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-06-17 17:34:08.664466+03
gfgrppy149gtc1eq2t16bi3c9lgvxncm	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-08-12 00:23:10.391916+03
i29nag1rxbl9q8sbrqazd6ud5xj5ac1z	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-07-21 08:50:04.193253+03
f3suog13orwrxu3wnoxhj7s8ejqvblf1	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-12 01:18:18.11925+03
0kamw5ygwf6kf5ddsk1wns1uo9qgzav5	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-07-21 15:25:46.702476+03
z2ws5mdh257s2nkh41o3bi7puqz87psv	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-07-27 22:24:47.548061+03
jw2xju3vp26oojj0eec9ftlczqedlftl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-17 22:06:57.936383+03
kkgy12vlbxi51drmn42uo4hm2y6p65ue	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-08 20:39:12.739859+03
s4nplxrz9pyl4ef68rhbv8r7fmtz4oss	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-09 01:49:35.059496+03
ryjuayvtvopejkqpu7ahfqjuhb8d4oei	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-17 23:51:01.929464+03
1uopo2hecf8k8f5nmul4fx53tsaq01re	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-09 08:45:01.990207+03
cdw8m2v8y5hnquvlmos41xjor1rckqeg	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-18 17:37:26.687315+03
2ue1eavdevjoszc4xax0gcdvucadiqwn	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-18 18:38:00.600251+03
lh0dxyj3cvo82h20pv95926mjxth5kgu	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-26 22:55:35.703017+03
xu2tod53jpzzglauxwu4iq4xlgt9hevt	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-29 18:36:04.989032+03
zbfk4crvsu57gqvw73sn7k5ci8gyn9tx	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-29 21:36:57.247614+03
n75ypnn202484wy2erimh4hyu3uzu8pd	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-30 20:56:20.356735+03
s1yji94tyyc2atbcf3e5nbrfmkgimtml	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-08-30 23:45:14.273456+03
43e3nagfcp63r213zm1jj4535ymiaycq	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-01 16:50:09.965794+03
cdl2t6exrfgwfp8nwot8wya1v92tzfnf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-01 19:57:04.936158+03
2y3462n0kdgetnsyrgfhih8983gax5nl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-01 23:01:30.981348+03
hfgzssrni7sg30jw4gyn5pkza1mmi0i2	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-02 22:15:38.663728+03
5b7c7zgmwav7pjbbvhkycnt87cd677if	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-06 18:17:17.171744+03
nff26wx0xpldtheacpec6ck7hpjb0ym6	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-06 19:47:56.405098+03
j21lws6gdteeycoaxs6txxhger8nt1jj	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-07 17:05:50.708491+03
n0hbz1sce8aplnrvldkzuh15bx1kix4p	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-09-07 18:17:48.624897+03
cdclsezjd6lw5u3psal98ke9b9qarpx4	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-07 18:24:41.888717+03
ujq40thxxxzrfj4tom9a0b5b7qmwu2gd	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-08 00:45:22.585795+03
rnxv6bdoq129o65ziozasc48aj3tk13t	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-08 01:26:50.874487+03
p7hx7m3wdqlxhhg8w4zxs5xlf5h2pjvf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-08 17:57:14.622577+03
45lrb6l2ok0phu75fbszhbsfu9k7vyjl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-08 18:19:27.432471+03
lpbid28uvsddqfl68zutryfbafhazeug	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-10 03:36:34.782517+03
ukzyfpfux25tvqauzt5wnv6eg9b30lak	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-12 19:28:38.935263+03
mqzklkcptlko5ty1ufujxgi8cixhan1n	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-13 16:29:04.24109+03
lm1bphothuxmrggdldnvw15bmepsn183	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-13 18:02:37.714051+03
0h4en9bqzft4ejqmrva84t1c86zrcvja	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-13 19:04:24.642421+03
equn7u0f7fah3injytymq1bhdid75jcz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2016-09-13 23:42:23.573638+03
hhectn64k6jln08yiz2gbrr9cubhvekd	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-14 00:21:36.312214+03
6814gnav1dn9g181rkfbickbc03jbr65	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-14 02:19:51.897403+03
73lmt20pv8gy7xdr43umys45e336sqyy	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-14 13:18:51.776582+03
fm67oxl3un2mqa63g3co6hhw01sjnjvf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-15 22:34:59.517076+03
6z0iwpmygsp3aqq0qgpfrjtt251uwmle	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-19 16:55:30.379495+03
wp8jaakmwue17wzzgw7tuxv19mvy8vu4	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-21 00:32:27.271339+03
8tvmus2he7p4t11qz6dwrlja7j02mr4w	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-23 18:18:13.192493+03
ajcco5rp2kfwt8ayhmnwamnhosydnew1	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-24 02:47:07.939449+03
9y1omrr45ceilwrxf5fjcq4h82tsoem9	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-24 04:15:45.099201+03
a7hgfmufrv5nxzqt4q9wrj8cd6pddcde	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-09-30 19:49:02.366447+03
exm2lu91yx98dozm9nub5pqdhia13onz	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-01 19:36:47.697249+03
esqffx0l7pm6t16i00tq0bca557d0j40	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-06 20:25:21.687285+03
cvai1tt8qkbwzu9316skuixo4svi6wh9	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-07 17:52:19.8637+03
z9gn1qhk0gjgtvkhumyb6k4v3xszuf0p	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-14 06:50:26.607847+03
2ejhl96adeqgl63uifdzz16ie44k52ed	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-14 16:21:18.706903+03
f3v24pr7c7m9mz1iab452ouxkirg3kzs	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-14 18:20:18.339582+03
xc14ylcav9u1omutav84un3t1qeyxptr	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-17 21:50:16.331944+03
ocxhztc2vp96fwxg8g5m0mrbhsh3ssgq	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-24 17:33:56.50029+03
dt4t03x9s8nhsb48ia3ylpivn9ijd190	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-25 17:20:19.825907+03
zm9g0wmqrnf6auh93yv8o2mq31i8n4w5	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-25 18:53:52.883828+03
zw22zrzlkzi0jkl06a75uyb9rso2bpsm	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-27 21:28:40.310315+03
73ojf7h6r1qw75ec7bn608eij2lzeghd	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-10-31 15:37:57.083492+02
cmh8deke486x87ojwax1r92wn6dmmm84	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-11-04 16:27:57.387278+02
rbsqtjm4aa5snugq9hajp28y7gt9jodl	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-11-06 02:01:18.236352+02
0mq4tuifea8ksfh0l6ubwnlxve7r7ikg	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-11-07 16:51:21.750951+02
ykpyw0tll1adg4c1nve88ljzgjompi6d	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-11-08 01:01:02.184367+02
9fwhicfb24ngwch3guz0ususnrljgljo	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-11-21 02:12:50.957153+02
zy6m69kztiu4h0tuwo98j2n99k6fhyvg	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2016-11-29 02:58:03.97056+02
n9yb8lpeagmv8oci06xvy3xkb88jtnml	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-01-13 01:27:39.570036+02
kx0ips4w8ihbgzmrounpqaql39z2dsnc	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-01-19 16:29:18.103645+02
wu1bj3gxyd1mg5e80bsjr1ep4hd5nyae	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-01-19 18:20:03.141408+02
rf204ppcx0u9n2ddljiokbwiscseyvbv	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-01-19 20:22:26.648422+02
9xszarno4h74vdhcf39hkc5p94l9b045	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-01-20 17:44:44.204662+02
vcu3uh2rbildjk9vgejzf0dtr8lw966b	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-01-21 06:46:29.764041+02
vvlvuw313qjdwmml8tw6becrvb7mtrwj	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-03-09 19:27:00.837863+02
glrjos9ln3317sq0iwr5p3rcqlpjh2i3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-04-04 20:08:01.923605+03
q7zkyhzcohqyb5mkdukvlzq7i6igno1q	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-04-04 21:17:14.521872+03
no6opsuoyo3nw8n2tpkh6fube8em7suw	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-04-10 23:42:58.670518+03
0omcqz6scfkiirtyuk44istjewfry6zi	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-04-13 21:45:53.996755+03
j0bq64e9dc2yuf0b1m6odt6pdm79zkc4	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-04-14 18:54:03.645054+03
vbjpq9f74bx6ag3hljl8de29jmzvnzg3	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-04-21 18:18:14.983942+03
q2i4xsrp76oy7i6hzt2p1bgxgb978b02	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2017-04-27 19:03:18.956193+03
4418wk3csmuzpkp355d85gm03n5qhvop	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2017-04-27 19:05:17.663829+03
3e3kwhb8k25wledsevzbstw74w7mmrfn	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-04-28 14:57:39.0189+03
fpohy7084guxt8ddi0d96751wagrf8j0	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2017-04-28 15:34:15.871664+03
wim6j68knv2pgy8dkvq1niozk7llkmrh	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-04-28 18:01:16.398791+03
fvowzao4p0feh80mr8cqbe6r8ydfe0ls	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-05-01 14:37:00.701224+03
pih72o5j6hpmrc1t0q4yxq7c1dweu7zd	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-05-01 14:37:01.179999+03
7enx7sp5xvqve0stonzzw23lgongy8qz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-05-01 14:37:02.079488+03
9n53ew00jmkqrntrqqmm4xhyzsvefhta	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-05-01 20:14:11.838939+03
5i2i932xmdsiut5o0g1qewsjlgohdek9	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-05-01 20:14:11.92935+03
qss55pdaqijubba1zbt27aj4szx36plj	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-05-01 20:14:12.405273+03
74bpv21p0ljnr69v1ctu9r0d1v54b0z4	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-05-12 00:45:21.869279+03
jledd4aqzysdk2m7r8yg3nb8ux6x0o1j	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2017-06-02 02:01:49.296422+03
2vnlu9nagvaa1nbklbx2hp1cvwzvqyj6	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2017-06-03 18:31:11.701531+03
c0rl9vraopvkc72zknqrkwgz4b8cv7hf	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-06-04 11:15:43.098869+03
z44dz1i5kbg0arxig48o8gchlrom5uwg	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-06-04 20:22:23.295504+03
fuxi3ni1yf3o4qj85er8ofcugctjfc7a	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-06-05 08:50:26.678016+03
w2m2i9vkbnf6s63v62lo9q8mk90pkh8y	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-06-06 20:46:48.178008+03
9uojut5uga5rdlte0o8xabx3ozllmpm7	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-06-07 16:24:32.45346+03
bj3cvfdwh9etkmu6098zmurnn0hb2ptd	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-06-10 01:57:24.577112+03
9v04klfccmd36uyny4x7nprvuuqrlmi6	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2017-06-15 00:44:44.858543+03
xepkrk5u039nyi0scdhlvco083gtn1hu	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-06-20 16:54:06.191602+03
uyozrgy1f6r911rkrv6c8cdi313kk8sb	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2017-06-27 15:49:35.641456+03
1nxl8yinioc9nosgqoqnvxgs6i2kvatz	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-07 20:06:23.868118+02
krpkmn81u61nxsu5rgdkb94m5i85658k	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-07 20:11:40.849149+02
9w5mzgbi9yjsscnw1z8zynzwlce5337q	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-07 20:31:44.818361+02
6c0qlrtqissz3whym6bhtrq818rzvjdc	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-07 22:57:30.162955+02
j52gmvzuk89u8xljdqcatr5htf1rft5p	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-10 21:10:49.664974+02
9fp2qznidgy3h1ktlxw41e5lnzzf0mpe	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-10 21:42:54.364035+02
qtnu58bsljcbrsjrv1efg8pyjv6lofhk	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-10 22:05:25.333142+02
vxhs4c7n1rncyb3spxgtgcb5pnkdu5z5	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-10 22:35:38.166273+02
x79y5jibfvc3eqn90vdbsv7ek251gcy1	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-10 23:10:19.002315+02
csj3z1qbc0sq2vffv1zeyokgntvv4y07	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-11 07:20:47.048742+02
5wjcx0t216l6150s6sbuv56wixuvx049	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-11 20:45:32.533738+02
lavvj0rs1jjrerm2n6pretmmo2ih5r9t	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-11 20:47:50.893004+02
pej044yg9gbbew66iawkw2hjo61ounuu	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-11 21:00:26.032187+02
btr2qlwzcgxe199enq48amifrq30albv	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-11 21:01:45.891916+02
vmcmmpf36wrvf6tmgve2ryph4sbfsigi	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-11 21:25:39.241181+02
3ph4hecak0j7k4yuu1ouzpk3x2zuqe8z	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-11 22:14:11.597551+02
s2jzkx8dvv8bx6rsro74t42fiuxlnhbs	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-11 22:18:39.841086+02
0r3vg681rer1k4vm6t4ga75mz6b2j817	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-11 22:19:14.199562+02
cz1op16xbci0tfta996v3e6t8m36kny7	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-11 23:51:32.169879+02
eg1tv5j8tnc2yo5prsaibb4wvyvo9gjj	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-12 15:57:26.399763+02
629hupk5vw5hwvg2gdj92d8xxh5770rk	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-12 17:34:20.375267+02
mf7c12de4fx23pkwvfq7phxejsn6lvmt	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-12 18:43:25.836536+02
ddpy5pxrvj84924nm7f1y10k8enb7ils	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-12 19:24:10.791468+02
fyfe27baf52dmvuke9ouc5r97hw56hmq	YTdmNGEyYjYxNWVkNjQzMWM2ZDcxOTc3NjMwOTVhMGM1MjUwZjJmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjgwNDI5YjI3OTNjNmI2YjNmZGRmMDJiMGMyYzBkNWYxYTMzYWJlMzMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9	2018-12-12 20:21:49.397299+02
s7opd60fm7p5b1c120wugkubsdj18ori	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-12 23:29:43.959172+02
uyp2ypmrvo1muevf86ugx7607cz6ljih	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-12 23:45:48.599084+02
oaq5slx4pq5buk0e98la53ondh18kuij	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-13 00:38:22.770371+02
adysl32z01devl31ks109ygteszhztv4	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-13 00:40:34.924752+02
6vnw92942zayaevxzvutbncw2kohx5xr	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-13 03:21:19.103171+02
8aaadud465exzitjaae79usigecu8xva	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-13 03:23:48.549624+02
xxgo7pu6cpc5nfl8zuie3n5k84xvtxrb	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-13 04:00:33.732693+02
1as43dnnqgkqz5m0k0le492e0xrk9ie4	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-13 04:03:25.902141+02
ajhvv3vrop93h28qojrgcu8fn7l6eayk	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-13 05:13:02.321131+02
qwktqsr6e3harbqc4ctefy6lws2o6ipz	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-13 19:17:27.251757+02
pndnuxrbym7yr3u8arjz5u9gxfwnmx5d	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-13 20:34:53.80056+02
krob6r82gkft9xljbl4crb2dy9yd8j45	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-13 23:59:11.90374+02
zwt1e5hfz94xua2qqkdpwsfzr65n1tra	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-14 00:35:00.464324+02
s3atl14yv94s9yau0ox28x5n0fjkxbix	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-14 01:02:17.511322+02
mb1izccyevk6erx972uflm9n7zhb4h8t	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-14 15:52:01.960395+02
1hhn7c4zyf98jf5b6f2vze51k8urfxq0	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-14 17:04:54.973777+02
tgvkxkpnti9ywuwmqmr9t9ek4j55063v	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-16 14:55:04.714264+02
u1cp4fmnerm83kb4rert03eg3h6z8r1d	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-19 17:57:08.360138+02
lkot7s5k9acodbyy2qqwx4brhp0qx4cc	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-19 19:55:30.727644+02
q1zdisnn3t2t6hm1y660t7lfcdlati2m	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-20 00:59:13.274979+02
o8n6b8owhfvnnx4j9sg3vcmaz0zjv6cn	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-20 01:13:59.885287+02
5uk7n8adeqvggja0l61mb9vbhbc7v07r	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-20 20:05:10.365612+02
pxmnyxlw539lxovuj9h1xzlsyr37d3wk	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-21 01:37:31.916732+02
dvzglbvhtr8bn4wey8678yqlkvlk5881	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-21 02:50:12.704423+02
225dvphfwm83ek2athpscn2sakyvykzp	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-21 02:50:30.390506+02
05e31owu65508pvccbdq15zo58kotph4	OGFhNjE4YmUzMDY2YTFkYjQzMDk3MzI4ZTI5MDg0YzhhNjk5MzVhNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjMyODM3N2E2MmQ3YmIwZTdkNWYyZTA2Yjk3NTQwNTcwMGNkYjRhZGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==	2018-12-21 02:50:42.677592+02
5yrsz19og2w7dztkw9l14l4cn2h7lk4o	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-21 22:32:30.059499+02
h86ezq8cj5ojrwld4h5atuphhn7vyz22	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-21 22:49:23.261533+02
86spns7rtqkiiin7ilj8gvjza52mp09s	MDM1ZTcwM2MwNmFjNDA4MjVhMTk1NmRhYWM2MzNhYWNiN2ZlYjgyYTp7fQ==	2018-12-21 22:51:15.994936+02
z3tgw3ydoawfsuw2l3zcd8zqk1k8pc6b	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-22 03:18:19.996545+02
spyaah23qgej5f7oy635sqvq2lk1usnv	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-22 04:19:14.591521+02
u41tg61hzwgjkoxn9zwqfsb4gchyr9uh	OTRhYWEyZmU5YWZkNDIxYzA0M2JkYTA0YjZmOGNhZDE1Zjc5MzkzMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZkNzkxMDUwZTI2NmRlYTg0NTk3YTlmZDNiNzI3ZWFjMTc2MzBjOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEzfQ==	2018-12-22 15:13:43.540905+02
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.django_site (id, domain, name) FROM stdin;
17	realclearneighborhoods.com/brighton-heights	Brighton Heights
18	realclearneighborhoods.com/clabber-creek-3	Clabber Creek Phase III
19	realclearneighborhoods.com/brentwood	Brentwood
20	realclearneighborhoods.com/bridgewater-estates	Bridgewater Estates
21	realclearneighborhoods.com/brighton-cottages	Brighton Cottages
22	realclearneighborhoods.com/central-park-phase-4	Central Park Phase IV
23	realclearneighborhoods.com/copper-creek	Copper Creek
24	realclearneighborhoods.com/cottages-at-old-wire	Cottages at Old Wire
25	realclearneighborhoods.com/creek-meadows	Creek Meadows
26	realclearneighborhoods.com/sloan-estates	Sloan Estates
27	realclearneighborhoods.com/woodbury	Woodbury
28	realclearneighborhoods.com/lexington	Lexington
12	example.com	example.com
14	realclearneighborhoods.com/sunbridge-villas	Sunbridge Villas
15	realclearneighborhoods.com/mission-hills	Mission Hills Cottages
13	realclearneighborhoods.com/waterford-estates	Waterford
1	example.com	example.com
16	realclearneighborhoods.com/silo-falls	Silo Falls
29	realclearneighborhoods.com/copper-creek	Copper Creek
30	rcn-office	Office
\.


--
-- Data for Name: forms_associationtype; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_associationtype (id, label, asterisk, "order", is_published) FROM stdin;
1	HOA		1	t
2	Condominium	\N	4	t
3	HOA Gated Community		2	t
4	POA		3	t
\.


--
-- Data for Name: forms_collectionprocess; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_collectionprocess (id, label, "order", is_published) FROM stdin;
1	Check by Mail	1	t
2	Cash	2	t
3	Paypal	3	t
\.


--
-- Data for Name: forms_commonproperty; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_commonproperty (id, label, "order", is_published) FROM stdin;
1	Pool	1	t
2	Clubhouse	2	t
3	Trails	3	t
4	Park	4	t
5	Fitness Center	5	t
6	Tennis Courts	6	t
\.


--
-- Data for Name: forms_contactlead; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_contactlead (id, first_name, last_name, phone, email, preferred_method, message, date) FROM stdin;
35	Megan	Seliga	479-935-4177	megan.seliga@citytitlellc.com	Email	I am with City Title and I'm working on a closing for David and Candice Watkins at 33 Madrid street. Can you please let me know if they are current, what the dues are, and when they are paid. Thank you!	2015-07-24
36	Matthew	Weber	479-957-7613	matthew.weber@raymondjames.com	Phone	Live in Waterford and wanted to know if the calendar is available to check dates of reservation. Thank you	2015-09-01
37	Belinda	Booth	4792493132	bblais621@msn.com	Email	Hello, to whom this may concern. I believe this is the POA for Sunbridge Patio Villas.  I'm writing this e mail for my elderly mother. She bought a new house in this neighborhood approximately 2 years ago. She loves her house.  But she has a couple of concerns. She does not drive and attempted to walk to your place of business on Sunbridge but was unable to find it. She is 80 and my father is 86. I hate the idea of this , she said she sent a letter with her 50 dollars with her thoughts of improvement but never heard back, so I told her I would attempt to contact you this way first.  Anyway with that being said. \r\n1. Her issue with 2626 arroyo. She said they have a metal frame from a bed or something and old basket ball hoop beer cans etc. she is wondering who should be called to fix this problem. The renters or the owners of the property?\r\n2.  She also wants to know who is in charge of the side walk or lack of between the neighborhood and Sunbridge. I've noticed myself not just my mom but other people elderly and small kids having to walk in the street verses a safer side walk.  \r\n3. The last thing is the parking. There are signs posted no parking on the street. Yet people are doing it on all streets. I think this could be an issue for fire trucks and ambulance. Should she call the Fay police when this happens? Or is there another way to fix this?  \r\nI thank you very much for your time. Older people tend to over think about some things but I don't want her to worry about these things, I think some are validated. \r\nYou can call or e mail me anytime.  Sincerely Belinda Booth	2015-09-07
38	John	Hendricks	4794095927	thegreybarn@gmail.com	Phone	Please let us know if there is an opportunity to bid on the landscape maintenance portion of the HOA's you manage.  We would love to sit down and visit about what we can do for you.\r\n\r\nSincerely,\r\nJohn Hendricks\r\nThe Grey Barn	2015-11-10
39	Laura	Harrington	5017492424	lauramadisonpremiumdenim@hotmail.com	Email	Hi, I am the POA President of Brighton Heights neighborhood in Bentonville AR. The developers for Buffington Homes told me that you manage their POA's. I have been on the board 4 years b/c noone else would step up to take over the board positions. We are interested in having someone come out to Las Fajitas on Airport Blvd in Bentonville on Dec 15 at 7pm to talk to the current board who is stepping down, as well as neighbors so we can make a decision on hiring a management company. Can you please email back or call 501-749-2424?	2015-12-09
40	Nirmall	Dijkman	4792761603	nirmalldijkman@gmail.com	Phone	I live in the silo falls subdivision and I was wondering if anyone is going to fix all the entrance lights including the fountain lights on the 28th street entrance. Someone fixed the other side but this side isn't. Also panels of the outside fence are broken and missing.\r\nEveryone complains about this but I am not sure if anyone reported this.\r\n\r\nThank you,\r\nNirmall\r\n	2016-03-12
41	Sally 	Markle	479-203-7434	salmarkle@aol.com	Email	My name is Sally Markle and I'm a resident in Brentwood Subdivision in Cave Springs. We just received the letter today about Real Clear Neighborhoods (RCN) becoming the property managers for Brentwood. However, the letter also states that the process can take up to 60 days. In the meantime I have a question regarding the company that mows the common areas. I notice they mow all along the curbing of empty lots and the common green area. We also need them to mow the area along Ford Rd. behind the homes on Shook Dr.  There is no way we can mow BEHIND our back fence that faces Ford Rd. and the weeds are growing taller. Since that is part of the subdivision they need to be made aware to mow that area as well.\r\nThank you.\r\n\r\n	2016-04-13
42	Darrell	Fox		dwfox08@gmail.com	Email	Welcome to our neighborhood at Brentwood.\r\n\r\nI think we need a couple of reminders sent out on not having campers, trailers, mowing decks, etc. stored in the neighborhood.  These are on Cavern Springs Way west of the pool.\r\n\r\n\r\n\r\nThanks,\r\nDarrell Fox	2016-04-22
43	Sandra	Jackson		sandrajackson1@me.com	Email	A few comments on the proposed Open Space Management Plan:\r\n\r\nI suggest a section toward the beginning where the pertinent terms are defined. Most critically, I refer to the terms “Open Space,” “Restricted Common Areas,” and perhaps “invasive plants,” and suggest something akin to the following: \r\n\r\nAs currently drafted, “Open Space” is identified as “approximately 200 acres” but the provided map (which should be declared to being a part of the Plan and incorporated therein by reference) doesn’t seem to clearly designate these 200 acres. There are dark lines denoting distinct parts of the subdivision but they include residential lots as well as the section up front where the ponds are and the rear portions (meadow areas south of residential property lines and north of the river) are NOT included in the dark lines but I understood that was part of the 200 acres. A legal document like this one needs to be precise in definition and language so in the future, when read by others, its meaning will be clear.  A legal description should be included to help define this term.\r\n\r\nAs currently drafted, the term "Restricted Common Areas” is said to "mean those areas identified on the Site Analysis Map as such." I assume this is the little map attached to the plan but it does not use this  term but rather "Restricted/Protected Area" (assuming the two are, in fact, the same). The Plan should use only one term to refer to an area.  If these are the areas outlined in red, why (in addition to the riverside areas) is there only one small rectangle so designated (in the NE section of the map) for the front of the property? I just wondered if the pond areas and the berms would not also fit in this category? Somehow this needs better description. \r\n\r\nAnother term that may need better designation is "invasive plants." As people disagree on what is and isn’t “invasive” – and as such is subject to change over time -  I would suggest we reference an authority/expert guide that designates invasive species for Arkansas and provide that future disputes on this issue are to be resolved by reference to this authority (most current in year of the dispute). \r\n\r\nAnother problem I see with the Plan is that it is rather vague. I know and appreciate that the POA/board has worked hard to come up with something that should never have been our obligation and I thank you for that but I wonder if the City won’t want more details/specificity.  For instance, the Plan provides that "The POA shall have the authority to create and enforce certain rules, established by the POA." It seems that we should have those rules established before presenting the Plan (and those rules) to the City for consideration.  Additionally, as a resident, I’d want to know what those rules are and how they will be enforced.\r\n\r\nLastly, in the last sentence the proposed Plan states that all state and local laws and POA rules shall be abided by – does “local” mean City/County and/or should that be spelled out and do federal rules also apply – i.e. Corps of Engineers?   \r\nI hope these comments and suggestions are of help.\r\nSandra Jackson\r\n	2016-04-25
44	Brooks	Branham	4799570945	BrooksandAngela@gmail.com	Email	1507 Crestwood Hills Lane Cave Springs, AR\r\nWe got a letter that you guys will be taking over in our neighborhood. However we have yet to receive an invoice, pool keys, or a date/time for the next neighborhood meeting. I wanted to make sure you had our information since we are new to the area. 	2016-05-10
45	Renee	Taylor	479-787-8726	rtaylorbiz@gmail.com	Phone	I am interested in the home at 4607 SW SKyline, Rogers, AR and have been advised you may be able to tell me how to get in touch with the owners.  The phone number is very hard to read.  Thank you.	2016-05-13
46	Chelsea	Perry	479-644-6502	chelsalee21@aol.com	Email	We are new to the Brentwood Subdivision.  I just recently got an email that you are the new Mgmt over our POA.  We were also recently informed that our rates would be going up.  I am sure you are being bombarded with questions about that, but I was hoping to find out about financial plans on this.  Is there anyway we can set up a monthly payment.  $275 is a lot for most of the families in our subdivision to come up with at one time.  It would be a lot easier (our subdivision is a middle class neighborhood) if it were monthly.  Just curious as to this.  It would be $25 a month which is much more doable.  I know you guys are getting bombarded with questions and concerns.  Thanks for tending to all the neighborhood needs.   	2016-05-17
47	Ainslee	Brown	479.366.2466	ainsleebrown@att.net	Email	I moved into the Silo Falls Neighborhood June 2015.  I need to be added to your list to receive notifications for the neighborhood.  I did not receive notifications of the POA meeting held April 2016.  I did received the notice for the 2016 dues and this has been paid.  I need a code or card to access the pool that is scheduled to open Saturday, May 28th.  I would like a copy of the breakdown of the association account, board members name and contact information.   My mailing address is 6209 S 27th Street, Rogers, AR 72758.  Thank-you for your assistance!	2016-05-22
48	Stephanie	Henkel	8708308882	stephhenkel@gmail.com	Email	Hi, I was just wondering when I would receive the new code for the pool entry. I see that my check for the HOA fees has been cashed. \r\nThanks, \r\nStephanie Henkel Timmons\r\n6206 S 29th St, Rogers, AR	2016-05-24
49	Kristel	McBride	479-445-3999	kristelmeister@gmail.com	Email	I need to send in my dues. I stopped by the office yesterday while in Fayetteville, but no one was there...Anyway, want to make sure to pay dues so we can get this summer rollling! My kids and I love the pool so much! How much is dues, and where do I send a check. I lost the letter...\r\nThanks,\r\nKristel McBride\r\n2703 West Cobbler Place,\r\nSilo Falls	2016-05-24
50	Jay	Baker	662-647-4301	jpb4008@hotmail.com	Email	Hi, I live in Silo Falls neighborhood and have not received the pool code. My address is 6212 S 28th ST. Will you please send me the pool access code?\r\n\r\nThanks,\r\n\r\nJay	2016-05-24
52	Spencer 	White	5017336113	spencer9357@yahoo.com	Email	I live at 6018 S27th St in Silo Falls. I gave you a check at the meeting in April which has not been cashed yet. I would like the pool code. Thank you. 	2016-05-26
53	Ainslee	Brown	479.366.2466	ainsleebrown@att.net	Email	The community pool at Silo Falls Neighborhood is filthy.  The sides and bottom of the pool has green slim and debris.  You open up the grill you will find leaves and appears to have last Summer's food remains on the grates.  The concrete needs pressure washed.  How much did you bribe the Health Department to approve this?  If this is the best you can do to ready the pool for summer then I demand a refund.  I did NOT get any value for my money!!!	2016-05-28
54	Derek	Habetz 	3377944620	derek_habetz@yahoo.com	Email	we have not received the code to the pool in silo falls subdivision. Can you please email it to myself or my wife, kat_nsu@yahoo.com.  2601 W Amour Dr 	2016-05-29
55	KIm 	Marbury	4795861009	kjpharmd@hotmail.com	Email	Hello, I live in SILO FALLS. (6202 S 27th ) We have paid our dues but have not received pool code as of yet. Can you please email to me?  kjpharmd@hotmail.com.     Thanks! Kim Marbury	2016-05-31
56	Philip	Miley	870-972-5253	valleyviewpoatreasurer@gmail.com	Email	We are interested in your service for billing, collections, past dues and related penalties, and monitoring covenant violations and related communications. I am treasurer and a retired CPA and can handle all financial services mentioned in your website. I got your name from William Stephenson our current President of Valley View POA, Farmington, AR. We have approx. 420 residences.  I would like to have an estimate of your fees for these services. 	2016-06-11
57	Ben	Bashaw	4799578006	bvbashaw@gmail.com	Email	I was told to contact you guys to register as new homeowners in Copper Creek.  Just need to know how to proceed from here.\r\n\r\nThank you.\r\n\r\nBen	2016-06-13
58	Sharon	Pepple	479-435-1405	spepple19@gmail.com	Email	Cottages at Old Wire Rd- In the common area in front of 1367 Cierco Ln. the tree is dead.  It has been dead for about a year.  	2016-06-14
59	Craig	Cowart	5593330866	cowart287@gmail.com	Phone	My questions is to Andy, I am a current resident at Brentwood in Cave Springs. My neighbor directly behind me has placed a very large outbuilding in their backyard and the adjoining utility easement. According to the bylaws, this should have been approved through the home-owners association and built with limitations. How can I find out about this buildings approval from the committee and my rights to reject its placement?\r\n\r\nCraig Cowart	2016-09-30
60	Ashley	Shaw	6603417237	apk1158@gmail.com	Email	Hi,\r\n\r\nWe live in the Brentwood Subdivision in Cave Springs, AR. Based on the Brentwood POA update it looks like we were supposed to have approval before putting a shed in our backyard? \r\n\r\nWe have not submitted a request, but ask that you can point us in the right direction for this approval.\r\n\r\nPlease feel free to reach out to me by phone or email 660-341-7237.\r\n\r\nThanks,\r\n\r\nAshley Shaw	2016-11-18
61	Angela	Mahoney	8163722219	angelacarlene@hotmail.com	Phone	I live in Brentwood and havent received POA dues statement.  How much are they and how do I pay them?  Thank you.	2017-01-06
62	Angela	Mahoney		angelacarlene@hotmail.com	Email	I'm following up on our conversation 2 weeks ago regarding our POA dues in Brentwood.  Did you find out if Buffington paid for 2016?  Our address again is 1701 Cavern Springs Way.  Please let me know.  I'd like to get this resolved.  Thank you.	2017-01-17
63	Jeff	Kulbeth	479-422-7040	jmkulbeth@gmail.com	Email	Hi RCN:\r\n\r\nI live in the Brentwood Subdivision of Cave Springs, AR.  Easy question.  I'm considering building a deck in my backyard to replace the concrete patio.  Simple design: roughly 23 feet wide and about 16 feet deep.  It'll extend about 8 to 10 feet past the roof line of the patio.\r\n\r\nDo I need approval from the POA prior to construction?  Are there POA guidelines I need to follow regarding the design or size?  \r\n\r\nThanks,\r\n\r\nJeff Kulbeth\r\n510 Hillsview Ln\r\nCave Springs, AR  72718\r\n479-422-7040\r\njmkulbeth@gmail.com	2017-02-20
64	Thomas 	Lackey 	8174129608	sofree76015@yahoo.com	Phone	I live at 3486 Hearthstone and to date have not received notice of Association dues and where to send them for Copper Creek. Please contact to give needed information. 	2017-02-24
65	Jennifer	Christman	479-582-5673	jennifer.christman@mercurytitlear.com	Email	I have been trying to verify HOA dues and have emailed Carolina and Andy as well as info@realclearneighborhoods.com and no one has responded to my emails. The properties are being sold next and week and it is very urgent that my request is responded to promptly.	2017-03-10
66	KEVIN	PRIMM	4792641997	77kprimm@gmail.com	Phone	I moved into Copper creek neighborhood at the first of the year, and would like to get fabs for pool and tennis courts.  Please contact me and let me know what i need to do\r\n\r\n\r\nThanks	2017-03-22
67	Chris	Hudgens	4798998908	chudgen@gmail.com	Phone	We are moving out of our house in Silo Falls on 4/14.  Our dues haven't been mailed to us yet and we haven't paid them.  What dates do the 2017 POA dues cover?  Do we need to split the dues with the new homeowner?	2017-03-30
68	Jason	Stanley	4792704229	jasonstanley888@yahoo.com	Email	Hello RCN, I'm a Silo Falls resident and was wondering about the status of the stop sign on S. 26th St. and Garret Rd. Any update on this sign that has been down for a few months now? I spoke to one of your employees back in January about it and they said they would have to order the new equipment for it. Can you please provide an update?	2017-04-03
69	Anthony	Crowson	870-692-4168	tvcrowson1970@att.net	Email	We are going to extend our back porch with a deck.  Do you need anything ahead and do we need a clearence from you?  Lowes is going to install in June.     We are at 2075 Riverfront Lane.    \r\n\r\nSincerely\r\nAnthony Crowson	2017-04-17
70	Jay	Schrade	9705800770	jayschrade9@gmail.com	Email	My family moved into the Brentwood Subdivision last fall and a looking forward to a great summer at the park and pool. I mailed my POA dues in earlier this week and was wondering how we can get our key to the pool?\r\n\r\nThanks,\r\n\r\nJay	2017-04-18
71	Amanda	Musick	4796591661	mandymusick@yahoo.com	Phone	Hello,\r\nWe have a home in Brighton Heights in Bentonville.  It is my understanding that you collected POA dues last year.  We would like to know if you are collecting them again this year.  We moved from the house three years ago and have requested the POA bill to come to our current address each year.  Will you kindly give us a call so that we can make sure the bill comes to the correct address?\r\nThank you,\r\nScott and Amanda Musick	2017-04-24
72	James	Boren	4795301539	borenfamily2008@gmail.com	Email	You sent the invoice CC-2017-23 for Adam Brown to my home address , which is 4543 Furlong Dr. Springdale AR\r\n\r\nPlease change the billing address for Adam Brown at 4037 Olive Tree Dr Fayetteville AR 72704 ( lot 23 Clabber Creek Phase III) to  4037 Olive Tree Dr Fayetteville AR 72704.\r\nI shredded the invoice so you'll need to send him another.\r\nThanks	2017-06-01
73	Gina	Hellums	479-883-3885	ghg.properties@yahoo.com	Email	Re:  Sunbridge Villas POA\r\n\r\nI just got the notices for POAs for 2016 & 2017.  We moved a year ago.  Our address is 2803 SW Joshua Ave, Bentonville, AR 72712.  We also own the house at 2622 Sierra Ave but it was not listed on the invoices.  2622 Sierra is owned by GHG Properties LLC, which is our business.  The mailing address is the same address listed above.  Please update our address for all of our properties.  I will get a check in the mail for $500 ..	2017-06-09
74	Marc	Murders	4794093708	mdmurders@gmail.com	Email	I submitted a request for proposal or fee schedule a couple of weeks ago for St. James Park POA.  Is there an update?  I have a board meeting in 7 days and would like to be able to provide and update.\r\n\r\nMarc	2017-06-22
75	Julie	Schmidt	479 445-7970	juliekschmidt@cox.net	Phone	need info. on how to go about getting two clickers for the gate in Waterford Subdivision. I live at 2452 Riverwater Lane. Thank you, Julie Schmidt	2017-07-24
76	Carla 	Buzzard	479-799-3287	cbuzzard@cox.net	Phone	Andy,\r\n\r\nWe would like to see if you could please mail us a new pool key, We lost ours. Please send to 1502 Parkside Circle Cave Springs, AR 72718. We will send you what we owe for this if you will send an invoice.\r\n\r\nThanks,\r\nCarla Buzzard	2017-07-25
77	James 	Nichols 	479-238-5821	twotim2_2@yahoo.com	Phone	We sent payment for a replacement pool gate card to the address on the invoice and it came back today undeliverable. Please advise where we should send this payment.	2017-08-02
78	brian	reilly	479-202-1205	alkalizemenow@yahoo.com	Phone	-How is a new homeowner in the Lexington Sub-division made aware that their property/lot has POA covenants ?\r\n\r\n-Are they provided copies of the covenants at closing ?\r\n\r\n-What method is in place to ensure the covenants are being enforced ?\r\n\r\n-Has there been an Architectural Control Committee established for the Lexington sub-division ?\r\n\r\n	2017-08-03
79	Adam	Martin	9134880153	adammartindesign@gmail.com	Email	I live in Brentwood, in Cave Springs, I have not received any information from you. \r\n\r\nWe moved in to the neighborhood in March. Are we not on any mailing list you have? \r\n\r\nThank you. \r\n\r\nAdam Martin	2017-08-07
80	Shari	Clark	479-530-6060	sharicclark@gmail.com	Email	This is Shari Clark and I live in Waterford subdivision and I just wondered where to go for the covenants for our neighborhood. I needed to know about adding a concrete patio to our back yard. Thanks for your help. 	2017-08-15
81	steve	jacoby	4797904641	steve.jacoby@fayar.net	Phone	Tried calling and no way to leave a message!\r\n\r\nEntering code number 8453 does not work.  Am I leaving something off the end or is there a "hick-up" with the number?\r\n\r\nThanks\r\n\r\n\r\n	2017-08-23
82	Ryan	Hodson	4798795826	ryanphodson@gmail.com	Email	this is a test	2017-08-24
83	Philip	Rule	479-276-1060	philip.rule@gmail.com	Phone	I'm a board member of a POA in Bentonville, AR looking to hand over the treasury position to a management company if the price is right. We have about 128 houses, no POA facilities, or a pool. The only thing in paying bills, PO Box if needed, future project budgeting, and collecting POA dues and enforcement of the By-laws and collections. Is there anyway you could give me a rough estimate of what the monthly rate or charge to manage such a POA as ours? Thanks.	2017-10-03
84	X	Teri		mrxteri@outlook.com	Email	When will the Eastview POA provide you with an answer as to whether they choose you to mange the POA? Thanks	2017-10-08
85	Jason	Alexander 	4799356689	jalexan44@yahoo.com	Email	Hello, we live in  Lexington sub in Centerton. We want to understand the requirements for storage units in the back yard. Please let us know so we can look at options. \r\n\r\nThanks, \r\nJason	2017-10-15
86	Kathy	Phillips	4794664363	kablackwell5372@gmail.com	Email	I am signed in with Lot 14 and my husband just tried to sign up and it wouldn't let him because someone had already used that lot.  What do we do to get him signed in too, or do we have to sign in with just 1 of us.\r\n\r\nKathy	2017-10-19
87	Thomas	Beck		tjbeck@gmail.com	Email	I attempted to create a homeowner account but received an error. When I attempted again it said the email already exists. I attempted to log in but was told the password was wrong. I used the forgot password link to reset it, but received an error.\r\n\r\nHow can I create an account and log in?	2017-11-03
88	John	Doe		johndoe@johndoe.com	Email	Your success message for entering this form is lorem ipsum.	2017-11-03
89	Catherinne	Landaverde	479-586-5170	cathylandaverde@gmail.com	Email	I would like to set up an appointment for the  East view community in Springdale Ar 	2017-11-09
90	Kevin	Bollman	814-777-1196	KevinBollman@gmail.com	Email	Hi I live in the Arbor Glen neighborhood of rogers.  I have had several incidents with our neighbors pertaining to our dogs.  It seems that our neighbors do not like me walking my dogs on the sidewalk in front of their property.  The dogs are always well controlled and I am sure to clean up any messes that are left by the dogs.\r\n\r\nI have tried several times to talk to my neighbors but that usually ends in a shooting match with said neighbor.  Does the POA have a stance or guidelines on pet ownership?  Also are there any plans to put in a pet friendly are in our neighborhood?\r\n\r\nAny feedback on this issue would be greatly appreciated.\r\n\r\nKevin Bollman	2017-11-15
91	Karen	Kinney	501-228-8239	karen.kinney@stewart.com	Email	I am needing the POA information for Otter Creek Estates, Phase II\r\nProperty: 204 Torrance Drive, Cave Springs, AR 72718\r\n\r\nSeller: Buffington Homes\r\nBuyer: Daniel and Stephanie Lauderback\r\n\r\nI need to know if they are current?\r\nHow they are paid Monthly, Annually, etc. and the cost?\r\n	2017-11-27
92	Stanley	Patterson	479-531-7798	bevstan71@yahoo.com	Email	We have not received an invoice for 2018 HOA dues.  We are at 500 Oakleaf Trail, Lot #102.	2017-11-29
93	brad	frazier	9103892156	bradley.d.frazier16@gmail.com	Email	Good Morning, Andy and team,\r\nBrad Frazier writing from Spring Ridge.  I am a recent addition to our POA and have some questions to answer to the board about services from your management team.\r\nWould love to meet next week if possible.  Anytime early in the week would be great.  I am happy to come by.\r\nPlease let me know.\r\nThanks much,\r\nBrad\r\n\r\nBrad Frazier \r\n910-389-2156	2018-02-15
94	DOROTHY	HENDERSON	4792008485	bobbiehenderson38@gmail.com	Phone	Andy,\r\nI wanted to let you know that I have sold my home in Copper Creek. I live in California.\r\nWilliam (Bill) Henderson my husband. Bill passed away\r\n January 13,2018.\r\nI would like to be taken off of your mailing list.\r\nThank You,\r\nDorothy Henderson  2438 Venice Court Discovery Bay CA\r\n479-200-8485 \r\n	2018-02-16
95	Dennis	Dobbs	8703073495	dandq@ipa.net	Email	How would I go about gaining information about and access to documents concerning the Sloan Estates POA?\r\n\r\nThanks for the assistance 	2018-02-17
96	Jack	thompson	4796594528	jdt52252000@yahoo.com	Email	When are you planning the spring garage sale?	2018-02-26
119	Chris	Bartholomew	(479) 426-3423	cbartholomew14@msn.com	Email	We live at lot 56 in Oak Tree in Centerton.  There is a vacant lot next to me that needs mowed badly.  I believe it's lot 55.  Can you please have the owner mow soon?\r\n\r\nThank you!\r\n	2018-05-16
97	MIKE	TREVATHAN	3183661211	mtrevathan@gavilancapital.com	Phone	My name is Mike Trevathan. I am an owner/partner with Gavilan Capital LLC, a private equity company specializing in multifamily acquisitions. My company is executing PSA for Maple Manor Apts, located at 3001 Wedington Dr. in Fayetteville, AR. I am conducting due-diligence to find 3rd-party property management team for this  128-bed asset built in 1973. Please contact me at your first convenience on my mobile at 318.366.1211 to discuss this opportunity. Thank you for your attention to this message. 	2018-02-28
98	Chad	Gilliam	4798995918	chadgilliam04@yahoo.com	Email	Received a letter for dues however those should have been paid when we closed on the house in early Feb	2018-03-04
99	Kishor	Karuvath	4798022584	kkaruvath@gmail.com	Email	I live in Parks at Brighton Bentonville and the Lot# is 104.\r\nAddress: 4708 SW Birmingham St\r\nBentonville, 72712\r\n\r\nI couldn't add this address to my account since the community is not available in the drop down. Please correct my account accordingly so that I can pay my dues online before march.\r\nThanks\r\n\r\nKishor Karuvath\r\n	2018-03-11
100	Betsey	Huson	489-841-1252	nursebetsey@aol.com	Email	Hi! I live at 13199 rusty Blackhaw court in spring ridge subdivision. I have a complaint about a home on Crest Lane 8874 Crest Lane-Linda and lee Jaslow. They have a skeleton in a swing in their front yard. It’s been there for a long time and in my opinion would only be appropriate for Halloween decoration. Please let me know if this can be addressed. Thank you. Betsey and Nelson Huson	2018-03-20
101	Betsey 	Huson		nursebetsey@aol.com	Email	Wasn’t sure if I put my complete email address	2018-03-20
102	Ron	Shumate	4798415906	shoe1701@gmail.com	Phone	Hi, this is Ron shumate, I am working with a builder in legendary subdivision in the reserve part. I have plans to put a retaining wall in the backyard for a pool, I understood as best I can find out that you may be a part of the POA and wanted to get approval before starting. We are hoping to start the pool early next week. But the retaining wall has to be approved for the project to work. Feel free to call me or text me at your earliest convenience. I appreciate your help or any other help you can give me.\r\n\r\nThanks	2018-03-22
103	Linda	Cline	5202712344	lecline44@hotmail.com	Email	I would like to pay my Liberty Bell Estates POA with my credit card. Will I be able to do that?\r\nThank you,\r\nLinda Cline	2018-03-25
104	Carolyn	McGinnis	479-544-5555	cjmcginnis13@yahoo.com	Phone	I received a bill for the POA dues on Liberty Bell property address 5606 S 62nd Street in Rogers, AR.  We sold that property and closed on 8/3/17.  The new owner is Cassie Middleton.  Please contact her at 479-422-2828 for the correct address to send the bill to.\r\n\r\nThank you.	2018-03-27
105	Jim	Walker	479-409-7500 	jim@laneybusiness.com	Phone	The island on 46th blvd in Cross Creek, Rogers, is in need of week control.  Henbit is taking over.  \r\n\r\n	2018-03-31
106	Lisa	Smith	7654049228	lisawl03@gmail.com	Email	We live at 5409 S 60th Place in liberty bell north and haven’t gotten the letter about POA management we also don’t have info on dues or pool key\r\n\r\nThanks	2018-03-31
107	Robert	Mckeel		bobmckeel@gmail.com	Phone	5704 south 63rd street.                                                                              Liberty Bell South.                                                                                       \r\n\r\nWe purchased this house in October 2017.\r\nOur mail is checked daily(we live in Jonesboro still)\r\nWe have not received an invoice at the time for POA.\r\n\r\nPlease advise!  Also, the street light in front of the house is out, but you may be aware of this.\r\n\r\nThank you,\r\n\r\nRobert McKeel\r\n\r\n	2018-04-04
108	LaDonna 	Leach	479-445-3468	lsharp172762@yahoo.com	Email	I paid my 250.00 dues and my neighborhood isn't showing up to sign in. Lakewood crossing Lowell ar lot 77. I would like to know exactly what that money is going towards  please send me info as to how it's going to be disbursed for this neighborhood. 	2018-04-10
109	Terri	Mossberger	4792835528	tmossberger@gmail.com	Phone	We moved in silo falls about 4 months now. \r\nLot#16 address 2604 W. Murfield Dr. Recently paid our p.o.a annual dues. \r\nQuestions:\r\n1.  Who can we contact for a key or code for the community area (pool)?\r\n2. Our subdivision is lack of street light.  Seems like this is a hugh safety concern for myself and other neighbors as well.\r\n\r\nThank you,   \r\nTerri Mossberger 	2018-04-11
110	Robert	Stinnett	9726588780	Robert.stinnett@bayer.com	Phone	Need directions and setup of use of the front gate.  I have two key remotes, but do not know how to use the key pad.\r\n\r\nAny help is appreciated..\r\n\r\nNew Resident: 3261 Oak Tree Drive	2018-04-20
111	Matt	Venable	479-200-0343	mvenable86@gmail.com	Phone	Moved into our house April 2017, and was told sellers had paid 2017 POA dues. Received a bill for 2017 dues in November 2017 and then 2018 bill a few months later. I've since paid 2018 dues but am still waiting on answer for why I received 2017 dues. Also am needing receipt for 2018 dues. \r\n\r\nThanks,\r\n\r\nMatt Venable	2018-04-23
112	sarah	emeterio	479-871-1275	sarah_emeterio@hotmail.com	Email	I mailed in my POA dues approximately a month ago and the check has not posted to my account.  Just wanted to check and see what was going on.  I would assume if you had received it it would have been posted.  Please let me know so that I can issue another.  	2018-04-30
113	X	Teri	479-757-9903	mrxteri@outlook.com	Email	I signed up but your site doesn't list Eastiview Estates in Springdale. Thanks	2018-05-01
114	Steven 	Ko	479-200-5693	stevenkoptatc@gmail.com	Email	Hi,\r\n\r\nI live in Liberty Bell North and was wondering if you could get the mowers out to mow the area behind my fence line (5306 S. 62nd Place) including the retention pond.  There is starting to get a lot of weeds and dandilions that I'm wanting to keep out of my yard.\r\n\r\nThanks\r\nSteven Ko	2018-05-01
115	X	Teri	479-757-9903	mrxteri@outlook.com	Email	I wrote yesterday, both on this form and with email followups to "Andy" and the "Info" email address. I didn't receive a reply to either one. Thanks	2018-05-02
116	Emily	Noetzel	14792634474	emily.noetzel@buffingtonhomesar.com	Email	Hi there, \r\n\r\nI am the current sales agent for Buffington Homes in Otter Creek. I’ve had several homeowners and soon-to-be homeowners asking about the pool code. What’s the best way for them to gain access once they’ve moved in? \r\n\r\nAny help would be greatly appreciated. \r\n\r\nHope you’re having a great day,\r\nEmily	2018-05-08
117	Peggy	Arend		luke1910arend@gmail.com	Email	I moved in recently and learned I need to paint the fence. What are the poa color options etc.   Can you provide a link to the poa requiremnts dealing with my wood fence?\r\n\r\n  I called and was sent to an answering machine.  Is there someone who is available during work hours to take phone calls? Can you send me the phone number and name? I would like to hear back from you today. \r\n\r\nThank you	2018-05-10
118	Joy	Dearien	4792368091	aprilbabydoll@hotmail.com	Email	Can a person pay their dues with a credit card?  I don't have any checks.  I pay my bills online.	2018-05-15
120	Chris	Bartholomew	4794263423	chris@nwarealtygroup.com	Email	I live in the Oak Tree subdivision in Centerton.  Our entry gate seems to be disabled.  I came through the gates at 9:50 pm last night and the gate was open.  I have came through past 9:00 pm a few times over the past few weeks and it has been open.\r\n\r\nThank you!	2018-05-18
121	Mitch	Charlton	4174994593	mwcharlton008@yahoo.com	Phone	We moved to liberty bell estates in August of 2017 and we were wondering how we go about getting a key to the pool for the summer?	2018-05-20
122	James	Parr	4797993748	james.parr.ar@gmail.com	Email	I live at 303 Henning Cir in otter creek. I paid my dues earlier this year but have not heard anything since. When will the pool open? Is there a community website now? Any other significant news?\r\n\r\nThanks James	2018-05-21
123	Juan 	Casas	4793069974	juancasas193@yahoo.com	Phone	Hello,\r\n\r\nI'm trying to pay the Eastview Annual POA fee but I would like to do it by phone or internet since that would be more easy for me, I called the number on the sheet I received through mail but none of the options were to pay. 	2018-05-21
124	Adam	Keeley	4797151508	adam.keeley@gmail.com	Email	Hi -\r\n\r\nI live in Cross Creek in Rogers, AR. I need help with two things: 1) I need to have my pool key cards activated (or issues two new ones). 2) I also want to confirm that I am on the email distribution list and the physical mailing list, as I understand other neighbors have received some communication from Real Clear in both of these manners, but I haven't. Please let me know how to proceed on these two items. Thanks!	2018-05-24
125	Kalyn	Cavalier	4799666702	kalynn.cavalier@gmail.com	Email	Hi! \r\n\r\nI have sent in my yearly dues twice (second time being 5/3/18) and either have yet to be debited from my checking account. Can you please confirm they have been received?\r\n\r\nThanks,\r\nKalyn Cavalier\r\n1259 S Oxbow Way\r\nFayetteville, AR 72704 	2018-05-24
126	GANGA	KOPPULA	4797152300	gangakiran.koppula@gmail.com	Phone	Hi,\r\n\r\nI have been trying to reach you to find the payment due for this year and already made the payment for the last year.\r\n\r\nI made a payment in the harvest bank in the last year and shared receipt.\r\n\r\nPlease call me @479715230/email me @ gangakiran.koppula@gmail.com for the details.\r\n\r\nTHanks,\r\nGanga.\r\n\r\n\r\n	2018-05-27
127	danette	bowles	4795861641	danettebowles@yahoo.com	Email	I just wanted to let you now that I am no longer in the Silo Falls neighborhood.  That house sold last August.  I have received an invoice for POA dues.    My address was 6209 S 26th st.	2018-06-02
128	Brett	Pittman	6202004117	bcp22@live.com	Phone	I bought a house in Brentwood and it’s been weeks and I still haven’t received my key to the community pool, where can I pick one up?	2018-06-04
129	David	Christenberry	4792256948	davidc6948@gmail.com	Email	I live at 6211 S 26th St, Roger 72758. I’d like the pool code please.  Aldo, if lokecfir slmeobevto call me back regarding poa dues prior to you all taking over the responsibilities.  I was taking care of the front entrance, mowing and weed eating the pond so my son and I could fish and kept up with the playground area. They were actually bailing hay on the lots. I’m hoping that someone will at least call me back regarding this. This is my fourth request in a year. \r\n\r\nThank you\r\nDavid	2018-06-07
130	Steven	Sterling	4792561354	kwks19@att.net	Email	Me and my wife live in the Eastview subdivision and were unable to attend the meeting. Is there any way I could get a briefing of the topics discussed? 	2018-06-09
131	Lee	Jaslow	4792481110	jaslowleeother@gmail.com	Email	Can we get the weeds remove at the entrance of the neighborhood … both sides of the street.  Not only will this look better, it will enhance the value of our properties!\r\n\r\nThanks!	2018-06-13
132	Betsey	Huson	4798411252	doesforsteak@aol.com	Email	Curious about our front entrance common area. Are we getting sod around the new sidewalk? And why haven’t we turned on our sprinkler system so that the grass doesn’t die? 	2018-06-18
133	Brian	Broduer		bbroduer@cox.net	Email	We haven't received our POA dues statement.  6102 Valley Forge Dr Rogers AR 72758.  Liberty Bell Estates.	2018-06-26
134	Brian	Broduer		bbroduer@cox.net	Email	Can you tell us where to purchase a new mailbox for the Liberty Bell Estates North neighborhood ?	2018-06-26
135	Don	Schofield	8019207603	dbschofield@yahoo.com	Email	I am currently in the process to get a loan for a property in the Parks At Brighton neighborhood in Bentonville, AR.   The mortgage company is asking for: \r\n\r\n"MASTER INSURANCE POLICY – NEED TO KNOW IF THERE’S AN HOA FOR THE SUBJECT PROPERTY, IF SO, NEED THEIR CONTACT INFO. AND A COPY OF THE MASTER INSURANCE POLICY FOR THE COMMON AREAS"\r\n\r\nCan you please provide a copy of the master insurance policy.\r\n\r\nThanks\r\nDon	2018-07-07
136	Jim	Ford	479-651-4108	jfordinfs@cox.net	Email	We live at 5611 S. 60th Pl, Liberty Bell-South. There is a space between the back fence of the folks on the east boundary of the neighborhood and the property behind us.  We were told when we bought that the POA would keep this space mowed.  In our first summer it was mowed each month, the next summer maybe 3 times. Last summer once.  This summer Zero.  What is your understanding of maintaining this area? Glad someone has taken over the management of the POA and we have someone to talk to.  Thanks. Jim F.	2018-07-09
137	Jennifer	Dickerson		jeneliz1@yahoo.com	Email	hello.  I am trying to register but the site says my email already has an account under it.  I have not signed up before.  I also keep getting an Error when i try to submit the needed info to register.  \r\nI learned of this web page yesterday at our annual poa meeting.  what is the web page for exactly?  \r\n\r\nthank you\r\nJennifer	2018-07-27
138	Clinton 	Slate	479-445-7342	clinton.slate@yahoo.com	Phone	The dump trucks delivering gravel to Lakewood 4 need to slow down upon entering the property. Lewth(?) trucking is accelerating continuously until he has to slow to turn. He is running between 35 & 40 mph down Woodland off of 264   	2018-09-17
139	Deidra	Mitchem	2055635223	dlcpoaii@gmail.com	Email	I sent an email back in September. We are looking into your company to help us with our HOA. What is your charge per house and what would that cover?\r\n\r\nThanks	2018-10-22
140	NA	Thompson	NA	bthompson@city-recognition.com	Email	I am happy to tell you that Real Clear Neighborhoods was chosen for the 2018 Best of Fayetteville Awards in the category of Homeowners' Association. The Best of Fayetteville Award was created to acknowledge the best businesses in our community.\r\n\r\nFor additional information please visit us at:\r\n\r\nhttps://fayetteville.city-recognition.com/MDKM3-UBD6-EXDD\r\n\r\nIf needed for reference - your code is: DKM3-UBD6-EXDD\r\n\r\nCongratulations,\r\n\r\nBlake Thompson\r\nBest of Fayetteville Awards\r\n	2018-12-06
141	David	Chapman	4796197773	chapman_history@me.com	Email	Hello!\r\nThere is a builder's sign at the west entrance of Liberty Bell Estates South. The sign is no longer relevant as we have no more empty lots. The sign is faded and damaged. Can that sign be removed, please?\r\nMany thanks for all you do!\r\nDavid	2018-12-08
51	Chris	Allen	4794666295	chrisallenhogs@yahoo.com	Email	I live in Silo Falls and was needing the pool code - It has never been sent to me.  Our address is 6202 S 28th St.  Rogers, AR  72758	2016-05-25
\.


--
-- Data for Name: forms_meetingfrequency; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_meetingfrequency (id, label, "order", is_published) FROM stdin;
1	1-2 per month	1	t
2	2-4 per month	2	t
3	2 per year	3	t
\.


--
-- Data for Name: forms_proposalrequest; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_proposalrequest (id, first_name, last_name, phone, email, preferred_method, subdivision, association_name, city, state, zip, number_of_homes, meeting_frequency, fee_collection, same_assessment, board_member, board_requested, reserve_study, transition_date, proposal_due_date, date) FROM stdin;
11	Marc	Murders	4794093708	mdmurders@gmail.com	Email	St. James Park	St. James POA	Fayetteville	AR	72704	73	2 per year	Check by Mail	yes	yes	yes	no	TBD	6/22/2017	2017-06-01
12	Benjamin	Orr	479-640-8742	Edinburghpoa@gmail.com	Email	Edinburgh	Edinburgh POA	Lowell	AR	72745	90	2 per year	Check by Mail	yes	yes	yes	no	September or sooner	As soon as possible	2017-06-09
13	Philip	Rule	4792761060	philip.rule@gmail.com	Email	The Orchards	The Orchards Home Association	Bentonville	AR	72712	128	2 per year	Check by Mail	no	yes	yes	yes	10/10/2017	10/6/2017	2017-10-03
14	Nathan	Putt	4799250495	chairman@hearthstonepoa.com	Email	Hearth Stone	Hearth Stone Property Owners Association, INC	Rogers	AR	72758	242	1-2 per month	Check by Mail	yes	yes	yes	no	03/2019	10/1/2018	2018-09-05
\.


--
-- Data for Name: forms_proposalrequest_association_types; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_proposalrequest_association_types (id, proposalrequest_id, associationtype_id) FROM stdin;
13	11	4
14	12	4
15	13	4
16	14	4
\.


--
-- Data for Name: forms_proposalrequest_common_properties; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.forms_proposalrequest_common_properties (id, proposalrequest_id, commonproperty_id) FROM stdin;
12	13	4
13	14	1
14	14	2
\.


--
-- Data for Name: front_placeholder; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.front_placeholder (key, value) FROM stdin;
181378f5491832b9f9f2330a4785c227859adee3	<h2>Financial<br />\nManagement</h2>\n
1f441cd9dc7af5ad9fa564a7063f1a830051c67b	
4350d165b3e840cf940c1cf65074c489b31aa048	<h2>Document<br />\nMangement</h2>\n
46624b9f919e1e8f339682ddcb813ae251a9314a	<h1>ABOUT US</h1>\n
4ddb24b5045ed3a9902e196c51d7ca09db162463	<h2>Lorem ipsum dolor sit</h2>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>
585446c059471d2cf10905f3deaeeee4f35bb11c	<h1>SOLUTIONS</h1>\n
6ce6c1e34e78dbcb75e80b00184bf340f68d19c8	<h2>Community<br />\nResources</h2>\n
713d85c82cb61150f00888ebc22de643a498571f	<h1>Success!</h1>\n
85ffcef5f6e0d8f5da12d6802dc84d2e098ea5cb	<h1>NEWS</h1>\n
8eb0fa75992e87dc84652e101e6c48e09dd5bfa8	<h1>DOCUMENT MANAGEMENT</h1>\n
99563d8bf7e0d6aeb596f68910a5935e2a952892	<h1>CONTACT US</h1>\n
a7ccd78652e4588047c0fcf06f76a5eb33f70dfd	<div>&copy;2015 Real Clear Neighborhood&nbsp;&bull; All Right Reserved</div>\n
baa6f6e8bd2b1c0f84fd1387d07d74b4cde75491	<h1>Who We Are</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.</p>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n
bd87f251dfbe1a574db880f17457e0e622609d10	<h2>Association<br />\nMangement</h2>\n
cc7e5277d5d488e977474c56bec26e24b13525ca	<h1>ABOUT US - FAQs</h1>\n
d500543749efdaa532ecaa4e55e7889e464f5468	
ebcae1a3727b5c5e6aef358b24e33e07b583beeb	<h2>Your Question Has Been Sent</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex commodo emin ad ut tempor.</p>\n\n<p><a class="btn info" onclick="hideSuccess()">Continue</a></p>\n
6b3efce9e0eccd1060c2428aa9b64c67daa92e47	<h2>Financial<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-financial-management">Find out more</a></p>\n
f8996283243a6118c8deedb8ae39cdcfb83c202b	<h3>Local Business</h3>\n\n<p>Integrate with surrounding neighborhoods</p>\n
1214cf7b976ca79c28a7e0265eeca30004d51279	<h1>Who Benefits&nbsp;from Our Services</h1>\n
c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Collective Intelligence</h2>\n\n<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n
f4bd18d188ce5a70c2af5b207a2d511260c5d852	<h2>Contact Us</h2>\n\n<ul>\n\t<li>REAL CLEAR NEIGHBORHOODS</li>\n\t<li>129 W. Sunbridge Dr.</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>info@realclearneighborhoods.com</li>\n\t<li>(479)&nbsp;935-8989</li>\n</ul>\n
cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners. We&nbsp;create custom solutions for all of our communities, and we settle for nothing less than the highest quality of life possible.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n
1348bfa09db2b72ade28ab92a0884c705e15376c	<h1>The Real Clear Neighborhoods Difference</h1>\n
3230aaec61a69ab0db265495dce22847e11904a5	<h3>Homeowners</h3>\n\n<p>Increase Property Values as well as Quality of Life</p>\n
dda32ed510275c73425e41417302efeee257c91b	<div>&copy;2015 Real Clear Neighborhoods &bull; All Right Reserved <a href="http://www.doc4design.com" style="float: right;">Arkansas design</a></div>\n
8ab7a1b1d0413c1f5ffae513bd6327e5104cb059	<h2>Who We Are</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Community Associations. RCN strives to maximize the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n\n<p><br />\nWhat would happen if neighborhoods became real communities again? A community where people care for one another. A place where the owners take pride in what is for most their largest investment. Moreover, come home every day to a community that not only offers a higher quality of life, but also adds to the property value of everyone involved.</p>\n\n<p><br />\nRCN was formed while trying to find an answer this simple question.&nbsp;</p>\n
969ae539c7c5a8629b977d2623bb04df57543549	<h3>Developers</h3>\n\n<p>Elimate neighborhood management from&nbsp;development</p>\n
1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/about-us">Learn More</a></p>\n
fb5318a6c90b7547f936281f7706943ed13fd261	<h1>ASSOCIATION MANAGEMENT</h1>\n
37c0e91d78dc68405a246ce7d76e5d7c2143b9fd	<h1>COMMUNITY RESOURCES</h1>\n
b53bf51de4ed57fc95ce668abcfe2914b23cceae	<h1>FINANCIAL MANAGEMENT</h1>\n
9601d415ecf289fe83994079c5388400c3466ea3	<h2>Location</h2>\n\n<ul>\n\t<li>Real Clear Neighborhoods</li>\n\t<li>4200 Gabel Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n</ul>\n\n<h2>Contact Info</h2>\n\n<ul>\n\t<li>Real Clear Neighborhoods</li>\n\t<li>479-935-8989</li>\n\t<li><a href="realclearneighborhoods.com">www.realclearneighborhoods.com</a></li>\n\t<li><a href="mailto:info@realclearneighborhoods.com">info@realclearneighborhoods.com</a></li>\n</ul>\n
3f082c0d8fee457f19aec5246382eb0fcf68ff61	<h1>WHAT WE DO</h1>\n
ed98f00afc74d4ae5daf8645f1ad7dca11edd9ca	<h2>Document<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-document-management">Find out more</a></p>\n
fcc1b82b134cbca72fee5c58573cb3f775ff467a	<h2>Community<br />\nResources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-community-resources">Find out more</a></p>\n
b8128170ad15609badb46af937af8d9c7433a072	<h2>Association<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-association-management">Find out more</a></p>\n
33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities. The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and&nbsp;add value and piece of mind for every resident in the communities we serve.</p>\n
5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<ul>\n\t<li>4200 Gabel Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Office: (479)&nbsp;935-8989</li>\n\t<li>Toll Free: (888) 958-7725</li>\n</ul>\n\n<p><a href="mailto:info@realclearneighborhoods.com">info@realclearneighborhoods.com</a></p>\n\n<p>&nbsp;</p>\n
6d799bc68dbbd8e90741fcaaddf96dcff2ea289e	<p>Local businesses and governments are embracing RCN because they recognize the potential benefit for everyone from the cohesive model we have developed. By adding value to the homes in the community, and adding to the quality of life for the residents of those communities, those same businesses, governments, and communities thrive as a whole.</p>\n
202f105f748a6463b946c5233a9be22b6706c16d	<h1>Find Answers to Common Questions</h1>\n\n<p>This page should contain most of the answers to your questions regarding RCN&#39;s Services. If you cannot find the answer to the question you have here, feel free to contact us and we will get back to you as soon as possible.&nbsp;</p>\n\n<h2>&nbsp;</h2>\n\n<h2>How do I register my account for the first time?</h2>\n\n<p>If your neighborhood has retianed RCN as the managment company&nbsp;for your homeowner association, the registration process begins by clicking on the &quot;Login&quot; button on the top right of this page. From there you will be taken to few&nbsp;pages that shouldn&#39;t take longer than a couple of minutes to complete. From that point forward&nbsp;you will have full access to all of&nbsp;the services and conveniences RCN has to offer your neighborhood, and you will also become a member of our decision making team for the future to shape your community into what you would like it to be.&nbsp;</p>\n\n<h2>Who do I contact if I have trouble with the registration process?</h2>\n\n<p>Simply click on the &quot;Contact Us&quot; link above and tell us the trouble or quesitons you have, and we will get back to you as soon as possible to help in any way that we can help.</p>\n
556b549786df2b8c786315dbb579769d6917664d	<h2>REAL CLEAR NEIGHBORHOODS</h2>\n\n<p>We provide our homeowners with tools, resources, and platforms in which they can share and strengthen their neighborhoods and maximize the property values within the entire community.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each member of the associations we serve. We do that by coupling person-to-person customer service with the systems we have designed. We have developed a platform that choreographs the dynamic interactions between the community and the people that reside in it.</p>\n
8bae21f28d5d13d4118ade0be1c4394e2db4c38c	<p>&copy;2017&nbsp;Real Clear Neighborhoods, Inc. &bull; All Rights Reserved &bull;</p>\n
a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>FAQ&#39;s</h2>\n\n<h3>&nbsp;</h3>\n\n<h3>WHAT WE DO</h3>\n\n<p><span style="line-height: 1.2; font-size: 13px;">Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;</span><a href="/"><em>Find out more</em></a></p>\n\n<h3>WHY WE DO IT</h3>\n\n<p>We love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.&nbsp;<a href="/"><em>Find out more</em></a></p>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p>We made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;<a href="/"><em>Find out more</em></a></p>\n
103d48ec81c801e2f9c38fffaaccb94fa6374d75	<h2>Financial Management</h2>\n\n<p>We aim to increase value, plain and simple. Now, when we say value, we&#39;re not just talking about value from a financial standpoint. We mean value in every sense of the word. Value within the communities we partner with, and the communities we will partner with in the future, from a financial standpoint, a quality of life standpoint, and an overall value in knowing when one of our members comes home after a long day at work, they&#39;ll be coming home to a house and community that we&#39;ve been working on all day to make sure it&#39;s what they want when they drive in... eat dinner with their family... and lay down to sleep at night.</p>\n\n<p class="btn info"><a href="/what-we-do-financial-management">Find out more</a></p>\n
9a667768e8f3d7699402e0f862de31c66cfc1c98	<h2>Community Resources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n
4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n\n<h2>Custom Solutions</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our communities.</p>\n
57d3def1340b29525ca48626a4dc933922312b7f	<p>Find Your Neighborhood</p>\n\n<p>Chose your neighborhood from the list below to be taken to your neighborhood&#39;s website.</p>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek III<br />\nCopper Creek<br />\nCottages at Old Wire<br />\nCreek Meadows<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nJoyce St Cottages<br />\nLakewood<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSpring Ridge<br />\nSunbridge Villas<br />\n<a href="http://corporate.realclearneighborhoods.com/townhomes-arbors">Townhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n
b6b133bb4e7b7ae76cc866f3ef85fe07894d70bc	<h2>Document Management</h2>\n\n<p>We have developed a system that puts all of the information for your Owner&#39;s Association, surrounding the community, and many other useful pieces of information together in one convenient place so it &nbsp;is always there when you need it.&nbsp;</p>\n\n<ul>\n\t<li>Digitally indexed &amp; searchable</li>\n\t<li>CC&amp;R&rsquo;s, Bylaws, Meeting Minutes, architectural guidelines and more</li>\n\t<li>Action without meeting forms &amp; submissions</li>\n\t<li>Annual meeting guides &amp; resources</li>\n\t<li>Monthly board meeting guides &amp; resources</li>\n\t<li>Current information on proposed law &amp; ordinance changes</li>\n\t<li>Proposed language &amp; policies for landlords to enter &amp; manage leases</li>\n\t<li>Board candidate application</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>And, RCN handles all changes, updates, disputes and issues associated with the collective covenants, conditions, and restrictions (CC&amp;R&#39;s). Life&#39;s complicated enough, you should not have to worry about anything when you get home.</p>\n\n<p class="btn info"><a href="/what-we-do-document-management">Find out more</a></p>\n
216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p>Real Clear Neighborhoods provides access to the knowledge and means to lead a Health and Well-being centered life. We organize the information and resources you need to make better lifestyle choices. We connect visitors to &#39;trusted sources&#39; committed to providing information. Products, services, and art that enhance Health and Well-being.</p>\n\n<ul>\n\t<li>Articles &amp; news relevant to the community</li>\n\t<li>Recommended service providers</li>\n\t<li>Latest Association/Neighborhood, City, State, and Government news and items of interest</li>\n\t<li>Direct links from association platforms to local services and information (including, but not limited to):&nbsp;\n\t<ul>\n\t\t<li>Zoning &amp; planning</li>\n\t\t<li>Schools and Day Care Providers</li>\n\t\t<li>Parks &amp; recreation</li>\n\t\t<li>City council &amp; commissions</li>\n\t\t<li>Hospitals &amp; Medical Care</li>\n\t\t<li>Law Enforcement, Fire, and Paramedics</li>\n\t\t<li>Utility Providers</li>\n\t\t<li>Registrar of voters</li>\n\t</ul>\n\t</li>\n</ul>\n\n<p>Our websites are&nbsp;your electronic tool-kit. Trusted Sources are resources committed to contributing to a positive impact on our homeowners daily lives.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n
b078824142dd4071959420a261ca8942b24e4b70	
53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<p>RCN creates platforms specially designed for the needs of our homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our homeowners.</p>\n\n<ul>\n\t<li>Full-service management of property &amp; homeowner associations</li>\n\t<li>Conflict resolution</li>\n\t<li>Website development &amp; maintenance</li>\n\t<li>member account area to manage account</li>\n\t<li>secure payment processing</li>\n\t<li>Common area reservation system</li>\n\t<li>Homeowner request &amp; idea submission</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do-association-management">Find out more</a></p>\n
434b451c09271a22387cd2e5764c9410a03a4e8c	<h2>Financial Services</h2>\n\n<p>RCN is committed to the financial strength and stability of every community we manage. We provide expert financial management that is focused on building long-term value, along with unmatched purchasing power. It&rsquo;s all designed to provide your HOA with significant savings, as well as one-stop-shop solutions that help you get the absolute best return on your investment.&nbsp;</p>\n\n<h2>At RCN, we:</h2>\n\n<ul>\n\t<li>Provide financial services customized for each community</li>\n\t<li>Prepare financial reports including balance sheets, income statements, general ledgers, accounts payable, check disbursements, and income and expense projections</li>\n\t<li>Reconcile all accounts including checking, savings, money market, etc.</li>\n\t<li>Prepare and distribute checks</li>\n\t<li>Manage accounts payable entry and processing</li>\n\t<li>Record, code, and preserve invoices</li>\n\t<li>Conduct billing and collections of association assessments</li>\n\t<li>Send delinquency notices and violation letters</li>\n</ul>\n
3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;</p>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="what we do" name="what we do">WHAT WE DO</a></h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="why we do it" name="why we do it">WHY WE DO IT</a></h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="our philosophy" name="our philosophy">OUR PHILOSOPHY</a></h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n
f932fb6a31b02e7eef73abc04f43b46853f766c3	<h1>Talk To Us</h1>\n\n<p>If you have any questions, issues, or just want to say hello before the full update and information package is sent, feel free to contact us anytime.</p>\n
8e62dc7f4ef30eeb72ce59c522b117619e8499f3	<h2>Document Management</h2>\n\n<p>We have developed a system that puts all of the information for your Owner&#39;s Association, surrounding community, and many other useful pieces of information together in one convenient spot so it&#39;s always there when you need it. And, RCN&nbsp;handles all changes, updates, disputes and issues associated with the collective covenants, conditions, and restrictions (CC&amp;R&#39;s). Life&#39;s complicated enough, you shouldn&#39;t have to worry about anything when you get home.</p>\n\n<h2>Example of Common&nbsp;Documents</h2>\n\n<p>Here are some common documents that can be found&nbsp;on our neighborhood websites:</p>\n\n<ul>\n\t<li>Delaration (or Master Deed)</li>\n\t<li>Articles of Incorporation (or Charter)</li>\n\t<li>Bylaws</li>\n\t<li>Rules and Regulations</li>\n</ul>\n
9876e1a2d80b66b8dd16abc76db67144c6151924	<h1>Report a Violation</h1>\n
44a8a54e64ed2e8825717b309ae63ae24ffb8e50	<h1>Work Request</h1>\n
61b265d897a4c25f33e4abd0de6c78fdc1e8ed9a	<h1>Architectural Review</h1>\n
89eac7493b9d5eb430574ea127fe83ec6768530d	<h1>Homeowners</h1>\n
f0c7ba04a5345176379be6d5143fee171fe00a80	<h1>Neighborhoods</h1>\n
5da5ab29387f4c3dea9d65488d6f510d27bb1ac4	
ea966c63742fd1eb37cdd16ac64cce6c9a87b4f5	<h2>Townhomes at the Arbors</h2>\n\n<h3>Townhomes at the Arbors Overview</h3>\n\n<p><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<h3>Townhomes at the Arbors Amenities</h3>\n\n<p><br />\nAt the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p>Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n\n<p><a href="/">Find out more</a></p>\n
a3c967699a8bc0b2e75ccbc149253bdc616e4607	<h2>Report a Violation</h2>\n\n<p>Report possible violations in your neighborhood with this quick online form.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n
664796d13aafbbc5b623a07802a3635fa01c3506	<h2>Work Request</h2>\n\n<p>Is there an item or area in your neighborhood in need of attention or service? Fill out the Work Request Form (with as much detail as possible) and we will submit it to your Board of Directors and get you their response as soon as possible.</p>\n\n<p><a href="/">Find out more</a></p>\n
ecbe6268da310c0397d2fca18b9dfa78731feb8b	<h2>Architectural Review&nbsp;</h2>\n\n<p>Would you like to add on to your home? Maybe you would like to paint the exterior of your home a new color? If it is visible from the street or from your neighbors house, you will need approval from the Architectural Review Committee in your neighborhood.</p>\n\n<p>Simply fill out the Architectural Review form and your Board of Directors will review your plans. As soon as they have reviewed your plans, we will notify you if the request has been approved or if it needs amending.</p>\n\n<p><a href="/">Find out more</a></p>\n
957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please send us an email at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="/homeowners-neighborhoods">Neighborhoods</a></p>\n
c4f2cbd2b3d95aa9fc2780a4e6dbdd41b022ec9a	<h1>Townhomes at the Arbors</h1>\n\n<p><strong>Townhomes at the Arbors Overview</strong><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><strong>Townhomes at the Arbors Amenities</strong><br />\nAt the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p>Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n
f3b3117eb90ffce754414ef3de0470e3c99df6b2	<h1>Townhomes at the Arbors Website</h1>\n\n<p>&nbsp;</p>\n\n<p><strong>Townhomes at the Arbors Overview</strong><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n
1982364ae9e7ace665966c9cc8a502a61c5f8cd8	<h2>Find Your Neighborhood</h2>\n\n<p>Chose your neighborhood from the list below to be taken to your community website.</p>\n\n<p><a href="http://realclearneighborhoods.com/townhomes-arbors">Townhomes at the Arbors</a></p>\n
d3b5f31020b2eb94dcff9e3eb7773d3a96212e67	<h1>Neighborhoods</h1>\n
47180b3fc660973601299e913ddbca5a59c4ef63	<h2>Violation Report Form</h2>\n\n<h2><iframe frameborder="0" height="1000" marginheight="0" marginwidth="0" src="https://docs.google.com/forms/d/e/1FAIpQLSejEjmmfyx-iMdaZ_N2xD7d_wX0uDoJkZUyINn8Db4K4CAnAw/viewform?embedded=true" width="640">Loading...</iframe></h2>\n
979119d0f06d6cafbed8a1eab97a09a6cbe40c36	<h2>Work Request Form</h2>\n\n<p><iframe frameborder="0" height="1000" marginheight="0" marginwidth="0" src="https://docs.google.com/forms/d/e/1FAIpQLSeWXtHh-MBc5FvG0WD3-1UF510ZwiKkpP1Lffw-KRGr9uaVRg/viewform?embedded=true" width="640">Loading...</iframe></p>\n\n<p>&nbsp;</p>\n
3f2bd2252231eb668cf2d03757c55e9fcd442b2a	<h2>Architectural Review Form</h2>\n\n<p>We cannot embed this form in our website yet (because it calls for files to be uploaded with the form), so click the&nbsp; link below to be taken to the Architectural Review Form.</p>\n\n<p class="btn info"><a href="https://goo.gl/forms/BTNU7YYrgBMa5lY03">Architectural Review Form</a></p>\n
7e939e830ef3650173358d252fbc36ab1af44be0	<h2>Pick Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood&#39;s website.</p>\n\n<p><a href="http://www.realclearneighborhoods.com/townhomes-arbors">Townhomes at the Arbors</a></p>\n
d89c9dfc8423dacf9ac24caacc559692aa664213	<h1>Townhomes at the Arbors</h1>\n
9916f93793c484e2a1b9839546a8839253de193a	<h2>Documents</h2>\n\n<p>Below you will find&nbsp;Governing Documents, Meeting Minutes, Guidelines, and many other important documents from the&nbsp;Townhomes at the Arbors.</p>\n\n<p>The full functionality of this page will be live soon, but for now the links below will take you to our Real Clear Neighborhoods cloud storage where your documents are temporarily stored.</p>\n\n<p>To go to Real Clear Neighborhoods Online File Storage for the Townhomes at the Arbors, please follow this link: <a href="https://drive.google.com/open?id=1hBja_o2FD9kxpA0pLYPlx13jR0DcoZng">Townhomes at the Arbors Documents</a></p>\n
3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n\n<h2>Neighborhoods We Manage</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\n<a href="/homeowners-townhomes-arbors">The Townhomes at the Arbors</a><br />\nWoodhaven</p>\n
358423d5f33c37988ccea5a450a844cb2fff940b	<h1>Create Request</h1>\n
fb495d8d6f0e126d249ff3a3ccf4426f56ce033e	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n\n<h2>Neighborhoods We Manage</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\n<a href="/homeowners-townhomes-arbors">The Townhomes at the Arbors</a><br />\nWoodhaven</p>\n\n<p class="btn info">&nbsp;</p>\n
\.


--
-- Data for Name: front_placeholderhistory; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.front_placeholderhistory (id, placeholder_id, value, saved) FROM stdin;
1	a7ccd78652e4588047c0fcf06f76a5eb33f70dfd	<div>&copy;2015 Real Clear Neighborhood&nbsp;&bull; All Right Reserved</div>\n	2015-01-30 00:09:28.663+02
2	8ab7a1b1d0413c1f5ffae513bd6327e5104cb059	<h2>Who We Are</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n	2015-01-30 17:56:11.232+02
3	f4bd18d188ce5a70c2af5b207a2d511260c5d852	<h2>Contact Us</h2>\n\n<ul>\n\t<li>Address Line 1</li>\n\t<li>City, State Zip</li>\n\t<li>Office: 123-456-7890</li>\n</ul>\n\n<p><a href="mailto:test@email.com">test@email.com</a></p>\n	2015-01-30 17:56:22.705+02
4	8ab7a1b1d0413c1f5ffae513bd6327e5104cb059	<h2>Who We Are</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad, consectetur adipisicing elit sed do eisomd teompr incidedunt ut labore et dolore. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad, consect. Ut enim ad, consectetur adipisicing elit sed do eisomd teompr incidedunt ut labore et dolore. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad, consect.</p>\n	2015-01-30 17:58:06.06+02
5	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Residents</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p><a class='btn info' href='/'>Find out more</a></p>	2015-01-30 21:00:20.133+02
6	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Residents</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<a class="btn info" href="/">Find out more</a>\n	2015-01-30 21:00:35.161+02
7	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Header Text</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p><a class="btn info" href="/">Find out more</a></p>\n	2015-01-30 21:00:55.658+02
8	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Great for presidents</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p><a class="btn info" href="/">Find out more</a></p>\n	2015-01-30 21:07:22.774+02
9	1348bfa09db2b72ade28ab92a0884c705e15376c	<h1>We Want to Work Together</h1>\n	2015-01-30 21:16:24.814+02
10	1c5282677f4cad943499bd4b2c7639b60b956326	<p><a class="btn action" href="/">Give us a call</a></p>\n	2015-01-30 22:33:13.958+02
11	1214cf7b976ca79c28a7e0265eeca30004d51279	<h1>Who We Benefit The Most</h1>\n	2015-01-31 00:02:02.573+02
12	3230aaec61a69ab0db265495dce22847e11904a5	<h3>Asoc. President</h3>\n\n<p>Dolor sit amet, consectetur a ipisicing elit, sed do eiusmod.</p>\n	2015-01-31 00:02:19.861+02
13	969ae539c7c5a8629b977d2623bb04df57543549	<h3>New Neighbors</h3>\n\n<p>Dolor sit amet, consectetur a ipisicing elit, sed do eiusmod.</p>\n	2015-01-31 00:02:28.627+02
14	f8996283243a6118c8deedb8ae39cdcfb83c202b	<h3>Stay-At-Home Mom</h3>\n\n<p>Dolor sit amet, consectetur a ipisicing elit, sed do eiusmod.</p>\n	2015-01-31 00:02:40.931+02
15	f4bd18d188ce5a70c2af5b207a2d511260c5d852	<h2>Contact Us</h2>\n\n<ul>\n\t<li>Address Line 1</li>\n\t<li>City, State Zip</li>\n\t<li>Office: 123-456-7890</li>\n\t<li><a href="mailto:test@email.com">test@email.com</a></li>\n</ul>\n	2015-01-31 00:29:24.162+02
16	4350d165b3e840cf940c1cf65074c489b31aa048	<h2>Document<br />\nMangement</h2>\n	2015-02-02 21:46:48.96+02
17	bd87f251dfbe1a574db880f17457e0e622609d10	<h2>Association<br />\nMangement</h2>\n	2015-02-02 21:48:58.981+02
18	181378f5491832b9f9f2330a4785c227859adee3	<h2>Financial<br />\nManagement</h2>\n	2015-02-02 21:49:09.831+02
19	6ce6c1e34e78dbcb75e80b00184bf340f68d19c8	<h2>Community<br />\nResources</h2>\n	2015-02-02 21:49:22.417+02
20	585446c059471d2cf10905f3deaeeee4f35bb11c	<h1>Solutions</h1>\n	2015-02-02 23:07:05.773+02
21	ed98f00afc74d4ae5daf8645f1ad7dca11edd9ca	<h2>Document<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/">Find out more</a></p>\n	2015-02-02 23:17:46.174+02
22	b8128170ad15609badb46af937af8d9c7433a072	<h2>Association<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/">Find out more</a></p>\n	2015-02-02 23:18:00.524+02
23	6b3efce9e0eccd1060c2428aa9b64c67daa92e47	<h2>Financial<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/">Find out more</a></p>\n	2015-02-02 23:18:12.855+02
24	fcc1b82b134cbca72fee5c58573cb3f775ff467a	<h2>Community<br />\nResources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/">Find out more</a></p>\n	2015-02-02 23:18:28.36+02
25	dda32ed510275c73425e41417302efeee257c91b	<div>&copy;2015 Real Clear Neighborhoods&nbsp;&bull; All Right Reserved &bull; <a href="http://www.doc4design.com">Arkansas design</a></div>\n	2015-02-02 23:21:32.914+02
26	dda32ed510275c73425e41417302efeee257c91b	<div>&copy;2015 Real Clear Neighborhood&nbsp;&bull; All Right Reserved &bull; <a href="http://www.doc4design.com">Arkansas design</a></div>\n	2015-02-02 23:21:47.383+02
27	8eb0fa75992e87dc84652e101e6c48e09dd5bfa8	<h1>Document Management</h1>\n	2015-02-03 00:37:55.265+02
28	46624b9f919e1e8f339682ddcb813ae251a9314a	<h1>About Us</h1>\n	2015-02-03 19:29:46.704+02
58	fcc1b82b134cbca72fee5c58573cb3f775ff467a	<h2>Community<br />\nResources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/solutions-community-resources">Find out more</a></p>	2015-02-18 19:14:37.403584+02
29	baa6f6e8bd2b1c0f84fd1387d07d74b4cde75491	<h1>Who We Are</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.</p>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n	2015-02-03 19:29:56.863+02
30	4ddb24b5045ed3a9902e196c51d7ca09db162463	<h2>Lorem ipsum dolor sit</h2>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p>Find out more</p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p>Find out more</p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p>Find out more</p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p>Find out more</p>	2015-02-03 19:32:12.917+02
31	4ddb24b5045ed3a9902e196c51d7ca09db162463	<h2>Lorem ipsum dolor sit</h2>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>	2015-02-03 19:34:51.597+02
32	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<p>&lt;h2&gt;Lorem ipsum dolor sit&lt;/h2&gt;</p>\n\n<p>&lt;h3&gt;Great Bullet Point Answer&lt;/h3&gt;</p>\n\n<p>&lt;p&gt;&lt;a href=&quot;/&quot;&gt;&lt;em&gt;Find out more&lt;/em&gt;&lt;/a&gt;&lt;/p&gt;</p>\n\n<p>&lt;h3&gt;Great Bullet Point Answer&lt;/h3&gt;</p>\n\n<p>&lt;p&gt;&lt;a href=&quot;/&quot;&gt;&lt;em&gt;Find out more&lt;/em&gt;&lt;/a&gt;&lt;/p&gt;</p>\n\n<p>&lt;h3&gt;Great Bullet Point Answer&lt;/h3&gt;</p>\n\n<p>&lt;p&gt;&lt;a href=&quot;/&quot;&gt;&lt;em&gt;Find out more&lt;/em&gt;&lt;/a&gt;&lt;/p&gt;</p>\n\n<p>&lt;h3&gt;Great Bullet Point Answer&lt;/h3&gt;</p>\n\n<p>&lt;p&gt;&lt;a href=&quot;/&quot;&gt;&lt;em&gt;Find out more&lt;/em&gt;&lt;/a&gt;&lt;/p</p>\n	2015-02-03 23:24:32.149+02
33	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>Lorem ipsum dolor sit</h2>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n	2015-02-03 23:24:44.681+02
34	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.</p>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n	2015-02-03 23:24:53.665+02
35	cc7e5277d5d488e977474c56bec26e24b13525ca	<h1>About Us - FAQs</h1>\n	2015-02-04 21:15:57.996+02
36	cc7e5277d5d488e977474c56bec26e24b13525ca	<h1>ABOUT US - FAQs</h1>\n	2015-02-04 21:20:33.54+02
37	46624b9f919e1e8f339682ddcb813ae251a9314a	<h1>ABOUT US</h1>\n	2015-02-04 21:20:41.389+02
38	585446c059471d2cf10905f3deaeeee4f35bb11c	<h1>SOLUTIONS</h1>\n	2015-02-04 21:20:53.277+02
39	8eb0fa75992e87dc84652e101e6c48e09dd5bfa8	<h1>DOCUMENT MANAGEMENT</h1>\n	2015-02-04 21:21:06.147+02
40	99563d8bf7e0d6aeb596f68910a5935e2a952892	<h1>CONTACT US</h1>\n	2015-02-04 21:53:01.033+02
41	ebcae1a3727b5c5e6aef358b24e33e07b583beeb	<h2>Your Question Has Been Sent!</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex commodo emin ad ut tempor.</p>\n\n<p><a class="btn info" onclick="hideSuccess()">Continue</a></p>\n	2015-02-05 21:52:41.747+02
42	ebcae1a3727b5c5e6aef358b24e33e07b583beeb	<h2>Your Question Has Been Sent</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex commodo emin ad ut tempor.</p>\n\n<p><a class="btn info" onclick="hideSuccess()">Continue</a></p>\n	2015-02-05 21:52:46.202+02
43	713d85c82cb61150f00888ebc22de643a498571f	<h1>Success!</h1>\n	2015-02-05 21:52:55.057+02
44	d500543749efdaa532ecaa4e55e7889e464f5468		2015-02-05 22:30:50.431+02
45	d500543749efdaa532ecaa4e55e7889e464f5468	<h2>Lorem ipsum dolor sit amet nihil amisi</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n\n<h2>Lorem ipsum dolor sit amet nihil amisi</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n	2015-02-05 22:30:56.084+02
46	d500543749efdaa532ecaa4e55e7889e464f5468		2015-02-05 22:53:19.503+02
47	1f441cd9dc7af5ad9fa564a7063f1a830051c67b		2015-02-06 22:15:13.094+02
48	85ffcef5f6e0d8f5da12d6802dc84d2e098ea5cb	<h1>NEWS</h1>\n	2015-02-06 22:16:24.642+02
49	fb5318a6c90b7547f936281f7706943ed13fd261	<h1>Association Management</h1>\n	2015-02-17 18:42:48.439104+02
50	37c0e91d78dc68405a246ce7d76e5d7c2143b9fd	<h1>Community Resources</h1>\n	2015-02-17 18:42:58.036139+02
51	b53bf51de4ed57fc95ce668abcfe2914b23cceae	<h1>Financial Management</h1>\n	2015-02-17 18:43:09.208929+02
52	fb5318a6c90b7547f936281f7706943ed13fd261	<h1>ASSOCIATION MANAGEMENT</h1>\n	2015-02-17 18:44:41.264775+02
53	37c0e91d78dc68405a246ce7d76e5d7c2143b9fd	<h1>COMMUNITY RESOURCES</h1>\n	2015-02-17 18:44:50.130136+02
54	b53bf51de4ed57fc95ce668abcfe2914b23cceae	<h1>FINANCIAL MANAGEMENT</h1>\n	2015-02-17 18:45:02.746722+02
55	ed98f00afc74d4ae5daf8645f1ad7dca11edd9ca	<h2>Document<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/solutions-document-management">Find out more</a></p>	2015-02-18 19:14:04.770984+02
56	b8128170ad15609badb46af937af8d9c7433a072	<h2>Association<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/solutions-association-management">Find out more</a></p>	2015-02-18 19:14:12.980804+02
57	6b3efce9e0eccd1060c2428aa9b64c67daa92e47	<h2>Financial<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p><a class="btn info" href="/solutions-financial-management">Find out more</a></p>	2015-02-18 19:14:23.00243+02
59	3f082c0d8fee457f19aec5246382eb0fcf68ff61	<h1>WHAT WE DO</h1>\n	2015-02-18 19:16:04.992753+02
60	1c5282677f4cad943499bd4b2c7639b60b956326	<p><a class="btn action" href="/contact-us">Give us a call</a></p>\n	2015-02-18 19:26:49.619215+02
61	3230aaec61a69ab0db265495dce22847e11904a5	<h3>Assoc. President</h3>\n\n<p>Dolor sit amet, consectetur a ipisicing elit, sed do eiusmod.</p>\n	2015-02-18 21:28:51.709251+02
62	f4bd18d188ce5a70c2af5b207a2d511260c5d852	<h2>Contact Us</h2>\n\n<ul>\n\t<li>135 W. Sunbridge Dr. #3</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Office: 479-935-8989</li>\n\t<li><a href="mailto:test@email.com">test@email.com</a></li>\n</ul>\n	2015-02-18 21:56:19.946411+02
63	dda32ed510275c73425e41417302efeee257c91b	<div>&copy;2015 Real Clear Neighborhood&nbsp;&bull; All Right Reserved <a style='float: right;' href="http://www.doc4design.com">Arkansas design</a></div>\n	2015-02-18 22:01:47.435876+02
64	9601d415ecf289fe83994079c5388400c3466ea3	<h2>Location</h2>\n\n<ul>\n\t<li>135 W. Sunbridge Dr. #3</li>\n\t<li>Fayetteville, AR 72703</li>\n</ul>\n\n<h2>Contact Info</h2>\n\n<ul>\n\t<li>479-935-8989</li>\n\t<li><a href="mailto:test@email.com">test@email.com</a></li>\n</ul>\n	2015-02-18 22:18:01.363803+02
65	f4bd18d188ce5a70c2af5b207a2d511260c5d852	<h2>Contact Us</h2>\n\n<ul>\n\t<li>Office: 479-935-8989</li>\n\t<li>135 W. Sunbridge Dr. #3</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li><a href="mailto:test@email.com">test@email.com</a></li>\n</ul>\n	2015-02-18 23:06:18.367403+02
66	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Residents</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-02-19 00:46:32.703929+02
67	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Great for presidents</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>	2015-02-19 00:46:43.638629+02
68	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn action"><a href="/contact-us">Give us a call</a></p>	2015-02-19 00:46:55.621285+02
69	ed98f00afc74d4ae5daf8645f1ad7dca11edd9ca	<h2>Document<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-document-management">Find out more</a></p>\n	2015-02-19 00:47:33.258371+02
70	b8128170ad15609badb46af937af8d9c7433a072	<h2>Association<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-association-management">Find out more</a></p>\n	2015-02-19 00:47:50.103882+02
71	6b3efce9e0eccd1060c2428aa9b64c67daa92e47	<h2>Financial<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-financial-management">Find out more</a></p>\n	2015-02-19 00:48:01.732619+02
72	fcc1b82b134cbca72fee5c58573cb3f775ff467a	<h2>Community<br />\nResources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-community-resources">Find out more</a></p>\n	2015-02-19 00:48:12.984682+02
73	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Residents</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p class="btn action"><a href="/">Find out more</a></p>\n	2015-02-19 01:06:36.263544+02
74	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Residents</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-02-19 01:06:44.162803+02
75	b8128170ad15609badb46af937af8d9c7433a072	<h2>Association<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\n\n<p class="btn info"><a href="/solutions-association-management">Find out more</a></p>\n	2015-02-19 01:09:49.803148+02
76	b8128170ad15609badb46af937af8d9c7433a072	<h2>Association<br />\nManagement</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/solutions-association-management">Find out more</a></p>\n	2015-02-19 01:10:11.0643+02
77	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-09 15:34:16.126492+02
78	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Great for Boards</h2>\n\n<p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua. Ut enim ad minim. Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-09 15:34:43.480902+02
79	3230aaec61a69ab0db265495dce22847e11904a5	<h3>Homeowners</h3>\n\n<p>Dolor sit amet, consectetur a ipisicing elit, sed do eiusmod.</p>\n	2015-03-09 15:35:18.951811+02
80	969ae539c7c5a8629b977d2623bb04df57543549	<h3>Developers</h3>\n\n<p>Dolor sit amet, consectetur a ipisicing elit, sed do eiusmod.</p>\n	2015-03-09 15:35:34.716586+02
81	f8996283243a6118c8deedb8ae39cdcfb83c202b	<h3>Local Business</h3>\n\n<p>Dolor sit amet, consectetur a ipisicing elit, sed do eiusmod.</p>\n	2015-03-09 15:35:56.191765+02
82	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-16 16:31:56.347221+02
83	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p class="btn info"><a href="/">Learn More</a></p>\n	2015-03-16 16:34:13.326727+02
84	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Great for Boards</h2>\n\n<p>We handle the day-to-day operations so your Board members are free to take care of other HOA responsibilities. We work with your Board to understand the association&rsquo;s needs and maximize value and quality of life for all owners.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-16 16:42:51.331821+02
85	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Great for Boards</h2>\n\n<p>We handle the day-to-day operations, so your Board members are free to take care of other HOA responsibilities. With the guidance of the Board, we work to address the association&rsquo;s need and maximize property value and the quality of life for all owners.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-16 16:53:16.881424+02
86	1348bfa09db2b72ade28ab92a0884c705e15376c	<h1>The Real Clear Neighborhoods Difference</h1>\n	2015-03-16 16:53:57.298136+02
87	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities. The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and s add value and piece of mind for every resident in the communities we serve.&nbsp;</p>\n\n<p>Local businesses and governments are embracing RCN because they recognize the potential benefit for everyone from the cohesive model we have developed. By adding value to the homes in the community, and adding to the quality of life for the residents of those communities, those same businesses, governments, and communities thrive as a whole.&nbsp;</p>\n\n<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n	2015-03-16 16:56:30.346035+02
88	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities. The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and s add value and piece of mind for every resident in the communities we serve.&nbsp;</p>\n\n<p>Local businesses and governments are embracing RCN because they recognize the potential benefit for everyone from the cohesive model we have developed. By adding value to the homes in the community, and adding to the quality of life for the residents of those communities, those same businesses, governments, and communities thrive as a whole.</p>\n	2015-03-16 16:56:51.390335+02
89	6d799bc68dbbd8e90741fcaaddf96dcff2ea289e	<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n	2015-03-16 16:56:59.339244+02
90	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities. The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and s add value and piece of mind for every resident in the communities we serve.</p>\n	2015-03-16 16:57:29.044051+02
91	6d799bc68dbbd8e90741fcaaddf96dcff2ea289e	<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n\n<p>Local businesses and governments are embracing RCN because they recognize the potential benefit for everyone from the cohesive model we have developed. By adding value to the homes in the community, and adding to the quality of life for the residents of those communities, those same businesses, governments, and communities thrive as a whole.</p>\n	2015-03-16 16:57:38.214731+02
92	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities.</p>\n\n<p>The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and s add value and piece of mind for every resident in the communities we serve.</p>\n	2015-03-16 16:57:43.856815+02
93	6d799bc68dbbd8e90741fcaaddf96dcff2ea289e	<p>Local businesses and governments are embracing RCN because they recognize the potential benefit for everyone from the cohesive model we have developed. By adding value to the homes in the community, and adding to the quality of life for the residents of those communities, those same businesses, governments, and communities thrive as a whole.</p>\n	2015-03-16 16:58:57.490581+02
94	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities.&nbsp;The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and s add value and piece of mind for every resident in the communities we serve.</p>\n	2015-03-16 16:59:08.099686+02
95	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn action"><a href="/contact-us">Learn More</a></p>\n	2015-03-16 16:59:48.491998+02
96	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/contact-us">Learn More</a></p>\n	2015-03-16 17:00:12.090636+02
97	1214cf7b976ca79c28a7e0265eeca30004d51279	<h1>Who Benefits the Most from Our Services</h1>\n	2015-03-16 17:00:41.106058+02
98	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>A Board Members&#39; Dream</h2>\n\n<p>We handle the day-to-day operations, so your Board members are free to take care of other HOA responsibilities. With the guidance of the Board, we work to address the association&rsquo;s need and maximize property value and the quality of life for all owners.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-16 18:49:53.383696+02
99	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Enhance, Not Replace</h2>\n\n<p>We handle the day-to-day operations, so your Board members are free to take care of other HOA responsibilities. With the guidance of the Board, we work to address the association&rsquo;s need and maximize property value and the quality of life for all owners.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-16 18:50:15.227465+02
100	3230aaec61a69ab0db265495dce22847e11904a5	<h3>Homeowners</h3>\n\n<p>Increase Property Values as well as Quality of Life</p>\n	2015-03-16 18:51:12.744317+02
101	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities. The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and s add value and piece of mind for every resident in the communities we serve.</p>\n	2015-03-22 23:11:58.675365+02
102	6d799bc68dbbd8e90741fcaaddf96dcff2ea289e	<p>Local businesses and governments are embracing RCN because they recognize the potential benefit for everyone from the cohesive model we have developed. By adding value to the homes in the community, and adding to the quality of life for the residents of those communities, those same businesses, governments, and communities thrive as a whole.</p>\n	2015-03-22 23:12:16.129156+02
103	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities. The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and s add value and piece of mind for every resident in the communities we serve.</p>\n	2015-03-22 23:13:31.705106+02
104	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Collective Intelligence</h2>\n\n<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-03-22 23:15:49.487047+02
105	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Collective Intelligence</h2>\n\n<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n\n<p class="btn info"><a href="http://doc4rcn.webfactional.com/what-we-do">Find out more</a></p>\n	2015-03-22 23:16:56.737194+02
106	4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n\n<h2>Custom Solutions</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our partners.</p>\n	2015-03-22 23:20:21.827344+02
107	4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Custom Solutions</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our partners.</p>\n\n<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n	2015-03-22 23:23:42.871147+02
108	4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Custom Solutions</h2>\n\n<p>RCN creates platforms specially designed for the needs of our homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our homeowners.</p>\n\n<p>RCN&rsquo;s community association platforms are simple and powerful. Moreover, always designed to the collective intelligence and needs of the community. That is the RCN way of doing things.</p>\n\n<h2>&nbsp;</h2>\n\n<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n	2015-03-22 23:24:54.84764+02
109	4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Custom Solutions</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our communities.</p>\n\n<p>&nbsp;</p>\n\n<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n	2015-03-22 23:25:56.594774+02
110	4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n\n<h2>Custom Solutions</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our communities.</p>\n	2015-03-22 23:30:31.021904+02
111	8ab7a1b1d0413c1f5ffae513bd6327e5104cb059	<h2>Who We Are</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Community Associations. RCN strives to maximize the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.<br />\nWhat would happen if neighborhoods became real communities again? A community where people care for one another. A place where the owners take pride in what is for most their largest investment. Moreover, come home every day to a community that not only offers a higher quality of life, but also adds to the property value of everyone involved.<br />\nRCN was formed while trying to find an answer this simple question.&nbsp;</p>\n	2015-03-22 23:33:15.936499+02
112	8ab7a1b1d0413c1f5ffae513bd6327e5104cb059	<h2>Who We Are</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Community Associations. RCN strives to maximize the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n\n<p><br />\nWhat would happen if neighborhoods became real communities again? A community where people care for one another. A place where the owners take pride in what is for most their largest investment. Moreover, come home every day to a community that not only offers a higher quality of life, but also adds to the property value of everyone involved.</p>\n\n<p><br />\nRCN was formed while trying to find an answer this simple question.&nbsp;</p>\n	2015-03-22 23:33:27.398802+02
113	33fea0e3c8b370ebc4a7e6cae3318c01f8181725	<p>Real Clear Neighborhoods (RCN) serves as a catalyst for communities to realize the maximum value from their largest investment, and, in turn, add to the quality of life within those communities. The platforms and services we have developed are extremely efficient, non-intrusive in daily life, and&nbsp;add value and piece of mind for every resident in the communities we serve.</p>\n	2015-03-22 23:38:20.808883+02
114	1214cf7b976ca79c28a7e0265eeca30004d51279	<h1>Who Benefits&nbsp;from Our Services</h1>\n	2015-03-22 23:39:19.353009+02
115	dda32ed510275c73425e41417302efeee257c91b	<div>&copy;2015 Real Clear Neighborhoods &bull; All Right Reserved <a href="http://www.doc4design.com" style="float: right;">Arkansas design</a></div>\n	2015-03-22 23:45:59.537148+02
116	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.</p>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n	2015-03-22 23:50:29.119232+02
117	f4bd18d188ce5a70c2af5b207a2d511260c5d852	<h2>Contact Us</h2>\n\n<ul>\n\t<li>REAL CLEAR NEIGHBORHOODS</li>\n\t<li>135 W. Sunbridge Dr. #3</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Email: info@realclearneighborhoods.com</li>\n\t<li>Phone: 479-935-8989</li>\n</ul>\n	2015-03-26 19:08:10.458074+02
118	f4bd18d188ce5a70c2af5b207a2d511260c5d852	<h2>Contact Us</h2>\n\n<ul>\n\t<li>REAL CLEAR NEIGHBORHOODS</li>\n\t<li>129 W. Sunbridge Dr.</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>info@realclearneighborhoods.com</li>\n\t<li>(479)&nbsp;935-8989</li>\n</ul>\n	2015-03-26 19:08:45.430878+02
119	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch with Us</h2>\n\n<ul>\n\t<li>129 W Sunbridge Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>(479)&nbsp;935-8989 or (888) 958-7725</li>\n</ul>\n\n<p>info@realclearneighborhoods.com</p>\n	2015-04-26 02:54:07.733003+03
120	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<ul>\n\t<li>129 W Sunbridge Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>(479)&nbsp;935-8989 or (888) 958-7725</li>\n</ul>\n\n<p>info@realclearneighborhoods.com</p>\n	2015-04-26 02:54:12.645555+03
121	556b549786df2b8c786315dbb579769d6917664d	<h2>REAL CLEAR NEIGHBORHOODS</h2>\n\n<p>We provide our homeowners with tools, resources, and platforms in which they can share and strengthen their neighborhoods and maximize the property values within the entire community.&nbsp;</p>\n	2015-04-26 02:59:42.6965+03
122	8bae21f28d5d13d4118ade0be1c4394e2db4c38c	<div>&copy;2015 Real Clear Neighborhoods, Inc.&nbsp;&bull; All Right Reserved &bull; <a href="http://www.doc4design.com" style="float: right;">Arkansas design</a></div>\n	2015-04-26 03:00:07.222427+03
123	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<ul>\n\t<li>129 W Sunbridge Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>(479)&nbsp;935-8989</li>\n</ul>\n\n<p>or</p>\n\n<ul>\n\t<li>(888) 958-7725</li>\n</ul>\n\n<p>info@realclearneighborhoods.com</p>\n	2015-04-26 03:00:32.350401+03
124	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<ul>\n\t<li>129 W Sunbridge Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Office: (479)&nbsp;935-8989</li>\n\t<li>or</li>\n\t<li>Toll Free: (888) 958-7725</li>\n</ul>\n\n<p>info@realclearneighborhoods.com</p>\n	2015-04-26 03:00:58.708491+03
125	556b549786df2b8c786315dbb579769d6917664d	<h2>REAL CLEAR NEIGHBORHOODS</h2>\n\n<p>We provide our homeowners with tools, resources, and platforms in which they can share and strengthen their neighborhoods and maximize the property values within the entire community.&nbsp;</p>\n\n<p>Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each member of the associations we serve. We do that by coupling person-to-person customer service with the systems we have designed. We have developed a platform that choreographs the dynamic interactions between the community and the people that reside in it.</p>\n	2015-04-26 03:03:26.508488+03
126	556b549786df2b8c786315dbb579769d6917664d	<h2>REAL CLEAR NEIGHBORHOODS</h2>\n\n<p>We provide our homeowners with tools, resources, and platforms in which they can share and strengthen their neighborhoods and maximize the property values within the entire community.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each member of the associations we serve. We do that by coupling person-to-person customer service with the systems we have designed. We have developed a platform that choreographs the dynamic interactions between the community and the people that reside in it.</p>\n	2015-04-26 03:03:32.177505+03
127	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<p>&nbsp;</p>\n\n<ul>\n\t<li>129 W Sunbridge Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Office: (479)&nbsp;935-8989</li>\n\t<li>or</li>\n\t<li>Toll Free: (888) 958-7725</li>\n</ul>\n\n<p>info@realclearneighborhoods.com</p>\n	2015-04-26 03:03:52.236717+03
128	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Collective Intelligence</h2>\n\n<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n\n<p class="btn info"><a href="http://doc4rcn.webfactional.com/what-we-do">Learn More</a></p>\n	2015-04-26 03:06:23.068539+03
129	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.</p>\n\n<h3>WHO WE ARE</h3>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;<br />\nWe have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>WHAT WE DO</h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.<br />\nWe have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>WHY WE DO IT</h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.<br />\nRCN is a collaborative effort, plain and simple.</p>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.<br />\nEach RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.<br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:29:49.04587+03
151	b078824142dd4071959420a261ca8942b24e4b70	<h2>How much does RCN&#39;s management cost?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n\n<h2>How long does the transition to RCN take?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n	2015-06-08 21:35:06.263769+03
152	b078824142dd4071959420a261ca8942b24e4b70	<h2>How much does it cost?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n\n<h2>How long does the transition&nbsp;take?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n	2015-06-08 21:35:27.105655+03
130	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.</p>\n\n<h3>WHO WE ARE</h3>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>WHAT WE DO</h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.</p>\n\n<p><br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>WHY WE DO IT</h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.</p>\n\n<p><br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:30:28.905439+03
131	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.<br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>WHAT WE DO</h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.</p>\n\n<p><br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>WHY WE DO IT</h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.</p>\n\n<p><br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:31:03.085921+03
132	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.</p>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>WHAT WE DO</h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.</p>\n\n<p><br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>WHY WE DO IT</h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.</p>\n\n<p><br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:31:10.452722+03
133	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>FAQ&#39;s</h2>\n\n<p>WHAT WE DO</p>\n\n<h2><span style="line-height: 1.2; font-size: 13px;">Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.</span></h2>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n	2015-04-26 03:33:32.368984+03
134	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>FAQ&#39;s</h2>\n\n<h3>WHAT WE DO</h3>\n\n<p><span style="line-height: 1.2; font-size: 13px;">Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.</span></p>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>Great Bullet Point Answer</h3>\n\n<p><a href="/"><em>Find out more</em></a></p>\n	2015-04-26 03:35:44.036634+03
135	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>FAQ&#39;s</h2>\n\n<h3>WHAT WE DO</h3>\n\n<p><span style="line-height: 1.2; font-size: 13px;">Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.</span></p>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>WHY WE DO IT</h3>\n\n<p>We love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.</p>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p>We made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.</p>\n\n<p>&nbsp;</p>\n\n<p><a href="/"><em>Find out more</em></a></p>\n	2015-04-26 03:37:16.393132+03
136	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.<br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>WHAT WE DO</h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>WHY WE DO IT</h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.<br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:37:45.678429+03
137	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.<br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="what we do" name="what we do">WHAT WE DO</a></h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="why we do it" name="why we do it">WHY WE DO IT</a></h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="our philosophy" name="our philosophy">OUR PHILOSOPHY</a></h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.<br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:38:41.197952+03
138	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>FAQ&#39;s</h2>\n\n<h3>WHAT WE DO</h3>\n\n<p><span style="line-height: 1.2; font-size: 13px;">Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.</span></p>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>WHY WE DO IT</h3>\n\n<p>We love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.</p>\n\n<p><a href="/"><em>Find out more</em></a></p>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p>We made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;<a href="/"><em>Find out more</em></a></p>\n	2015-04-26 03:41:17.88297+03
139	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>FAQ&#39;s</h2>\n\n<h3>WHAT WE DO</h3>\n\n<p><span style="line-height: 1.2; font-size: 13px;">Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;</span><a href="/"><em>Find out more</em></a></p>\n\n<h3>WHY WE DO IT</h3>\n\n<p>We love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.&nbsp;<a href="/"><em>Find out more</em></a></p>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p>We made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;<a href="/"><em>Find out more</em></a></p>\n	2015-04-26 03:41:31.219607+03
140	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.</p>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="what we do" name="what we do">WHAT WE DO</a></h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="why we do it" name="why we do it">WHY WE DO IT</a></h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="our philosophy" name="our philosophy">OUR PHILOSOPHY</a></h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:49:55.064542+03
234	8bae21f28d5d13d4118ade0be1c4394e2db4c38c	<p>&copy;2016 Real Clear Neighborhoods, Inc.&nbsp;&bull; All Right Reserved &bull;</p>\n	2016-09-13 22:04:02.47107+03
141	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>&nbsp;</p>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;At RCN, we know that associations, homeowners, and developers can all count on our singular focus____________.</p>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="what we do" name="what we do">WHAT WE DO</a></h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="why we do it" name="why we do it">WHY WE DO IT</a></h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="our philosophy" name="our philosophy">OUR PHILOSOPHY</a></h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-04-26 03:50:03.144792+03
142	a12ebabceaaf340322b4f7aa0206462b4bf79db8	<h2>FAQ&#39;s</h2>\n\n<h3>&nbsp;</h3>\n\n<h3>WHAT WE DO</h3>\n\n<p><span style="line-height: 1.2; font-size: 13px;">Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;</span><a href="/"><em>Find out more</em></a></p>\n\n<h3>WHY WE DO IT</h3>\n\n<p>We love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.&nbsp;<a href="/"><em>Find out more</em></a></p>\n\n<h3>OUR PHILOSOPHY</h3>\n\n<p>We made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;<a href="/"><em>Find out more</em></a></p>\n	2015-04-26 03:50:08.206167+03
143	9a667768e8f3d7699402e0f862de31c66cfc1c98	<h2>Community Resources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-04-26 03:57:42.473386+03
144	556b549786df2b8c786315dbb579769d6917664d	<h2>REAL CLEAR NEIGHBORHOODS</h2>\n\n<p>We provide our homeowners with tools, resources, and platforms in which they can share and strengthen their neighborhoods and maximize the property values within the entire community.&nbsp;</p>\n\n<p>Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each member of the associations we serve. We do that by coupling person-to-person customer service with the systems we have designed. We have developed a platform that choreographs the dynamic interactions between the community and the people that reside in it.</p>\n	2015-05-05 05:54:17.214035+03
145	556b549786df2b8c786315dbb579769d6917664d	<h2>REAL CLEAR NEIGHBORHOODS</h2>\n\n<p>We provide our homeowners with tools, resources, and platforms in which they can share and strengthen their neighborhoods and maximize the property values within the entire community.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each member of the associations we serve. We do that by coupling person-to-person customer service with the systems we have designed. We have developed a platform that choreographs the dynamic interactions between the community and the people that reside in it.</p>\n	2015-05-05 05:54:25.27377+03
146	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-06-08 21:28:46.938+03
147	103d48ec81c801e2f9c38fffaaccb94fa6374d75	<h2>Financial Management</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-06-08 21:28:56.409624+03
148	b6b133bb4e7b7ae76cc866f3ef85fe07894d70bc	<h2>Document Management</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-06-08 21:29:04.734464+03
149	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2015-06-08 21:29:13.748454+03
150	b078824142dd4071959420a261ca8942b24e4b70	<h2>What Does an Association Managment Do?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n\n<h2>How long does the transition to RCN take?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n	2015-06-08 21:34:04.702246+03
166	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>&nbsp;</p>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 10:50:38.000691+03
153	b078824142dd4071959420a261ca8942b24e4b70	<h2>How do I login/register for the first time?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n\n<h2>Who do I contact if I have trouble with my account?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n	2015-06-08 21:36:42.752118+03
154	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/association-management">Find out more</a></p>\n	2015-06-08 21:44:38.532025+03
155	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/what-we-do-association-management">Find out more</a></p>\n	2015-06-08 21:45:04.100261+03
156	103d48ec81c801e2f9c38fffaaccb94fa6374d75	<h2>Financial Management</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/what-we-do-financial-management">Find out more</a></p>\n	2015-06-08 21:45:25.343777+03
157	b6b133bb4e7b7ae76cc866f3ef85fe07894d70bc	<h2>Document Management</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/what-we-do-document-management">Find out more</a></p>\n	2015-06-08 21:45:43.041616+03
158	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/what-we-do-community-resources">Find out more</a></p>\n	2015-06-08 21:45:58.507953+03
159	b078824142dd4071959420a261ca8942b24e4b70		2015-06-08 21:47:03.187979+03
160	202f105f748a6463b946c5233a9be22b6706c16d	<h1>Lorem ipsum</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.</p>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>\n\n<h2>How do I login/register for the first time?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n\n<h2>Who do I contact if I have trouble with my account?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n	2015-06-08 21:47:16.962197+03
161	202f105f748a6463b946c5233a9be22b6706c16d	<h1>Find Answers to Common Questions</h1>\n\n<p>This page should contain most of the answers to your questions regarding RCN&#39;s Services. If you cannot find the answer to the question you have here, feel free to contact us and we will get back to you as soon as possible.&nbsp;</p>\n\n<h2>&nbsp;</h2>\n\n<h2>How do I login/register for the first time?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n\n<h2>Who do I contact if I have trouble with my account?</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat</p>\n	2015-06-08 21:49:37.815174+03
162	202f105f748a6463b946c5233a9be22b6706c16d	<h1>Find Answers to Common Questions</h1>\n\n<p>This page should contain most of the answers to your questions regarding RCN&#39;s Services. If you cannot find the answer to the question you have here, feel free to contact us and we will get back to you as soon as possible.&nbsp;</p>\n\n<h2>&nbsp;</h2>\n\n<h2>How do I register my account for the first time?</h2>\n\n<p>If your neighborhood has retianed RCN as the managment company&nbsp;for your homeowner association, the registration process begins by clicking on the &quot;Login&quot; button on the top right of this page. From there you will be taken to few&nbsp;pages that shouldn&#39;t take longer than a couple of minutes to complete. From that point forward&nbsp;you will have full access to all of&nbsp;the services and conveniences RCN has to offer your neighborhood, and you will also become a member of our decision making team for the future to shape your community into what you would like it to be.&nbsp;</p>\n\n<h2>Who do I contact if I have trouble with the registration process?</h2>\n\n<p>Simply click on the &quot;Contact Us&quot; link above and tell us the trouble or quesitons you have, and we will get back to you as soon as possible to help in any way that we can help.</p>\n	2015-06-08 21:55:13.799051+03
163	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-06-08 22:00:58.297798+03
164	c7f13da926737e98fb648fa45aa4a85546b11137	<h2>Collective Intelligence</h2>\n\n<p>We believe in the collective intelligence of communities. So we work with (and listen to) every resident of the communities we partner with to continually improve and refine our services.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-06-08 22:01:38.102143+03
165	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/about-us">Learn More</a></p>\n	2015-06-08 22:02:05.73804+03
167	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 10:51:24.395373+03
168	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h3>Built For Homeowners</h3>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 10:51:42.361281+03
169	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.</p>\n\n<p>Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 10:51:54.607001+03
170	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.</p>\n\n<p>Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 10:52:57.261964+03
171	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>&nbsp;</h2>\n\n<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.</p>\n\n<p>Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 11:01:59.956632+03
172	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>&nbsp;</h2>\n\n<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.</p>\n\n<p>Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 11:02:12.597907+03
173	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>&nbsp;</h2>\n\n<h2>Built For Homeowners</h2>\n\n<p>&nbsp;</p>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.</p>\n\n<p>Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 11:02:18.950376+03
174	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>&nbsp;</h2>\n\n<h2><a id="homeowners" name="homeowners">Built For Homeowners</a></h2>\n\n<p>&nbsp;</p>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.</p>\n\n<p>Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 11:02:42.011502+03
175	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 11:04:02.736976+03
176	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Built For Homeowners</h2>\n\n<p>&nbsp;</p>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 11:04:08.041833+03
177	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn action"><a href="/about-us">Learn More</a></p>\n	2015-07-15 11:23:12.576394+03
178	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info">&nbsp;</p>\n\n<p class="btn info"><a href="/about-us">Learn More</a></p>\n	2015-07-15 11:23:21.874075+03
179	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/about-us">Learn More</a></p>\n\n<p class="btn info"><a href="/about-us"><img alt="" src="/media/uploads/learn-more-test.png" style="float: right; width: 383px; height: 100px;" /></a></p>\n	2015-07-15 11:35:06.30885+03
180	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/about-us">Learn More</a></p>\n\n<p class="btn info"><a href="/about-us"><img alt="" src="/media/uploads/learn-more-test.png" style="width: 383px; height: 100px;" /></a></p>\n	2015-07-15 11:35:33.899704+03
181	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/about-us">Learn More</a></p>\n	2015-07-15 11:35:46.721057+03
182	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/about-us">Learn More</a></p>\n\n<p class="btn info">&nbsp;</p>\n	2015-07-15 11:35:50.789397+03
183	1c5282677f4cad943499bd4b2c7639b60b956326	<p class="btn info"><a href="/about-us">Learn More</a></p>\n	2015-07-15 11:35:57.904119+03
184	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<ul>\n\t<li>129 W Sunbridge Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Office: (479)&nbsp;935-8989</li>\n\t<li>Toll Free: (888) 958-7725</li>\n</ul>\n\n<p>info@realclearneighborhoods.com</p>\n\n<p>&nbsp;</p>\n	2015-07-15 11:36:35.658989+03
185	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>&nbsp;</p>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 16:58:02.789274+03
186	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 16:58:08.510728+03
187	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;RCN creates custom platforms specially designed for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:00:52.182669+03
188	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:00:56.966171+03
235	8bae21f28d5d13d4118ade0be1c4394e2db4c38c	<pre>\n&copy;2016 Real Clear Neighborhoods, Inc. &bull; All Right Reserved &bull;</pre>\n	2016-09-13 22:04:58.003878+03
189	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:01:28.54901+03
190	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>Every neighborhood is different, just as every person living within that neighborhood is different, so RCN&#39;s POA Managment Service&nbsp;treats each community&nbsp;as a unique entity. Meaning? We work with our communities to create custom solutions so the Board of Directors, homeowners, and residents in that respective community all can attain the highest quality of life possible. Period.</p>\n\n<p><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:06:32.021413+03
191	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>Every neighborhood is different, just as every person living within that neighborhood is different, so RCN&#39;s POA Managment Service&nbsp;treats each community&nbsp;as a unique entity. Meaning? We work with our communities to create custom solutions so the Board of Directors, homeowners, and residents in that respective community all can attain the highest quality of life possible. Period.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:06:41.659567+03
192	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>Every neighborhood is different, just as every person living within that neighborhood is different, so RCN&#39;s POA Managment Service&nbsp;treats each community&nbsp;as a unique entity. We work with our communities to create custom solutions so the Board of Directors, homeowners, and residents in that respective community all can attain the highest quality of life possible.&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:07:05.527707+03
193	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>Every neighborhood is unique. Our&nbsp;POA Managment Service&nbsp;treats each community&nbsp;as just that: a unique community. We&nbsp;create custom solutions so the Board of Directors, the homeowners, and the community as a whole thrives with as little interefearance in the daily life of everyone in our neighborhoods.&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:08:44.93969+03
194	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.</p>\n\n<p>Every neighborhood is unique. Our&nbsp;POA Managment Service&nbsp;treats each community&nbsp;as just that: a unique community. We&nbsp;create custom solutions for all of our communities, and we settle for nothing less than the highest quality of life possible.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-15 17:09:56.729795+03
195	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners.&nbsp;Each platform we create adds convenience and simplicity to increase the quality of life for everyone in our communities.&nbsp;We&nbsp;create custom solutions for all of our communities, and we settle for nothing less than the highest quality of life possible.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-19 17:43:16.232723+03
196	cfbf3e438cd576bccc69018756e7e3412ce5c046	<h2>Building Community</h2>\n\n<p>Real Clear Neighborhoods connects neighbors online to improve their quality of life offline.&nbsp;</p>\n\n<p>RCN creates custom platforms designed specifically&nbsp;for the needs of homeowners. We&nbsp;create custom solutions for all of our communities, and we settle for nothing less than the highest quality of life possible.</p>\n\n<p class="btn info"><a href="/what-we-do">Learn More</a></p>\n	2015-07-19 17:43:34.716926+03
197	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>&nbsp;</p>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;</p>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="what we do" name="what we do">WHAT WE DO</a></h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="why we do it" name="why we do it">WHY WE DO IT</a></h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="our philosophy" name="our philosophy">OUR PHILOSOPHY</a></h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2015-07-27 16:33:05.300875+03
236	8bae21f28d5d13d4118ade0be1c4394e2db4c38c	<p>&copy;2016 Real Clear Neighborhoods, Inc. &bull; All Right Reserved &bull;</p>\n	2016-09-13 22:05:11.138097+03
198	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<ul>\n\t<li>129 W Sunbridge Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Office: (479)&nbsp;935-8989</li>\n\t<li>Toll Free: (888) 958-7725</li>\n</ul>\n\n<p><a href="mailto:info@realclearneighborhoods.com">info@realclearneighborhoods.com</a></p>\n\n<p>&nbsp;</p>\n	2015-10-07 06:43:36.494424+03
199	3580930cc5c9071ce54af8c02b9714d06aa23686	<h1>Who We Are</h1>\n\n<p>We provide unparalleled association management solutions for our homeowners to protect, maintain, and enhance their community.&nbsp;</p>\n\n<p><br />\nReal Clear Neighborhoods is a company founded on transparency and collective intelligence.&nbsp;We have a simple belief and purpose that drives everything we do here at RCN. To put it simply, we feel like life is too short to not live it to its fullest. With the access to information available today, &nbsp;coupled with the rapid rate that everyone in the world is becoming interconnected, we designed our company around one dream.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="what we do" name="what we do">WHAT WE DO</a></h3>\n\n<p><br />\nReal Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage.&nbsp;We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it.<br />\nWe are big believers in collaborative working and thinking, but strive to ensure that no one loses his or her individuality and unique voice. With the collective intelligence of the association and the board members, and our company working towards one goal, well, to say we are moving fast would be an incredible understatement.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="why we do it" name="why we do it">WHY WE DO IT</a></h3>\n\n<p><br />\nWe love seeing the looks on people&#39;s faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people&#39;s lives.<br />\nRCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood synergy, the mix of the land and how it is used, and how the community interacts with the city. And, all of this is done in a completely transparent manner.</p>\n\n<p>RCN is a collaborative effort, plain and simple.</p>\n\n<h3>&nbsp;</h3>\n\n<h3><a id="our philosophy" name="our philosophy">OUR PHILOSOPHY</a></h3>\n\n<p><br />\nWe made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere.&nbsp;Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and tie them all into the surrounding community.</p>\n\n<p><br />\nSimple. Powerful. And, always created with the input of the collective intelligence of the association and needs of the surrounding community... that is the RCN way of doing things.</p>\n	2016-02-06 21:03:34.220631+02
200	969ae539c7c5a8629b977d2623bb04df57543549	<h3>Developers</h3>\n\n<p>Elimate the neighborhood management from your day-to-day workload</p>\n	2016-05-18 01:20:14.96989+03
201	f8996283243a6118c8deedb8ae39cdcfb83c202b	<h3>Local Business</h3>\n\n<p>Integrate with surrounding neighborhoods</p>\n	2016-05-18 01:21:15.367292+03
202	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<ul>\n\t<li>Full-service management of property &amp; homeowner associations</li>\n\t<li>Conflict resolution\n\t<ul>\n\t\t<li>&nbsp;&nbsp; &nbsp;online, anonymous violation reporting</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;board is copied on all disputes</li>\n\t</ul>\n\t</li>\n\t<li>Technology\n\t<ul>\n\t\t<li>&nbsp;&nbsp; &nbsp;website development &amp; maintenance&nbsp;</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;member account area to manage account</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;secure payment processing</li>\n\t</ul>\n\t</li>\n\t<li>Common area reservation system</li>\n\t<li>Homeowner request &amp; idea submission</li>\n</ul>\n\n<p class="btn info"><a href="/what-we-do-association-management">Find out more</a></p>\n	2016-05-19 19:06:27.002248+03
203	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<ul>\n\t<li>Full-service management of property &amp; homeowner associations</li>\n\t<li>Conflict resolution\n\t<ul>\n\t\t<li>&nbsp;&nbsp; &nbsp;online, anonymous violation reporting</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;board is copied on all disputes</li>\n\t</ul>\n\t</li>\n\t<li>Technology\n\t<ul>\n\t\t<li>&nbsp;&nbsp; &nbsp;website development &amp; maintenance&nbsp;</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;member account area to manage account</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;secure payment processing</li>\n\t</ul>\n\t</li>\n\t<li>Common area reservation system</li>\n\t<li>Homeowner request &amp; idea submission</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do-association-management">Find out more</a></p>\n	2016-05-19 19:06:51.082228+03
204	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<ul>\n\t<li>Full-service management of property &amp; homeowner associations</li>\n\t<li>Conflict resolution</li>\n\t<li>Technology\n\t<ul>\n\t\t<li>&nbsp;&nbsp; &nbsp;website development &amp; maintenance&nbsp;</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;member account area to manage account</li>\n\t\t<li>&nbsp;&nbsp; &nbsp;secure payment processing</li>\n\t</ul>\n\t</li>\n\t<li>Common area reservation system</li>\n\t<li>Homeowner request &amp; idea submission</li>\n</ul>\n\n<p class="btn info"><a href="/what-we-do-association-management">Find out more</a></p>\n	2016-05-19 19:07:23.321234+03
205	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<p>RCN creates platforms specially designed for the needs of our homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our homeowners.</p>\n\n<ul>\n\t<li>Full-service management of property &amp; homeowner associations</li>\n\t<li>Conflict resolution</li>\n\t<li>Website development &amp; maintenance</li>\n\t<li>member account area to manage account</li>\n\t<li>secure payment processing</li>\n\t<li>Common area reservation system</li>\n\t<li>Homeowner request &amp; idea submission</li>\n</ul>\n\n<p><a href="/what-we-do-association-management">Find out more</a></p>\n	2016-05-19 19:08:53.03184+03
206	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<p>RCN creates platforms specially designed for the needs of our homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our homeowners.</p>\n\n<ul>\n\t<li>Full-service management of property &amp; homeowner associations</li>\n\t<li>Conflict resolution</li>\n\t<li>Website development &amp; maintenance</li>\n\t<li>member account area to manage account</li>\n\t<li>secure payment processing</li>\n\t<li>Common area reservation system</li>\n\t<li>Homeowner request &amp; idea submission</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><a href="/what-we-do-association-management">Find out more</a></p>\n	2016-05-19 19:09:03.901203+03
207	53c6d183b8463cf4b1b92aa90052ee5416c35096	<h2>Association Management</h2>\n\n<p>RCN creates platforms specially designed for the needs of our homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our homeowners.</p>\n\n<ul>\n\t<li>Full-service management of property &amp; homeowner associations</li>\n\t<li>Conflict resolution</li>\n\t<li>Website development &amp; maintenance</li>\n\t<li>member account area to manage account</li>\n\t<li>secure payment processing</li>\n\t<li>Common area reservation system</li>\n\t<li>Homeowner request &amp; idea submission</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p class="btn info"><a href="/what-we-do-association-management">Find out more</a></p>\n	2016-05-19 19:09:19.578725+03
208	103d48ec81c801e2f9c38fffaaccb94fa6374d75	<h2>Financial Management</h2>\n\n<p>We aim to increase value, plain and simple. Now, when we say value, we&#39;re not just talking about value from a financial standpoint. We mean value in every sense of the word. Value within the communities we partner with, and the communities we will partner with in the future, from a financial standpoint, a quality of life standpoint, and an overall value in knowing when one of our members comes home after a long day at work, they&#39;ll be coming home to a house and community that we&#39;ve been working on all day to make sure it&#39;s what they want when they drive in... eat dinner with their family... and lay down to sleep at night.</p>\n\n<p class="btn info"><a href="/what-we-do-financial-management">Find out more</a></p>\n	2016-05-19 19:11:40.781609+03
237	8bae21f28d5d13d4118ade0be1c4394e2db4c38c	<p>&copy;2017&nbsp;Real Clear Neighborhoods, Inc. &bull; All Rights Reserved &bull;</p>\n	2017-03-09 18:27:20.270457+02
209	b6b133bb4e7b7ae76cc866f3ef85fe07894d70bc	<h2>Document Management</h2>\n\n<ul>\n\t<li>Digitally indexed &amp; searchable</li>\n\t<li>CC&amp;R&rsquo;s, Bylaws, Meeting Minutes, architectural guidelines and more</li>\n\t<li>Action without meeting forms &amp; submissions</li>\n\t<li>Annual meeting guides &amp; resources</li>\n\t<li>Monthly board meeting guides &amp; resources</li>\n\t<li>Current information on proposed law &amp; ordinance changes</li>\n\t<li>Proposed language &amp; policies for landlords to enter &amp; manage leases</li>\n\t<li>Board candidate application</li>\n</ul>\n\n<p class="btn info"><a href="/what-we-do-document-management">Find out more</a></p>\n	2016-05-19 19:13:32.804494+03
210	b6b133bb4e7b7ae76cc866f3ef85fe07894d70bc	<h2>Document Management</h2>\n\n<p>We have developed a system that puts all of the information for your Owner&#39;s Association, surrounding the community, and many other useful pieces of information together in one convenient place so it &nbsp;is always there when you need it. And, RCN handles all changes, updates, disputes and issues associated with the collective covenants, conditions, and restrictions (CC&amp;R&#39;s). Life&#39;s complicated enough, you should not have to worry about anything when you get home.</p>\n\n<ul>\n\t<li>Digitally indexed &amp; searchable</li>\n\t<li>CC&amp;R&rsquo;s, Bylaws, Meeting Minutes, architectural guidelines and more</li>\n\t<li>Action without meeting forms &amp; submissions</li>\n\t<li>Annual meeting guides &amp; resources</li>\n\t<li>Monthly board meeting guides &amp; resources</li>\n\t<li>Current information on proposed law &amp; ordinance changes</li>\n\t<li>Proposed language &amp; policies for landlords to enter &amp; manage leases</li>\n\t<li>Board candidate application</li>\n</ul>\n\n<p class="btn info"><a href="/what-we-do-document-management">Find out more</a></p>\n	2016-05-19 19:16:20.271021+03
211	b6b133bb4e7b7ae76cc866f3ef85fe07894d70bc	<h2>Document Management</h2>\n\n<p>We have developed a system that puts all of the information for your Owner&#39;s Association, surrounding the community, and many other useful pieces of information together in one convenient place so it &nbsp;is always there when you need it.&nbsp;</p>\n\n<ul>\n\t<li>Digitally indexed &amp; searchable</li>\n\t<li>CC&amp;R&rsquo;s, Bylaws, Meeting Minutes, architectural guidelines and more</li>\n\t<li>Action without meeting forms &amp; submissions</li>\n\t<li>Annual meeting guides &amp; resources</li>\n\t<li>Monthly board meeting guides &amp; resources</li>\n\t<li>Current information on proposed law &amp; ordinance changes</li>\n\t<li>Proposed language &amp; policies for landlords to enter &amp; manage leases</li>\n\t<li>Board candidate application</li>\n</ul>\n\n<p>And, RCN handles all changes, updates, disputes and issues associated with the collective covenants, conditions, and restrictions (CC&amp;R&#39;s). Life&#39;s complicated enough, you should not have to worry about anything when you get home.</p>\n\n<p class="btn info"><a href="/what-we-do-document-management">Find out more</a></p>\n	2016-05-19 19:16:42.689109+03
212	b6b133bb4e7b7ae76cc866f3ef85fe07894d70bc	<h2>Document Management</h2>\n\n<p>We have developed a system that puts all of the information for your Owner&#39;s Association, surrounding the community, and many other useful pieces of information together in one convenient place so it &nbsp;is always there when you need it.&nbsp;</p>\n\n<ul>\n\t<li>Digitally indexed &amp; searchable</li>\n\t<li>CC&amp;R&rsquo;s, Bylaws, Meeting Minutes, architectural guidelines and more</li>\n\t<li>Action without meeting forms &amp; submissions</li>\n\t<li>Annual meeting guides &amp; resources</li>\n\t<li>Monthly board meeting guides &amp; resources</li>\n\t<li>Current information on proposed law &amp; ordinance changes</li>\n\t<li>Proposed language &amp; policies for landlords to enter &amp; manage leases</li>\n\t<li>Board candidate application</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>And, RCN handles all changes, updates, disputes and issues associated with the collective covenants, conditions, and restrictions (CC&amp;R&#39;s). Life&#39;s complicated enough, you should not have to worry about anything when you get home.</p>\n\n<p class="btn info"><a href="/what-we-do-document-management">Find out more</a></p>\n	2016-05-19 19:16:56.453378+03
213	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<ul>\n\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t<p>Articles &amp; news relevant to the community</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t<p>Recommended service providers</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t<p>Latest Association/Neighborhood, City, State, and Government news and items of interest</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t<p>Direct links from association platforms to local services and information (including, but not limited to):&nbsp;</p>\n\n\t<ul>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Zoning &amp; planning</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Parks &amp; recreation</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;City council &amp; commissions</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;DMV</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Libraries</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Hospitals &amp; Medical Care</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Law Enforcement, Fire, and Paramedics</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Postal Service</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Public Transportation</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Trash &amp; recycling</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;TV, Phone &amp; internet</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Gas</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Electric</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;&nbsp; &nbsp;Registrar of voters</p>\n\t\t</li>\n\t\t<li style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">\n\t\t<p>&nbsp;</p>\n\t\t</li>\n\t</ul>\n\t</li>\n</ul>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);"><a href="/what-we-do-community-resources">Find out more</a></p>\n	2016-05-19 19:22:31.139184+03
214	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Articles &amp; news relevant to the community</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Recommended service providers</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Latest Association/Neighborhood, City, State, and Government news and items of interest</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Direct links from association platforms to local services and information (including, but not limited to):&nbsp;</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Zoning &amp; planning</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Parks &amp; recreation</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;City council &amp; commissions</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;DMV</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Libraries</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Hospitals &amp; Medical Care</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Law Enforcement, Fire, and Paramedics</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Postal Service</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Public Transportation</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Trash &amp; recycling</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;TV, Phone &amp; internet</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Gas</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Electric</p>\n\n<p style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Registrar of voters</p>\n\n<p class="btn info" style="margin: 0px; font-size: 11px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);"><a href="/what-we-do-community-resources">Find out more</a></p>\n	2016-05-19 19:23:21.906443+03
215	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2016-05-19 19:25:19.009116+03
216	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Articles &amp; news relevant to the community</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Recommended service providers</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Latest Association/Neighborhood, City, State, and Government news and items of interest</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Direct links from association platforms to local services and information (including, but not limited to):&nbsp;</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Zoning &amp; planning</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Schools (Interactive district maps and calendars for local schools)</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Parks &amp; recreation</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;City council &amp; commissions</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;DMV</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Libraries</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Hospitals &amp; Medical Care</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Law Enforcement, Fire, and Paramedics</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Postal Service</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Public Transportation</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Trash &amp; recycling</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;TV, Phone &amp; internet</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Gas</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Electric</p>\n\n<p style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Registrar of voters</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2016-05-19 19:25:34.154019+03
233	5ec80e160839267d0f6ba8eef022205849f2cf8d	<h2>Get in Touch</h2>\n\n<ul>\n\t<li>4200 Gabel Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n\t<li>Office: (479)&nbsp;935-8989</li>\n\t<li>Toll Free: (888) 958-7725</li>\n</ul>\n\n<p><a href="mailto:info@realclearneighborhoods.com">info@realclearneighborhoods.com</a></p>\n\n<p>&nbsp;</p>\n	2016-09-13 22:02:23.091813+03
217	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<ul>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Articles &amp; news relevant to the community</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Recommended service providers</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Latest Association/Neighborhood, City, State, and Government news and items of interest</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">Direct links from association platforms to local services and information (including, but not limited to):&nbsp;</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Zoning &amp; planning</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Schools (Interactive district maps and calendars for local schools)</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Parks &amp; recreation</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;City council &amp; commissions</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;DMV</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Libraries</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Hospitals &amp; Medical Care</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Law Enforcement, Fire, and Paramedics</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Postal Service</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Public Transportation</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Trash &amp; recycling</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;TV, Phone &amp; internet</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Gas</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Electric</li>\n\t<li style="margin: 0px; font-size: 14px; line-height: normal; font-family: 'Proxima Nova'; color: rgb(68, 68, 68);">&nbsp;&nbsp; &nbsp;Registrar of voters</li>\n</ul>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2016-05-19 19:26:41.579979+03
218	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2016-05-19 19:26:48.588965+03
219	9601d415ecf289fe83994079c5388400c3466ea3	<h2>Location</h2>\n\n<ul>\n\t<li>4200 Gabel Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n</ul>\n\n<h2>Contact Info</h2>\n\n<ul>\n\t<li>479-935-8989</li>\n\t<li><a href="mailto:info@realclearneighborhoods.com">info@realclearneighborhoods.com</a></li>\n</ul>\n	2016-05-19 19:28:19.198822+03
220	f932fb6a31b02e7eef73abc04f43b46853f766c3	<h1>Talk To Us</h1>\n\n<p>If you have any questions, issues, or just want to say hello before the full update and information package is sent, feel free to contact us anytime.</p>\n\n<p>&nbsp;</p>\n	2016-05-19 19:29:37.035154+03
221	f932fb6a31b02e7eef73abc04f43b46853f766c3	<h1>Talk To Us</h1>\n\n<p>If you have any questions, issues, or just want to say hello before the full update and information package is sent, feel free to contact us anytime.</p>\n	2016-05-19 19:29:46.570313+03
222	9601d415ecf289fe83994079c5388400c3466ea3	<h2>Location</h2>\n\n<ul>\n\t<li>Real Clear Neighborhoods</li>\n\t<li>4200 Gabel Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n</ul>\n\n<h2>Contact Info</h2>\n\n<ul>\n\t<li>Real Clear Neighborhoods</li>\n\t<li><a href="realclearneighborhoods.com">www.realclearneighborhoods.com</a></li>\n\t<li>479-935-8989</li>\n\t<li><a href="mailto:info@realclearneighborhoods.com">info@realclearneighborhoods.com</a></li>\n</ul>\n	2016-05-19 19:30:29.74876+03
223	9601d415ecf289fe83994079c5388400c3466ea3	<h2>Location</h2>\n\n<ul>\n\t<li>Real Clear Neighborhoods</li>\n\t<li>4200 Gabel Dr</li>\n\t<li>Fayetteville, AR 72703</li>\n</ul>\n\n<h2>Contact Info</h2>\n\n<ul>\n\t<li>Real Clear Neighborhoods</li>\n\t<li>479-935-8989</li>\n\t<li><a href="realclearneighborhoods.com">www.realclearneighborhoods.com</a></li>\n\t<li><a href="mailto:info@realclearneighborhoods.com">info@realclearneighborhoods.com</a></li>\n</ul>\n	2016-05-19 19:30:51.310399+03
224	969ae539c7c5a8629b977d2623bb04df57543549	<h3>Developers</h3>\n\n<p>Elimate neighborhood management from&nbsp;developer workload</p>\n	2016-05-19 23:23:50.685435+03
225	969ae539c7c5a8629b977d2623bb04df57543549	<h3>Developers</h3>\n\n<p>Elimate neighborhood management from&nbsp;development</p>\n	2016-05-19 23:24:07.533974+03
226	8e62dc7f4ef30eeb72ce59c522b117619e8499f3	<h2>Document Management</h2>\n\n<p>We have developed a system that puts all of the information for your Owner&#39;s Association, surrounding community, and many other useful pieces of information together in one convenient spot so it&#39;s always there when you need it. And, RCN&nbsp;handles all changes, updates, disputes and issues associated with the collective covenants, conditions, and restrictions (CC&amp;R&#39;s). Life&#39;s complicated enough, you shouldn&#39;t have to worry about anything when you get home.</p>\n\n<h2>Example of Common&nbsp;Documents</h2>\n\n<p>Here are some common documents that can be found&nbsp;on our neighborhood websites:</p>\n\n<ul>\n\t<li>Delaration (or Master Deed)</li>\n\t<li>Articles of Incorporation (or Charter)</li>\n\t<li>Bylaws</li>\n\t<li>Rules and Regulations</li>\n</ul>\n	2016-05-19 23:33:02.596878+03
227	434b451c09271a22387cd2e5764c9410a03a4e8c	<h2>Financial Services</h2>\n\n<p>RCN is committed to the financial strength and stability of every community we manage. We provide expert financial management that is focused on building long-term value, along with unmatched purchasing power. It&rsquo;s all designed to provide your HOA with significant savings, as well as one-stop-shop solutions that help you get the absolute best return on your investment.&nbsp;</p>\n\n<h2>At RCN, we:</h2>\n\n<ul>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Provide financial services customized for each community</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Prepare comprehensive financial reports including balance sheets, income statements, general ledgers, accounts payable, check disbursements, and income and expense projections</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Reconcile all accounts including checking, savings, money market, etc.</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Prepare and distribute checks</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Monitor investment funds and rollover dates</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Manage accounts payable entry and processing</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Record, code and preserve invoices</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Conduct billing and collections of association assessments</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Send delinquency notices and violation letters</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Oversee escrow demands</p>\n\t</li>\n\t<li style="margin: 0px; font-size: 12px; line-height: normal; font-family: 'Myriad Pro'; color: rgb(68, 68, 68);">\n\t<p>Manage electronic funds via secured computers</p>\n\t</li>\n</ul>\n	2016-05-19 23:36:09.696676+03
228	434b451c09271a22387cd2e5764c9410a03a4e8c	<h2>Financial Services</h2>\n\n<p>RCN is committed to the financial strength and stability of every community we manage. We provide expert financial management that is focused on building long-term value, along with unmatched purchasing power. It&rsquo;s all designed to provide your HOA with significant savings, as well as one-stop-shop solutions that help you get the absolute best return on your investment.&nbsp;</p>\n\n<h2>At RCN, we:</h2>\n\n<ul>\n\t<li>Provide financial services customized for each community</li>\n\t<li>Prepare financial reports including balance sheets, income statements, general ledgers, accounts payable, check disbursements, and income and expense projections</li>\n\t<li>Reconcile all accounts including checking, savings, money market, etc.</li>\n\t<li>Prepare and distribute checks</li>\n\t<li>Manage accounts payable entry and processing</li>\n\t<li>Record, code, and preserve invoices</li>\n\t<li>Conduct billing and collections of association assessments</li>\n\t<li>Send delinquency notices and violation letters</li>\n</ul>\n	2016-05-19 23:37:49.789916+03
229	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<ul>\n\t<li>Articles &amp; news relevant to the community</li>\n\t<li>Recommended service providers</li>\n\t<li>Latest Association/Neighborhood, City, State, and Government news and items of interest</li>\n\t<li>Direct links from association platforms to local services and information (including, but not limited to):&nbsp;\n\t<ul>\n\t\t<li>Zoning &amp; planning</li>\n\t\t<li>Schools and Day Care Providers</li>\n\t\t<li>Parks &amp; recreation</li>\n\t\t<li>City council &amp; commissions</li>\n\t\t<li>Hospitals &amp; Medical Care</li>\n\t\t<li>Law Enforcement, Fire, and Paramedics</li>\n\t\t<li>Utility Providers</li>\n\t\t<li>Registrar of voters</li>\n\t</ul>\n\t</li>\n</ul>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2016-05-19 23:54:04.298591+03
230	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<ul>\n\t<li>Articles &amp; news relevant to the community</li>\n\t<li>Recommended service providers</li>\n\t<li>Latest Association/Neighborhood, City, State, and Government news and items of interest</li>\n\t<li>Direct links from association platforms to local services and information (including, but not limited to):&nbsp;\n\t<ul>\n\t\t<li>Zoning &amp; planning</li>\n\t\t<li>Schools and Day Care Providers</li>\n\t\t<li>Parks &amp; recreation</li>\n\t\t<li>City council &amp; commissions</li>\n\t\t<li>Hospitals &amp; Medical Care</li>\n\t\t<li>Law Enforcement, Fire, and Paramedics</li>\n\t\t<li>Utility Providers</li>\n\t\t<li>Registrar of voters</li>\n\t</ul>\n\t</li>\n</ul>\n\n<p class="btn info">&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2016-05-19 23:54:19.918912+03
231	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p>Real Clear Neighborhoods provides access to the knowledge and means to lead a Health and Well-being centered life. We organize the information and resources you need to make better lifestyle choices. We connect visitors to &#39;trusted sources&#39; committed to providing information. Products, services, and art that enhance Health and Well-being.</p>\n\n<ul>\n\t<li>Articles &amp; news relevant to the community</li>\n\t<li>Recommended service providers</li>\n\t<li>Latest Association/Neighborhood, City, State, and Government news and items of interest</li>\n\t<li>Direct links from association platforms to local services and information (including, but not limited to):&nbsp;\n\t<ul>\n\t\t<li>Zoning &amp; planning</li>\n\t\t<li>Schools and Day Care Providers</li>\n\t\t<li>Parks &amp; recreation</li>\n\t\t<li>City council &amp; commissions</li>\n\t\t<li>Hospitals &amp; Medical Care</li>\n\t\t<li>Law Enforcement, Fire, and Paramedics</li>\n\t\t<li>Utility Providers</li>\n\t\t<li>Registrar of voters</li>\n\t</ul>\n\t</li>\n</ul>\n\n<p>Our websites are&nbsp;your electronic tool-kit. Trusted Sources are resources committed to contributing to a positive impact on our homeowners daily lives.</p>\n\n<p><a href="/">Find out more</a></p>\n	2016-05-19 23:56:25.346223+03
232	216a0e34345c5bbb681732e621b727842fd8bf32	<h2>Community Resources</h2>\n\n<p>Real Clear Neighborhoods provides access to the knowledge and means to lead a Health and Well-being centered life. We organize the information and resources you need to make better lifestyle choices. We connect visitors to &#39;trusted sources&#39; committed to providing information. Products, services, and art that enhance Health and Well-being.</p>\n\n<ul>\n\t<li>Articles &amp; news relevant to the community</li>\n\t<li>Recommended service providers</li>\n\t<li>Latest Association/Neighborhood, City, State, and Government news and items of interest</li>\n\t<li>Direct links from association platforms to local services and information (including, but not limited to):&nbsp;\n\t<ul>\n\t\t<li>Zoning &amp; planning</li>\n\t\t<li>Schools and Day Care Providers</li>\n\t\t<li>Parks &amp; recreation</li>\n\t\t<li>City council &amp; commissions</li>\n\t\t<li>Hospitals &amp; Medical Care</li>\n\t\t<li>Law Enforcement, Fire, and Paramedics</li>\n\t\t<li>Utility Providers</li>\n\t\t<li>Registrar of voters</li>\n\t</ul>\n\t</li>\n</ul>\n\n<p>Our websites are&nbsp;your electronic tool-kit. Trusted Sources are resources committed to contributing to a positive impact on our homeowners daily lives.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2016-05-20 20:20:50.180681+03
238	4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n\n<h2>Custom Solutions and More</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our communities.</p>\n	2018-12-07 19:32:22.015208+02
239	4816327b3a554842cb3e566cbe829561bac19ef5	<h2>Association Management</h2>\n\n<p>Real Clear Neighborhoods (RCN) is a management company for Homeowners and Property Owners Associations.</p>\n\n<p>RCN maximizes the property value in every community we represent. We also ensure that every resident in an RCN managed community has the highest quality of life possible.</p>\n\n<h2>Custom Solutions</h2>\n\n<p>RCN creates custom platforms specially designed for the needs of homeowners. Each platform we create adds convenience and simplicity to increase the quality of life for every one of our communities.</p>\n	2018-12-07 19:32:41.949723+02
240	f0c7ba04a5345176379be6d5143fee171fe00a80	<h1>Find Your Neighborhood</h1>\n	2018-12-12 18:09:59.058875+02
241	9876e1a2d80b66b8dd16abc76db67144c6151924	<h1>Report a Violation</h1>\n	2018-12-12 18:10:11.021627+02
242	44a8a54e64ed2e8825717b309ae63ae24ffb8e50	<h1>Work Request</h1>\n	2018-12-12 18:10:27.997219+02
243	61b265d897a4c25f33e4abd0de6c78fdc1e8ed9a	<h1>Architectural Review</h1>\n	2018-12-12 18:10:44.869297+02
244	89eac7493b9d5eb430574ea127fe83ec6768530d	<h1>Homeowners</h1>\n	2018-12-12 18:10:56.345836+02
245	5da5ab29387f4c3dea9d65488d6f510d27bb1ac4	<h2>Find Your Neighborhood</h2>\n\n<p>Please choose your neighborhood from the list below to access your Neighborhood&#39;s Website.</p>\n\n<p>\n<style type="text/css">p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 18.0px 'Proxima Nova'}\n</style>\n</p>\n\n<ul>\n\t<li class="p1">Arbor Glenn</li>\n\t<li class="p1">Brentwood</li>\n\t<li class="p1">Bridgewater</li>\n\t<li class="p1">Central Park</li>\n\t<li class="p1">Clabber Creek III</li>\n\t<li class="p1">Copper Creek</li>\n\t<li class="p1">Cottages at Old Wire</li>\n\t<li class="p1">Creek Meadows</li>\n\t<li class="p1">Cross Creek</li>\n\t<li class="p1">Diamond Estates</li>\n\t<li class="p1">Eastview</li>\n\t<li class="p1">Fox Run</li>\n\t<li class="p1">Joyce St Cottages</li>\n\t<li class="p1">Lakewood</li>\n\t<li class="p1">Legendary</li>\n\t<li class="p1">Lexington</li>\n\t<li class="p1">Liberty Bell</li>\n\t<li class="p1">Maple Estates</li>\n\t<li class="p1">Oak Tree</li>\n\t<li class="p1">Otter Creek</li>\n\t<li class="p1">Parks at Brighton</li>\n\t<li class="p1">Rolling Acres</li>\n\t<li class="p1">Savanna Estates</li>\n\t<li class="p1">Silo Falls</li>\n\t<li class="p1">Sloan Estates</li>\n\t<li class="p1">St Valery Downs</li>\n\t<li class="p1">Spring Ridge</li>\n\t<li class="p1">Sunbridge Villas</li>\n\t<li class="p1">Townhomes at the Arbors</li>\n</ul>\n	2018-12-12 18:14:27.15847+02
246	5da5ab29387f4c3dea9d65488d6f510d27bb1ac4		2018-12-12 18:18:31.640809+02
256	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n\n<p class="btn info">If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n	2018-12-12 19:36:29.846061+02
257	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n	2018-12-12 19:37:08.14586+02
247	ea966c63742fd1eb37cdd16ac64cce6c9a87b4f5	<h2>Townhomes at the Arbors</h2>\n\n<h3 class="p1">Townhomes at the Arbors Overview</h3>\n\n<p class="p1">Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p class="p2">&nbsp;</p>\n\n<h3 class="p1">Townhomes at the Arbors Amenities</h3>\n\n<p class="p1">At the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p class="p1">Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2018-12-12 19:25:19.858501+02
248	ea966c63742fd1eb37cdd16ac64cce6c9a87b4f5	<h2>Townhomes at the Arbors</h2>\n\n<h3 class="p1">Townhomes at the Arbors Overview</h3>\n\n<p class="p1">&nbsp;</p>\n\n<p class="p1">Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p class="p2">&nbsp;</p>\n\n<h3 class="p1">Townhomes at the Arbors Amenities</h3>\n\n<p class="p1">&nbsp;</p>\n\n<p class="p1">At the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p class="p1">Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n\n<p class="btn info">&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2018-12-12 19:25:35.709154+02
249	ea966c63742fd1eb37cdd16ac64cce6c9a87b4f5	<h2>Townhomes at the Arbors</h2>\n\n<p>Townhomes at the Arbors Overview</p>\n\n<p>&nbsp;</p>\n\n<p>Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p>&nbsp;</p>\n\n<p>Townhomes at the Arbors Amenities</p>\n\n<p>&nbsp;</p>\n\n<p>At the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p>&nbsp;</p>\n\n<p>Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2018-12-12 19:26:14.000152+02
250	ea966c63742fd1eb37cdd16ac64cce6c9a87b4f5	<h2>Townhomes at the Arbors</h2>\n\n<p><a href="/">Find out more</a></p>\n	2018-12-12 19:26:38.759825+02
251	ea966c63742fd1eb37cdd16ac64cce6c9a87b4f5	<h2>Townhomes at the Arbors</h2>\n\n<h3>Townhomes at the Arbors Overview</h3>\n\n<p><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<h3>Townhomes at the Arbors Amenities</h3>\n\n<p><br />\nAt the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p>Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n\n<p><a href="/">Find out more</a></p>\n	2018-12-12 19:27:43.510559+02
252	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website. If you do not see your neighbhorhood listed, please contact us at&nbsp;info@realclearneighborhoods.com.</p>\n\n<p><a href="/">Find out more</a></p>\n	2018-12-12 19:33:22.491632+02
253	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website. If you do not see your neighbhorhood listed, please contact us at&nbsp;info@realclearneighborhoods.com.</p>\n\n<p class="btn action"><a href="/">Find out more</a></p>\n	2018-12-12 19:33:36.646112+02
254	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website. If you do not see your neighbhorhood listed, please contact us at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>.</p>\n\n<p class="btn action"><a href="/">Find out more</a></p>\n	2018-12-12 19:35:27.819744+02
255	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website. If you do not see your neighbhorhood listed, please contact us at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2018-12-12 19:35:36.983735+02
258	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n\n<p>&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n	2018-12-12 19:37:14.493538+02
259	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n	2018-12-12 19:37:19.601236+02
260	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>&nbsp;</p>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p class="btn info">&nbsp;</p>\n\n<p><a href="/">Find out more</a></p>\n\n<p>&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n	2018-12-12 19:37:47.740433+02
261	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>&nbsp;</p>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p class="btn info">&nbsp;</p>\n\n<p class="btn action"><a href="/">Find out more</a></p>\n\n<p>&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n	2018-12-12 19:37:58.573605+02
262	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>&nbsp;</p>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n\n<p>&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n	2018-12-12 19:38:06.803621+02
263	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2018-12-12 19:38:28.164777+02
264	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p><a href="/">C</a><a href="realclearneighborhoods.com/neighborhoods">hoose Your Neighborhood</a></p>\n	2018-12-12 19:46:17.367228+02
265	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please email&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="/">C</a><a href="realclearneighborhoods.com/neighborhoods">hoose Your Neighborhood</a></p>\n	2018-12-12 19:46:33.534047+02
266	a3c967699a8bc0b2e75ccbc149253bdc616e4607	<h2>Report a Violation</h2>\n\n<p>Report possible violations in your neighborhood with this quick online form.</p>\n\n<p class="btn info"><a href="/">Find out more</a></p>\n	2018-12-12 19:47:31.714266+02
267	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please send us an email at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="/">C</a><a href="realclearneighborhoods.com/neighborhoods">hoose Your Neighborhood</a></p>\n	2018-12-12 19:58:48.292315+02
268	664796d13aafbbc5b623a07802a3635fa01c3506	<h2>Work Request</h2>\n\n<p>Is there an item or area in your neighborhood in need of attention or service? Fill out the Work Request Form (with as much detail as possible) and we will submit it to your Board of Directors and get you their response as soon as possible.</p>\n\n<p><a href="/">Find out more</a></p>\n	2018-12-12 20:00:29.962497+02
269	ecbe6268da310c0397d2fca18b9dfa78731feb8b	<h2>Architectural Review&nbsp;</h2>\n\n<p>Would you like to add on to your home? Maybe you would like to paint the exterior of your home a new color? If it is visible from the street or from your neighbors house, you will need approval from the Architectural Review Committee in your neighborhood.</p>\n\n<p>Simply fill out the Architectural Review form and your Board of Directors will review your plans. As soon as they have reviewed your plans, we will notify you if the request has been approved or if it needs amending.</p>\n\n<p><a href="/">Find out more</a></p>\n	2018-12-12 20:04:08.954344+02
270	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please send us an email at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="http://realclearneighborhoods.com/neighborhoods">Find Your&nbsp;</a><a href="realclearneighborhoods.com/neighborhoods">Neighborhood</a></p>\n	2018-12-12 22:41:24.595561+02
271	f0c7ba04a5345176379be6d5143fee171fe00a80	<h1>Neighborhoods</h1>\n	2018-12-12 22:42:31.284936+02
272	57d3def1340b29525ca48626a4dc933922312b7f	<h1>Chose Your Neighborhood</h1>\n\n<p>Chose your neighborhood from the list below to be taken to your website.</p>\n	2018-12-12 22:43:22.205153+02
288	7e939e830ef3650173358d252fbc36ab1af44be0	<h2>Pick Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood&#39;s website.</p>\n\n<p><a href="http://www.realclearneighborhoods.com/townhomes-arbors">Townhomes at the Arbors</a></p>\n	2018-12-12 23:29:41.25194+02
273	57d3def1340b29525ca48626a4dc933922312b7f	<h1>Chose Your Neighborhood</h1>\n\n<p>Chose from the list below your to go to your&nbsp;neighborhood&nbsp;website.</p>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek III<br />\nCopper Creek<br />\nCottages at Old Wire<br />\nCreek Meadows<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nJoyce St Cottages<br />\nLakewood<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSpring Ridge<br />\nSunbridge Villas</p>\n\n<p>\n<style type="text/css">p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 18.0px 'Proxima Nova'}\n</style>\n</p>\n	2018-12-12 22:46:51.670397+02
274	57d3def1340b29525ca48626a4dc933922312b7f		2018-12-12 22:47:37.187333+02
275	57d3def1340b29525ca48626a4dc933922312b7f	<p>Find Your Neighborhood</p>\n\n<p>Chose your neighborhood from the list below to be taken to your neighborhood&#39;s website.</p>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek III<br />\nCopper Creek<br />\nCottages at Old Wire<br />\nCreek Meadows<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nJoyce St Cottages<br />\nLakewood<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSpring Ridge<br />\nSunbridge Villas<br />\n<a href="http://corporate.realclearneighborhoods.com/townhomes-arbors">Townhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n	2018-12-12 22:50:15.695521+02
276	c4f2cbd2b3d95aa9fc2780a4e6dbdd41b022ec9a	<h1>Townhomes at the Arbors</h1>\n\n<p>&nbsp;</p>\n\n<h3>Townhomes at the Arbors Overview</h3>\n\n<p><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<h3>&nbsp;</h3>\n\n<h3>Townhomes at the Arbors Amenities</h3>\n\n<p><br />\nAt the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p>Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n	2018-12-12 22:51:39.744772+02
277	c4f2cbd2b3d95aa9fc2780a4e6dbdd41b022ec9a	<h1>Townhomes at the Arbors</h1>\n\n<p><strong>Townhomes at the Arbors Overview</strong><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><strong>Townhomes at the Arbors Amenities</strong><br />\nAt the center of the community is the beautiful clubhouse. Staying in great shape is a breeze with a well-equipped exercise room. A catering kitchen and meeting rooms are perfect for entertaining friends and neighbors. The clubhouse also provides card tables and billiards for friendly competition, while a business center is available for when you need some space to be productive.</p>\n\n<p>Enjoying the warmer months is easy at Townhomes at the Arbors. A sparkling outdoor pool and patio allows residents to swim a few laps or relax in the sunshine. There are also outdoor social spaces, like a barbecue area and shuffleboard court. Residents can practice their short game with the putting green or take a leisurely stroll around the community&#39;s ponds.</p>\n	2018-12-12 22:52:27.342505+02
278	1982364ae9e7ace665966c9cc8a502a61c5f8cd8	<h2>Find Your Neighborhood</h2>\n\n<p>Chose your neighborhood from the list below to be taken to your community website.</p>\n\n<p><a href="http://townhomes-arbors">Townhomes at the Arbors</a></p>\n	2018-12-12 23:01:17.826075+02
279	1982364ae9e7ace665966c9cc8a502a61c5f8cd8	<h2>Find Your Neighborhood</h2>\n\n<p>Chose your neighborhood from the list below to be taken to your community website.</p>\n\n<p><a href="www.realclearneighborhoods.com/townhomes-arbors">Townhomes at the Arbors</a></p>\n	2018-12-12 23:03:33.054373+02
280	1982364ae9e7ace665966c9cc8a502a61c5f8cd8	<h2>Find Your Neighborhood</h2>\n\n<p>Chose your neighborhood from the list below to be taken to your community website.</p>\n\n<p><a href="http://realclearneighborhoods.com/townhomes-arbors">Townhomes at the Arbors</a></p>\n	2018-12-12 23:07:31.274935+02
281	d3b5f31020b2eb94dcff9e3eb7773d3a96212e67	<h1>Neighborhoods</h1>\n	2018-12-12 23:17:49.831734+02
282	47180b3fc660973601299e913ddbca5a59c4ef63	<h2>&lt;iframe src=&quot;https://docs.google.com/forms/d/e/1FAIpQLSejEjmmfyx-iMdaZ_N2xD7d_wX0uDoJkZUyINn8Db4K4CAnAw/viewform?embedded=true&quot; width=&quot;640&quot; height=&quot;1000&quot; frameborder=&quot;0&quot; marginheight=&quot;0&quot; marginwidth=&quot;0&quot;&gt;Loading...&lt;/iframe&gt;</h2>\n	2018-12-12 23:21:22.573166+02
283	47180b3fc660973601299e913ddbca5a59c4ef63	<h2>Violation Report Form</h2>\n\n<h2><iframe frameborder="0" height="1000" marginheight="0" marginwidth="0" src="https://docs.google.com/forms/d/e/1FAIpQLSejEjmmfyx-iMdaZ_N2xD7d_wX0uDoJkZUyINn8Db4K4CAnAw/viewform?embedded=true" width="640">Loading...</iframe></h2>\n	2018-12-12 23:22:02.390392+02
284	979119d0f06d6cafbed8a1eab97a09a6cbe40c36	<h2>Work Request Form</h2>\n\n<p>&lt;iframe src=&quot;https://docs.google.com/forms/d/e/1FAIpQLSeWXtHh-MBc5FvG0WD3-1UF510ZwiKkpP1Lffw-KRGr9uaVRg/viewform?embedded=true&quot; width=&quot;640&quot; height=&quot;1000&quot; frameborder=&quot;0&quot; marginheight=&quot;0&quot; marginwidth=&quot;0&quot;&gt;Loading...&lt;/iframe&gt;</p>\n\n<p>&nbsp;</p>\n	2018-12-12 23:23:18.109974+02
285	979119d0f06d6cafbed8a1eab97a09a6cbe40c36	<h2>Work Request Form</h2>\n\n<p><iframe frameborder="0" height="1000" marginheight="0" marginwidth="0" src="https://docs.google.com/forms/d/e/1FAIpQLSeWXtHh-MBc5FvG0WD3-1UF510ZwiKkpP1Lffw-KRGr9uaVRg/viewform?embedded=true" width="640">Loading...</iframe></p>\n\n<p>&nbsp;</p>\n	2018-12-12 23:23:45.709083+02
286	3f2bd2252231eb668cf2d03757c55e9fcd442b2a	<h2>Architectural Review Form</h2>\n\n<p>We cannot embed this form in our website yet (because it calls for files to be uploaded with the form), so click the&nbsp; link below to be taken to the Architectural Review Form.</p>\n\n<p class="btn info"><a href="https://goo.gl/forms/BTNU7YYrgBMa5lY03">Architectural Review Form</a></p>\n	2018-12-12 23:26:14.645537+02
287	7e939e830ef3650173358d252fbc36ab1af44be0	<h2>Pick Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood&#39;s website.</p>\n\n<p>&nbsp;</p>\n	2018-12-12 23:28:53.517288+02
289	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">Find out more</a></p>\n	2018-12-12 23:35:01.371834+02
290	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="http://homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n	2018-12-12 23:46:58.050761+02
291	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please send us an email at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="http://realclearneighborhoods.com/neighborhoods">Find Your&nbsp;</a><a href="realclearneighborhoods.com/neighborhoods">Neighborhood</a></p>\n	2018-12-12 23:47:36.577173+02
292	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please send us an email at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="http://realclearneighborhoods.com/neighborhoods">Find Your&nbsp;</a><a href="realclearneighborhoods.com/homeowners-neighborhoods">Neighborhood</a></p>\n	2018-12-12 23:48:48.164302+02
293	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n	2018-12-12 23:49:21.313002+02
294	d89c9dfc8423dacf9ac24caacc559692aa664213	<h1>Townhomes at the Arbors</h1>\n	2018-12-12 23:49:39.653421+02
295	f3b3117eb90ffce754414ef3de0470e3c99df6b2	<h1>Townhomes at the Arbors Website</h1>\n\n<p><strong>Townhomes at the Arbors Overview</strong><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n	2018-12-12 23:51:18.097632+02
296	f3b3117eb90ffce754414ef3de0470e3c99df6b2	<h1>Townhomes at the Arbors Website</h1>\n\n<p><strong>Townhomes at the Arbors Overview</strong></p>\n\n<p><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n	2018-12-12 23:51:24.699059+02
297	f3b3117eb90ffce754414ef3de0470e3c99df6b2	<h1>Townhomes at the Arbors Website</h1>\n\n<p>&nbsp;</p>\n\n<p><strong>Townhomes at the Arbors Overview</strong><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n	2018-12-12 23:51:30.322862+02
298	9916f93793c484e2a1b9839546a8839253de193a	<h2>Documents</h2>\n\n<p>Below you will find&nbsp;Governing Documents, Meeting Minutes, Guidelines, and many other important documents from the&nbsp;Townhomes at the Arbors.</p>\n\n<p>The full functionality of this page will be live soon, but for now the links below will take you to our Real Clear Neighborhoods cloud storage where your documents are temporarily stored.</p>\n\n<p>To go to Real Clear Neighborhoods Online File Storage for the Townhomes at the Arbors, please follow this link: <a href="https://drive.google.com/open?id=1hBja_o2FD9kxpA0pLYPlx13jR0DcoZng">Townhomes at the Arbors Documents</a></p>\n	2018-12-13 00:03:10.381074+02
299	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please send us an email at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="http://realclearneighborhoods.com/neighborhoods">Find Your&nbsp;</a><a href="homeowners-neighborhoods">Neighborhood</a></p>\n	2018-12-13 00:08:42.519032+02
300	957da7cfd8d65d0a79433fb0bd985d50eb9aa386	<h2>Find Your Neighborhood</h2>\n\n<p>Choose your neighborhood from the list below to be taken to your neighborhood website.&nbsp;</p>\n\n<p>If you do not see your neighbhorhood listed, please send us an email at&nbsp;<a href="mailto:info@realclearneighborhoods.com?subject=Neighborhood%20Not%20Listed%20on%20Website">info@realclearneighborhoods.com</a>&nbsp;and we will get it added as soon as possible.</p>\n\n<p class="btn info"><a href="/homeowners-neighborhoods">Neighborhoods</a></p>\n	2018-12-13 00:09:51.109461+02
307	f3b3117eb90ffce754414ef3de0470e3c99df6b2	<h1>Townhomes at the Arbors Website</h1>\n\n<p>&nbsp;</p>\n\n<p><strong>Townhomes at the Arbors Overview</strong><br />\nTownhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n	2018-12-19 19:13:57.766689+02
301	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Neighborhoods Managed by&nbsp;Real Clear Neighborhoods</h2>\n\n<p>&nbsp;</p>\n\n<h2>&nbsp;</h2>\n\n<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n	2018-12-19 18:59:08.759796+02
302	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Neighborhoods Managed by&nbsp;Real Clear Neighborhoods</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\nThe Townhomes at the Arbors<br />\nWoodhaven</p>\n\n<h2>&nbsp;</h2>\n\n<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n	2018-12-19 19:02:01.773652+02
303	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n\n<h2>Neighborhoods Managed by&nbsp;Real Clear Neighborhoods</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\nThe Townhomes at the Arbors<br />\nWoodhaven</p>\n	2018-12-19 19:05:35.315989+02
304	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n\n<h2>Real Clear Neighborhoods&nbsp;Managed Neighborhoods&nbsp;</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\nThe Townhomes at the Arbors<br />\nWoodhaven</p>\n	2018-12-19 19:06:18.326474+02
305	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n\n<h2>Neighborhoods We Manage</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\nThe Townhomes at the Arbors<br />\nWoodhaven</p>\n	2018-12-19 19:06:42.388297+02
306	3e2d7392745477729497d439a7e00dac01f51c73	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n\n<h2>Neighborhoods We Manage</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\n<a href="/homeowners-townhomes-arbors">The Townhomes at the Arbors</a><br />\nWoodhaven</p>\n	2018-12-19 19:07:21.425906+02
308	358423d5f33c37988ccea5a450a844cb2fff940b	<h1>Report Violation</h1>\n	2018-12-22 02:50:14.931041+02
309	358423d5f33c37988ccea5a450a844cb2fff940b	<p>Maintance Request</p>\n	2018-12-22 03:07:19.940161+02
310	358423d5f33c37988ccea5a450a844cb2fff940b	<h1>Create Request</h1>\n	2018-12-22 03:07:49.097019+02
311	fb495d8d6f0e126d249ff3a3ccf4426f56ce033e	<h2>Townhomes at the Arbors</h2>\n\n<p>The Townhomes at the Arbors is an active lifestyle community located in Bentonville, Arkansas. Townhomes at the Arbors brings low-maintenance living to the highly desirable Northern Arkansas region, luring active adult homebuyers from all around the state. With a well-appointed clubhouse, European-inspired attached homes, and a close-knit community atmosphere, Townhomes at the Arbors is a terrific neighborhood in Bentonville, Arkansas.</p>\n\n<p><a href="realclearneighborhoods.com/townhomes-arbors">T</a><a href="/homeowners-townhomes-arbors">ownhomes at the Arbors</a></p>\n\n<p>&nbsp;</p>\n\n<h2>Neighborhoods We Manage</h2>\n\n<p>Arbor Glenn<br />\nBrentwood<br />\nBridgewater<br />\nCentral Park<br />\nClabber Creek Ill<br />\nCopper Creek<br />\nCreek Meadows<br />\nCreekside I &amp; II<br />\nCross Creek<br />\nDiamond Estates<br />\nEastview<br />\nFox Run<br />\nGrand Valley<br />\nJoyce Street Cottages<br />\nLakewood<br />\nLegacy Heights<br />\nLegendary<br />\nLexington<br />\nLiberty Bell<br />\nMaple Estates<br />\nOak Tree<br />\nOtter Creek<br />\nParks at Brighton<br />\nRolling Acres<br />\nSavanna Estates<br />\nSilo Falls<br />\nSloan Estates<br />\nSt Valery Downs<br />\nSunbridge Villas<br />\n<a href="/homeowners-townhomes-arbors">The Townhomes at the Arbors</a><br />\nWoodhaven</p>\n\n<p class="btn info">&nbsp;</p>\n	2018-12-22 14:46:18.020289+02
\.


--
-- Data for Name: home_content_benefitgroup; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.home_content_benefitgroup (id, label, image, is_published, "order") FROM stdin;
2	Developers	/media/uploads/developer-placeholder-image.jpg	t	2
1	Homeowners	/media/uploads/homeowners.jpg	t	1
3	Local Business	/media/uploads/local-business.jpg	t	3
\.


--
-- Data for Name: home_content_billboard; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.home_content_billboard (id, label, image, header, sub_header, link, is_published, publish_date, expire_date, "order") FROM stdin;
11	Real-Clear-Neighborhoods-green-valley-neighborhood-banner-image-1436x400	/media/uploads/home-banner-3.jpg	Welcome to Your New Neighborhood		\N	t	2015-07-22	\N	1
10	banner-rcn-network	/media/uploads/home-banner-2.jpg	Welcome to Your New Neighborhood		\N	t	2015-07-20	\N	2
13	rcp-green-neighborhood-banner-main-landing	/media/uploads/home-banner.jpg	Welcome to Your New Neighborhood		\N	t	2015-07-29	\N	3
\.


--
-- Data for Name: home_content_homesection; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.home_content_homesection (id, label, template, image_background, background_size, slide_position, is_published, "order") FROM stdin;
1	Billboards	billboard	/media/uploads/rcn-neighborhood-street-blur-background.jpg	n	l	t	1
4	Collective Intelligence	slide		n	r	t	4
3	Built For Homeowners	slide		n	l	t	3
2	Mini Billboards	mini_billboard		c	l	t	2
5	The RCN Difference	2_col		n	r	t	5
6	Who We Benefit The Most	benefit_group		c	r	t	6
\.


--
-- Data for Name: home_content_minibillboard; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.home_content_minibillboard (id, label, image, link, is_published, publish_date, expire_date, "order") FROM stdin;
3	Community Resources	/media/uploads/mini_billboards/computer-icon.png	/solutions-community-resources	f	2015-01-29	\N	4
1	Report Violation	/media/uploads/mini_billboards/clipboard-icon.png	/homeowners-report-violation/	t	2015-01-29	\N	1
2	Work Request	/media/uploads/mini_billboards/document-icon.png	/homeowners-maintenance-request/	t	2015-01-29	\N	2
4	ARC Review	/media/uploads/financial-icon.png	/homeowners-architectural-review/	t	2015-03-16	\N	3
\.


--
-- Data for Name: home_content_sectionslideshowimage; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.home_content_sectionslideshowimage (id, parent_id, label, image, "order") FROM stdin;
7	4	ipad at angle	/media/uploads/slide_shows/residents/people-circle-house-2_medium.png	1
6	3	circle and house made of people Real Clear Neighborhoods	/media/uploads/ipad-2-(white).png	1
\.


--
-- Data for Name: navigation_primarynavigation; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.navigation_primarynavigation (id, title, link_type, page_id, link, is_published, "order") FROM stdin;
1	About Us	page	3		t	1
4	News	page	6		t	4
5	Contact	page	5		t	5
2	What We Do	page	10		t	2
3	Homeowners	page	13		t	3
\.


--
-- Data for Name: navigation_subprimarynavigation; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.navigation_subprimarynavigation (id, parent_id, title, page_id, link, is_published, "order") FROM stdin;
4	2	Association Management	7		t	1
6	2	Community Resources	8		t	2
3	2	Document Management	2		t	3
5	2	Financial Management	9		t	4
13	3	Neighborhoods	28		t	1
7	3	Report a Violation	\N	/homeowners-report-violation/	t	2
8	3	Work Request	\N	/homeowners-maintenance-request/	t	3
9	3	Architectural Review	\N	/homeowners-architectural-review/	t	4
14	3	New Owner Request	\N	/homeowners-new-owner/	t	5
\.


--
-- Data for Name: news_article; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.news_article (id, label, author, meta_title, meta_description, meta_tags, slug, image, teaser, content, publish_date, is_published) FROM stdin;
4	Conflicting Interests	Ryan Hodson				nunc-eu-ullamcorper-orci-quisque-eget	/media/uploads/conflict-blog-article-real-clear-neighborhoods-333x250.jpg	When people are elected to positions of power, there is always the possibility that, knowingly or unknowingly, aconflict of interest will develop. Conflicts of interest come in severalshapes and forms. It is almost impossible to avoid them but how they are handled is critical. For example,when it comes time for painting or roofing and your association has limited funds, whose buildings get done fi	<p>When people are elected to positions of power, there is always the possibility that, knowingly or unknowingly, aconflict of interest will develop. Conflicts of interest come in severalshapes and forms. It is almost impossible to avoid them but how they are handled is critical. For example,when it comes time for painting or roofing and your association has limited funds, whose buildings get done first?</p>\r\n<p>If the board president decides to painther own unit first, there is an obviousconflict. Rather than be exposed to wellearned criticism, why not ask a thirdparty consultant to make the call inwriting and share it with the owners?This technique can be used in manysituations where limited resources causesome owners to benefit over others.Avoid the perception of selfdealing...get someone else to make thecall.</p>\r\n<p>Another technique for avoiding conflictof interest is for a director to abstainfrom voting when the outcome isself-benefitting. And make sure thesecretary records in the meetingminutes that (fill in name) abstaineddue to a conflict of interest". That way,the written record will show no intent tosway the vote.</p>\r\n<p>Disclosure is another way of avoidingconflict of interest. The idea behinddisclosure is that any possible conflictis brought to the attention of the board.If the board has no problem with it, it&rsquo;sokay. But beware. Technically, if youadvise the board that your brother inlaw, the HOA&rsquo;s landscape contractor, isgiving you massive kick backs toinfluence the contract, you&rsquo;ve provideddisclosure. If the rest of the board wantsin on the action and makes it known,they&rsquo;ve also provided disclosure. Nofoul, right? Hardly. The board fiddleswhile the owners do a slow burn.Disclosure can smooth over minorconflicts of interest but if there aresignificant implications, the disclosureshould be made to owners with writtendocumentation for the record. And thismay raise more questions than answers.Many conflicts of interest are bestavoided altogether.</p>\r\n<p>One of the best ways for the board toavoid self dealing is to deal openly.&nbsp;Board meetings should be open to allowners and minutes should be complete&nbsp;newsletters should advise of upcoming events. If the board knows someone is looking over its shoulders, it&rsquo;s less likely to engage in self serving activity.</p>\r\n<p>Many homeowner association developers exhibit shortsighted interest in their developments. Their primary goal seems to be to make a profit and get out as fast as possible. No training or long range budget or maintenance planning is provided for the new homeowner board. Assessments are often set artificially low to make sales prices more attractive. This strategy starves the HOA of funds it desperately needs to properly take care of the assets. All this can and often does can come back to haunt the developer because of disgruntled buyers.</p>\r\n<p>Developers should seek out experts to assist them shape the new homeowner association. Specialist attorneys can write user friendly governing documents and management consultants formulate good budget and maintenance plans. This makes the whole process "arm&rsquo;s length" and more credible to owners. In a word, the developer should offer every possible resource to help ensure board success. With this approach, the chance for success are greatly enhanced, the owners are happier and less likely to blame (read "sue") the developer for shortcomings.</p>\r\n<p>We&rsquo;re all capable of feathering our own nest even when we don&rsquo;t think we&rsquo;re doing it. The best policy is to avoid any perception of wrong doing. Step "outside the box" and ask yourself if what you&rsquo;re doing could be misconstrued by outsiders. Trust is a fragile thing. Take precautions to avoid conflicting interests that can deharmonize your HOA.</p>	2015-02-18	t
2	What is a Homeowner Association?	Ryan Hodson				lorem-ipsum-title-article-2	/media/uploads/hoa-definition-article-real-clear-neighborhoods-blue-house.jpg	An HOA is comprised of two or more homeowners that belong to a mandatory membership organization for the maintenance of commonly owned real estate and improvements.	<p><strong>What is a Homeowner Association?</strong></p>\r\n<p>The terms "homeowner association" and "HOA" are used in a generic sense although some states use the terms for specific forms of housing. As here, an HOA is comprised of two or more homeowners that belong to a mandatory membership organization for the maintenance of commonly owned real estate and improvements. Size-wise, it can range from a simple duplex up to a huge development with thousands of detached homes, condominiums and townhouses that maintain marinas, golf courses and other extensive recreational facilities.</p>\r\n<p>A "neighborhood association" is a voluntary membership organization that deals with social, political, zoning, crime and does not maintain commonly owned property. Some neighborhood associations, unfortunately, call themselves "homeowner associations" which is confusing the issue. (So stop doing that...we're confused enough already).</p>\r\n<p>Sometimes the HOA legal framework varies even though the association's responsibilities remain essentially the same. For example, property ownership rights are different in a co-op, a condominium and a townhouse. (See our Glossary for definitions.) But in each case, maintenance responsibilities can be very similar. Terminology for these organizations varies not only according to legal structure but also by state and country.&nbsp;</p>\r\n<p>The functions of HOAs vary according to type, location and custom.&nbsp;</p>\r\n<p>&nbsp;</p>	2015-02-06	t
\.


--
-- Data for Name: news_article_tags; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.news_article_tags (id, article_id, tag_id) FROM stdin;
26	4	1
27	2	2
\.


--
-- Data for Name: news_tag; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.news_tag (id, label, meta_title, meta_description, meta_tags, slug, "order", is_published) FROM stdin;
4	DIY				diy	4	t
1	Community	Tips			tips	2	t
2	News				advice	1	t
3	Home Improvement				cool-stuff	5	t
9	Kids				kids	3	t
\.


--
-- Data for Name: page_content_faq; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.page_content_faq (id, label, question, answer, "order", is_published) FROM stdin;
2	Why We Do It?	Why Do We Do It?	We love seeing the looks on people's faces when they realize the value of our hard work. Everyone has a way to make a difference, and as idealistic and corny as it sounds, we feel like we are making a difference in people's lives. RCN is a tool for the communities that allows them to make informed decisions. Those decisions include the positioning of use for common areas, the overall neighborhood 	2	t
3	Our Philosophy?	What is RCN's Philosophy?	We made a decision early on to develop our systems and procedures with our homeowners, not before we had them. It was a painstakingly long process, but we feel that was the only way to ensure we all have the best product and service possible, or available, anywhere. Each RCN platform is a custom set of solutions meant to handle all of the needs of the Property Owners Association, its residents and	3	t
1	What We Do	What Does RCN Do?	Real Clear Neighborhoods has a single-minded purpose that permeates everything we stand for, and everything we do. That purpose is to increase the quality of life of each homeowner in every association we manage. We have developed platforms that choreograph the dynamic interactions between the community and the people that reside in it. We are big believers in collaborative working and thinking, b	1	t
\.


--
-- Data for Name: page_content_footer; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.page_content_footer (id, site_id, label) FROM stdin;
3	1	Social Media
\.


--
-- Data for Name: page_content_footersociallink; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.page_content_footersociallink (id, parent_id, label, image, link, "order") FROM stdin;
8	3	facebook	/media/uploads/facebook-64px.png	https://www.facebook.com/RCNeighborhoods	1
9	3	twitter	/media/uploads/twitter-64px.png	https://twitter.com/RCNeighborhoods	2
10	3	linkedin	/media/uploads/linkedin-64px.png.png	https://www.linkedin.com/company/real-clear-neighborhoods	3
\.


--
-- Data for Name: page_content_logo; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.page_content_logo (id, site_id, label, image) FROM stdin;
5	1	RCN Corporate Logo	/media/uploads/logo.png
\.


--
-- Data for Name: page_content_pagesection; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.page_content_pagesection (id, page_id, label, image, display_order, is_published) FROM stdin;
7	10	Association Management	/media/uploads/mini_billboards/clipboard-icon.png	1	t
9	10	Financial Management	/media/uploads/financial-icon.png	1	t
8	10	Document Management	/media/uploads/mini_billboards/document-icon.png	3	t
10	10	Community Resources	/media/uploads/mini_billboards/community_resources.png	4	t
11	13	Find Your Neighborhood	/media/uploads/mini_billboards/map-icon-neighborhoods-rcn.png	1	t
13	13	Report a Violation	/media/uploads/rcn-task-list-icon.png	2	t
14	13	Work Request	/media/uploads/clipboard-icon.png	3	t
15	13	Architectural Review	/media/uploads/arc-review-icon.png	4	t
18	28	The Townhomes at the Arbors	/media/uploads/arbors-entry.jpg	1	t
\.


--
-- Data for Name: page_content_webpage; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.page_content_webpage (id, template_choice, template_addon, label, slug, meta_title, meta_description, meta_tags, image_cover, is_published, create_date, modified_date) FROM stdin;
5	2_col_contact	proposal	Contact Us	contact-us				/media/uploads/neighborhood-network-header.jpg	t	2015-02-04 21:52:35.04+02	2016-09-01 19:22:03.393538+03
9	1_col	none	What We Do: Financial Management	what-we-do-financial-management	Financial Management			/media/uploads/website-banner.jpg	t	2015-02-17 18:42:03.576052+02	2016-05-19 23:38:42.386964+03
2	1_col	none	What We Do: Document Management	what-we-do-document-management	Document Management			/media/uploads/website-banner.jpg	t	2015-02-03 00:35:05.715+02	2016-05-19 23:44:21.938279+03
7	1_col	none	What We Do: Association Management	what-we-do-association-management	Association Management			/media/uploads/website-banner.jpg	t	2015-02-17 18:41:05.754639+02	2016-05-19 23:44:53.211619+03
4	1_col_contact	faq	About Us - FAQs	about-us-faqs				/media/uploads/rcn-neighborhood-street-blur-background.jpg	t	2015-02-04 21:15:12.024+02	2015-04-26 03:54:17.966798+03
3	2_col	staff	About Us	about-us				/media/uploads/website-banner.jpg	t	2015-02-03 19:21:39.488+02	2015-05-23 07:01:02.533797+03
10	landing	none	What We Do	what-we-do				/media/uploads/website-banner.jpg	t	2015-02-18 19:15:29.671584+02	2015-06-08 21:28:24.908704+03
1	2_col	faq	Solutions 	solutions-info-page				/media/uploads/website-banner.jpg	f	2015-02-02 21:36:53.548+02	2018-12-12 23:15:52.468042+02
6	news	none	News	all-articles				/media/uploads/website-banner.jpg	t	2015-02-06 19:05:54.765+02	2018-12-12 23:16:04.832114+02
27	2_col	none	Homeowners: Townhomes at the Arbors	homeowners-townhomes-arbors	Townhomes at the Arbors			/media/uploads/website-banner.jpg	t	2018-12-12 23:46:20.421263+02	2018-12-12 23:50:24.108512+02
13	landing	none	Homeowners	homeowners	homeowners			/media/uploads/website-banner.jpg	t	2018-12-12 17:32:04.408184+02	2018-12-13 00:07:30.903203+02
8	1_col	none	What We Do: Landscape Maintenance	what-we-do-landscape-maintenance	Landscape Maintenance			/media/uploads/website-banner.jpg	t	2015-02-17 18:41:39.400102+02	2018-12-12 23:14:29.842579+02
28	landing	none	Homeowners: Neighborhoods	homeowners-neighborhoods	Neighborhoods			/media/uploads/website-banner.jpg	t	2018-12-22 14:45:14.181748+02	2018-12-22 14:45:14.181774+02
\.


--
-- Data for Name: questions_community; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.questions_community (id, name) FROM stdin;
1	Boa
\.


--
-- Data for Name: questions_question; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.questions_question (id, type, info, name, address, phone, email, created_at, is_resolved, assigned_admin_id, neighborhood_id) FROM stdin;
2	review	Test	Test	Test	1234567890	1@hotmail.com	2018-12-22 14:30:48.490865+02	f	\N	1
1	violation	sdf	fdsfs	dfsdfs	324234234234	dfD@fds.sdfs	2018-12-22 03:10:17.604155+02	t	13	1
3	violation	Test	Test	Test	1234567890	Test@hotmail.com	2018-12-22 14:54:45.137128+02	f	\N	1
\.


--
-- Data for Name: questions_question_questions; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.questions_question_questions (id, question_id, questionpart_id) FROM stdin;
1	1	1
2	2	2
3	2	3
4	3	4
5	3	5
\.


--
-- Data for Name: questions_questionpart; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.questions_questionpart (id, question, answer) FROM stdin;
1	Please Include as much detail of the issue as possible. The more complete picture we have of the matter you are bringing to our attention, the more effective we will be in addressing and resolving it. Thanks for your time.	fdsfd
2	If you have additional information you'd like to submit, please include below.	Test
3	If you are planning to install solar panels, please provide as much information as possible so your ARC Board can review and respond to your request in a timely manner.	Test
4	What is the address of the house where the vehicle has been abandoned?	Test
5	Please Include as much detail of the issue as possible. The more complete picture we have of the matter you are bringing to our attention, the more effective we will be in addressing and resolving it. Thanks for your time.	Test
\.


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.reversion_revision (id, manager_slug, date_created, user_id, comment) FROM stdin;
\.


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.reversion_version (id, revision_id, object_id, object_id_int, content_type_id, format, serialized_data, object_repr) FROM stdin;
\.


--
-- Data for Name: staff_member; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.staff_member (id, name, "position", slug, meta_title, meta_description, meta_tags, image, teaser, bio, is_published, "order") FROM stdin;
2	Andy	Co-Founder	ryan-hodson-president-ceo-2	Ryan Hodson			/media/uploads/andy.jpg	Andy Hague has been in the real estate industry in Northwest Arkansas for over	<p>Andy Hague has been in the real estate industry in Northwest Arkansas for over 15 years. Andy heads our customer development and relations branch of&nbsp;Real Clear Neighborhoods, and he also oversees two other companies under the RCN umbrella.</p>	t	1
3	Carolina	Operations Manager	carolina-caldera-operations-manager				/media/uploads/carolina.jpg	Carolina Caldera joined the RCN team a couple of months ago, and her talent was	<p>Carolina joined the RCN team a couple of months ago, and her talent was immediately evident. She is the glue that holds the RCN office together, and we couldn't be more thankful to have her as a member of our team.</p>	t	3
1	Ryan	Co-Founder	ryan-hodson-president-ceo	Ryan Hodson	Member description		/media/uploads/hodson-profile-rcn-website.jpg	Ryan Hodson founded his first company in February of 2000, and he immediately...	<p>Ryan Hodson founded his first company in February of 2000, and he immediately fell in love with creating companies that increase the quality of life for everyone those respective companies reach. From founding a premier hunting and fly-fishing outfitter straight out of college, to founding a chain of restaurants, to now operating the technical and operatations for&nbsp;Real Clear Neighborhoods, he loves the act (and art) of creation.&nbsp;</p>	t	2
\.


--
-- Data for Name: staff_membersociallink; Type: TABLE DATA; Schema: public; Owner: real_clear
--

COPY public.staff_membersociallink (id, parent_id, label, image, link, "order") FROM stdin;
4	2	Facebook	/media/uploads/social_icons/facebook.png	http://www.facebook.com/	1
5	2	Twitter	/media/uploads/social_icons/twitter.png	http://www.twitter.com/	2
1	1	Facebook	/media/uploads/social_icons/facebook.png	http://www.facebook.com/	1
2	1	Twitter	/media/uploads/social_icons/twitter.png	http://www.twitter.com/	2
3	1	LinkedIn	/media/uploads/social_icons/linkedin.png	http://www.linkedin.com/	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 45, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 111, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 13, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 547, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 37, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 6, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.django_site_id_seq', 30, true);


--
-- Name: forms_associationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_associationtype_id_seq', 4, true);


--
-- Name: forms_collectionprocess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_collectionprocess_id_seq', 3, true);


--
-- Name: forms_commonproperty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_commonproperty_id_seq', 6, true);


--
-- Name: forms_contactlead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_contactlead_id_seq', 141, true);


--
-- Name: forms_meetingfrequency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_meetingfrequency_id_seq', 3, true);


--
-- Name: forms_proposalrequest_association_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_proposalrequest_association_types_id_seq', 16, true);


--
-- Name: forms_proposalrequest_common_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_proposalrequest_common_properties_id_seq', 14, true);


--
-- Name: forms_proposalrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.forms_proposalrequest_id_seq', 14, true);


--
-- Name: front_placeholderhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.front_placeholderhistory_id_seq', 311, true);


--
-- Name: home_content_benefitgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.home_content_benefitgroup_id_seq', 3, true);


--
-- Name: home_content_billboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.home_content_billboard_id_seq', 13, true);


--
-- Name: home_content_homesection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.home_content_homesection_id_seq', 6, true);


--
-- Name: home_content_minibillboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.home_content_minibillboard_id_seq', 4, true);


--
-- Name: home_content_sectionslideshowimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.home_content_sectionslideshowimage_id_seq', 7, true);


--
-- Name: navigation_primarynavigation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.navigation_primarynavigation_id_seq', 5, true);


--
-- Name: navigation_subprimarynavigation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.navigation_subprimarynavigation_id_seq', 14, true);


--
-- Name: news_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.news_article_id_seq', 4, true);


--
-- Name: news_article_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.news_article_tags_id_seq', 27, true);


--
-- Name: news_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.news_tag_id_seq', 9, true);


--
-- Name: page_content_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.page_content_faq_id_seq', 3, true);


--
-- Name: page_content_footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.page_content_footer_id_seq', 3, true);


--
-- Name: page_content_footersociallink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.page_content_footersociallink_id_seq', 10, true);


--
-- Name: page_content_logo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.page_content_logo_id_seq', 5, true);


--
-- Name: page_content_pagesection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.page_content_pagesection_id_seq', 18, true);


--
-- Name: page_content_webpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.page_content_webpage_id_seq', 28, true);


--
-- Name: questions_community_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.questions_community_id_seq', 1, true);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 3, true);


--
-- Name: questions_question_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.questions_question_questions_id_seq', 5, true);


--
-- Name: questions_questionpart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.questions_questionpart_id_seq', 5, true);


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.reversion_revision_id_seq', 1, false);


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.reversion_version_id_seq', 1, false);


--
-- Name: staff_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.staff_member_id_seq', 3, true);


--
-- Name: staff_membersociallink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: real_clear
--

SELECT pg_catalog.setval('public.staff_membersociallink_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: forms_associationtype forms_associationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_associationtype
    ADD CONSTRAINT forms_associationtype_pkey PRIMARY KEY (id);


--
-- Name: forms_collectionprocess forms_collectionprocess_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_collectionprocess
    ADD CONSTRAINT forms_collectionprocess_pkey PRIMARY KEY (id);


--
-- Name: forms_commonproperty forms_commonproperty_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_commonproperty
    ADD CONSTRAINT forms_commonproperty_pkey PRIMARY KEY (id);


--
-- Name: forms_contactlead forms_contactlead_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_contactlead
    ADD CONSTRAINT forms_contactlead_pkey PRIMARY KEY (id);


--
-- Name: forms_meetingfrequency forms_meetingfrequency_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_meetingfrequency
    ADD CONSTRAINT forms_meetingfrequency_pkey PRIMARY KEY (id);


--
-- Name: forms_proposalrequest_association_types forms_proposalrequest_associa_proposalrequest_id_associatio_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_association_types
    ADD CONSTRAINT forms_proposalrequest_associa_proposalrequest_id_associatio_key UNIQUE (proposalrequest_id, associationtype_id);


--
-- Name: forms_proposalrequest_association_types forms_proposalrequest_association_types_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_association_types
    ADD CONSTRAINT forms_proposalrequest_association_types_pkey PRIMARY KEY (id);


--
-- Name: forms_proposalrequest_common_properties forms_proposalrequest_common__proposalrequest_id_commonprop_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_common_properties
    ADD CONSTRAINT forms_proposalrequest_common__proposalrequest_id_commonprop_key UNIQUE (proposalrequest_id, commonproperty_id);


--
-- Name: forms_proposalrequest_common_properties forms_proposalrequest_common_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_common_properties
    ADD CONSTRAINT forms_proposalrequest_common_properties_pkey PRIMARY KEY (id);


--
-- Name: forms_proposalrequest forms_proposalrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest
    ADD CONSTRAINT forms_proposalrequest_pkey PRIMARY KEY (id);


--
-- Name: front_placeholder front_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.front_placeholder
    ADD CONSTRAINT front_placeholder_pkey PRIMARY KEY (key);


--
-- Name: front_placeholderhistory front_placeholderhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.front_placeholderhistory
    ADD CONSTRAINT front_placeholderhistory_pkey PRIMARY KEY (id);


--
-- Name: home_content_benefitgroup home_content_benefitgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_benefitgroup
    ADD CONSTRAINT home_content_benefitgroup_pkey PRIMARY KEY (id);


--
-- Name: home_content_billboard home_content_billboard_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_billboard
    ADD CONSTRAINT home_content_billboard_pkey PRIMARY KEY (id);


--
-- Name: home_content_homesection home_content_homesection_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_homesection
    ADD CONSTRAINT home_content_homesection_pkey PRIMARY KEY (id);


--
-- Name: home_content_minibillboard home_content_minibillboard_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_minibillboard
    ADD CONSTRAINT home_content_minibillboard_pkey PRIMARY KEY (id);


--
-- Name: home_content_sectionslideshowimage home_content_sectionslideshowimage_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_sectionslideshowimage
    ADD CONSTRAINT home_content_sectionslideshowimage_pkey PRIMARY KEY (id);


--
-- Name: navigation_primarynavigation navigation_primarynavigation_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.navigation_primarynavigation
    ADD CONSTRAINT navigation_primarynavigation_pkey PRIMARY KEY (id);


--
-- Name: navigation_subprimarynavigation navigation_subprimarynavigation_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.navigation_subprimarynavigation
    ADD CONSTRAINT navigation_subprimarynavigation_pkey PRIMARY KEY (id);


--
-- Name: news_article news_article_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article
    ADD CONSTRAINT news_article_pkey PRIMARY KEY (id);


--
-- Name: news_article news_article_slug_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article
    ADD CONSTRAINT news_article_slug_key UNIQUE (slug);


--
-- Name: news_article_tags news_article_tags_article_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article_tags
    ADD CONSTRAINT news_article_tags_article_id_tag_id_key UNIQUE (article_id, tag_id);


--
-- Name: news_article_tags news_article_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article_tags
    ADD CONSTRAINT news_article_tags_pkey PRIMARY KEY (id);


--
-- Name: news_tag news_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_tag
    ADD CONSTRAINT news_tag_pkey PRIMARY KEY (id);


--
-- Name: news_tag news_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_tag
    ADD CONSTRAINT news_tag_slug_key UNIQUE (slug);


--
-- Name: page_content_faq page_content_faq_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_faq
    ADD CONSTRAINT page_content_faq_pkey PRIMARY KEY (id);


--
-- Name: page_content_footer page_content_footer_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_footer
    ADD CONSTRAINT page_content_footer_pkey PRIMARY KEY (id);


--
-- Name: page_content_footer page_content_footer_site_id_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_footer
    ADD CONSTRAINT page_content_footer_site_id_key UNIQUE (site_id);


--
-- Name: page_content_footersociallink page_content_footersociallink_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_footersociallink
    ADD CONSTRAINT page_content_footersociallink_pkey PRIMARY KEY (id);


--
-- Name: page_content_logo page_content_logo_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_logo
    ADD CONSTRAINT page_content_logo_pkey PRIMARY KEY (id);


--
-- Name: page_content_logo page_content_logo_site_id_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_logo
    ADD CONSTRAINT page_content_logo_site_id_key UNIQUE (site_id);


--
-- Name: page_content_pagesection page_content_pagesection_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_pagesection
    ADD CONSTRAINT page_content_pagesection_pkey PRIMARY KEY (id);


--
-- Name: page_content_webpage page_content_webpage_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_webpage
    ADD CONSTRAINT page_content_webpage_pkey PRIMARY KEY (id);


--
-- Name: page_content_webpage page_content_webpage_slug_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_webpage
    ADD CONSTRAINT page_content_webpage_slug_key UNIQUE (slug);


--
-- Name: questions_community questions_community_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_community
    ADD CONSTRAINT questions_community_pkey PRIMARY KEY (id);


--
-- Name: questions_question questions_question_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_question_pkey PRIMARY KEY (id);


--
-- Name: questions_question_questions questions_question_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question_questions
    ADD CONSTRAINT questions_question_questions_pkey PRIMARY KEY (id);


--
-- Name: questions_question_questions questions_question_questions_question_id_questionpart_id_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question_questions
    ADD CONSTRAINT questions_question_questions_question_id_questionpart_id_key UNIQUE (question_id, questionpart_id);


--
-- Name: questions_questionpart questions_questionpart_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_questionpart
    ADD CONSTRAINT questions_questionpart_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: staff_member staff_member_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.staff_member
    ADD CONSTRAINT staff_member_pkey PRIMARY KEY (id);


--
-- Name: staff_member staff_member_slug_key; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.staff_member
    ADD CONSTRAINT staff_member_slug_key UNIQUE (slug);


--
-- Name: staff_membersociallink staff_membersociallink_pkey; Type: CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.staff_membersociallink
    ADD CONSTRAINT staff_membersociallink_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_group_permissions_0e939a4f ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_group_permissions_8373b171 ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_permission_417f1b1c ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_user_groups_0e939a4f ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_user_groups_e8701ad4 ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_user_user_permissions_8373b171 ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX django_admin_log_417f1b1c ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX django_admin_log_e8701ad4 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: forms_proposalrequest_association_types_associationtype_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX forms_proposalrequest_association_types_associationtype_id ON public.forms_proposalrequest_association_types USING btree (associationtype_id);


--
-- Name: forms_proposalrequest_association_types_proposalrequest_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX forms_proposalrequest_association_types_proposalrequest_id ON public.forms_proposalrequest_association_types USING btree (proposalrequest_id);


--
-- Name: forms_proposalrequest_common_properties_commonproperty_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX forms_proposalrequest_common_properties_commonproperty_id ON public.forms_proposalrequest_common_properties USING btree (commonproperty_id);


--
-- Name: forms_proposalrequest_common_properties_proposalrequest_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX forms_proposalrequest_common_properties_proposalrequest_id ON public.forms_proposalrequest_common_properties USING btree (proposalrequest_id);


--
-- Name: front_placeholder_key_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX front_placeholder_key_like ON public.front_placeholder USING btree (key varchar_pattern_ops);


--
-- Name: front_placeholderhistory_placeholder_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX front_placeholderhistory_placeholder_id ON public.front_placeholderhistory USING btree (placeholder_id);


--
-- Name: front_placeholderhistory_placeholder_id_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX front_placeholderhistory_placeholder_id_like ON public.front_placeholderhistory USING btree (placeholder_id varchar_pattern_ops);


--
-- Name: home_content_billboard_publish_date; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX home_content_billboard_publish_date ON public.home_content_billboard USING btree (publish_date);


--
-- Name: home_content_minibillboard_publish_date; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX home_content_minibillboard_publish_date ON public.home_content_minibillboard USING btree (publish_date);


--
-- Name: home_content_sectionslideshowimage_parent_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX home_content_sectionslideshowimage_parent_id ON public.home_content_sectionslideshowimage USING btree (parent_id);


--
-- Name: navigation_primarynavigation_page_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX navigation_primarynavigation_page_id ON public.navigation_primarynavigation USING btree (page_id);


--
-- Name: navigation_subprimarynavigation_page_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX navigation_subprimarynavigation_page_id ON public.navigation_subprimarynavigation USING btree (page_id);


--
-- Name: navigation_subprimarynavigation_parent_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX navigation_subprimarynavigation_parent_id ON public.navigation_subprimarynavigation USING btree (parent_id);


--
-- Name: news_article_publish_date; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX news_article_publish_date ON public.news_article USING btree (publish_date);


--
-- Name: news_article_slug_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX news_article_slug_like ON public.news_article USING btree (slug varchar_pattern_ops);


--
-- Name: news_article_tags_article_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX news_article_tags_article_id ON public.news_article_tags USING btree (article_id);


--
-- Name: news_article_tags_tag_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX news_article_tags_tag_id ON public.news_article_tags USING btree (tag_id);


--
-- Name: news_tag_slug_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX news_tag_slug_like ON public.news_tag USING btree (slug varchar_pattern_ops);


--
-- Name: page_content_footersociallink_parent_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX page_content_footersociallink_parent_id ON public.page_content_footersociallink USING btree (parent_id);


--
-- Name: page_content_pagesection_page_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX page_content_pagesection_page_id ON public.page_content_pagesection USING btree (page_id);


--
-- Name: page_content_webpage_slug_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX page_content_webpage_slug_like ON public.page_content_webpage USING btree (slug varchar_pattern_ops);


--
-- Name: questions_question_1cb18886; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX questions_question_1cb18886 ON public.questions_question USING btree (neighborhood_id);


--
-- Name: questions_question_83614c7b; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX questions_question_83614c7b ON public.questions_question USING btree (assigned_admin_id);


--
-- Name: questions_question_questions_7aa0f6ee; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX questions_question_questions_7aa0f6ee ON public.questions_question_questions USING btree (question_id);


--
-- Name: questions_question_questions_7f8d2073; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX questions_question_questions_7f8d2073 ON public.questions_question_questions USING btree (questionpart_id);


--
-- Name: reversion_revision_date_created; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX reversion_revision_date_created ON public.reversion_revision USING btree (date_created);


--
-- Name: reversion_revision_manager_slug; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX reversion_revision_manager_slug ON public.reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_manager_slug_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX reversion_revision_manager_slug_like ON public.reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_revision_user_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX reversion_revision_user_id ON public.reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX reversion_version_content_type_id ON public.reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_object_id_int; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX reversion_version_object_id_int ON public.reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_revision_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX reversion_version_revision_id ON public.reversion_version USING btree (revision_id);


--
-- Name: staff_member_slug_like; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX staff_member_slug_like ON public.staff_member USING btree (slug varchar_pattern_ops);


--
-- Name: staff_membersociallink_parent_id; Type: INDEX; Schema: public; Owner: real_clear
--

CREATE INDEX staff_membersociallink_parent_id ON public.staff_membersociallink USING btree (parent_id);


--
-- Name: news_article_tags article_id_refs_id_66e710d8; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article_tags
    ADD CONSTRAINT article_id_refs_id_66e710d8 FOREIGN KEY (article_id) REFERENCES public.news_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_proposalrequest_association_types forms_proposalrequest_association_types_associationtype_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_association_types
    ADD CONSTRAINT forms_proposalrequest_association_types_associationtype_id_fkey FOREIGN KEY (associationtype_id) REFERENCES public.forms_associationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_proposalrequest_common_properties forms_proposalrequest_common_properties_commonproperty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_common_properties
    ADD CONSTRAINT forms_proposalrequest_common_properties_commonproperty_id_fkey FOREIGN KEY (commonproperty_id) REFERENCES public.forms_commonproperty(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: front_placeholderhistory front_placeholderhistory_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.front_placeholderhistory
    ADD CONSTRAINT front_placeholderhistory_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES public.front_placeholder(key) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_content_sectionslideshowimage home_content_sectionslideshowimage_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.home_content_sectionslideshowimage
    ADD CONSTRAINT home_content_sectionslideshowimage_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.home_content_homesection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: navigation_subprimarynavigation navigation_subprimarynavigation_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.navigation_subprimarynavigation
    ADD CONSTRAINT navigation_subprimarynavigation_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.navigation_primarynavigation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: news_article_tags news_article_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.news_article_tags
    ADD CONSTRAINT news_article_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.news_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_content_footersociallink page_content_footersociallink_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_footersociallink
    ADD CONSTRAINT page_content_footersociallink_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.page_content_footer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_content_pagesection page_content_pagesection_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.page_content_pagesection
    ADD CONSTRAINT page_content_pagesection_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.page_content_webpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: navigation_primarynavigation page_id_refs_id_0a162d33; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.navigation_primarynavigation
    ADD CONSTRAINT page_id_refs_id_0a162d33 FOREIGN KEY (page_id) REFERENCES public.page_content_webpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: navigation_subprimarynavigation page_id_refs_id_abeb2365; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.navigation_subprimarynavigation
    ADD CONSTRAINT page_id_refs_id_abeb2365 FOREIGN KEY (page_id) REFERENCES public.page_content_webpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_proposalrequest_common_properties proposalrequest_id_refs_id_5dc02be1; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_common_properties
    ADD CONSTRAINT proposalrequest_id_refs_id_5dc02be1 FOREIGN KEY (proposalrequest_id) REFERENCES public.forms_proposalrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_proposalrequest_association_types proposalrequest_id_refs_id_846563a7; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.forms_proposalrequest_association_types
    ADD CONSTRAINT proposalrequest_id_refs_id_846563a7 FOREIGN KEY (proposalrequest_id) REFERENCES public.forms_proposalrequest(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_questions q_questionpart_id_2f6e48f313363b55_fk_questions_questionpart_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question_questions
    ADD CONSTRAINT q_questionpart_id_2f6e48f313363b55_fk_questions_questionpart_id FOREIGN KEY (questionpart_id) REFERENCES public.questions_questionpart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question ques_neighborhood_id_4f326712c8990366_fk_questions_community_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT ques_neighborhood_id_4f326712c8990366_fk_questions_community_id FOREIGN KEY (neighborhood_id) REFERENCES public.questions_community(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question questions_qu_assigned_admin_id_3d15393a27d2d1f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question
    ADD CONSTRAINT questions_qu_assigned_admin_id_3d15393a27d2d1f4_fk_auth_user_id FOREIGN KEY (assigned_admin_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions_question_questions questions_question_id_43e21897dff4803a_fk_questions_question_id; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.questions_question_questions
    ADD CONSTRAINT questions_question_id_43e21897dff4803a_fk_questions_question_id FOREIGN KEY (question_id) REFERENCES public.questions_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_revision reversion_revision_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.reversion_revision
    ADD CONSTRAINT reversion_revision_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version reversion_version_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reversion_version reversion_version_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.reversion_version
    ADD CONSTRAINT reversion_version_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: staff_membersociallink staff_membersociallink_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: real_clear
--

ALTER TABLE ONLY public.staff_membersociallink
    ADD CONSTRAINT staff_membersociallink_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.staff_member(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

