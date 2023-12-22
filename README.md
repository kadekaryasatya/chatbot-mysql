Aplikasi Pengenalan Pola Inputan Chatbot pada Mesin PL SQL MySQL
==========================

Sebuah aplikasi untuk proses pengenalan pola  menggunakan algoritma N-gram dan Full-Text yang diimplementasikan pada PL SQL di MySQL. 


Project Structure
=================
The project contains two files as:
 * `backup_test_sql`
 * `query_to_test.sql`

 In file `backup_test_sql` is the sql dump of database .
 In file `query_to_test_sql` is the sql query for test. 


Requirements:
=============
* MySQL 8.0 or more

Test pengenalan pola
======
* Import `backup_test_sql` to your database
* Run sql query from `query_to_test_sql`

Usage on Chatbot:
======
* Aktifkan MySQL 8.0
* Set webhook 
*	Buat fungsi untuk menerima input dari user dan masukkan ke tabel tb_inbox 
*	Start event inbox_looping_db_1 yang memanggil sp_pengenalan_pola untuk memproses pesan user, pesan balasan dapat dilihat pada tabel tb_outbox  
*	Buat fungsi untuk mengambil pesan dari tb_outbox dan kirim ke user
