/** Author : @godwin.yusuf@outlook.com
	Date:  19-12-2023
	Title: Student Mental Health (Project)
    Objective:  Exploratory Analysis On Specialist_Treatment Students.
    
**/

SELECT 
    *
FROM
    STMH;

/** Gender distribution of depressed people, we found out that all married people are depressed
with women FOUR TIMES as more as men **/

-- @Total Number of Specialist_Treatment Students

SELECT 
    GENDER,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN GENDER
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    STMH
GROUP BY 1;

-- @Total Number of none Specialist_Treatment Students
SELECT 
    GENDER,
    COUNT(CASE
        WHEN Specialist_Treatment = 'NO' THEN GENDER
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    STMH
GROUP BY 1;

-- @Specialist_Treatment and Married Students
SELECT 
    GENDER, `Marital status` as Marital_status,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN GENDER
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    STMH
WHERE
    `MARITAL STATUS` = "YES"
GROUP BY 1,2 ;


-- @Specialist_Treatment and not married.
SELECT 
    GENDER, `MARITAL STATUS`,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN GENDER
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    STMH
WHERE
    `MARITAL STATUS` = "NO"
GROUP BY 1,2 ;


-- @Age Distribution table of @Specialist_Treatment students
SELECT 
    Gender,
    Age,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN gender
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
        WHEN Specialist_Treatment= 'YES' THEN gender
        ELSE NULL
    END) > 0
ORDER BY 2;

-- @Age Distribution of student @Specialist_Treatment that are married.
SELECT 
    Gender,`Marital status`,
    Age,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END) AS No_Specialist_Treatment
FROM
    stmh
WHERE `MARITAL STATUS` = "YES"
GROUP BY 1 , 2, 3
Having COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END)  >0
ORDER BY 3;

-- @Course taken by students that are married.
SELECT 
    Course,
    Gender,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
    WHEN Specialist_Treatment = 'yes' THEN gender
    ELSE NULL
END) > 0
ORDER BY 1;

-- @Specialist_Treatment students by @year study.
SELECT 
    `year Study`,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END) AS Specialist_Treatment_YearCount
FROM
    stmh
GROUP BY 1
;

-- @Specialist_Treatment student @gender distribution by @year study
SELECT 
    Gender,`year Study`,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END) AS Specialist_Treatment_YearCount
FROM
    stmh
GROUP BY 1,2
ORDER BY 2
;

-- Count of @Specialist_Treatment students from out date time column
SELECT 
    `date`, Gender, `year study`,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN `date`
        ELSE NULL
    END) AS No_Specialist_Treatment
FROM
    stmh
GROUP BY 1,2,3
HAVING COUNT(CASE
    WHEN Specialist_Treatment = 'yes' THEN `date`
    ELSE NULL
END) > 0
 ORDER BY 4 desc;

