Chatbot Input Pattern Recognition Application on MySQL
==========================

Application for the pattern recognition process using the N-gram and Full-Text algorithms implemented in PL SQL in MySQL


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

Pattern Recognition test
======
* Import `backup_test_sql` to your database
* Run sql query from `query_to_test_sql`

Usage on Chatbot:
======
* Active MySQL 8.0
* Set webhook 
*	Create a function to receive input from the user and insert it into the tb_inbox table
*	Start event inbox_looping_db_1 which calls sp_pengenalan_pola to process user messages, reply messages can be seen in the tb_outbox table 
*	Create a function to retrieve messages from tb_outbox and send to the user
