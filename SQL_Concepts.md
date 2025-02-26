# SQL Concepts You Need To Know Before Jumping Into Leetcoding


### Order of Statments
This is the order in which the statements will be written.

```sql
SELECT column_names
FROM table_name
WHERE condition
GROUP BY column_names
HAVING condition
ORDER BY column_names;
```

### Order of Execution
:exclamation: :exclamation: If you don't know this your logic will never land clearly. For instance **group by** will only be applied to columns which fit the **where** criteria.

1️⃣	**FROM**	Identifies the table(s) to retrieve data from.
</br>
2️⃣	**WHERE**	Filters rows based on a condition.
</br>
3️⃣	**GROUP BY**	Groups rows with the same values in specified columns.
</br>
4️⃣	**HAVING**	Filters groups after aggregation.
</br>
5️⃣	**SELECT**	Chooses which columns to return.
</br>
6️⃣	**ORDER BY**	Sorts the result set.

### Joins

:wrench: This is where **sets** concept from maths will help you. 

![image](https://github.com/user-attachments/assets/89e38d2d-82ff-47f9-b4b5-e81cc8b00c47)
</br>
[Source](https://www.linkedin.com/pulse/understanding-sql-joins-left-join-right-union-explained-sharma-ntrec/)
</br>

:wrench: Remembering one join is the key to remember every join. 
- JOIN Returns common data between the two columns
- LEFT JOIN  Returns data from left but only the common data between the two tables from the right.
- RIGHT JOIN Opposite of the left join
- FULL OUTER JOIN - Returns everything which means you will be seeing some nulls. :mag:

### Group By

- You group whatever repeats but thats easy said than done.
- If you group whatever repeats, then you need to aggregate the rest and this is where count, sum, and average comes into the picture
- If I want to know what was sold on **2020-05-30** and how much, then I can group by sell_date but what should I do with products?
- I can use **group_concat** which is ideal when we want to combine string or non-numeric rows.
  ![image](https://github.com/user-attachments/assets/ac34466e-235f-4f2e-a719-3ab533d97b6a)

[Source](https://leetcode.com/problems/group-sold-products-by-the-date/description/)

```sql
SELECT sell_date,
COUNT(distinct(product)) as num_sold,
GROUP_CONCAT(DISTINCT(product)) as products
FROM activities
GROUP BY sell_date;
```


  ### Sub queries

  This is where most people stop. I did too but I came when I learned this

  - For a table that contains salaries, I want to compare employees that have salaries higher than the **average salary**
  - You have 10 salaries that have to be compared against a single average value, HOW?!
  - :bulb: That is where we use sub queries
    -- Selecting all columns from the employees table 
``` sql
SELECT * 
FROM employees 
WHERE salary > (SELECT avg(salary) FROM employees);
``` 

  ### Common Table Expressions (CTEs)

- In subquery, there was a single average, what if we have multiple departments with each having its own average?
- :bulb: We will use CTEs.

```sql
  WITH DeptAvgSalary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.employee_id, e.name, e.salary, d.avg_salary, e.department_id
FROM employees e
JOIN DeptAvgSalary d ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;

  ```

### Window Functions

These are used to create windows overs a table
#### Use Cases
- Running Totals or Averages (Addings sales at each row)

  ```sql
   SELECT customer_id, amount_due, SUM(amount_due) OVER(order by customer_id) as running_sums FROM billing;
```

</br>

- What comes after or before a value?
```sql
SELECT DISTINCT num ConsecutiveNums from (

SELECT id, NUM, LAG(num) OVER(ORDER BY id) laging, LEAD(num) OVER(ORDER BY id) leader FROM logs
)
t
WHERE (laging = num  AND num = leader)
;

```
If this helped you, please :star: and follow. 
   

  

  


