# sql-challenge
![sql](sql.png)

## Submission
For the assignment considering the sizes of the tables, I only opted to created primary keys, foreign keys and 1 composite primary key (due to non unique values). I attempted to model my database for each use case provided in the HW with the dataset size in consideration. If this hw assignment had dealt with larger datasets approaching 50k rows or above in any given table, it would have been faster to duplicate column values and build clustered indexes to allow for faster joins as well as more flexibility for data science needs.

## DISCLAIMER:
I did have to delete my repository and recreate it since I inadvertantly committed my username/password for my postgres server. Due to that my # of commits is low but if you need me to do a bunch of random commits just say the word. My wife will definitely back me up on this but I'm all about commitment.

## ERD
Here is the ERD for my database model:
![ERD](/EmployeeSQL/images/ERD.PNG)

## Schema/SQL
Here are my schema/sql files respectively:
[Schema File](/EmployeeSQL/schema.sql),
[Query File](/EmployeeSQL/query.sql)

## Bonus
Here is the jupyter notebook for the bonus section:
[Bonus File](/EmployeeSQL/bonus.ipynb)

And here is my histogram for the bonus section of the homework:
![histogram](/EmployeeSQL/images/histogram.PNG)