
	/*
		1- Create Database
	*/
	CREATE DATABASE LibraryProject;
	GO
	USE LibraryProject;

	/*
		2- Create Tables
	*/

	CREATE TABLE reader
	(
		ssn int IDENTITY (1,1) NOT NULL PRIMARY KEY,
		firstname VARCHAR(50) NOT NULL,
		lastname VARCHAR(50) NOT NULL,
		country VARCHAR(50) NOT NULL,
		city VARCHAR(50) NOT NULL,
		street VARCHAR(50) NOT NULL,
		phone INT NOT NULL,
	);
	

	CREATE TABLE book
	(
		book_id INT PRIMARY KEY IDENTITY(1,1),
		ISBN VARCHAR(50) NOT NULL,
		name VARCHAR(50) NOT NULL,
		author VARCHAR(50) NOT NULL,
		publish_name VARCHAR(50)NOT NULL,
		price INT NOT NULL,
		publish_date DATE  NOT NULL,
		amount INT NOT NULL,
	

	);

	ALTER TABLE book

	DROP COLUMN publish_name;

	CREATE TABLE borrowbook
	(
		borrow_id INT PRIMARY KEY IDENTITY(1,1),
		reader_ssn INT NOT NULL ,
		book_id INT NOT NULL ,
		start_date  DATE NOT NULL , 
		return_date DATE NOT NULL , 
		constraint Fk_borrowing_reader FOREIGN KEY  (reader_ssn )
			REFERENCES reader (ssn) 
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	
		constraint FK_borrowing_book FOREIGN KEY  (book_id)
			REFERENCES book (book_id) 
			ON UPDATE CASCADE
			ON DELETE CASCADE
	
	);

	CREATE TABLE returnbook
	(
		return_id INT PRIMARY KEY IDENTITY(1,1),
		reader_ssn INT NOT NULL ,
		book_id INT NOT NULL ,
		return_date DATE NOT NULL , 
		constraint fk_readerReturn FOREIGN KEY  (reader_ssn)
			REFERENCES reader (ssn),
		constraint fk_returnBook FOREIGN KEY  (book_id)
			REFERENCES book (book_id) 
		
	
	);

	/*
		3-Filling Tables
	*/

	/*
		Filling reader Table
	*/
	INSERT INTO reader(firstname, lastname ,country,city,street,phone)
	VALUES ('Mohamed','Sadek','Egypt','Alexandria','15','0123456789');

	INSERT INTO reader(firstname, lastname ,country,city,street,phone)
	VALUES ('Ibrahim','Maher','Egypt','Alexandria','16','0198765432');

	INSERT INTO reader(firstname, lastname ,country,city,street,phone)
	VALUES ('Abd','El-Hamid','Egypt','KafrElShiekh','19','011456286');

	INSERT INTO reader(firstname, lastname ,country,city,street,phone)
	VALUES ('Sha3ban','El-Bay','Germany','Berlin','8','0112233445');

	INSERT INTO reader(firstname, lastname ,country,city,street,phone)
	VALUES ('Mostafa','Ahmed','Sudan','Khartoum','55','0123456789');

	/* Displaying The readers Data */
	SELECT * FROM reader
	
	/* Filling Book Table */
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-91950-476-9','Louisa May Alcott','Little Women',150,'2000-11-3',1);
	
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-91950-466-4','Khaled Hosseini','The Kite Runner',30,'1999-3-4',6);   
    
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-87740-463-4','George Orwell','1984',50,'1881-8-8',9); 
    
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-76040-420-4','Philip Pullman','The Golden Compass',100,'1919-7-5',3); 
    
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-75010-700-7','Salman Rushdie','The Satanic Verses',80,'1970-8-1',2); 
    
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-75040-604-7','Miguel de Cervantes','Don Quixote',55,'1998-11-2',7);

    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-45040-004-1','J.R.R. Tolkien','The Lord of the Rings',35,'1995-5-6',6);
	
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-47000-207-8','Carlos Ruiz Zafon','The Shadow of the Wind',25,'1994-4-1',12);
	
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-32140-304-4','James Joyce','Ulysses',200,'1888-9-8',20);
	
    INSERT INTO book(ISBN, author, name, price, publish_date, amount)
    VALUES ('3-35040-340-0','Leo Tolstoy','War and Peace',250,'1990-7-7',25);
	/* Displaying Book Data */
	SELECT * FROM book

    /* Filling Borrowed Books Data */
    INSERT INTO borrowbook(reader_ssn, book_id, start_date, return_date)
    VALUES (1,8,'2020-5-1','2020-5-3');
	
	INSERT INTO borrowbook(reader_ssn, book_id, start_date, return_date)
    VALUES (2,9,'2020-5-5','2020-5-7');
	
	INSERT INTO borrowbook(reader_ssn, book_id, start_date, return_date)
    VALUES (3,10,'2020-2-7','2020-2-12');
	
	INSERT INTO borrowbook(reader_ssn, book_id, start_date, return_date)
    VALUES (4,11,'2019-6-3','2019-6-10');
	
	INSERT INTO borrowbook(reader_ssn, book_id, start_date, return_date)
    VALUES (5,13,'2020-7-8','2020-9-9');
	/* Displaying Borred Books Data */
	SELECT * FROM borrowbook

	/* Filling Returned Books Data */
	INSERT INTO returnbook(reader_ssn, book_id,return_date)
    VALUES (1,1,'2020-5-3');

	INSERT INTO returnbook(reader_ssn, book_id,return_date)
    VALUES (2,9,'2020-5-7');
	
	INSERT INTO returnbook(reader_ssn, book_id,return_date)
    VALUES (3,10,'2020-2-15');
	
	INSERT INTO returnbook(reader_ssn, book_id,return_date)
    VALUES (4,11,'2020-1-1');
	
	INSERT INTO returnbook(reader_ssn, book_id,return_date)
    VALUES (5,13,'2020-9-9');
	/* Displaying Returned Books Data */
	SELECT * FROM returnbook

	/***************************************************************************************/
	/*4- Select Statements using Different Functions*/

	/* 1- What is the number of borroed books? */

	SELECT COUNT(*) FROM borrowbook

	/* 2- What is the amount of books in the library? */

	SELECT SUM(amount) FROM book

	/* 3- What is the book have the biggest number of coppies? */

	SELECT * FROM book WHERE amount IN (SELECT MAX(amount) FROM book );

	/* 4- What is the book has the least number of coppies? */

	SELECT * FROM book WHERE amount IN (SELECT MIN(amount) FROM book  );

	/* 5- What is the average number of all the books? */

	SELECT AVG(book_id) FROM book 

	/* 6- I need to make all the books names in lowercases letters? */

	SELECT LOWER(book.name) FROM book

	/* 7. I need to make all the books names in Uppercases letters? */

	SELECT UPPER(book.name) FROM book

	/* 8- What is the date in days of each borrow operation ? */

	SELECT DAY(borrowbook.start_date) FROM borrowbook

	/* 9- What is the date in months of each borrow operation ? */

	SELECT MONTH(borrowbook.start_date) FROM borrowbook

	/* 10. What is the date in years of each borrow operation ? */
	
	SELECT YEAR(borrowbook.start_date) FROM borrowbook

	/* 11- What is the Length of the books ISBN? */

	SELECT LEN(book.ISBN) FROM book

	/* 12- How to re-format the phone numbers of the readers? */

	SELECT FORMAT(reader.phone, '0##-###-###-##') FROM reader

	/* 13- How to set the the price of the books in float? */

	SELECT CONVERT(float, book.price)FROM book

	/* 14- How to know if the books' ISBN is NULL or NOTNULL? */

	SELECT ISNULL(NULL, book.ISBN) FROM book

	/* 15- How to contact the books names with authoer name by specific 
	string like 'the writer is '? */

	SELECT CONCAT(book.name,' the writer is ' ,book.author)FROM book

	/* 16- What is the books that are rare and have less than 2 copies? */

	SELECT IIF(book.amount < 2, 'Rare', 'Many') FROM book 

	/* 17- How to make the books' ISBN shorter and replace the rest with "****"? */

	SELECT STUFF(book.ISBN, 8, 13, '****') FROM book

	/* 18- How to reverse the readers' Countries? */

	SELECT REVERSE(reader.country)FROM reader

	/* 19. How to put '-' between authers' names? */

	SELECT REPLACE(book.author,' ', '-')FROM book

	/* 20. How to return the prices as a string? */

	SELECT STR(book.price)FROM book

	/*******************************************************************************************/

	/* 5- Select Statements using Sub Query */		

	
	/* 1-Select all readers that done a borrow process afeter "2019-9-9" */ 

	SELECT * FROM reader WHERE firstname IN (SELECT firstname FROM borrowbook WHERE start_date > '2019-9-9') ;

	/* 2-Select all the books that thier copies are more than 5 copy */ 

	SELECT * FROM book WHERE book_id IN (SELECT book_id FROM book WHERE amount > 5) ;

	/* 3-Select the number phones of readers from Alexandria city  */ 

	SELECT phone FROM reader WHERE phone IN (SELECT phone FROM reader WHERE city = 'Alexandria') ;

	
	/********************************************************************************************/
		
	/* 6- Select Statements using Count and Group Functions */	
		
	
	/* 1-Count function: selecting how many books are borred by reader whose sssn =reader_ssn */

	SELECT reader_ssn, MAX(start_date) FROM borrowbook GROUP BY reader_ssn
	
	/* 2-Group by function: selecting the numder of books borred for auther */

	SELECT COUNT(author) FROM book WHERE author='George Orwell';





	/********************************************************************************************/
	/* 7- Select Statements using different joins */


	/*1- Lift Join*/
	SELECT  reader.firstname,reader.lastname,borrowbook.start_date,borrowbook.return_date
	FROM reader LEFT JOIN borrowbook
	ON reader.ssn=borrowbook.reader_ssn;

	/*2- Right Join*/
	SELECT  reader.firstname,reader.lastname,borrowbook.start_date,borrowbook.return_date
	FROM reader RIGHT JOIN borrowbook
	ON reader.ssn=borrowbook.reader_ssn;


	/*3- Outer Join*/
	SELECT  reader.firstname,reader.lastname,borrowbook.start_date,borrowbook.return_date
	FROM reader 
	FULL OUTER JOIN borrowbook
	ON reader.ssn=borrowbook.reader_ssn
	ORDER BY borrowbook.reader_ssn;


	/*4- Inner join*/
	SELECT  reader.firstname,reader.lastname,borrowbook.start_date,borrowbook.return_date
	FROM reader 
	INNER JOIN borrowbook
	ON reader.ssn=borrowbook.reader_ssn
	ORDER BY borrowbook.reader_ssn;

	/* 5-Inner Join */
	SELECT  reader.firstname,reader.lastname,borrowbook.start_date,borrowbook.return_date
	FROM reader 
	INNER JOIN borrowbook
	ON reader.ssn=borrowbook.reader_ssn
	ORDER BY borrowbook.book_id;


	/********************************************************************************************/
	/* 8- Update Statement  */


	/* 1. Updating the price of the book of id = 7 */

	UPDATE book SET price = 1050 WHERE book_id = 8;

	/* 2. Updating the the phone of the reader of ssn=5*/

	UPDATE reader SET phone = '01102564978' WHERE ssn = 5;

	/* 3. Updating the numder of copies of book named 'The Satanic Verses'*/

	UPDATE book SET amount = 0  WHERE name = 'The Satanic Verses';


	/* 4. Updating the return date of book with id=13 */

	UPDATE returnbook SET return_date = '2020-9-10'  WHERE book_id=13;

	/* 5. Updating the start date of borrowing of book with id = 4*/

	UPDATE borrowbook SET start_date='2019-11-12' WHERE book_id = 4;



	/*************************************************************************************/
	/* 9- Delete Statment */
	
	/*1- Delete the book of id=10 form borrowed books */
	DELETE FROM borrowbook WHERE book_id = 10 ;

	/*2- Delete the reader of ssn=3 form borrowing list */
	DELETE FROM borrowbook WHERE reader_ssn = 3;  

	/*3- Delete the book with name 'The Kite Runner' form the books list*/
	DELETE FROM book WHERE name='The Kite Runner';

	/*4- Delete the book with id =5 form the books list*/
	DELETE FROM book WHERE book_id=5;

	/*5- delete the book with auther's name Salman Rushdie for books list*/
	DELETE FROM book WHERE author='Salman Rushdie';
