--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;


--
-- Data for Name: journal; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY journal (identifier, title, print_issn, online_issn, publisher, country, url, notes) FROM stdin;
\.


--
-- Data for Name: article; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY article (identifier, title, doi, year, journal, journal_vol, journal_pages, url, notes) FROM stdin;
\.


--
-- Data for Name: report; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY report (identifier, title) FROM stdin;
\.


--
-- Data for Name: chapter; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY chapter (identifier, title, report, number) FROM stdin;
\.


--
-- Data for Name: contributor_role_type; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY contributor_role_type (identifier, "table") FROM stdin;
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY organization (identifier, name, url, country) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY person (id, name, address, phone, email, url) FROM stdin;
\.


--
-- Data for Name: contributor; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY contributor (id, person_id, role_type, organization) FROM stdin;
\.


--
-- Name: contributor_id_seq; Type: SEQUENCE SET; Schema: gcis_metadata; Owner: -
--

SELECT pg_catalog.setval('contributor_id_seq', 1, false);


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY dataset (identifier, name, type, version, description, native_id, publication_dt, access_dt, url, data_qualifier, scale, spatial_ref_sys, cite_metadata, scope, spatial_extent, temporal_extent, vertical_extent, processing_level, spatial_res) FROM stdin;
\.


--
-- Data for Name: dataset_lineage; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY dataset_lineage (id, dataset_id, parent_id) FROM stdin;
\.


--
-- Name: dataset_lineage_id_seq; Type: SEQUENCE SET; Schema: gcis_metadata; Owner: -
--

SELECT pg_catalog.setval('dataset_lineage_id_seq', 1, false);


--
-- Data for Name: dataset_organization; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY dataset_organization (identifier, dataset, organization) FROM stdin;
\.


--
-- Data for Name: figure; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY figure (identifier, uuid, chapter, title, caption, attributes, time_start, time_end, lat_max, lat_min, lon_max, lon_min, keywords, usage_limits, submission_dt, create_dt, source_citation, ordinal) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY image (identifier, figure, "position", title, description, attributes, time_start, time_end, lat_max, lat_min, lon_max, lon_min, keywords, usage_limits, submission_dt, create_dt) FROM stdin;
\.


--
-- Data for Name: file; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY file (identifier, image, file_type, dir, file) FROM stdin;
\.


--
-- Data for Name: finding; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY finding (identifier, chapter, statement) FROM stdin;
\.


--
-- Data for Name: organization_type; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY organization_type (identifier) FROM stdin;
\.


--
-- Data for Name: organization_type_map; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY organization_type_map (organization, organization_type) FROM stdin;
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: gcis_metadata; Owner: -
--

SELECT pg_catalog.setval('person_id_seq', 1, false);


--
-- Data for Name: publication_type; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY publication_type (identifier, "table") FROM stdin;
\.


--
-- Data for Name: publication; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY publication (id, parent_id, publication_type, fk) FROM stdin;
\.


--
-- Data for Name: publication_contributor; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY publication_contributor (id, publication_id, contributor_id) FROM stdin;
\.


--
-- Name: publication_contributor_id_seq; Type: SEQUENCE SET; Schema: gcis_metadata; Owner: -
--

SELECT pg_catalog.setval('publication_contributor_id_seq', 1, false);


--
-- Name: publication_id_seq; Type: SEQUENCE SET; Schema: gcis_metadata; Owner: -
--

SELECT pg_catalog.setval('publication_id_seq', 1, false);


--
-- Data for Name: ref_type; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY ref_type (identifier, "table") FROM stdin;
\.


--
-- Data for Name: publication_ref; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY publication_ref (id, publication_id, type, fk) FROM stdin;
\.


--
-- Name: publication_ref_id_seq; Type: SEQUENCE SET; Schema: gcis_metadata; Owner: -
--

SELECT pg_catalog.setval('publication_ref_id_seq', 1, false);


--
-- Data for Name: submitter; Type: TABLE DATA; Schema: gcis_metadata; Owner: -
--

COPY submitter (id, person_id, "table", fk, contributor_id) FROM stdin;
\.


--
-- Name: submitter_id_seq; Type: SEQUENCE SET; Schema: gcis_metadata; Owner: -
--

SELECT pg_catalog.setval('submitter_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

