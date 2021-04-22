--
-- PostgreSQL database dump
--

-- Dumped from database version 11.10
-- Dumped by pg_dump version 11.10

-- Started on 2021-04-22 19:37:08

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
-- TOC entry 6 (class 2615 OID 26456)
-- Name: postgres; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA postgres;


ALTER SCHEMA postgres OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 26504)
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
-- TOC entry 200 (class 1259 OID 26510)
-- Name: issued_books; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres.issued_books (
    id bigint,
    title character varying,
    student_id bigint,
    student_name character varying,
    "CURRENT_TIMESTAMP" time without time zone
);


ALTER TABLE postgres.issued_books OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 26471)
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
-- TOC entry 196 (class 1259 OID 26466)
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
-- TOC entry 198 (class 1259 OID 26481)
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
-- TOC entry 201 (class 1259 OID 26516)
-- Name: variable; Type: TABLE; Schema: postgres; Owner: postgres
--

CREATE TABLE postgres.variable (
    amount_collected bigint
);


ALTER TABLE postgres.variable OWNER TO postgres;

--
-- TOC entry 2707 (class 2606 OID 26470)
-- Name: studentBasicInfo studentIdPKey; Type: CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studentBasicInfo"
    ADD CONSTRAINT "studentIdPKey" PRIMARY KEY ("Student_ID");


--
-- TOC entry 2709 (class 2606 OID 26502)
-- Name: studentBasicInfo unique_contact; Type: CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studentBasicInfo"
    ADD CONSTRAINT unique_contact UNIQUE ("Contact");


--
-- TOC entry 2711 (class 2606 OID 26480)
-- Name: studFeesInfo unique_transaction; Type: CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studFeesInfo"
    ADD CONSTRAINT unique_transaction UNIQUE ("transaction_ID");


--
-- TOC entry 2712 (class 2606 OID 26496)
-- Name: studFeesInfo fk_studID_fees; Type: FK CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studFeesInfo"
    ADD CONSTRAINT "fk_studID_fees" FOREIGN KEY ("student_ID") REFERENCES postgres."studentBasicInfo"("Student_ID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2713 (class 2606 OID 26491)
-- Name: studentSubjects fk_studID_lang; Type: FK CONSTRAINT; Schema: postgres; Owner: postgres
--

ALTER TABLE ONLY postgres."studentSubjects"
    ADD CONSTRAINT "fk_studID_lang" FOREIGN KEY ("studID") REFERENCES postgres."studentBasicInfo"("Student_ID") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2021-04-22 19:37:08

--
-- PostgreSQL database dump complete
--

