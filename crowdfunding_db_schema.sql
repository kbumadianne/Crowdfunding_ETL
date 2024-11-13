--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-12 21:31:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16668)
-- Name: campaign; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campaign (
    cf_id integer NOT NULL,
    contact_id integer NOT NULL,
    company_name character varying NOT NULL,
    description character varying NOT NULL,
    goal numeric NOT NULL,
    pledged numeric NOT NULL,
    outcome character varying NOT NULL,
    backers_count integer NOT NULL,
    country character varying NOT NULL,
    currency character varying NOT NULL,
    launched_date date NOT NULL,
    end_date date NOT NULL,
    category_id character varying NOT NULL,
    subcategory_id character varying NOT NULL
);


ALTER TABLE public.campaign OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16676)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id character varying NOT NULL,
    category character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16695)
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    contact_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16688)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategories (
    subcategory_id character varying NOT NULL,
    subcategory character varying NOT NULL
);


ALTER TABLE public.subcategories OWNER TO postgres;

--
-- TOC entry 4703 (class 2606 OID 16674)
-- Name: campaign campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (cf_id);


--
-- TOC entry 4705 (class 2606 OID 16682)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4709 (class 2606 OID 16701)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (contact_id);


--
-- TOC entry 4707 (class 2606 OID 16694)
-- Name: subcategories subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategory_pkey PRIMARY KEY (subcategory_id);


--
-- TOC entry 4710 (class 2606 OID 16683)
-- Name: campaign campaign_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id) NOT VALID;


--
-- TOC entry 4711 (class 2606 OID 16708)
-- Name: campaign campaign_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contacts(contact_id) NOT VALID;


--
-- TOC entry 4712 (class 2606 OID 16703)
-- Name: campaign campaign_subcategory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campaign
    ADD CONSTRAINT campaign_subcategory_id_fkey FOREIGN KEY (subcategory_id) REFERENCES public.subcategories(subcategory_id) NOT VALID;


-- Completed on 2024-11-12 21:31:29

--
-- PostgreSQL database dump complete
--

