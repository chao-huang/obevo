--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: myschema01; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA myschema01;


SET search_path = myschema01, pg_catalog;


--
-- Name: usertype0; Type: TYPE; Schema: mylargeschema; Owner: -
--

CREATE TYPE myschema01.usertype1 AS ENUM (
    '1',
    '2',
    '3'
);


--
-- Name: sp0(); Type: PROCEDURE; Schema: mylargeschema; Owner: -
--

CREATE PROCEDURE myschema01.sp1()
    LANGUAGE plpgsql
    AS $$ DECLARE val INTEGER; END $$;


--
-- Name: func1(); Type: FUNCTION; Schema: myschema01; Owner: -
--

CREATE FUNCTION myschema01.func1() RETURNS integer
    LANGUAGE plpgsql
    AS '
BEGIN
    -- ensure that func comment remains
    RETURN 1;
END;
';


--
-- Name: func_with_overload(); Type: FUNCTION; Schema: myschema01; Owner: -
--

CREATE FUNCTION myschema01.func_with_overload() RETURNS integer
    LANGUAGE plpgsql
    AS '
BEGIN
    RETURN 1;
END;
';


--
-- Name: func_with_overload(integer); Type: FUNCTION; Schema: myschema01; Owner: -
--

CREATE FUNCTION myschema01.func_with_overload(var1 integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
BEGIN
    RETURN 1;
END;
';


--
-- Name: func_with_overload(integer, character varying); Type: FUNCTION; Schema: myschema01; Owner: -
--

CREATE FUNCTION myschema01.func_with_overload(var1 integer, invalstr character varying) RETURNS integer
    LANGUAGE plpgsql
    AS '
BEGIN
    RETURN 1;
END;
';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: metadata_test_table; Type: TABLE; Schema: myschema01; Owner: -
--

CREATE TABLE myschema01.metadata_test_table (
    afield integer,
    bfield integer
);


--
-- Name: regular_sequence; Type: SEQUENCE; Schema: myschema01; Owner: -
--

CREATE SEQUENCE myschema01.regular_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: table_a; Type: TABLE; Schema: myschema01; Owner: -
--

CREATE TABLE myschema01.table_a (
    a_id integer NOT NULL,
    a2_id integer
);


--
-- Name: table_a_multicol_pk; Type: TABLE; Schema: myschema01; Owner: -
--

CREATE TABLE myschema01.table_a_multicol_pk (
    a1_id integer NOT NULL,
    a2_id integer NOT NULL,
    val3 integer
);


--
-- Name: table_b_with_fk; Type: TABLE; Schema: myschema01; Owner: -
--

CREATE TABLE myschema01.table_b_with_fk (
    b_id integer NOT NULL,
    other_a_id integer
);


--
-- Name: table_b_with_multicol_fk; Type: TABLE; Schema: myschema01; Owner: -
--

CREATE TABLE myschema01.table_b_with_multicol_fk (
    b_id integer NOT NULL,
    other_a1_id integer,
    other_a2_id integer
);


--
-- Name: table_generated_id; Type: TABLE; Schema: myschema01; Owner: -
--

CREATE TABLE myschema01.table_generated_id (
    gen_id integer NOT NULL,
    field1 integer
);


--
-- Name: table_generated_id_gen_id_seq; Type: SEQUENCE; Schema: myschema01; Owner: -
--

CREATE SEQUENCE myschema01.table_generated_id_gen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: table_generated_id_gen_id_seq; Type: SEQUENCE OWNED BY; Schema: myschema01; Owner: -
--

ALTER SEQUENCE myschema01.table_generated_id_gen_id_seq OWNED BY myschema01.table_generated_id.gen_id;


--
-- Name: view1; Type: VIEW; Schema: myschema01; Owner: -
--

CREATE VIEW myschema01.view1 AS
 SELECT metadata_test_table.afield,
    metadata_test_table.bfield
   FROM myschema01.metadata_test_table;


--
-- Name: table_generated_id gen_id; Type: DEFAULT; Schema: myschema01; Owner: -
--

ALTER TABLE ONLY myschema01.table_generated_id ALTER COLUMN gen_id SET DEFAULT nextval('table_generated_id_gen_id_seq'::regclass);


--
-- Name: table_a_multicol_pk table_a_multicol_pk_pkey; Type: CONSTRAINT; Schema: myschema01; Owner: -
--

ALTER TABLE ONLY myschema01.table_a_multicol_pk
    ADD CONSTRAINT table_a_multicol_pk_pkey PRIMARY KEY (a1_id, a2_id);


--
-- Name: table_a table_a_pkey; Type: CONSTRAINT; Schema: myschema01; Owner: -
--

ALTER TABLE ONLY myschema01.table_a
    ADD CONSTRAINT table_a_pkey PRIMARY KEY (a_id);


--
-- Name: table_b_with_fk table_b_with_fk_pkey; Type: CONSTRAINT; Schema: myschema01; Owner: -
--

ALTER TABLE ONLY myschema01.table_b_with_fk
    ADD CONSTRAINT table_b_with_fk_pkey PRIMARY KEY (b_id);


--
-- Name: table_b_with_multicol_fk table_b_with_multicol_fk_pkey; Type: CONSTRAINT; Schema: myschema01; Owner: -
--

ALTER TABLE ONLY myschema01.table_b_with_multicol_fk
    ADD CONSTRAINT table_b_with_multicol_fk_pkey PRIMARY KEY (b_id);


--
-- Name: table_b_with_fk fk_a; Type: FK CONSTRAINT; Schema: myschema01; Owner: -
--

ALTER TABLE ONLY myschema01.table_b_with_fk
    ADD CONSTRAINT fk_a FOREIGN KEY (other_a_id) REFERENCES table_a(a_id);


--
-- Name: table_b_with_multicol_fk fk_a_multicol; Type: FK CONSTRAINT; Schema: myschema01; Owner: -
--

ALTER TABLE ONLY myschema01.table_b_with_multicol_fk
    ADD CONSTRAINT fk_a_multicol FOREIGN KEY (other_a1_id, other_a2_id) REFERENCES table_a_multicol_pk(a1_id, a2_id);


--
-- PostgreSQL database dump complete
--

