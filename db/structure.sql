--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: trip_days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trip_days (
    id integer NOT NULL,
    trip_plan_id integer,
    date date,
    planned_start character varying,
    planned_finish character varying,
    daylight character varying,
    moonlight character varying,
    water_availability character varying,
    hammock_trees character varying,
    fishing character varying,
    weather character varying,
    geocaches character varying
);


--
-- Name: trip_days_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trip_days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trip_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trip_days_id_seq OWNED BY trip_days.id;


--
-- Name: trip_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trip_plans (
    id integer NOT NULL,
    user_id integer,
    title character varying NOT NULL,
    planned_route_url character varying,
    who_is_going character varying,
    contacts character varying,
    transportation character varying,
    expected_departure character varying,
    expected_return character varying,
    freak_out_time character varying,
    communications character varying,
    inreach_map character varying,
    local_contact character varying,
    managing_agency character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    alternate_id character varying NOT NULL,
    published boolean DEFAULT false NOT NULL,
    big_picture_planning text,
    start_location character varying,
    finish_location character varying,
    start_location_description character varying,
    finish_location_description character varying
);


--
-- Name: trip_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trip_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trip_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trip_plans_id_seq OWNED BY trip_plans.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
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
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trip_days ALTER COLUMN id SET DEFAULT nextval('trip_days_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trip_plans ALTER COLUMN id SET DEFAULT nextval('trip_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: trip_days_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trip_days
    ADD CONSTRAINT trip_days_pkey PRIMARY KEY (id);


--
-- Name: trip_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trip_plans
    ADD CONSTRAINT trip_plans_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_trip_plans_on_alternate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trip_plans_on_alternate_id ON trip_plans USING btree (alternate_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160325184319');

INSERT INTO schema_migrations (version) VALUES ('20160325190208');

INSERT INTO schema_migrations (version) VALUES ('20160325191726');

INSERT INTO schema_migrations (version) VALUES ('20160325210821');

INSERT INTO schema_migrations (version) VALUES ('20160325215201');

INSERT INTO schema_migrations (version) VALUES ('20160325220207');

INSERT INTO schema_migrations (version) VALUES ('20160326214934');

INSERT INTO schema_migrations (version) VALUES ('20160327001056');

INSERT INTO schema_migrations (version) VALUES ('20160327015423');

