/* 
[JOIN 용어 정리]
  오라클       	  	                          SQL : 1999표준(ANSI)
----------------------------------------------------------------------------------------------------------------
등가 조인		                            내부 조인(INNER JOIN), JOIN USING / ON
                                        + 자연 조인(NATURAL JOIN, 등가 조인 방법 중 하나)
----------------------------------------------------------------------------------------------------------------
포괄 조인 		                        왼쪽 외부 조인(LEFT OUTER), 오른쪽 외부 조인(RIGHT OUTER)
                                        + 전체 외부 조인(FULL OUTER, 오라클 구문으로는 사용 못함)
----------------------------------------------------------------------------------------------------------------
자체 조인, 비등가 조인   	                    	JOIN ON
----------------------------------------------------------------------------------------------------------------
카테시안(카티션) 곱		               			교차 조인(CROSS JOIN)
CARTESIAN PRODUCT

- 미국 국립 표준 협회(American National Standards Institute, ANSI) 미국의 산업 표준을 제정하는 민간단체.
- 국제표준화기구 ISO에 가입되어 있음.
*/
-----------------------------------------------------------------------------------------------------------------------------------------------------

-- JOIN
-- 하나 이상의 테이블에서 데이터를 조회하기 위해 사용.
-- 수행 결과는 하나의 Result Set으로 나옴.

/* 
- 관계형 데이터베이스에서 SQL을 이용해 테이블간 '관계'를 맺는 방법.

- 관계형 데이터베이스는 최소한의 데이터를 테이블에 담고 있어
  원하는 정보를 테이블에서 조회하려면 한 개 이상의 테이블에서 
  데이터를 읽어와야 되는 경우가 많다.
  이 때, 테이블간 관계를 맺기 위한 연결고리 역할이 필요한데,
  두 테이블에서 같은 데이터를 저장하는 컬럼이 연결고리가됨.   
*/

--------------------------------------------------------------------------------------------------------------------------------------------------

-- 기존에 서로 다른 테이블의 데이터를 조회 할 경우 아래와 같이 따로 조회함.

-- 직원번호, 직원명, 부서코드, 부서명을 조회 하고자 할 때
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;
-- 직원번호, 직원면, 부서코드는 EMPLOYEE테이블에 조회가능

-- 부서명은은 DEPARTMENT테이블에서 조회 가능
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;


SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);


/*  JOIN은 단순히 테이블을 두개를 붙이는 것이 아닌
 *  
 *  기준 삼은 테이블의 한 컬럼을 지정해
 *  다른 테이블의 한 컬럼과 같은 행을 찾아
 *   
 *  기준 테이블 옆에 한 행씩 붙여나감 
 *   */




-- 1. 내부 조인(INNER JOIN) ( == 등가 조인(EQUAL JOIN))

--> 연결되는 컬럼의 값이 일치하는 행들만 조인됨.  
-- (== 일치하는 값이 없는 행은 조인에서 제외됨. )

-- 작성 방법 크게 ANSI구문과 오라클 구문 으로 나뉘고 
-- ANSI에서  USING과 ON을 쓰는 방법으로 나뉜다.


-- *ANSI 표준 구문
-- ANSI는 미국 국립 표준 협회를 뜻함, 미국의 산업표준을 제정하는 민간단체로 
-- 국제표준화기구 ISO에 가입되어있다.
-- ANSI에서 제정된 표준을 ANSI라고 하고 
-- 여기서 제정한 표준 중 가장 유명한 것이 ASCII코드이다.


-- *오라클 전용 구문
-- FROM절에 쉼표(,) 로 구분하여 합치게 될 테이블명을 기술하고
-- WHERE절에 합치기에 사용할 컬럼명을 명시한다



-- 1) 연결에 사용할 두 컬럼명이 다른 경우  -->  JOIN  ON

-- EMPLOYEE 테이블, DEPARTMENT 테이블을 참조하여
-- 사번, 이름, 부서코드, 부서명 조회

-- EMPLOYEE 테이블에 DEPT_CODE컬럼과 DEPARTMENT 테이블에 DEPT_ID 컬럼은 
-- 서로 같은 부서 코드를 나타낸다.
--> 이를 통해 두 테이블이 관계가 있음을 알고 조인을 통해 데이터 추출이 가능.

-- ANSI
-- 연결에 사용할 컬럼명이 다른 경우 ON()을 사용
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);



-- 오라클 (JOIN이라는 단어를 작성하지 않음)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;



-- DEPARTMENT 테이블, LOCATION 테이블을 참조하여
-- 부서명, 지역명 조회


-- ANSI 방식
SELECT * FROM DEPARTMENT; -- LOCATION_ID

SELECT * FROM LOCATION;   -- LOCAL_CODE


SELECT DEPT_TITLE 부서명, LOCAL_NAME 지역명 
FROM DEPARTMENT
JOIN LOCATION ON ( LOCATION_ID = LOCAL_CODE );


-- 오라클 방식
SELECT DEPT_TITLE 부서명, LOCAL_NAME 지역명 
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;



-- 부서명이 '해외영업2부'인 사원의
-- 사번(EMP_ID), 이름(EMP_NAME), 부서명(DEPT_TITLE)을 
-- 사번 오름차순으로 조회
/* 3 */SELECT EMP_ID, EMP_NAME, DEPT_TITLE
/*1-1*/FROM EMPLOYEE
/*1-2*/JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
/* 2 */WHERE DEPT_TITLE = '해외영업2부'
/* 4 */ORDER BY EMP_ID;


-- 오라클 방식
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND   DEPT_TITLE = '해외영업2부'
ORDER BY EMP_ID;


SELECT *
FROM DEPARTMENT
JOIN LOCATION ON ( LOCATION_ID = LOCAL_CODE );



-- 2) 연결에 사용할 두 컬럼명이 같은 경우 --> JOIN USING

-- EMPLOYEE 테이블, JOB테이블을 참조하여
-- 사번, 이름, 직급코드, 직급명 조회


-- ANSI
-- 연결에 사용할 컬럼명이 같은 경우 USING(컬럼명)을 사용함

SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;

SELECT * FROM JOB;


SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE); 
--> 컬럼이 16개가 아니라 15개 인 이유
 --> 컬럼 이름이 같아서 두 테이블의 같은 컬럼이 포개지듯이 합쳐짐


-- ORA-00918: 열의 정의가 애매합니다
--> 작성된 컬럼이 어떤 테이블의 컬럼인지 구분할 수 없음

-- 오라클 -> 별칭 사용
-- 테이블 별로 별칭을 등록할 수 있음.
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;
--WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;



SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
/* INNER */JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--> 하동운, 이오리가 누락됨
--> 왜?? DEPT_CODE(NULL) 값과
--     같은 값이 DEPT_ID 컬럼에 존재하지 않아서
--     연결되지 않음 --> 최종 결과에서 제외 == INNER JOIN



---------------------------------------------------------------------------------------------------------------


-- 2. 외부 조인(OUTER JOIN)

-- 두 테이블의 지정하는 컬럼값이 일치하지 않는 행도 
-- 조인에 포함을 시킴
-->  *반드시 OUTER JOIN임을 명시해야 한다.

-- OUTER JOIN과 비교할 INNER JOIN 쿼리문
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
/*INNER*/ JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);


-- 1) LEFT [OUTER] JOIN  : 
-- 합치기에 사용한 두 테이블 중 왼편에 기술된 테이블의 
-- 컬럼 수를 기준으로 JOIN

-- ANSI 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--> JOIN 구문 기준으로 왼쪽에 작성된 테이블의
-- 모든 행이 최종 결과(RESULT SET)에 포함 되도록 하는 JOIN
-- == LEFT JOIN

-- 오라클 구문
SELECT EMP_NAME, DEPT_TITLE 
FROM EMPLOYEE e , DEPARTMENT d 
WHERE DEPT_CODE = DEPT_ID(+);
-- DEPT_CODE의 값이
-- DEPT_ID와 일치하지 않아도 결과에 포함시켜라


-- 2) RIGHT [OUTER] JOIN : 합치기에 사용한 두 테이블 중 
-- 오른편에 기술된 테이블의  컬럼 수를 기준으로 JOIN

-- ANSI 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--> JOIN 구문 기준으로 오른쪽에 작성된 테이블의
-- 모든 행이 최종 결과(RESULT SET)에 포함 되도록 하는 JOIN
-- ==  RIGHT JOIN



-- 오라클 구문
SELECT EMP_NAME, DEPT_TITLE 
FROM EMPLOYEE e , DEPARTMENT d 
WHERE DEPT_CODE(+) = DEPT_ID;

-- 3) FULL [OUTER] JOIN   : 합치기에 사용한 두 테이블이 가진 모든 행을 결과에 포함
-- ** 오라클 구문은 FULL OUTER JOIN을 사용 못함

-- ANSI 표준
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--> JOIN 구문 기준으로 양쪽에 작성된 테이블의
-- 모든 행이 최종 결과(RESULT SET)에 포함 되도록 하는 JOIN
-- ==  RIGHT JOIN

-- 오라클 구문
SELECT EMP_NAME, DEPT_TITLE 
FROM EMPLOYEE e , DEPARTMENT d ;
-- WHERE DEPT_CODE(+) = DEPT_ID(+); -- 오류 발생





---------------------------------------------------------------------------------------------------------------

-- 3. 교차 조인(CROSS JOIN == CARTESIAN PRODUCT)
--  조인되는 테이블의 각 행들이 모두 매핑된 데이터가 검색되는 방법(곱집합)
--> 모든 경우의 수를 보고싶을 때 빼고는 직접 작성하는 경우가 없음
	--> 자연 조인 실패 결과로 교차 조인 결과가 출력됨
		-- (교차 조인 결과가 보이면 -> 아... 자연 조인 잘못 썻네)

SELECT EMP_NAME , DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE e2 
CROSS JOIN DEPARTMENT d 
ORDER BY EMP_NAME, DEPT_CODE;


---------------------------------------------------------------------------------------------------------------

-- 4. 비등가 조인(NON EQUAL JOIN)

-- '='(등호)를 사용하지 않는 조인문
--  지정한 컬럼 값이 일치하는 경우가 아닌, 값의 범위에 포함되는 행들을 연결하는 방식

-- 사원의 급여가
-- SAL_LEVEL에 작성된 최소(MIN_SAL) ~ 최대(MAX_SAL) 
-- 범위의 급여가 맞을 때만 결과에 포함하겠다는 JOIN

SELECT EMP_NAME, E.SAL_LEVEL, MIN_SAL, SALARY, MAX_SAL
FROM EMPLOYEE E
JOIN SAL_GRADE S ON ( SALARY BETWEEN MIN_SAL AND MAX_SAL );

---------------------------------------------------------------------------------------------------------------

-- 5. 자체 조인(SELF JOIN)

-- 같은 테이블을 조인.
-- 자기 자신과 조인을 맺음
--> 똑같은 테이블이 2개 있다고 생각하면 쉽다!!!

-- EMPLOYEE 테이블에서
-- 각 사원의 이름, 사수 이름 조회

-- ANSI 표준

SELECT EMP.EMP_NAME "사원명", MGR.EMP_NAME "사수명"
FROM EMPLOYEE EMP
LEFT JOIN EMPLOYEE MGR ON(EMP.MANAGER_ID = MGR.EMP_ID);


-- 오라클 구문
SELECT EMP.EMP_NAME "사원명", MGR.EMP_NAME "사수명"
FROM EMPLOYEE EMP, EMPLOYEE MGR
WHERE EMP.MANAGER_ID = MGR.EMP_ID(+);



---------------------------------------------------------------------------------------------------------------

-- 6. 자연 조인(NATURAL JOIN)
-- 동일한 타입과 이름을 가진 컬럼이 있는 테이블 간의 조인을 간단히 표현하는 방법
-- 반드시 두 테이블 간의 동일한 컬럼명, 타입을 가진 컬럼이 필요
--> 없을 경우 교차조인이 됨.

-- EMPLOYEE.JOB_CODE (CHAR(2))
-- JOB.JOB_CODE (CHAR(2))
	--> 칼럼명, 자료형이 모두 일치! == NATURAL JOIN의 대상

-- NATURAL JOIN (X)
SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE e 
JOIN JOB j USING (JOB_CODE);

-- NATURAL JOIN (O)
SELECT EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE e 
NATURAL JOIN JOB j;

/* NATURAL JOIN 실패 --> CROSS JOIN 결과 조회 */
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE e 
NATURAL JOIN DEPARTMENT d;

---------------------------------------------------------------------------------------------------------------

-- 7. 다중 조인
-- N개의 테이블을 조회할 때 사용  (순서 중요!)

-- EMPLOYEE, DEPARTMENT, LOCATION 3개 조인

-- ANSI 표준
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION l ON (LOCATION_ID = LOCAL_CODE);

-- 1) EMPLOYLEE - DEPARTMENT 1차 조인
-- 2) 1차 조인 결과에 LOCATION 2차 조인

-- 오라클 전용

SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE e , DEPARTMENT d , LOCATION l 
WHERE DEPT_CODE = DEPT_ID  AND LOCATION_ID = LOCAL_CODE;

-- 조인 순서를 지키지 않은 경우(에러발생)
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE e 
JOIN LOCATION l ON (LOCATION_ID = LOCAL_CODE)
JOIN DEPARTMENT d ON (DEPT_CODE = DEPT_ID);
-- SQL Error [904] [42000]: ORA-00904: "LOCATION_ID": 부적합한 식별자
--> 1) EMPLOYEE - LOCATION 조인 시
--> LOCATION_ID 칼럼이 존재하지 않아 JOIN 실패

/* 여러 테이블 조인 시 JOIN 순서를 지키지 않아도 되는 경우 */
-- 이름, 직급명, 부서명 조회
-- 조인 하려는 테이블들이 서로 겹치는게 없을땐 상관없음
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING (JOB_CODE);


--[다중 조인 연습 문제]

-- 직급이 대리이면서 아시아 지역에 근무하는 직원 조회
-- 사번, 이름, 직급명, 부서명, 근무지역명, 급여를 조회하세요

-- ANSI
--SELECT EMP_ID , EMP_NAME , JOB_CODE , 
SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE, LOCAL_NAME, SALARY
FROM EMPLOYEE 
JOIN JOB USING(JOB_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE JOB_NAME = '대리'


-- J6 대리 / 아시아1,2,3 // 임플로이, 잡, 로케이션

-- 오라클 전용
SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE, LOCAL_NAME, SALARY
FROM EMPLOYEE , JOB , DEPARTMENT , LOCATION 
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE
AND   DEPT_CODE = DEPT_ID
AND   LOCATION_ID = LOCAL_CODE
AND   JOB_NAME = '대리'
AND   LOCAL_NAME LIKE 'ASIA%';



---------------------------------------------------------------------------------------------------------------


-- [연습문제]

-- 1. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 '전'씨인 직원들의 
-- 사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT *
FROM EMPLOYEE e
WHERE TO_NUMBER(SUBSTR(EMP_NO, 1, 1)) = 7 AND TO_NUMBER(SUBSTR(EMP_NO, 8, 1)) = 2 AND 
EMP_NAME LIKE '전%';

-- AND LOCAL_NAME LIKE 'ASIA%';
-- EXTRACT(YEAR FROM ENTRANCE_DATE) - TO_NUMBER(19 || SUBSTR(STUDENT_SSN, 1, 2)) > 19;
      
      
-- 2. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE e 
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_NAME LIKE '%형%';



-- 3. 해외영업 1부, 2부에 근무하는 사원의 
-- 사원명, 직급명, 부서코드, 부서명을 조회하시오.
SELECT EMP_NAME, EMP_ID, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_ID IN ('D6', 'D5');



--4. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
SELECT EMP_NAME, BONUS, DEPT_TITLE, NATIONAL_NAME 
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION l ON (LOCATION_ID = LOCAL_CODE)
JOIN "NATIONAL" n USING (NATIONAL_CODE)
WHERE BONUS IS NOT NULL;





--5. 부서가 있는 사원의 사원명, 직급명, 부서명, 지역명 조회
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE, NATIONAL_NAME 
FROM EMPLOYEE e 
JOIN JOB USING (JOB_CODE)
JOIN DEPARTMENT d ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION l ON (LOCATION_ID = LOCAL_CODE)
JOIN "NATIONAL" n USING (NATIONAL_CODE);


-- 6. 급여등급별 최소급여(MIN_SAL)를 초과해서 받는 직원들의
--사원명, 직급명, 급여, 연봉(보너스포함)을 조회하시오.
--연봉에 보너스포인트를 적용하시오.
SELECT EMP_NAME, JOB_NAME, 
CASE 
	WHEN BONUS IS NOT NULL THEN SALARY * BONUS + SALARY 
	WHEN BONUS IS NULL THEN SALARY 
END "보너스+"
FROM EMPLOYEE e 
JOIN SAL_GRADE sg USING (SAL_LEVEL)
JOIN JOB USING (JOB_CODE)
WHERE MIN_SAL < SALARY ;




-- 7.한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME 
FROM EMPLOYEE e 
JOIN JOB USING (JOB_CODE)
JOIN DEPARTMENT d ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION l ON (LOCATION_ID = LOCAL_CODE)
JOIN "NATIONAL" n USING (NATIONAL_CODE)
WHERE NATIONAL_CODE IN ('KO', 'JP');



-- 8. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- SELF JOIN 사용

SELECT E.EMP_NAME, E.DEPT_CODE, E2.EMP_NAME AS 동료이름
FROM EMPLOYEE E
JOIN EMPLOYEE E2 ON E.DEPT_CODE = E2.DEPT_CODE ;




-- 9. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, JOIN, IN 사용할 것
SELECT EMP_NAME, JOB_NAME, SALARY 
FROM EMPLOYEE e 
JOIN JOB USING (JOB_CODE)
WHERE BONUS IS  NULL
AND JOB_CODE IN ('J4', 'J7');



