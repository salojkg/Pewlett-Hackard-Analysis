---CREATE RETIREMENT TITLES TABLE
SELECT em.emp_no, em.first_name, em.last_name, tl.title,tl.from_date,tl.to_date
INTO retirements_titles
FROM employees as em
LEFT JOIN titles as tl
ON em.emp_no = tl.emp_no
WHERE em.birth_date BETWEEN '01-01-1952' AND '12-31-1955'
ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirements_titles
ORDER BY emp_no, to_date desc;

--COUNT BY TITLE
SELECT COUNT(*) as count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


--MENTORSHIP ELIGIBILITY TABLE

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tl.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_emp as de ON e.emp_no = de.emp_no
LEFT JOIN titles as tl ON e.emp_no = tl.emp_no
WHERE e.birth_date BETWEEN '01-01-1965' AND '12-31-1965' 
AND de.to_date = '01-01-9999'
ORDER BY e.emp_no, tl.to_date DESC;
