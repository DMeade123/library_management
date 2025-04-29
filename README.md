Normalization Explanation - 
- In order to normalize the table, I had made four separate entities. Originally the table would have consisted of redundant data.
- The table would have had repeating authors and members across multiple tables.
- By separating authors and using the primary key of the authors table as a referenced foreign key in another table, ensure no redundant data across multiple tables.
- Also separting members and using the primary key of the members table as a referenced foreign key in another table ensure no redundant data.
- In order to reach 1NF I had ensure any author or member with multiple books had a row that was unique and each column contained one value per row.
- In order to reach 2NF I had to ensure no partial dependencies existed and table is already in 1NF; for example each table solely depends directly on the primary key.
- In order to reach 3NF I had to ensure no transitive dependencies existed and table was already in 2NF; for example each tables non-key columns do not depend on another non-key column.

Run Script Instructions - 
- To run script locally, open psql, then call path which is \i C:\Users\dmead\QuotomProjects\database.sql
- If you copy my repo, then open psql, then call path on local system; overall run database.sql script
- This script will create the 3NF database and all of its tables; then use the join query at the end to show current books out on rent, who is renting, and when the return date is.
  
