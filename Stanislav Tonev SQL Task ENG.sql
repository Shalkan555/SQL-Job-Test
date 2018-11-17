create table students (id integer PRIMARY KEY, name text, age integer);



INSERT INTO students (id, name, age) VALUES 
	(1, 'Stanislav Tonev', 25),
	(2, 'Ivan Shishkov', 47),
	(3, 'Petko Iordanov', 33),
	(4, 'Viktoria Petkova', 26),
	(5, 'Irina Spasova', 21);

create table friends (id integer PRIMARY KEY, 
						studentsId integer,
						FrName text,
						FOREIGN KEY(studentsId) REFERENCES students(id)
						
						);

INSERT INTO friends (id, studentsId, FrName) VALUES

	(1, 1, 'Viktoria Petkova'),
	(2, 1, 'Ivan Shishkov'),
	(3, 1, 'Petko Iordanov'),
	(4, 2, 'Stanislav Tonev'),
	(5, 2, 'Irina Spasova'),
	(6, 2, 'Petko Iordanov'),
	(7, 3, 'Ivan Shishkov'),
	(8, 3, 'Stanislav Tonev'),
	(9, 3, 'Viktoria Petkova'),
	(10, 3, 'Irina Spasova'),
	(11, 4, 'Stanislav Tonev'),
	(12, 4, 'Petko Iordanov'),
	(13, 4, 'Irina Spasova'),
	(14, 5, 'Viktoria Petkova'),
	(15, 5, 'Hanko Brat');
	

-- // THE_FINISHING_TOUCHES //

-- SHOW ALL THE FRIENDS
select distinct FrName from friends; 


-- SHOW ALL THE FRIENDS OF MY FRIENDS
select students.name, friends.FrName  
from students 
Inner JOIN friends ON (students.id = friends.studentsId)
WHERE students.id!=1;


-- SHOW ALL FRIENDS OF MY FRIENDS, WHO ARE NOT MY FRIENDS
select students.name, friends.FrName 
from students 
Inner JOIN friends ON (students.id = friends.studentsId)
WHERE students.id!=1 and friends.FrName!='Stanislav Tonev';