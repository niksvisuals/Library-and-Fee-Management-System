--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10
-- Dumped by pg_dump version 11.10

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
-- Name: postgres; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA postgres;


ALTER SCHEMA postgres OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: book; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres.book (
    id bigint,
    title character varying,
    author character varying,
    pub character varying
);


ALTER TABLE postgres.book OWNER TO postgres;

--
-- Name: issued_books; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres.issued_books (
    id bigint,
    title character varying,
    student_id bigint,
    student_name character varying,
    issued_time timestamp(0) without time zone
);


ALTER TABLE postgres.issued_books OWNER TO postgres;

--
-- Name: studFeesInfo; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres."studFeesInfo" (
    "totalFees" numeric(10,2),
    "currentPayment" numeric(10,2),
    balance numeric(10,2),
    "transaction_ID" character varying(20),
    transaction_date timestamp(0) without time zone,
    "paymentMode" character varying(20) DEFAULT 'Cash'::character varying,
    "student_ID" bigint
);


ALTER TABLE postgres."studFeesInfo" OWNER TO postgres;

--
-- Name: studentBasicInfo; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres."studentBasicInfo" (
    "Student_ID" bigint NOT NULL,
    "First Name" character varying(20),
    "Last Name" character varying(20),
    "Address" character varying(100),
    "Contact" numeric(12,0)
);


ALTER TABLE postgres."studentBasicInfo" OWNER TO postgres;

--
-- Name: studentSubjects; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres."studentSubjects" (
    "studID" bigint,
    "DS" boolean,
    "AoA" boolean,
    "Java" boolean,
    "DMS" boolean,
    "ITC" boolean
);


ALTER TABLE postgres."studentSubjects" OWNER TO postgres;

--
-- Name: variable; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres.variable (
    amount_collected bigint
);


ALTER TABLE postgres.variable OWNER TO postgres;

--
-- Name: studentBasicInfo studentIdPKey; Type: CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studentBasicInfo"
    ADD CONSTRAINT "studentIdPKey" PRIMARY KEY ("Student_ID");


--
-- Name: studentBasicInfo unique_contact; Type: CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studentBasicInfo"
    ADD CONSTRAINT unique_contact UNIQUE ("Contact");


--
-- Name: studFeesInfo unique_transaction; Type: CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studFeesInfo"
    ADD CONSTRAINT unique_transaction UNIQUE ("transaction_ID");


--
-- Name: studFeesInfo fk_studID_fees; Type: FK CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studFeesInfo"
    ADD CONSTRAINT "fk_studID_fees" FOREIGN KEY ("student_ID") REFERENCES postgres."studentBasicInfo"("Student_ID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: studentSubjects fk_studID_lang; Type: FK CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studentSubjects"
    ADD CONSTRAINT "fk_studID_lang" FOREIGN KEY ("studID") REFERENCES postgres."studentBasicInfo"("Student_ID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

