# MySQL Portfolio Project

## In this project, I have used multiple joins

- to combine multiple tables (Users, Posts and Comments) to find what comments are made.

![image](https://github.com/user-attachments/assets/e3e00bf6-d3c2-45b0-94ab-757971e61cd4)


- to find what badges are earned by each user and also utilized group_concat to find all the badges in a single row

  ![image](https://github.com/user-attachments/assets/de1ac147-c88f-41c1-972c-167a42b901ed)


## I have used subqueries to find

- Which user has the highest reputation? Because we need to compare each user against the highest score
  

## I have also used CTEs combined with JOINS and Window Functions

- to find averages of users and rank them.
- Data for this table was spread across 2 tables and for ranking I used dense_rank()

  ![image](https://github.com/user-attachments/assets/28a68538-7566-411e-8c05-2ddd62bd5a04)

  ## Other useful insights

  ### What tags are in each post?
  - I used concat to match the text in title of each posts with tags.
  - tags and posts are different tables
    

  ![image](https://github.com/user-attachments/assets/38021f3f-acc7-4926-8c12-c893ab178aa7)



  
