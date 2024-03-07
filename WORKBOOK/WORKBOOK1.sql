-- WORKBOOK 문제 2는 7번까지만 풀기!
-- 1번
-- 춘 기술대학교의 학과 이름과 계열을 조회하시오. 
-- 단, 출력 헤더(컬럼명)는 "학과 명", "계열"으로 표시하도록 한다.

SELECT
	DEPARTMENT_NAME "학과 명",
	CATEGORY "계열"
FROM
	TB_DEPARTMENT td ;
-- 2 번 
-- 학과의 학과 정원을 다음과 같은 형태로 조회하시오.

SELECT
	DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.' "학과별 정원"
FROM
	TB_DEPARTMENT td2;
-- 3번 
-- "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 조회하시오. 
-- (국문학과의 학과코드(DEPARTMENT_NO)는 001)

	SELECT
	*
FROM
	TB_STUDENT ts
WHERE
	DEPARTMENT_NO = '001'
	AND TS.ABSENCE_YN = 'Y'
	AND SUBSTR(ts.STUDENT_SSN , 8, 1) = 2;
-- 4번  
-- 도서관에서 대출 도서 장기 연체자들을 찾아 이름을 게시하고자 한다. 
-- 그 대상자들의 학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL구문을 작성하시오. 
-- A513079, A513090, A513091, A513110, A513119

SELECT
	STUDENT_NAME
FROM
	TB_STUDENT ts
WHERE
	TS.STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY
	STUDENT_NAME DESC;
-- 순서?
-- 5번 
-- 입학 정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 조회하시오. 
	SELECT
	DEPARTMENT_NAME ,
	CATEGORY
FROM
	TB_DEPARTMENT td
WHERE
	td.CAPACITY >= 20
	AND td.CAPACITY <= 30;
-- 6번 
-- 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 
-- 그럼 춘 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오. 
	SELECT
	*
FROM
	TB_PROFESSOR tp
WHERE
	DEPARTMENT_NO IS NULL;
-- 7번 
-- 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 
-- 선수과목이 존재하는 과목들은 어떤 과목인지 과목 번호를 조회하시오. 
	
SELECT
	CLASS_NO
FROM
	TB_CLASS tc
WHERE
	PREATTENDING_CLASS_NO IS NOT NULL;
-- 8번 
-- 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해 보시오.
SELECT DISTINCT 
CATEGORY 
FROM TB_DEPARTMENT td ;

-- 9번 
-- 02학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들은 제외한 재학중인 학생들의 학번, 
-- 이름, 주민번호를 조회하는 구문을 작성하시오.
--SELECT STUDENT_NO , STUDENT_NAME , STUDENT_SSN, ENTRANCE_DATE , ABSENCE_YN 
SELECT
	*
FROM
	TB_STUDENT ts
WHERE
	ts.ABSENCE_YN = 'N'
	AND SUBSTR(STUDENT_NO , 2, 2) = '21'
	AND ts.STUDENT_ADDRESS LIKE '%전주%';
--WHERE ts.ABSENCE_YN = 'N' AND TO_CHAR( SUBSTR(TO_CHAR(ENTRANCE_DATE , 'YYYY-MM-DD'), 3, 2)) = '02';
-- WHERE SUBSTR(ENTRANCE_DATE, 3, 2) = 02;
--------------
-- 2-1번 
-- 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를  
-- 입학 년도가 빠른 순으로 표시하는 SQL을 작성하시오. 
-- (단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)
SELECT
	STUDENT_NO 학번,
	STUDENT_NAME 이름,
	TO_CHAR( ENTRANCE_DATE, 'YYYY-MM-DD') 입학년도
FROM
	TB_STUDENT ts
WHERE
	DEPARTMENT_NO = '002'
ORDER BY 
입학년도;

-- 2-2번 
-- 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 두 명 있다고 한다.  
-- 그 교수의 이름과 주민번호를 조회하는 SQL을 작성하시오. 

SELECT 
PROFESSOR_NAME 이름, PROFESSOR_SSN 주번
FROM TB_PROFESSOR tp 
WHERE 
PROFESSOR_NAME  NOT LIKE '___';

-- 2-3번 
-- 춘 기술대학교의 남자 교수들의 이름과 나이를 나이 오름차순으로 조회하시오. 
-- (단, 교수 중 2000년 이후 출생자는 없으며 출력 헤더는 "교수이름"으로 한다.  
-- 나이는 '만'으로 계산한다.) 
SELECT
	PROFESSOR_NAME 교수이름 ,
	FLOOR(MONTHS_BETWEEN(SYSDATE, 
								TO_DATE( 19 || SUBSTR(PROFESSOR_SSN, 1, 6) ) ) / 12) 나이
FROM
	TB_PROFESSOR
WHERE
	SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
ORDER BY
	나이;

-- 4번
-- 교수들의 이름 중 성을 제외한 이름만 조회하시오. 
-- 출력 헤더는 "이름"이 찍히도록 한다.
-- (성이 2자인 경우의 교수는 없다고 가정)
SELECT SUBSTR(PROFESSOR_NAME, 2) 이름
FROM TB_PROFESSOR;

SELECT 
	CASE
		WHEN LENGTH(PROFESSOR_NAME) = 3
		THEN SUBSTR(PROFESSOR_NAME, 2)
		WHEN LENGTH(PROFESSOR_NAME) = 4
		THEN SUBSTR(PROFESSOR_NAME, 3)
	END 이름
FROM
	TB_PROFESSOR;


-- 5번
-- 춘 기술대학교의 재수생 입학자를 조회하시오.
-- (19살에 입학하면 재수를 하지 않은 것!)
SELECT
	STUDENT_NO ,
	STUDENT_NAME
FROM
	TB_STUDENT
WHERE
	EXTRACT(YEAR FROM ENTRANCE_DATE) - TO_NUMBER(19 || SUBSTR(STUDENT_SSN, 1, 2)) > 19;

-- 6번
-- 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되어있다. 
-- 2000년도 이전 학번을 받은 학생들의 학번과 이름 조회하는 SQL을 작성하시오

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT ts 
WHERE STUDENT_NO NOT LIKE 'A%';

-- 7번
-- 학번이 A517178인 한아름 학생의 학점 총 평점을 구하는 SQL문을 작성하시오.
-- 단, 이때 출력 화면의 헤더는 "평점"이라고 찍히게 하고,
-- 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.
SELECT ROUND(AVG(POINT), 1) "평점"
FROM TB_GRADE tg 
WHERE STUDENT_NO IN ('A517178');

-- 8번
-- 학과별 학생 수를 구하여 "학과번호", "학생수(명)"의 형태로 조회하시오.

SELECT
DEPARTMENT_NO AS "학과번호",
COUNT(*) AS "학생수(명)"
FROM TB_STUDENT ts
GROUP BY DEPARTMENT_NO;

-- 9번
-- 지도 교수를 배정받지 못한 학생의 수를 조회하시오.
SELECT COUNT(*)
FROM TB_STUDENT ts 
WHERE COACH_PROFESSOR_NO IS NULL;

-- 10번
-- 학번이 A112113인 김고운 학생의 년도 별 평점을 구하는 SQL문을 작성하시오.
-- 단, 이때 출력화면의 헤더는 "년도", "년도 별 평점"이라고 찍히게 하고,
-- 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.
SELECT SUBSTR(TERM_NO, 1, 4) AS "년도",
       ROUND(AVG(POINT), 1) AS "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
ORDER BY "년도";

-- 11번 
-- 학과 별 휴학생 수를 파악하고자 한다.  
-- 학과 번호와 휴학생 수를 조회하는 SQL을 작성하시오.
SELECT
	DEPARTMENT_NO ,
	SUM(CASE ABSENCE_YN WHEN 'Y' THEN 1 ELSE 0 END) AS 휴학생_수
FROM
	TB_STUDENT ts
GROUP BY
	DEPARTMENT_NO
ORDER BY
	DEPARTMENT_NO ;

-- 12번 
-- 춘 대학교에 다니는 동명이인인 학생들의 이름, 동명인 수를 조회하시오.





