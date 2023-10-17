-- MySQL dump 10.13  Distrib 8.1.0, for macos13.3 (arm64)
--
-- Host: localhost    Database: db_chatbot_mysql_1
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS`db_chatbot_mysql_1`;
USE `db_chatbot_mysql_1`;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `id_database` int DEFAULT NULL,
  `title` text,
  `keyword_menu` text,
  `dml_ddl` enum('select','insert','update','delete','create','alter','drop','call') DEFAULT NULL,
  `table` varchar(100) DEFAULT NULL,
  `columns` text,
  `value_columns` text,
  `columns_condition` text,
  `value_cols_cond` text,
  `join` enum('JOIN','RIGHT JOIN','LEFT JOIN') DEFAULT NULL,
  `join_table` text,
  `limit` varchar(100) DEFAULT NULL,
  `sp_name` text,
  `sp_parameter` text,
  `response` text,
  `response_type` enum('text','photo','pdf','location','excel','word') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'text',
  `is_public` tinyint DEFAULT '0' COMMENT '0=private, 1=public',
  PRIMARY KEY (`id_menu`),
  KEY `id_database` (`id_database`),
  KEY `keyword_menu_btree` (`keyword_menu`(255)) USING BTREE,
  FULLTEXT KEY `keyword_menu` (`keyword_menu`) /*!50100 WITH PARSER `ngram` */ ,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_database`) REFERENCES `tb_database` (`id_database`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Login','Login','call',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sp_login_user','f_username,f_token,f_chat_id,f_id_inbox',NULL,'text',1),(2,2,'Register','Register','call',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sp_register_user','4,\"func_get_role\",\"func_get_id\",f_username,f_token,f_chat_id,f_id_inbox',NULL,'text',1),(3,3,'Logout','Logout','call',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sp_logout_user','f_chat_id,f_id_inbox',NULL,'text',1),(15,7,'Tambah Departemen','Tambah Departemen','insert','departemen','nama_departemen,telp','f_nama_departemen,f_telp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berhasil menambahkan departemen!','text',1),(16,7,'Lihat Departemen','Lihat Departemen','select','departemen','nama_departemen,telp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berikut adalah daftar departemen','word',1),(17,7,'Hapus Departemen','Hapus Departemen','delete','departemen',NULL,NULL,'id_departemen','f_id_departemen',NULL,NULL,NULL,NULL,NULL,'Berhasil menghapus departemen!','text',1),(18,6,'Tambah Log Posisi','Tambah Log Posisi','insert','log_posisi','id_pegawai,tgl,lat,long','f_identifier,f_tgl_y-f_tgl_month-f_tgl_d f_tgl_j:f_tgl_mn,f_lat,f_lng',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berhasil menambah log posisi!','text',1),(19,6,'Tampilkan Lokasi Terakhir','Tampilkan Lokasi Terakhir','select','log_posisi','lat,long',NULL,'id_log','f_id_log',NULL,NULL,NULL,NULL,NULL,'Lokasi GPS sedang dikirim..','location',1),(20,5,'Tambah Driver','Tambah Driver','insert','driver','nop,nama,departemen,tmt,telp','f_nop,f_nama,f_departemen,f_tmt_y-f_tmt_m-f_tmt_d,f_telp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berhasil menambah driver!','text',1),(22,4,'Tambah Aktivitas','Tambah Aktivitas','insert','aktivitas','id_pegawai,tgl,kegiatan,mulai,foto_awal,selesai,foto_akhir','f_identifier,f_tgl_y-f_tgl_m-f_tgl_d,f_kegiatan,f_mulai_j:f_mulai_mn,f_foto_awal,f_selesai_j:f_selesai_mn,f_foto_akhir',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berhasil menambah aktivitas!','text',1),(23,4,'Tampilkan Foto Awal Aktivitas','Tampilkan Foto Awal Aktivitas','select','aktivitas','foto_awal',NULL,'id_aktivitas','f_id_aktivitas',NULL,NULL,NULL,NULL,NULL,NULL,'photo',1),(25,8,'Tambah Tabel','Tambah Tabel','create',NULL,NULL,'f_nama_tabel,f_nama_kolom,f_tipe_data,f_panjang_data,f_pk',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berhasil menambah tabel!','text',1),(26,8,'Perbarui Tabel','Perbarui Tabel','alter',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berhasil memperbarui tabel!','text',1),(27,8,'Hapus Tabel','Hapus Tabel','drop',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Berhasil menghapus tabel!','text',1),(28,5,'Tampilkan Nama Driver dan Departemen','Tampilkan Nama Driver dan Departemen','select','driver','driver.nama,departemen.nama_departemen',NULL,NULL,NULL,'JOIN','driver.departemen',NULL,NULL,NULL,NULL,'text',1),(29,5,'Tampilkan Nama Terbatas','Tampilkan Nama Terbatas','call',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sp_tampilDriverTerbatas','f_id_inbox,f_chat_id,f_jumlah',NULL,'text',1),(30,5,'Perbarui Telepon Driver','Perbarui Telepon Driver','update','driver','telp','f_telp','id_pegawai','f_id_pegawai',NULL,NULL,NULL,NULL,NULL,'Berhasil memperbarui nomor telepon driver','text',1),(31,5,'Hapus Driver','Hapus Driver','delete','driver',NULL,NULL,'id_pegawai','f_id_pegawai',NULL,NULL,NULL,NULL,NULL,'Berhasil menghapus driver!','text',1),(32,4,'Tampilkan Foto Akhir Aktivitas','Tampilkan Foto Akhir Aktivitas','select','aktivitas','foto_akhir',NULL,'id_aktivitas','f_id_aktivitas',NULL,NULL,NULL,NULL,NULL,NULL,'photo',1),(33,4,'Lihat Aktivitas yang Tersedia','Lihat Aktivitas yang Tersedia','select','aktivitas','driver.nama,aktivitas.tgl,aktivitas.kegiatan,aktivitas.mulai,aktivitas.selesai',NULL,NULL,NULL,'JOIN','aktivitas.driver',NULL,NULL,NULL,NULL,'text',1),(34,4,'Hapus Aktivitas','Hapus Aktivitas','delete','aktivitas',NULL,NULL,'id_aktivitas','f_id_aktivitas',NULL,NULL,NULL,NULL,NULL,'Berhasil menghapus aktivitas!','text',1),(35,5,'Unduh Berkas Driver (PDF)','Unduh Berkas Driver (PDF)','select','driver','driver.nop,driver.nama,departemen.nama_departemen,driver.telp',NULL,NULL,NULL,'JOIN','driver.departemen',NULL,NULL,NULL,NULL,'pdf',1),(36,7,'Unduh Berkas Departemen (WORD)','Unduh Berkas Departemen (WORD)','select','departemen','nama_departemen,telp',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'word',1),(37,9,'Unduh Berkas User (EXCEL)','Unduh Berkas User (EXCEL)','select','user','username,token_telegram,id_pegawai,role',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'excel',1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stopwords`
--

DROP TABLE IF EXISTS `stopwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stopwords` (
  `value` varchar(30) DEFAULT NULL,
  KEY `value_btree` (`value`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopwords`
--

LOCK TABLES `stopwords` WRITE;
/*!40000 ALTER TABLE `stopwords` DISABLE KEYS */;
INSERT INTO `stopwords` VALUES ('ada'),('adalah'),('adanya'),('adapun'),('agak'),('agaknya'),('agar'),('akan'),('akankah'),('akhiri'),('akhirnya'),('aku'),('akulah'),('amat'),('amatlah'),('anda'),('andalah'),('antar'),('antara'),('antaranya'),('apa'),('apaan'),('apabila'),('apakah'),('apalagi'),('apatah'),('artinya'),('asal'),('asalkan'),('atas'),('atau'),('ataukah'),('ataupun'),('awalnya'),('bagai'),('bagaikan'),('bagaimana'),('bagaimanakah'),('bagaimanapun'),('bagi'),('bagian'),('bahkan'),('bahwa'),('bahwasanya'),('baik'),('bakal'),('bakalan'),('balik'),('banyak'),('bapak'),('bawah'),('beberapa'),('begini'),('beginian'),('beginikah'),('beginilah'),('begitu'),('begitukah'),('begitulah'),('begitupun'),('bekerja'),('belakang'),('belakangan'),('belum'),('belumlah'),('benar'),('benarkah'),('benarlah'),('berada'),('berakhir'),('berakhirlah'),('berakhirnya'),('berapa'),('berapakah'),('berapalah'),('berapapun'),('berarti'),('berawal'),('berbagai'),('berdatangan'),('beri'),('berikan'),('berikut'),('berikutnya'),('berjumlah'),('berkali-kali'),('berkata'),('berkehendak'),('berkeinginan'),('berkenaan'),('berlainan'),('berlalu'),('berlangsung'),('berlebihan'),('bermacam'),('bermacam-macam'),('bermaksud'),('bermula'),('bersama'),('bersama-sama'),('bersiap'),('bersiap-siap'),('bertanya'),('bertanya-tanya'),('berturut'),('berturut-turut'),('bertutur'),('berujar'),('berupa'),('besar'),('betul'),('betulkah'),('biasa'),('biasanya'),('bila'),('bilakah'),('bisa'),('bisakah'),('boleh'),('bolehkah'),('bolehlah'),('buat'),('bukan'),('bukankah'),('bukanlah'),('bukannya'),('bulan'),('bung'),('cara'),('caranya'),('cukup'),('cukupkah'),('cukuplah'),('cuma'),('dahulu'),('dalam'),('dan'),('dapat'),('dari'),('daripada'),('datang'),('dekat'),('demi'),('demikian'),('demikianlah'),('dengan'),('depan'),('di'),('dia'),('diakhiri'),('diakhirinya'),('dialah'),('diantara'),('diantaranya'),('diberi'),('diberikan'),('diberikannya'),('dibuat'),('dibuatnya'),('didapat'),('didatangkan'),('digunakan'),('diibaratkan'),('diibaratkannya'),('diingat'),('diingatkan'),('diinginkan'),('dijawab'),('dijelaskan'),('dijelaskannya'),('dikarenakan'),('dikatakan'),('dikatakannya'),('dikerjakan'),('diketahui'),('diketahuinya'),('dikira'),('dilakukan'),('dilalui'),('dilihat'),('dimaksud'),('dimaksudkan'),('dimaksudkannya'),('dimaksudnya'),('diminta'),('dimintai'),('dimisalkan'),('dimulai'),('dimulailah'),('dimulainya'),('dimungkinkan'),('dini'),('dipastikan'),('diperbuat'),('diperbuatnya'),('dipergunakan'),('diperkirakan'),('diperlihatkan'),('diperlukan'),('diperlukannya'),('dipersoalkan'),('dipertanyakan'),('dipunyai'),('diri'),('dirinya'),('disampaikan'),('disebut'),('disebutkan'),('disebutkannya'),('disini'),('disinilah'),('ditambahkan'),('ditandaskan'),('ditanya'),('ditanyai'),('ditanyakan'),('ditegaskan'),('ditujukan'),('ditunjuk'),('ditunjuki'),('ditunjukkan'),('ditunjukkannya'),('ditunjuknya'),('dituturkan'),('dituturkannya'),('diucapkan'),('diucapkannya'),('diungkapkan'),('dong'),('dua'),('dulu'),('empat'),('enggak'),('enggaknya'),('entah'),('entahlah'),('guna'),('gunakan'),('hal'),('hampir'),('hanya'),('hanyalah'),('hari'),('harus'),('haruslah'),('harusnya'),('hendak'),('hendaklah'),('hendaknya'),('hingga'),('ia'),('ialah'),('ibarat'),('ibaratkan'),('ibaratnya'),('ibu'),('ikut'),('ingat'),('ingat-ingat'),('ingin'),('inginkah'),('inginkan'),('ini'),('inikah'),('inilah'),('itu'),('itukah'),('itulah'),('jadi'),('jadilah'),('jadinya'),('jangan'),('jangankan'),('janganlah'),('jauh'),('jawab'),('jawaban'),('jawabnya'),('jelas'),('jelaskan'),('jelaslah'),('jelasnya'),('jika'),('jikalau'),('juga'),('jumlah'),('jumlahnya'),('justru'),('kala'),('kalau'),('kalaulah'),('kalaupun'),('kalian'),('kami'),('kamilah'),('kamu'),('kamulah'),('kan'),('kapan'),('kapankah'),('kapanpun'),('karena'),('karenanya'),('kasus'),('kata'),('katakan'),('katakanlah'),('katanya'),('ke'),('keadaan'),('kebetulan'),('kecil'),('kedua'),('keduanya'),('keinginan'),('kelamaan'),('kelihatan'),('kelihatannya'),('kelima'),('kembali'),('kemudian'),('kemungkinan'),('kemungkinannya'),('kenapa'),('kepada'),('kepadanya'),('kesampaian'),('keseluruhan'),('keseluruhannya'),('keterlaluan'),('ketika'),('khususnya'),('kini'),('kinilah'),('kira'),('kira-kira'),('kiranya'),('kita'),('kitalah'),('kok'),('kurang'),('lagi'),('lagian'),('lah'),('lain'),('lainnya'),('lalu'),('lama'),('lamanya'),('lanjut'),('lanjutnya'),('lebih'),('lewat'),('lima'),('luar'),('macam'),('maka'),('makanya'),('makin'),('malah'),('malahan'),('mampu'),('mampukah'),('mana'),('manakala'),('manalagi'),('masa'),('masalah'),('masalahnya'),('masih'),('masihkah'),('masing'),('masing-masing'),('mau'),('maupun'),('melainkan'),('melakukan'),('melalui'),('melihat'),('melihatnya'),('memang'),('memastikan'),('memberi'),('memberikan'),('membuat'),('memerlukan'),('memihak'),('meminta'),('memintakan'),('memisalkan'),('memperbuat'),('mempergunakan'),('memperkirakan'),('memperlihatkan'),('mempersiapkan'),('mempersoalkan'),('mempertanyakan'),('mempunyai'),('memulai'),('memungkinkan'),('menaiki'),('menambahkan'),('menandaskan'),('menanti'),('menanti-nanti'),('menantikan'),('menanya'),('menanyai'),('menanyakan'),('mendapat'),('mendapatkan'),('mendatang'),('mendatangi'),('mendatangkan'),('menegaskan'),('mengakhiri'),('mengapa'),('mengatakan'),('mengatakannya'),('mengenai'),('mengerjakan'),('mengetahui'),('menggunakan'),('menghendaki'),('mengibaratkan'),('mengibaratkannya'),('mengingat'),('mengingatkan'),('menginginkan'),('mengira'),('mengucapkan'),('mengucapkannya'),('mengungkapkan'),('menjadi'),('menjawab'),('menjelaskan'),('menuju'),('menunjuk'),('menunjuki'),('menunjukkan'),('menunjuknya'),('menurut'),('menuturkan'),('menyampaikan'),('menyangkut'),('menyatakan'),('menyebutkan'),('menyeluruh'),('menyiapkan'),('merasa'),('mereka'),('merekalah'),('merupakan'),('meski'),('meskipun'),('meyakini'),('meyakinkan'),('minta'),('mirip'),('misal'),('misalkan'),('misalnya'),('mula'),('mulai'),('mulailah'),('mulanya'),('mungkin'),('mungkinkah'),('nah'),('naik'),('namun'),('nanti'),('nantinya'),('nyaris'),('nyatanya'),('oleh'),('olehnya'),('pada'),('padahal'),('padanya'),('pak'),('paling'),('panjang'),('pantas'),('para'),('pasti'),('pastilah'),('penting'),('pentingnya'),('per'),('percuma'),('perlu'),('perlukah'),('perlunya'),('pernah'),('persoalan'),('pertama'),('pertama-tama'),('pertanyaan'),('pertanyakan'),('pihak'),('pihaknya'),('pukul'),('pula'),('pun'),('punya'),('rasa'),('rasanya'),('rata'),('rupanya'),('saat'),('saatnya'),('saja'),('sajalah'),('saling'),('sama'),('sama-sama'),('sambil'),('sampai'),('sampai-sampai'),('sampaikan'),('sana'),('sangat'),('sangatlah'),('satu'),('saya'),('sayalah'),('se'),('sebab'),('sebabnya'),('sebagai'),('sebagaimana'),('sebagainya'),('sebagian'),('sebaik'),('sebaik-baiknya'),('sebaiknya'),('sebaliknya'),('sebanyak'),('sebegini'),('sebegitu'),('sebelum'),('sebelumnya'),('sebenarnya'),('seberapa'),('sebesar'),('sebetulnya'),('sebisanya'),('sebuah'),('sebut'),('sebutlah'),('sebutnya'),('secara'),('secukupnya'),('sedang'),('sedangkan'),('sedemikian'),('sedikit'),('sedikitnya'),('seenaknya'),('segala'),('segalanya'),('segera'),('seharusnya'),('sehingga'),('seingat'),('sejak'),('sejauh'),('sejenak'),('sejumlah'),('sekadar'),('sekadarnya'),('sekali'),('sekali-kali'),('sekalian'),('sekaligus'),('sekalipun'),('sekarang'),('sekarang'),('sekecil'),('seketika'),('sekiranya'),('sekitar'),('sekitarnya'),('sekurang-kurangnya'),('sekurangnya'),('sela'),('selain'),('selaku'),('selalu'),('selama'),('selama-lamanya'),('selamanya'),('selanjutnya'),('seluruh'),('seluruhnya'),('semacam'),('semakin'),('semampu'),('semampunya'),('semasa'),('semasih'),('semata'),('semata-mata'),('semaunya'),('sementara'),('semisal'),('semisalnya'),('sempat'),('semua'),('semuanya'),('semula'),('sendiri'),('sendirian'),('sendirinya'),('seolah'),('seolah-olah'),('seorang'),('sepanjang'),('sepantasnya'),('sepantasnyalah'),('seperlunya'),('seperti'),('sepertinya'),('sepihak'),('sering'),('seringnya'),('serta'),('serupa'),('sesaat'),('sesama'),('sesampai'),('sesegera'),('sesekali'),('seseorang'),('sesuatu'),('sesuatunya'),('sesudah'),('sesudahnya'),('setelah'),('setempat'),('setengah'),('seterusnya'),('setiap'),('setiba'),('setibanya'),('setidak-tidaknya'),('setidaknya'),('setinggi'),('seusai'),('sewaktu'),('siap'),('siapa'),('siapakah'),('siapapun'),('sini'),('sinilah'),('soal'),('soalnya'),('suatu'),('sudah'),('sudahkah'),('sudahlah'),('supaya'),('tadi'),('tadinya'),('tahu'),('tahun'),('tak'),('tambahnya'),('tampak'),('tampaknya'),('tandas'),('tandasnya'),('tanpa'),('tanya'),('tanyakan'),('tanyanya'),('tapi'),('tegas'),('tegasnya'),('telah'),('tempat'),('tengah'),('tentang'),('tentu'),('tentulah'),('tentunya'),('tepat'),('terakhir'),('terasa'),('terbanyak'),('terdahulu'),('terdapat'),('terdiri'),('terhadap'),('terhadapnya'),('teringat'),('teringat-ingat'),('terjadi'),('terjadilah'),('terjadinya'),('terkira'),('terlalu'),('terlebih'),('terlihat'),('termasuk'),('ternyata'),('tersampaikan'),('tersebut'),('tersebutlah'),('tertentu'),('tertuju'),('terus'),('terutama'),('tetap'),('tetapi'),('tiap'),('tiba'),('tiba-tiba'),('tidak'),('tidakkah'),('tidaklah'),('tiga'),('tinggi'),('toh'),('tunjuk'),('turut'),('tutur'),('tuturnya'),('ucap'),('ucapnya'),('ujar'),('ujarnya'),('umum'),('umumnya'),('ungkap'),('ungkapnya'),('untuk'),('usah'),('usai'),('waduh'),('wah'),('wahai'),('waktu'),('waktunya'),('walau'),('walaupun'),('wong'),('yaitu'),('yakin'),('yakni'),('yang');
/*!40000 ALTER TABLE `stopwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_database`
--

DROP TABLE IF EXISTS `tb_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_database` (
  `id_database` int NOT NULL AUTO_INCREMENT,
  `nama_database` varchar(255) DEFAULT NULL,
  `alias_database` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_database`),
  FULLTEXT KEY `title` (`alias_database`) /*!50100 WITH PARSER `ngram` */ 
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_database`
--

LOCK TABLES `tb_database` WRITE;
/*!40000 ALTER TABLE `tb_database` DISABLE KEYS */;
INSERT INTO `tb_database` VALUES (1,'db_chatbot_mysql_1','login'),(2,'db_chatbot_mysql_1','register'),(3,'db_chatbot_mysql_1','logout'),(4,'db_chatbot_mysql_1','Aktivitas'),(5,'db_chatbot_mysql_1','Driver'),(6,'db_chatbot_mysql_1','Log Posisi'),(7,'db_chatbot_mysql_1','Departemen'),(8,'db_chatbot_mysql_1','Database Management'),(9,'db_chatbot_mysql_1','User');
/*!40000 ALTER TABLE `tb_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inbox`
--

DROP TABLE IF EXISTS `tb_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_inbox` (
  `id_inbox` int NOT NULL AUTO_INCREMENT,
  `msg` text,
  `chat_id` varchar(50) DEFAULT NULL,
  `flag` tinyint DEFAULT '0' COMMENT '0=belum diproses, 1=sedang diproses, 2=selesai',
  `msg_type` enum('text','photo','document','location') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'text',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inbox`),
  KEY `chat_id_btree` (`chat_id`) USING BTREE,
  KEY `flag_btree` (`flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inbox`
--

LOCK TABLES `tb_inbox` WRITE;
/*!40000 ALTER TABLE `tb_inbox` DISABLE KEYS */;
INSERT INTO `tb_inbox` VALUES (1,'/start','123123',0,'text','2023-10-16 21:39:08'),(2,'menu','123123',0,'text','2023-10-16 21:55:29'),(3,'tmpilkan fto awl aktivtas','123123',0,'text','2023-10-16 22:00:17');
/*!40000 ALTER TABLE `tb_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_outbox`
--

DROP TABLE IF EXISTS `tb_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_outbox` (
  `id_outbox` int NOT NULL AUTO_INCREMENT,
  `id_inbox` int DEFAULT NULL,
  `msg` text,
  `chat_id` varchar(50) DEFAULT NULL,
  `flag` int DEFAULT NULL,
  `msg_type` enum('text','photo','document','location','pdf','excel','word') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'text',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_outbox`),
  KEY `id_inbox` (`id_inbox`),
  CONSTRAINT `tb_outbox_ibfk_1` FOREIGN KEY (`id_inbox`) REFERENCES `tb_inbox` (`id_inbox`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_outbox`
--

LOCK TABLES `tb_outbox` WRITE;
/*!40000 ALTER TABLE `tb_outbox` DISABLE KEYS */;
INSERT INTO `tb_outbox` VALUES (1,1,'Hai! Selamat datang di Bot Pintar Driver. Berikut adalah layanan-layanan yang tersedia pada Bot Pintar Driver. Silakan memilih salah satu layanan berikut dengan ketik nomor urut layanan. Selamat mencoba!\n\n[Menu Utama]\n1. login\n2. register\n3. logout\n4. Aktivitas\n5. Driver\n6. Log Posisi\n7. Departemen\n8. Database Management\n9. User\n\n[Sistem]\n10. Login\n11. Register','123123',1,'text','2023-10-16 22:10:58'),(2,2,'[Menu Utama]\n1. login\n2. register\n3. logout\n4. Aktivitas\n5. Driver\n6. Log Posisi\n7. Departemen\n8. Database Management\n9. User\n\n[Sistem]\n10. Login\n11. Register','123123',1,'text','2023-10-16 22:10:58'),(3,3,'Berikut adalah hasil dari pencarian menu layanan\n\n[Aktivitas]\n1. Tampilkan Foto Akhir Aktivitas\n2. Tampilkan Foto Awal Aktivitas\n\n[Sistem]\n3. Tampilkan menu selengkapnya\n4. Kembali ke menu sebelumnya\n','123123',1,'text','2023-10-16 22:10:58');
/*!40000 ALTER TABLE `tb_outbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_setting`
--

DROP TABLE IF EXISTS `tb_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_setting` (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `setting` varchar(100) DEFAULT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`id_setting`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_setting`
--

LOCK TABLES `tb_setting` WRITE;
/*!40000 ALTER TABLE `tb_setting` DISABLE KEYS */;
INSERT INTO `tb_setting` VALUES (1,'threshold',0.93),(2,'catch',5),(3,'pagination',5),(5,'session',30),(6,'max_choices',5);
/*!40000 ALTER TABLE `tb_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_temp_database`
--

DROP TABLE IF EXISTS `tb_temp_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_temp_database` (
  `id_temp_database` int NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(50) DEFAULT NULL,
  `id_database` int DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  PRIMARY KEY (`id_temp_database`),
  KEY `id_database` (`id_database`),
  KEY `chat_id_btree` (`chat_id`) USING BTREE,
  CONSTRAINT `tb_temp_database_ibfk_1` FOREIGN KEY (`id_database`) REFERENCES `tb_database` (`id_database`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_temp_database`
--

LOCK TABLES `tb_temp_database` WRITE;
/*!40000 ALTER TABLE `tb_temp_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_temp_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_temp_menu`
--

DROP TABLE IF EXISTS `tb_temp_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_temp_menu` (
  `id_temp_menu` int NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(50) DEFAULT NULL,
  `final_word` text,
  `id_menu` int DEFAULT NULL COMMENT 'id_database/id_menu',
  `ranking` int DEFAULT NULL,
  `score` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id_temp_menu`),
  KEY `id_menu` (`id_menu`),
  KEY `chat_id_btree` (`chat_id`) USING BTREE,
  KEY `ranking_btree` (`ranking`) USING BTREE,
  CONSTRAINT `tb_temp_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_temp_menu`
--

LOCK TABLES `tb_temp_menu` WRITE;
/*!40000 ALTER TABLE `tb_temp_menu` DISABLE KEYS */;
INSERT INTO `tb_temp_menu` VALUES (11,'123123','tmpilkan fto awl aktivtas',32,1,'1.3922688961029053'),(12,'123123','tmpilkan fto awl aktivtas',23,2,'1.3922688961029053'),(14,'123123',NULL,NULL,3,'0'),(15,'123123',NULL,NULL,4,'0');
/*!40000 ALTER TABLE `tb_temp_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `chat_id` varchar(50) DEFAULT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status_login` enum('true','false') DEFAULT 'true',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `chat_id` (`chat_id`),
  KEY `username_btree` (`username`) USING BTREE,
  KEY `chatid_btree` (`chat_id`) USING BTREE,
  KEY `chat_id_btree` (`chat_id`) USING BTREE,
  KEY `status_login_btree` (`status_login`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'adi','qwe123','123123','3','true');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_value_history`
--

DROP TABLE IF EXISTS `tb_value_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_value_history` (
  `id_value_history` int NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(50) DEFAULT NULL,
  `id_menu` int DEFAULT NULL,
  `id_submenu` int DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `jenis_value` enum('text','choice','photo','document','location') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `flag` tinyint DEFAULT '0' COMMENT '0=proses, 1=dijawab, 2=siap dieksekusi, 3=selesai',
  `id_kesimpulan_chat` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_value_history`),
  KEY `id_menu` (`id_menu`),
  KEY `id_submenu` (`id_submenu`),
  KEY `id_kesimpulan_chat` (`id_kesimpulan_chat`),
  KEY `chat_id_btree` (`chat_id`) USING BTREE,
  KEY `flag_btree` (`flag`) USING BTREE,
  CONSTRAINT `tb_value_history_ibfk_2` FOREIGN KEY (`id_submenu`) REFERENCES `submenu` (`id_submenu`),
  CONSTRAINT `tb_value_history_ibfk_3` FOREIGN KEY (`id_kesimpulan_chat`) REFERENCES `tb_kesimpulan_chat` (`id_kesimpulan_chat`),
  CONSTRAINT `tb_value_history_ibfk_4` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_value_history`
--

LOCK TABLES `tb_value_history` WRITE;
/*!40000 ALTER TABLE `tb_value_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_value_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_chatbot_mysql_1'
--
/*!50003 DROP FUNCTION IF EXISTS `foldingPunctuation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `foldingPunctuation`(word varchar(100)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
		DECLARE i, len SMALLINT DEFAULT 1; 
		DECLARE ret varchar(255) DEFAULT ''; 
		DECLARE c CHAR(1);
		IF word IS NOT NULL THEN 
			SET len = CHAR_LENGTH( word ); 
			REPEAT 
				BEGIN 
					SET c = MID( word, i, 1 ); 
					IF c REGEXP '[[:alnum:]]' THEN 
						SET ret = CONCAT(ret,c);
					else
						IF i = 1 THEN 
							SET ret = CONCAT(ret,"");
						elseif i = (len-1) then
							SET ret = CONCAT(ret,"");
						else 
							SET ret = CONCAT(ret," ");
						end if;
					END IF; 
					SET i = i + 1; 
				END; 
			UNTIL i > len END REPEAT; 
			SET ret = TRIM(ret);
			RETURN ret;
		ELSE
			RETURN word; 
		END IF; 
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `tp_nlp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tp_nlp`( words TEXT) RETURNS text CHARSET utf8mb4
    DETERMINISTIC
BEGIN
		DECLARE result TEXT default "";
		
		DECLARE v_words_2, v_words_3, v_words_4 text;
		DECLARE v_word_conter, v_remove_punctuation_last_word INT;
		DECLARE i INT DEFAULT 0;
		DECLARE v_token_word VARCHAR(255);
		DECLARE v_is_stopword INT DEFAULT 0;
		
		-- hapus spasi ganda dan spasi awal dan akhir string
		-- SELECT 1_removeWhitespaces(words) INTO v_remove_whitespaces;
		SET v_words_2 = TRIM(REGEXP_REPLACE(words, ' \+', ' '));

		-- hapus tanda baca
		SELECT foldingPunctuation(v_words_2) INTO v_words_3;
		
		-- hapus spasi ganda setelah tanda baca yg diubah menjadi spasi
		SELECT REGEXP_REPLACE(v_words_3, '[[:space:]]+', ' ') into v_words_4;

		-- hapus stopwords
		SELECT LENGTH(v_words_4) - LENGTH(REPLACE(v_words_4, ' ', '')) INTO v_word_conter;
		WHILE i <= v_word_conter DO
			SELECT SUBSTRING_INDEX(v_words_4, " ", i + 1) INTO v_token_word;
			SELECT SUBSTRING_INDEX(v_token_word, " ", -1) INTO v_token_word;
			
			SELECT COUNT(*) INTO v_is_stopword FROM stopwords WHERE `value` = v_token_word;
			IF v_is_stopword = 0 THEN
				IF result = "" THEN
					SET result = v_token_word;
				ELSE
					SET result = CONCAT(result,' ',v_token_word);
				END IF;
			END IF;
			
			SET i = i + 1;
		END WHILE;
		
		RETURN result;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_pengenalan_pola` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pengenalan_pola`(IN v_id_inbox INT, IN v_chat_id VARCHAR(50), IN v_msg TEXT, IN v_msg_type VARCHAR(100))
sp: BEGIN
        DECLARE v_perm INT;
        DECLARE v_perm_database INT;
        DECLARE v_check_answered INT;
        DECLARE v_check_inproses INT;
        DECLARE v_check_temp_menu INT;
        DECLARE v_check_temp_db INT;
        DECLARE v_flag INT;
        DECLARE v_catch INT;
        DECLARE v_threshold FLOAT;
        DECLARE v_db_count INT;
        DECLARE v_id_database INT;
        DECLARE i INT DEFAULT 0;
        DECLARE k INT DEFAULT 0;
        DECLARE v_ranking INT DEFAULT 1;
        DECLARE v_reply TEXT DEFAULT "";
        DECLARE final_words TEXT;
        DECLARE v_alias_database VARCHAR(255);
        DECLARE v_login_info VARCHAR(50) DEFAULT "true";
    
        -- cek info login akun
        -- SELECT checkLogin(v_chat_id) INTO v_login_info;

        -- cek status pesan
        SELECT IFNULL(COUNT(1),0) INTO v_check_inproses FROM tb_value_history WHERE chat_id = v_chat_id AND flag = 0; -- status apakah user masih memiliki pesan status diproses
        SELECT IFNULL(COUNT(1),0) INTO v_check_answered FROM tb_value_history WHERE chat_id = v_chat_id AND flag = 1; -- status apakah semua pesan user telah dijawab
        SELECT IFNULL(COUNT(1),0) INTO v_check_temp_menu FROM tb_temp_menu WHERE chat_id = v_chat_id; -- status apakah user memiliki hasil pencarian menu
        SELECT IFNULL(COUNT(1),0) INTO v_check_temp_db FROM tb_temp_database WHERE chat_id = v_chat_id; -- status apakah user masih berada di tingkatan menu

        -- mendapatkan threshold dan catch (jumlah menu yg ditampilkan)
        SELECT `value` INTO v_threshold FROM tb_setting WHERE setting = "threshold";
        SELECT `value` INTO v_catch FROM tb_setting WHERE setting = "catch"; -- batas menu yang diambil berdasarkan data menu yang telah difilter threshold
                
        IF v_check_inproses = 0 AND v_check_answered = 0 THEN -- cek user tidak memiliki pesan yg diproses dan yg telah dijawab
            IF v_msg_type = "text" THEN
                IF LOWER(v_msg) = "/start" THEN
                    SET v_reply = "Hai! Selamat datang di Bot Pintar Driver. Berikut adalah layanan-layanan yang tersedia pada Bot Pintar Driver. Silakan memilih salah satu layanan berikut dengan ketik nomor urut layanan. Selamat mencoba!\n\n";
                    -- reset hasil pencarian menu sebelumnya
                    DELETE FROM tb_temp_menu WHERE chat_id = v_chat_id;
                    DELETE FROM tb_temp_database WHERE chat_id = v_chat_id;
                    
                    -- mendapatkan jumlah database
                    SELECT COUNT(*) INTO v_db_count FROM tb_database;
                    WHILE k < v_db_count DO
                        SELECT id_database, alias_database INTO v_id_database, v_alias_database FROM tb_database ORDER BY id_database LIMIT k,1;
                        
                        -- cek permission user
                        -- SELECT checkPermissionDatabase(v_chat_id, v_id_database, v_login_info) INTO v_perm_database;

                        -- 0=login, 3=register, 4=logout
                        -- IF v_perm_database = 1 AND v_id_database != 1 AND v_id_database != 2 AND v_id_database != 3 THEN
                            INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, v_id_database, v_ranking);
                            IF v_reply = "Hai! Selamat datang di Bot Pintar Driver. Berikut adalah layanan-layanan yang tersedia pada Bot Pintar Driver. Silakan memilih salah satu layanan berikut dengan ketik nomor urut layanan. Selamat mencoba!\n\n" THEN
                                SET v_reply = CONCAT(v_reply, "[Menu Utama]\n", v_ranking ,". ", v_alias_database ,"\n");
                            ELSE
                                SET v_reply =  CONCAT(v_reply, v_ranking, ". ", v_alias_database, "\n");
                            END IF;
                            
                            SET v_ranking = v_ranking + 1;
                        -- END IF;

                        SET k = k + 1;
                    END WHILE;

                    -- IF v_login_info = "true" THEN
                    --     INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, 3, v_ranking);
                    --     SET v_reply =  CONCAT(v_reply,"\n[Sistem]\n", v_ranking ,". Logout");
                    -- ELSE
                        INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, 1, v_ranking);
                        INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, 2, v_ranking+1);
                        SET v_reply =  CONCAT(v_reply,"\n[Sistem]\n", v_ranking ,". Login\n", v_ranking+1 ,". Register");
                    -- END IF;
                    
                    INSERT INTO tb_outbox (id_inbox, msg, chat_id, flag, msg_type) VALUES (v_id_inbox, v_reply, v_chat_id, 1, 'text');
                ELSEIF LOWER(v_msg) = "menu" THEN
                    -- reset hasil pencarian menu sebelumnya
                    DELETE FROM tb_temp_menu WHERE chat_id = v_chat_id;
                    DELETE FROM tb_temp_database WHERE chat_id = v_chat_id;
                    
                    -- mendapatkan jumlah database
                    SELECT COUNT(*) INTO v_db_count FROM tb_database;
                    WHILE k < v_db_count DO
                        SELECT id_database, alias_database INTO v_id_database, v_alias_database FROM tb_database ORDER BY id_database LIMIT k,1;
                        
                        -- cek permission user
                        -- SELECT checkPermissionDatabase(v_chat_id, v_id_database, v_login_info) INTO v_perm_database;

                        -- 0=login, 3=register, 4=logout
                        -- IF v_perm_database = 1 AND v_id_database != 1 AND v_id_database != 2 AND v_id_database != 3 THEN
                            INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, v_id_database, v_ranking);
                            IF v_reply = "" THEN
                                SET v_reply = CONCAT("[Menu Utama]\n", v_ranking ,". ", v_alias_database ,"\n");
                            ELSE
                                SET v_reply =  CONCAT(v_reply, v_ranking, ". ", v_alias_database, "\n");
                            END IF;
                            
                            SET v_ranking = v_ranking + 1;
                        -- END IF;

                        SET k = k + 1;
                    END WHILE;

                    -- IF v_login_info = "true" THEN
                    --     INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, 3, v_ranking);
                    --     SET v_reply =  CONCAT(v_reply,"\n[Sistem]\n", v_ranking ,". Logout");
                    -- ELSE
                        INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, 1, v_ranking);
                        INSERT INTO tb_temp_database (chat_id, id_database, ranking) VALUES (v_chat_id, 2, v_ranking+1);
                        SET v_reply =  CONCAT(v_reply,"\n[Sistem]\n", v_ranking ,". Login\n", v_ranking+1 ,". Register");
                    -- END IF;
                    
                    -- mengirim pesan balasan ke user
                    INSERT INTO tb_outbox (id_inbox, msg, chat_id, flag, msg_type) VALUES (v_id_inbox, v_reply, v_chat_id, 1, 'text');
                ELSEIF (v_check_temp_menu > 0 OR v_check_temp_db > 0) AND (SELECT (SELECT REGEXP_REPLACE((SELECT foldingPunctuation(v_msg)), '[[:space:]]+', '')) REGEXP "^[0-9]+$") = 1 THEN
                    INSERT INTO tb_outbox (id_inbox, msg, chat_id, flag, msg_type) VALUES (v_id_inbox, 'Masuk ke Sub Pemilihan Menu', v_chat_id, 1, 'text');
                    -- CALL sp_sub_pemilihan_menu(v_check_temp_db, v_check_temp_menu, v_chat_id, v_login_info, v_msg, v_id_inbox);
                ELSE
                    -- reset hasil pencarian menu sebelumnya
                    DELETE FROM	tb_temp_menu WHERE chat_id = v_chat_id;
                    DELETE FROM	tb_temp_database WHERE chat_id = v_chat_id;

                    SET @reply_menu = "";
                    CALL sp_sub_nlp(v_msg, v_chat_id, v_catch, v_threshold);
                    -- IF v_login_info = "true" THEN
                    -- 	CALL sp_sub_nlp(v_msg, v_chat_id, v_catch, v_threshold);
                    -- 	SELECT @reply_menu;
                    -- END IF;
                    
                    -- mengirim pesan balasan ke user
                    IF @reply_menu = "" THEN
                        INSERT INTO tb_outbox (id_inbox, msg, chat_id, flag, msg_type) VALUES (v_id_inbox, "Maaf, bot tidak mengerti yang kamu maksud. Mohon ketik 'menu' atau nama menu secara spesifik supaya lebih cepat.", v_chat_id, 1, 'text');
                    ELSE 
                        INSERT INTO tb_temp_menu (chat_id, final_word, ranking, score) VALUES (v_chat_id, final_words, (@ranking := @ranking + 1), 0);
                        SELECT CONCAT(@reply_menu, "\n[Sistem]",  "\n", @ranking, ". Tampilkan menu selengkapnya\n") INTO @reply_menu;
                        INSERT INTO tb_temp_menu (chat_id, final_word, ranking, score) VALUES (v_chat_id, final_words, (@ranking := @ranking + 1), 0);
                        SELECT CONCAT(@reply_menu, @ranking, ". Kembali ke menu sebelumnya\n") INTO @reply_menu;
                        INSERT INTO tb_outbox (id_inbox, msg, chat_id, flag, msg_type) VALUES (v_id_inbox, @reply_menu, v_chat_id, 1, "text");
                    END IF;
                END IF;
            ELSE
                INSERT INTO tb_outbox (id_inbox, msg, chat_id, flag, msg_type) VALUES (v_id_inbox, "Maaf, bot tidak mengerti yang kamu maksud. Mohon ketik 'menu' atau nama menu secara spesifik supaya lebih cepat.", v_chat_id, 1, 'text');
            END IF;
        -- ELSE -- cek user memiliki pesan yg diproses atau yg telah dijawab
            -- CALL sp_pemrosesan_layanan(v_msg,v_msg_type,v_id_inbox,v_chat_id);
        END IF;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sub_nlp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sub_nlp`(IN v_msg TEXT, IN v_chat_id VARCHAR(50), IN v_catch INT, IN v_threshold float)
sp: BEGIN
		DECLARE final_words TEXT;

		-- NLP
		SELECT tp_nlp(v_msg) INTO final_words;
		
		-- simpan ke tb_temp_menu
		SET @ranking = 0; 
		INSERT INTO tb_temp_menu (chat_id, final_word, tb_temp_menu.id_menu, ranking, score)
			SELECT v_chat_id, final_words, id_menu, (@ranking := @ranking + 1), score
				FROM (
					SELECT distinct menu.id_menu, MATCH (keyword_menu) AGAINST (final_words) AS score 
						FROM menu 
						JOIN tb_database ON tb_database.`id_database` = menu.`id_database`
						WHERE (MATCH (keyword_menu) AGAINST (final_words)) >= v_threshold
							AND LOWER(title) != "login"
							AND LOWER(title) != "logout"
							AND LOWER(title) != "register"
							AND menu.is_public = 1
							ORDER BY score DESC, keyword_menu ASC 
							LIMIT v_catch
				) menu;	
								
		if @ranking = 0 and v_threshold > 0.0 then 
			SET @reply_menu = "Bot tidak terlalu mengerti maksud kamu. Bot telah meningkatkan toleransi kesalahan. Mungkin salah satu menu di bawah ini adalah yang kamu maksud\n\n";
		else 
			SET @reply_menu = "Berikut adalah hasil dari pencarian menu layanan\n\n";
		end if;
				
		rethreshold: while @ranking = 0 do
			set v_threshold = v_threshold-1;
			INSERT INTO tb_temp_menu (chat_id, final_word, tb_temp_menu.id_menu, ranking, score)
				SELECT v_chat_id, final_words, id_menu, (@ranking := @ranking + 1), score
					FROM (
						SELECT DISTINCT menu.id_menu, MATCH (keyword_menu) AGAINST (final_words) AS score 
							FROM menu 
							JOIN tb_database ON tb_database.`id_database` = menu.`id_database`
							WHERE (MATCH (keyword_menu) AGAINST (final_words)) >= v_threshold
								AND LOWER(title) != "login"
								AND LOWER(title) != "logout"
								AND LOWER(title) != "register"
								AND menu.is_public = 1
								ORDER BY score DESC, keyword_menu ASC 
								LIMIT v_catch
					) menu;	
					
			IF v_threshold <= 0.0 AND @ranking = 0 THEN
				SET @reply_menu = "";
				LEAVE rethreshold;
			end if;
		end while;
				
		-- FTS dan Ngram sebagai reply message
		SET @ranking = 0;  
		SET @alias_database = "";
		set v_catch = v_catch+1;
		
		SELECT IF(
				@reply_menu = "Berikut adalah hasil dari pencarian menu layanan\n\n" or @reply_menu = "Bot telah meningkatkan toleransi ketidakcocokan pencarian input kamu terhadap menu layanan. Mungkin salah satu menu di bawah ini adalah menu yang kamu maksud\n\n", 
				(@reply_menu := CONCAT(@reply_menu,"[",alias_database,"]\n",(@ranking := @ranking + 1),". ",title,"\n")), 
				IF(
					@alias_database = alias_database, 
					(@reply_menu := CONCAT(@reply_menu,(@ranking := @ranking + 1),". ",title,"\n")),
					(@reply_menu :=  CONCAT(@reply_menu,"\n[",alias_database,"]\n",(@ranking := @ranking + 1),". ",title,"\n"))
				)
			) AS reply,
			(@alias_database := alias_database) AS alias_database
			FROM tb_temp_menu 
			JOIN menu ON menu.id_menu = tb_temp_menu.id_menu
			JOIN tb_database ON tb_database.id_database = menu.id_database
			WHERE chat_id = v_chat_id
			ORDER BY ranking ASC
			LIMIT v_catch;
			
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 22:32:05
