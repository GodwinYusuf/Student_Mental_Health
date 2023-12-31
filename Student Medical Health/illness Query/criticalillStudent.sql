USE EMPLOYEES;

SELECT * FROM STMH;

/** Author : @godwin.yusuf@outlook.com
	Date:  18-12-2023
	Title: Student Mental Health (Project)
    Objective:  Exploratory Analysis On Anxiety Students.
    
**/

-- Querying for student with all illness 
SELECT 
    student_id, gender, age, grade, depressed, anxiety, panic_attack, specialist_treatment
FROM
    (SELECT 
        Student_id, gender, gender, age, grade,
            COUNT(CASE
                WHEN DEPRESSION = 'YES' THEN student_id
                ELSE NULL
            END) AS Depressed,
            COUNT(CASE
                WHEN anxiety = 'YES' THEN student_id
                ELSE NULL
            END) AS Anxiety,
            COUNT(CASE
                WHEN Panic_attack = 'YES' THEN student_id
                ELSE NULL
            END) AS Panic_Attack,
            COUNT(CASE
                WHEN Specialist_treatment = 'YES' THEN student_id
                ELSE NULL
            END) AS Specialist_treatment
    FROM
        STMH
    GROUP BY student_id, gender, age, grade,) as illness
WHERE
    depressed >= 1 AND anxiety >= 1
        AND panic_attack >= 1
        AND specialist_treatment >= 1;
