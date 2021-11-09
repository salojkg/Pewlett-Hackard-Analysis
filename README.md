# Pewlett-Hackard-Analysis
# Overview
The objective of this analysis is to help the Pewlett Hackard (PH) organize their database using SQL. With databse its easy to establisg the relationship between tables and retrive datas more effiecently.  
 
 # Purpose
 
The purpose of this analysis is to create a report that will help Bobby's Manager prepare for the "Silver Tsunami" as many current employyes have reached retirement age.To achieve this we are creating the following tables.
 -  Retirement Titles Tables
 -  Retiring Employees Count by Titles 
 -  Mentorship Eligibility Table 
 ## Environment

    - Postgres and pgAdmin
    
 # Results
 - Title with highest number of employees reaching retirement falls in Senior Engineer.
 - Title with least number falls in Manager.
 - There are no eligbile Managers in the Mentorship program.Most of the Managers are born before 1965 and are retiring soon.
 - Title with highest number of employees eligible for Mentorship programs falls in Senior Staff.
 ![Results](https://user-images.githubusercontent.com/90934630/140844688-d82ea7de-f7ae-45ec-bf6c-ce51d5edb0e3.png)
  
  # Summary
  
  - There are 7 roles and total of 90398 positions to be filled.
   ```
   select sum(count) from retiring_titles ; 
   select count(*) from retiring_titles;
   ```
   - Compared to the number of employees retiring or nearing retirement in the future years the number of employees eligible for mentorship program is very low.
```
      SELECT DISTINCT ON (e.emp_no) e.emp_no,
      d.dept_name,
      de.dept_no,
      e.first_name,
      e.last_name,
      e.birth_date,
      de.from_date,
      de.to_date,
      tl.title
      INTO mentorship_eligibilty_2
      FROM employees as e
      LEFT JOIN dept_emp as de ON e.emp_no = de.emp_no
      LEFT JOIN titles as tl ON e.emp_no = tl.emp_no
      left join departments d on d.dept_no = de.dept_no
      WHERE e.birth_date BETWEEN '01-01-1965' AND '12-31-1965' 
      AND de.to_date = '01-01-9999'
      ORDER BY e.emp_no, tl.to_date DESC;
      select dept_name, count(*) from mentorship_eligibilty_2 
      group by dept_name
      order by dept_name;
 ```
    
To Summarize , most of the employees in PH are eligible for retirement or will be retiring soon. PH needs to accrlarate their hiring and mentorship programs to reduce the impact of this "Silver Tsunami".
