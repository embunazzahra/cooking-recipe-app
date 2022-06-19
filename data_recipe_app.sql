--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6
-- Dumped by pg_dump version 14.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: recipes; Type: TABLE; Schema: public; Owner: proyek_oop
--

CREATE TABLE public.recipes (
    recipe_id integer NOT NULL,
    recipe_name character varying(100) NOT NULL,
    ingredient text NOT NULL,
    direction text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.recipes OWNER TO proyek_oop;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: proyek_oop
--

CREATE SEQUENCE public.recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipe_id_seq OWNER TO proyek_oop;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proyek_oop
--

ALTER SEQUENCE public.recipes_recipe_id_seq OWNED BY public.recipes.recipe_id;


--
-- Name: saved_recipes; Type: TABLE; Schema: public; Owner: proyek_oop
--

CREATE TABLE public.saved_recipes (
    recipe_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.saved_recipes OWNER TO proyek_oop;

--
-- Name: saved_recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: proyek_oop
--

CREATE SEQUENCE public.saved_recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_recipes_recipe_id_seq OWNER TO proyek_oop;

--
-- Name: saved_recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proyek_oop
--

ALTER SEQUENCE public.saved_recipes_recipe_id_seq OWNED BY public.saved_recipes.recipe_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: proyek_oop
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO proyek_oop;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: proyek_oop
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO proyek_oop;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: proyek_oop
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: recipes recipe_id; Type: DEFAULT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.recipes ALTER COLUMN recipe_id SET DEFAULT nextval('public.recipes_recipe_id_seq'::regclass);


--
-- Name: saved_recipes recipe_id; Type: DEFAULT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.saved_recipes ALTER COLUMN recipe_id SET DEFAULT nextval('public.saved_recipes_recipe_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: proyek_oop
--

COPY public.recipes (recipe_id, recipe_name, ingredient, direction, user_id) FROM stdin;
2	nasi goreng telur	nasi secukupnya, telur 2 butir,bawang merah, bawang putih, terasi	1. panaskan minyak\n2. goreng	1
6	telur bakar	nasi secukupnya, telur 2 butir,bawang merah, bawang putih, terasi	1. panaskan minyak\n2. goreng	38
10	nasi uduk	nasi secukupnya, telur 2 butir,bawang merah, bawang putih, terasi	1. panaskan minyak\n2. goreng	5
1	babi rebus	babi 5kg	1. panaskan minyak\n2. goreng	46
11	Palm sugar peanut cookies	200 gr gula palem bubuk\n100 gr kacang sangrai\n200 gr margarine (resep asli 250gr)\n300 gr terigu kunci (resep asli 350gr)\n1 sachet vanilli bubuk\nChocochips (sy gk pake)	1. Aduk rata margarine, vanilli, dan gula palem hingga rata.\n2. Tambahkan kacang sangray yang sudah ditumbuk kasar, aduk rata. Setelah itu tambahkan terigu secara bertahap. Tidak perlu seluruhnya, lihat kepekatan adonan ya. Kalo saya cenderung agak basah tidak kalis karena nnti dibentuk dengan bantuan sendok dan garpu.\n3. Ambil secukupnya adonan dengan sendok, lalu ratakan dengan garpu dengan cara ditekan-tekan. Beri jarak karena adonan akan melebar ya. Tidak perlu sampai kering karena nanti akan mengeras dengan sendirinya setelah dingin. Sy tidak pake olesan margarin tapi kertas baking alasnya.\n4. Jika sudah dingin, masukkan toples untuk dinikmati setiap saat.	1
12	Oseng bunga pepaya	1 bungkus bunga pepaya (4ribu)\n1/2 ons teri tanpa kepala\nBumbu:\n2 siung bawang putih\n1 siung bawang merah\n1 buah tomat\n10 buah rawit hijau\n1/4 sdm garam\n1 sdm gula pasir	1. Siapkan semua bahan dan bumbu. Petiki bunga pepayanya, pisahkan dari tangkai. Cuci bersih bunga pepaya dan teri, serta bumbu, tiriskan.\n2. Oseng bunga pepaya langkah memasak\n3. Oseng bunga pepaya langkah memasak\n4. Sementara menyiapkan bahan lain, goreng teri hingga matang kecokelatan. Angkat lalu tiriskan.\n5. Oseng bunga pepaya langkah memasak\n6. Oseng bunga pepaya langkah memasak\nIris bumbu2, tumis dg minyak baru jgn bekas goreng teri ya. 7. Dahulukan menumis duo bawang hingga harum dan kekuningan, kemudian masukkan bunga pepaya. Aduk hingga sedikit layu. Beri setengah gelas air, aduk dan ungkep.\n8. Oseng bunga pepaya langkah memasak\n9. Oseng bunga pepaya langkah memasak \n10. Oseng bunga pepaya langkah memasak\n11. Setelah agak mnyusut masukkan tomat dan rait, disusul teri goreng.\n12. Oseng bunga pepaya langkah memasak \n13. Oseng bunga pepaya langkah memasak \n14. Tambahkan gula dan garam, boleh tambh penyedap jika suka. Koreksi rasa. \n15. Setelah matang dan empuk, angkat lalu sajikan.	1
14	Cumi masak sambal matah	2 ons cumi asin\n10 buah rawit merah\n13 buah rawit hijau\n10 siung bawang merah\n1 batang serai\n1/2 buah jeruk nipis\n1/4 sdt garam\n3/4 sdm gula pasir\n1/4 potong terasi matang	1. Siapkan bahan untuk diiris, cuci bersih lalu iris sesuai selera. Batang serai ambil bagian putihnya saja\n2. Cumi masak sambal matah langkah memasak\n3. Cumi masak sambal matah langkah memasak\n4. Cumi masak sambal matah langkah memasak\n5. Cuci bersih cumi, lalu tiriskan dan goreng matang sambil dtutup agar minyak tidak nyiprat kmn2. Biasanya sy matikn kompor klo mw mmbolak balik. Jika sudah matang, angkat dan tiriskan.\n6. Cumi masak sambal matah langkah memasak\n7. Cumi masak sambal matah langkah memasak\nCuci wajan karena sy pake wajan sama ganti minyak goreng yg baru bwt menumis bumbu iris, secukupnya saja. Tumis sebentar\n8. Cumi masak sambal matah langkah memasak\n9. Cumi masak sambal matah langkah memasak\n10. Setelah itu masukkan cumi goreng, aduk2 beri gula, terasi dan garam. Beri perasan jeruk nipis. Tes rasa.. sajikan	4
15	Ayam Kecap Toping Mie Ayam	Bumbu halus :\n10 siung bawang merah\n7 siung bawang putih\n1 buah tomat\nBumbu cemplung :\n5 cm kayu manis\n5 buah cengkeh\n1/4 buah pala\n1/4 sdt lada\n3 lbr daun salam\n3 lbr daun jeruk\n1 batang bawang daun\nsecukupnya Kecap manis\nsecukupnya Air\nsecukupnya Gula, garam, dan kaldu jamur	1. Tumis bumbu halus hingga harum\n* Masukkan semua bumbu cemplung kecuali kecap manis dan air\n* Jika sudah harum dan berminyak masukkan potongan ayam oseng sebentar\n2. Masukkan irisan bawang daun\n* Lalu tambahkan kecap aduk perlahan\n* Masak hingga air sedikit menyusut\n* Koreksi rasa matikan api\n3. Angkat dan siap untuk digunakan	5
16	Ikan Bakar Bumbu Kuning	Bahan Ikan Bakar\n1 KG Ikan Laut/Lele/Jahir\nLada Bubuk\n1-5 Biji Asam\nGaram\nBahan Bumbu Kuning (Di Giling/Blender)\n6 Siung Bawang Putih\n3 cm Jahe\n5 cm Kunyit\n3 cm Lengkuas\n4 Biji Serai\n5 Biji Kemiri\nBahan Bumbu Sambal (Di Giling)\nCabe Rawit+Cabe Merah 3 Ons (Sesuaikan selera pedas masing2)\n3 Ons Andaliman\n8-10 Siung Bawang Merah\nKemiri 5 Biji (Di Bakar/Goreng)\nBatang Rias/Kecombrang 4 Biji (Di Bakar/Goreng)	1. Langkah Membuat Bumbu Kuning:\nMasukkan Ikan yang sudah dibersihkan dan disayat-sayat bagian daging(supaya bumbu meresap) pada satu wadah yg besar, masukkan Bumbu Kuning yang sudah di Blender/Giling, Tambahkan Lada Bubuk 1 sendok makan kecil, Garam 1 sendok makan kecil, Peras Asam 1 Buah. Aduk/Campur semua Bahan, kemudian diamkan sekitar 5-10 menit bisa didalam kulkas (setelah 5 menit aduk/campur kembali supaya bumbu meresap)\n2. Ikan yang sudah dilumuri bumbu kuning selama 10 menit siap untuk dipanggang. Saat proses memanggang usahakan bara api tidak besar/panas supaya ikan dapat perlahan dan masak dengan baik. Anda dapat mengoleskan bumbu kuning tadi selama proses memanggang.\n3. Pastikan ikan sudah matang atau kering, ikan siap di hidangkan\nLangkah Membuat Bumbu Sambal:\n1. Goreng Kemiri sampai berubah warna menjadi hitam coklat\n2. Goreng Rias/Kecombrang sampai Layuu,..\n3. Giling Cabe dan Andaliman bersamaan + garam secukupnya\n4. Setelah halus, masukkan Bawang merah kemudian giling sampai halus.\n5. Masukkan Kemiri dan Rias yang sudah digoreng, giling sampai halus dan merata. (Pastikan kembali rasa garam sudah cukup atau belum)\n6. Sambal siap dihidangkan	22
17	Indomie goreng kriuk	1 bungkus indomie goreng jumbo\n4 sdm Tepung bumbu instan\nDaun bawang iris iris\n1 butir telur\nAir matang	1. Hancurkan mie kering agak kecil kecil, rebus setengah matang\n2. Campur bumbu instan dg air, dan masukan unclang, bumbu indomie...masukan mie dan telur.\nBisa ditambahkan garam kalau mau sedikit lebih asin\n3. Goreng dg api sedang sampai matang	30
18	Tahu Bayam Goreng (Perkedel Tahu Bayam)	Bahan-bahan\n5 balok tahu ukuran sedang\n35 gr tepung bumbu\n1 batang loncang (daun bawang)\n1 butir telur\n1/2 ikat bayam\nSecukupnya Minyak goreng\nBumbu\n1 siung bawang merah (besar)\n1 siung bawang putih (kecil)\nSecukupnya Ketumbar bubuk\nSecukupnya Merica bubuk\nSecukupnya Garam\nSecukupnya Kaldu jamur	1. Siapkan bahan dan bumbu\n2. Iris tipis atau cacah halus bawang merah dan bawang putih. Cuci bersih dan sisihkan\n3. Iris tipis bayam, cuci bersih dan sisihkan\n4. Iris tipis daun bawang. Cuci bersih dan sisihkan\n5. Siapkan wadah, masukkan tahu. Lalu haluskan menggunakan garpu\n6. Jika sudah halus, masukkan semua bahan dan bumbu. Aduk sampai rata\n7. Siapkan wajan, masukkan minyak goreng. Lalu goreng tahu sampai berwarna kecoklatan. Lakukan sampai selesai	37
19	Es Cendol Cincau Hitam	1 plastik cendol\n1 blok cincau hitam\n1 gelas santai cair\nSecukupnya selasih yang sudah di rendam air\nSecukupnya selasih yang sudah di rendam air\nSecukupnya (lihat resep)\nEs batu	1.Cuci bersih cendol dan cincau. Potong cincau sesuai selera\n2. Siapkan gelas, masukkan es batun\n3.Masukkan cendol dan cincau hitam\n4. Kemudian masukkan simple sirup\n5. Masukkan santan cair dan selasih	37
20	Semur Ayam Kampung	1 plastik cendol\n1 blok cincau hitam\n1 gelas santai cair\nSecukupnya selasih yang sudah di rendam air\nSecukupnya selasih yang sudah di rendam air\nSecukupnya (lihat resep)\nEs batu	1.Cuci bersih cendol dan cincau. Potong cincau sesuai selera\n2. Siapkan gelas, masukkan es batun\n3.Masukkan cendol dan cincau hitam\n4. Kemudian masukkan simple sirup\n5. Masukkan santan cair dan selasih	37
21	Es buah	Bahannya yaitu\nes batu,\nbuah segarrr\nDan lain lain misalnya sirup Marjan atau apapun	caring aja di yutub	48
22	kopi janji jiwawawa	kopi Saturday bubuk,\ngula 5 kg,\ngelas plastik\nesbatu	dicampur semua aja, coba di edit	48
23	bakso stroberi edit	bakso Dan stroberi	campurkan bakso Dan stroberi	48
25	indomi lagi	indomi rebus	di goreng	48
26	indomi bakar	mi sedap	di rebus	48
27	bakso pahit	bakso	rebus hingga matang	48
\.


--
-- Data for Name: saved_recipes; Type: TABLE DATA; Schema: public; Owner: proyek_oop
--

COPY public.saved_recipes (recipe_id, user_id) FROM stdin;
2	1
10	38
15	48
14	48
21	48
6	48
23	48
11	48
22	58
16	58
17	58
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: proyek_oop
--

COPY public.users (user_id, username, email, password) FROM stdin;
1	usernamesatu	username.satu@gmail.com	$2b$10$5M7Q/7GPr4S9HWbfBUqTUOS.8nKq54D.rihNCwkU11tu3lAVU7ymK
4	bla	coba.dua@gmail.com	$2b$10$U5GOsoWlsEY56fi6JC9MEOGNuAy.JfZq.G7eoP4DBjkyle5Jud3IC
5	bla	a.yy@yahoo.com	jajaja
7	haha	hihi@gmail.co	$2a$08$djUJUE78W7QI4qdMw95PZeVIs1flh6s02scc3pGoz62tOis7zPDyW
22	fifu	hahyu@gaja.com	$2a$08$wOwKyefzQMcYOyo2qIt9pO0iWkWS7uwqRVO/sPwBEl0C7vUpA98xu
30	dadusu	da.dusu@gmail.com	$2a$08$us.T8th3A1.TlnDoSlTafuwgT9uSp0VLvxUxubSe.2o3hhWAJYNgG
32	dadusu	dadusu@gmail.com	$2a$08$6uAn665E4Qcqyfmy5m99SutJ63WkoLNp6fb7GO5uXZtOnISHq9NmS
34	daajsju	ddusu@gmail.com	$2a$08$Mhxdp3BrM/yJhFPNnGo5a.Ia5a32rcKSkqTIj//YmbvF.VZ/ma5XW
36	papale	ddasusu@gmail.com	$2a$08$Vwhh/BS.45./vAIEqJzFbu4wwYZ3MM5/lUMvb/0Q3edIM9939P0ia
37	papalhe	susu@gmail.com	$2a$08$RI28y7SAC6BgaZDW/bdDMOpeYcW1zCTAumCfNVTa7f/7LeZQzvk3e
38	bajuku	bajuku@gmail.com	$2a$08$07iIaGymFKRoZOyxWyF7jOgso5.IC7fFu4ZtltdKkFbhcSLjzLTGa
46	ba_po	sas@gml.com	$2a$08$hjEAgrG/Dj8K2yZZj2E4UeUOPWW3e8TbhZEYEnEwIUlUAkKWpVzCW
48	cobaandroid	coba.android@gmail.com	$2a$08$jrZjw4WzkgW2VKuwEntvfeoyUIge4bp6ngtGoyYBbTQvmxPVMnG1a
50	pppp	coba.adoid@gmail.com	$2a$08$JPRxhmFvnWXTMU01IyDM2OiryMmNG736oXkKKfvNqck48gcIKjRU6
51	Apapapapaap34	shau.sksk@gmail.com	$2a$08$UtKdu4rjewI0Q1GsfdKlBOPKQqOwp3nMJ6EdLoOwXP.AT5.emLbbC
52	Popo123456	popo@gmail.com	$2a$08$mOKKC0WgHVUklQTg7Q0TGeunFmc9KNnmaaqiv/jOP5Anddgsjy2Am
54	aaa	asa@as.com	$2a$08$2PsicT8X.rby3lJDBfbLnuqWw8OxdhLx/WnUv6RRFjTksE3Umr5Vi
55	2ss	sss@as.com	$2a$08$aOJ8080iXtsgh0slut1dqenYiKamvPODwuTMB6yzqXeGjFYp6vySC
56	papapa	papapa@gmail.com	$2a$08$py2k/AhDeRtbrNoRka7rEeoBjV/Dh6RSg1.1zkjjCKKHZqK7LrF7O
57	salah	salah.email@gmail.com	$2a$08$8O4wO6iS5P1N.IqUGwfbheVDCpgLNWLoYdmj5QzcEyZ92LtqpJ20S
58	registsatu	regist.satu@gmail.com	$2a$08$Fu8kjckPSvBXzQDX3yTz2.fT3NV59DzNAQ3D.PIFE99zLnBSIbXqm
59	namakubento	namaku.bento@gmail.com	$2a$08$68JiHGrmXlOC2w./o.FnaewWAbL/nmKoFNZOLVxtURbxRgXGzB4aW
\.


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proyek_oop
--

SELECT pg_catalog.setval('public.recipes_recipe_id_seq', 29, true);


--
-- Name: saved_recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proyek_oop
--

SELECT pg_catalog.setval('public.saved_recipes_recipe_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: proyek_oop
--

SELECT pg_catalog.setval('public.users_user_id_seq', 60, true);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: saved_recipes FK_saved_recipes.recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.saved_recipes
    ADD CONSTRAINT "FK_saved_recipes.recipe_id" FOREIGN KEY (recipe_id) REFERENCES public.recipes(recipe_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saved_recipes FK_saved_recipes.user_id; Type: FK CONSTRAINT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.saved_recipes
    ADD CONSTRAINT "FK_saved_recipes.user_id" FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recipes recipes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: proyek_oop
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: azure_pg_admin
--

REVOKE ALL ON SCHEMA public FROM azuresu;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO azure_pg_admin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: FUNCTION pg_replication_origin_advance(text, pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_create(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_drop(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_oid(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_progress(text, boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_is_setup(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_progress(boolean); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_session_setup(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO azure_pg_admin;


--
-- Name: FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset(); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset() TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_shared(text); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_shared(text) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_function_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_function_counters(oid) TO azure_pg_admin;


--
-- Name: FUNCTION pg_stat_reset_single_table_counters(oid); Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_reset_single_table_counters(oid) TO azure_pg_admin;


--
-- Name: COLUMN pg_config.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_config.setting; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(setting) ON TABLE pg_catalog.pg_config TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.line_number; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(line_number) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.type; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(type) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.database; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(database) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.user_name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(user_name) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.address; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(address) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.netmask; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(netmask) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.auth_method; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(auth_method) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.options; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(options) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_hba_file_rules.error; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(error) ON TABLE pg_catalog.pg_hba_file_rules TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.external_id; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(external_id) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.remote_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(remote_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_replication_origin_status.local_lsn; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(local_lsn) ON TABLE pg_catalog.pg_replication_origin_status TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.name; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(name) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.off; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(off) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_shmem_allocations.allocated_size; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(allocated_size) ON TABLE pg_catalog.pg_shmem_allocations TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.starelid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(starelid) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staattnum; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staattnum) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stainherit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stainherit) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanullfrac; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanullfrac) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stawidth; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stawidth) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stadistinct; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stadistinct) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stakind5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stakind5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.staop5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(staop5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stacoll5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stacoll5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stanumbers5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stanumbers5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues1; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues1) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues2; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues2) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues3; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues3) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues4; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues4) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_statistic.stavalues5; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(stavalues5) ON TABLE pg_catalog.pg_statistic TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.oid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(oid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subdbid; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subdbid) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subowner; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subowner) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subenabled; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subenabled) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subconninfo; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subconninfo) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subslotname; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subslotname) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subsynccommit; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subsynccommit) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- Name: COLUMN pg_subscription.subpublications; Type: ACL; Schema: pg_catalog; Owner: azuresu
--

GRANT SELECT(subpublications) ON TABLE pg_catalog.pg_subscription TO azure_pg_admin;


--
-- PostgreSQL database dump complete
--

