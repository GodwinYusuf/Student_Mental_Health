/** Author : @godwin.yusuf@outlook.com
	Date:  18-12-2023
	Title: Student Mental Health (Project)
    Objective:  Exploratory Analysis On Panic Attack Students.
    
**/

SELECT 
    *
FROM
    STMH;

/** Gender distribution of depressed people, we found out that all married people are depressed
with women FOUR TIMES as more as men **/

-- @Total Number of Panic_attack Students

SELECT 
    GENDER,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN GENDER
        ELSE NULL
    END) AS Panic_attack
FROM
    STMH
GROUP BY 1;

-- @Total Number of none Panic_attack Students
SELECT 
    GENDER,
    COUNT(CASE
        WHEN Panic_attack = 'NO' THEN GENDER
        ELSE NULL
    END) AS Panic_attack
FROM
    STMH
GROUP BY 1;

-- @Panic_attack and Married Students
SELECT 
    GENDER, `Marital status` as Marital_status,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN GENDER
        ELSE NULL
    END) AS Panic_attack
FROM
    STMH
WHERE
    `MARITAL STATUS` = "YES"
GROUP BY 1,2 ;


-- @Panic_attack and not married.
SELECT 
    GENDER, `MARITAL STATUS`,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN GENDER
        ELSE NULL
    END) AS NO_Panic_attack
FROM
    STMH
WHERE
    `MARITAL STATUS` = "NO"
GROUP BY 1,2 ;


-- @Age Distribution table of @Panic_attack students
SELECT 
    Gender,
    Age,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN gender
        ELSE NULL
    END) AS Panic_attack
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
        WHEN Panic_attack= 'YES' THEN gender
        ELSE NULL
    END) > 0
ORDER BY 2;

-- @Age Distribution of student @Panic_attack that are married.
SELECT 
    Gender,`Marital status`,
    Age,
    COUNT(CASE
        WHEN Panic_attack = 'yes' THEN gender
        ELSE NULL
    END) AS No_Panic_attack
FROM
    stmh
WHERE `MARITAL STATUS` = "YES"
GROUP BY 1 , 2, 3
Having COUNT(CASE
        WHEN Panic_attack = 'yes' THEN gender
        ELSE NULL
    END)  >0
ORDER BY 3;

-- @Course taken by students that are married.
SELECT 
    Course,
    Gender,
    COUNT(CASE
        WHEN Panic_attack = 'yes' THEN gender
        ELSE NULL
    END) AS Panic_attack
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
    WHEN Panic_attack = 'yes' THEN gender
    ELSE NULL
END) > 0
ORDER BY 1;

-- @Panic_attack students by @year study.
SELECT 
    `year Study`,
    COUNT(CASE
        WHEN Panic_attack = 'yes' THEN gender
        ELSE NULL
    END) AS Panic_attack_YearCount
FROM
    stmh
GROUP BY 1
;

-- @Panic_attack student @gender distribution by @year study
SELECT 
    Gender,`year Study`,
    COUNT(CASE
        WHEN Panic_attack = 'yes' THEN gender
        ELSE NULL
    END) AS Panic_attack_YearCount
FROM
    stmh
GROUP BY 1,2
ORDER BY 2
;

-- Count of @Panic_attack students from out date time column
SELECT 
    `date`, Gender, `year study`,
    COUNT(CASE
        WHEN Panic_attack = 'yes' THEN `date`
        ELSE NULL
    END) AS No_Panic_attack
FROM
    stmh
GROUP BY 1,2,3
HAVING COUNT(CASE
    WHEN Panic_attack = 'yes' THEN `date`
    ELSE NULL
END) > 0
 ORDER BY 4 desc;