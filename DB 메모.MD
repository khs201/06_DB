Data
관찰 결과로 나타난정 양적 혹은 정성적인 실제값

정보
데이터를 기반으로 의미를 부여한 것

Database
한 조직에 필요한 정보를 여러 응용 시스템에서 공용할 수 있도록
논리적으로 연관된 데이터를 모으고 중복되는 데이터를 최소화하여
구조적으로 통합/저장 해놓은것.

DBMS(DATA BASE MANAGEMENT SYSTEM) : DB 조작, 추출, 정의, 제어 관리 시스템

SQL(STRUCTURED QUERY LANGUAGE) : 구조적 질의 언어, DB의 데이터를 조작, 추출, 정의, 제어하는데 사용되는 데이터 처리 언어

DQL, DML, TCL, DDL, DCL

1. DQL (Data Query Language): 데이터 쿼리 언어
정의: 데이터베이스에서 데이터를 검색하고 조회하는 데 사용하는 언어입니다.
대표적인 명령어: SELECT

2. DML (Data Manipulation Language): 데이터 조작 언어
정의: 데이터베이스의 데이터를 추가, 수정, 삭제하는 데 사용하는 언어입니다.
대표적인 명령어: INSERT, UPDATE, DELETE

3. TCL(Transaction Control Language) : 트랜잭션 제어 언어
Transaction : 업무, 처리
대표적인 명령어 : COMMIT, ROLLBACK

 TRANSACTION이란?
 - 데이터베이스의 논리적 연산 단위
 
 - 데이터 변경 사항을 묶어 하나의 트랜잭션에 담아 처리함.

 - 트랜잭션의 대상이 되는 데이터 변경 사항 : INSERT, UPATE, DELETE (DML)

4. DDL(DATA DEFINITION LANGUAGE) : 데이터 정의 언어
  
 객체(OBJECT)를 만들고(CREATE), 수정(ALTER)하고, 삭제(DROP) 등
 데이터의 전체 구조를 정의하는 언어로 주로 DB관리자, 설계자가 사용함

 오라클에서의 객체 : 테이블(TABLE), 뷰(VIEW), 시퀀스(SEQUENCE),
                   인덱스(INDEX), 패키지(PACKAGE), 트리거(TRIGGER)
                   프로시져(PROCEDURE), 함수(FUNCTION),
                   동의어(SYNONYM), 사용자(USER)

5. DCL (Data Control Language): 데이터 제어 언어

정의: 데이터베이스 사용자의 권한을 부여, 취소, 관리하는 데 사용하는 언어입니다.
대표적인 명령어: GRANT, REVOKE

//

[JOIN]
- [INNER] JOIN : 같은 컬럼 값을 가진 행들끼리 연결(INNER는 생략 가능, 기본값이기 때문)
- LEFT [OUTER] JOIN : 왼쪽 테이블의 모든 행이 결과에 포함
- RIGHT [OUTER] JOIN : 오른쪽 테이블의 모든 행이 결과에 포함

[INSERT문 작성법]
1)
INSERT INTO 테이블명
VALUES(값...)

2)
INSERT INTO 테이블명(컬럼명...)
VALUES(값...)

3)
INSERT INTO 테이블명 (서브쿼리)

[UPDATE문 작성법]
UPDATE 테이블
SET 컬럼명 = 변경값, 
    컬럼명 = 변경값,
WHERE 조건;    

[DELETE문 작성법]
DELETE FROM 테이블명
WHERE 조건;

[DB 자료형]

- NUMBER : 숫자
- DATE : 날짜
- CHAR : 고정 길이 문자형(2000 BYTE)
- VARCHAR2 : 가변 길이 문자형(4000 BYTE)

[제약 조건]

- NOT NULL (컬럼 레벨로만 설정 가능!)
- UNIQUE
- PRIMARY KEY (식별자 역할)
- FOREIGN KEY
- CHECK

[테이블 생성 시 제약 조건 설정 방법]

- 제약 조건만 작성 -> 자동으로 제약 조건명이 설정(SYS_C23123어쩌고)

- CONSTRAINT 제약조건명 제약조건
  -> 지정된 제약 조건명으로 제약조건 생성

[FOREIGN KEY]

- 부모 테이블의 컬럼 값을 참조해서 자식 테이블 컬럼에 작성하는 제약
  -> (부모의 값이나 NULL만 자식 테이블에 작성 가능!)



//

DB의 데이터 타입 :
1. 문자열(고정, 가변)
2. 숫자
3. 날짜
4. 큰 데이터

//

SELECT : 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL

컬럼명 별칭 지정하기

별칭 지정 방법
1) 컬럼명 AS 별칭   : 문자O, 띄어쓰기 X, 특수문자 X
2) 컬럼명 AS "별칭" : 문자O, 띄어쓰기 O, 특수문자 O
3) 컬럼명 별칭      : 문자O, 띄어쓰기 X, 특수문자 X
4) 컬럼명 "별칭"    : 문자O, 띄어쓰기 O, 특수문자 O

"" 의미 ("" 사이 글자 그대로 인식)
1) 대/소문자 구분
2) 특수문자, 띄어쓰기 인식
-- ORACLE에서 문자열은 ''

/******************/
/**** WHERE 절 ****/
/******************/

-- 테이블에서 조건을 충족하는 행을 조회할 때 사용
-- WHERE절에는 조건식(true/false)만 작성

-- 비교 연산자 : >, <, >=, <=, = (같다), !=, <> (같지 않다)
-- 논리 연산자 : AND, OR, NOT

/*NULL 비교하기*/
--  컬럼명 = NULL  / 컬럼명 != NULL   (X)
--> =, !=, < 등의 비교 연산자는 값을 비교하는 연산자!!
--> DB에서 NULL은 값 X, 저장된 값이 없다라는 의미!!!

-- 컬럼명 IS NULL, 컬럼명 IS NOT NULL (O)
	--> 컬럼 값이 존재하지 않는 경우 / 존재하는 경우

/* 컬럼명 BETWEEN A AND B */
	-- 컬럼의 값이 A 이상 B 이하면 TRUE

/* 컬럼명 NOT BETWEEN A AND B */
	-- 컬럼의 값이 A 이상 B 이하면 TRUE
	--> A 미만 또는 B 초과 시 TRUE

    -- EMPLOYEE 테이블에서
-- 이메일의 아이디 중 '_' 앞 쪽 글자의 수가 3글자인 사원의
-- 사번, 이름, 이메일 조회
--SELECT EMP_NAME , EMAIL 
--FROM EMPLOYEE e 
--WHERE EMAIL LIKE '____%';

-- 문제점 : 기준으로 삼은 문자 '_'와
-- LIKE의 와일드카드 '_'가 동일하여
-- 모든 '_'가 와일드 카드로 인식됨

-- 해결 방법 : 
-- LIKE의 ESCAPE 옵션 사용
--> 적용 범위 : 특수문자 뒤 한 글자

/* SELECT문 해석 순서
  5 : SELECT 컬럼명 AS 별칭, 계산식, 함수식
  1 : FROM 참조할 테이블명
  2 : WHERE 컬럼명 | 함수식 비교연산자 비교값
  3 : GROUP BY 그룹을 묶을 컬럼명
  4 : HAVING 그룹함수식 비교연산자 비교값
  6 : ORDER BY 컬럼명 | 별칭 | 컬럼순번 정렬방식 [NULLS FIRST | LAST];
*/

-----------------------------------------------------------------------------------------------------------------------------------------

-- * GROUP BY절 : 같은 값들이 여러개 기록된 컬럼을 가지고 같은 값들을
--              하나의 그룹으로 묶음
-- GROUP BY 컬럼명 | 함수식, ....
-- 여러개의 값을 묶어서 하나로 처리할 목적으로 사용함
-- 그룹으로 묶은 값에 대해서 SELECT절에서 그룹함수를 사용함

-- 그룹 함수는 단 한개의 결과 값만 산출하기 때문에 그룹이 여러 개일 경우 오류 발생
-- 여러 개의 결과 값을 산출하기 위해 그룹 함수가 적용된 그룹의 기준을 ORDER BY절에 기술하여 사용



-- EMPLOYEE 테이블에서 부서코드, 부서(그룹) 별 급여 합계 조회



-- EMPLOYEE 테이블에서 
-- 부서코드, 부서 별 급여의 합계, 부서 별 급여의 평균(정수처리), 인원 수를 조회하고 
-- 부서 코드 순으로 정렬



-- EMPLOYEE 테이블에서 
-- 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고 
-- 부서코드 순으로 정렬



-- EMPLOYEE 테이블에서
-- 성별과 성별 별 급여 평균(정수처리), 급여 합계, 인원 수 조회하고
-- 인원수로 내림차순 정렬



-- * WHERE절 GROUP BY절을 혼합하여 사용
--> WHERE절은 각 컬럼 값에 대한 조건 (SELECT문 해석 순서를 잘 기억하는 것이 중요!!)

-- EMPLOYEE 테이블에서 부서코드가 'D5', 'D6'인 부서의 평균 급여 조회

-- EMPLOYEE 테이블에서 직급 별 2000년도 이후 입사자들의 급여 합을 조회




-- * 여러 컬럼을 묶어서 그룹으로 지정 가능
-- *** GROUP BY 사용시 주의사항
--> SELECT문에 GROUP BY절을 사용할 경우
--  SELECT절에 명시한 조회할려면 컬럼 중
--  그룹함수가 적용되지 않은 컬럼을 
--  모두 GROUP BY절에 작성해야함.

--------------------------------------------------------------------------------------------------------------------------

-- * HAVING 절 : 그룹함수로 구해 올 그룹에 대한 조건을 설정할 때 사용
-- HAVING 컬럼명 | 함수식 비교연산자 비교값



-- 집계함수(ROLLUP, CUBE)
-- 그룹 별 산출한 결과 값의 집계를 계산하는 함수
-- GOURP BY 절에만 작성하는 함수


-- ROLLUP 함수 : 그룹별로 중간 집계 처리를 하는 함수
-- 그룹별로 묶여진 값에 대한 '중간 집계'와 '총 집계'를 계산하여 자동으로 추가하는 함수
-- * 인자로 전달받은 그룹중에서 가장 먼저 지정한 그룹별 합계와 총 합계를 구하는 함수

-- EMPLOYEE 테이블에서 
-- 각 부서에 소속된 직급 별 급여합, 
-- 부서 별 급여 합,
-- 전체 직원 급여 총합 조회

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
ORDER BY 1;


------------------------------------------------


-- CUBE 함수 : 그룹별 산출한 결과를 집계하는 함수이다.
-- * 그룹으로 지정된 모든 그룹에 대한 집계와 총 합계를 구하는 함수

-- EMPLOYEE 테이블에서 각 부서 마다 직급별 급여합,
-- 부서 전체 급여 합,

SELECT DEPT_CODE, JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE, JOB_CODE)
ORDER BY 1;

-- ROLLUP 결과에 아래 두 SQL문의 결과가 추가됨
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;


---------------------------------------------------------------------------------------------------------------------------------


-- * SET OPERATION(집합 연산)
-- 여러 개의 SELECT 결과물을 하나의 쿼리로 만드는 연산자
-- 여러가지의 조건이 있을 때 그에 해당하는 여러개의 결과값을 결합시키고 싶을때 사용
-- 초보자들이 사용하기 쉽다.(조건들을 어떻게 엮어야 되는지 덜 생각해도 되니깐)
-- (주의) 집합 연산에 사용되는 SELECT문은 SELECT절이 동일해야함

-- UNION은 OR 같은 개념 (합집합) --> 중복 제거
-- INTERSECT는 AND 같은 개념 (교집합)
-- UNION ALL은 OR 결과 값에 AND 결과값이 더해진거(합집합 + 교집합) --> 중복 미제거
-- MINUS는 차집합 개념 


-- UNION : 여러개의 쿼리 결과를 하나로 합치는 연산자
-- 중복된 영역을 제외하여 하나로 합친다.



-- INTERSECT : 여러개의 SELECT한 결과에서 공통 부분만 결과로 추출 (교집합)




-- UNION ALL : 여러개의 쿼리 결과를 하나로 합치는 연산자
-- UNION과의 차이점은 중복영역을 모두 포함시킨다. (합집합 +  교집합)



-- MINUS : 선행 SELECT 결과에서 다음 SELECT 결과와 겹치는 부분을 제외한 나머지 부분만 추출(차집합)
-- 부서 코드 D5 중 급여가 300만 초과인 직원 제외




-- SELECT 관련 KEY POINT !! --
 * 1. 테이블 구조 파악
 * 2. SELECT 해석 순서
 *   + 별칭 사용이 가능한 부분
 *    EX) ORDER BY 절에서는 SELECT절에서 해석된 별칭 사용 가능
 * 	  EX) 인라인뷰에서 지정된 별칭을 메인쿼리에서도 똑같이 사용해야된다
 * 
 * 3. 여러 테이블을 이용한 SELECT 진행 시
 *    컬럼명이 겹치는 경우 이를 해결하는 방법
 * 	
 *    EX) 셀프 조인 -> 테이블별로 별칭 지정
 *    EX) 상관 쿼리 -> 테이블별로 별칭 지정
 *
 *    EX) 다른 테이블이여도 컬럼명이 같을 때
 *      -> 테이블별로 별칭 지정
 *       -> 테이블명.컬럼명 형식으로 작성
 *        
 *  4. 조회하려는 데이터 (목적, 요구사항)을 확실하게 파악

SELECT절 해석 순서
 5) SELECT - 컬럼 지정
 1) FROM + JOIN - 테이블 설정
 2) WHERE - 행선택
 3) GROUP BY - 그룹화
 4) HAVING - 그룹 조건
 6) ORDER BY - 정렬

 //

sqlplus 접속

sys/oracle = oracle 관리자=사용자 
as
sysdba = 데이터베이스 생성과 삭제 권한

alter = 수정
session
set = 수정하고자 하는 부분
"_oracle_script" = true;

create = 생성
user = 생성하고자하는 목표
아이디명
identified by 
비밀번호
"_oracle_script" = true;

권한 명령어 
grant = 권한 부여
connect = 사용자가 데이터베이스에 접속할 수 있는 권한,
resource = 데이터베이스에 생성하고 사용할 수 있는 권한,
dba = dbadmin 슈퍼권한
to 아이디;

ctrl + c = 명령어에서 하고있는 작업을 중단할 때 사용하는 단축키
exit = 현재 sql에서 컴퓨터로 돌아가고 싶을 때 사용하는 명령어

sqlplus 관리자 권한으로 접속해서
khk 라는 계정 생성
비밀번호 kh1234

유저명 varchar2(100)
varchar2 란 : 숫자 영어 한글 등 모든 문자를 넣을 수 있는 공간

//

CRUD

Create (INSERT)
Read (SELECT)
Update (UPDATE)
Delete (DELETE)

DELETE는 롤백 가능
TRUNCATE는 롤백 불가능

//

딜리트 작성법
DELETE FROM 테이블명 [WHERE 조건];
DELETE 문은 데이터를 영구적으로 삭제합니다. 삭제하기 전에 백업을 수행하는 것이 좋습니다.
WHERE 절 없이 DELETE 문을 실행하면 테이블의 모든 데이터가 삭제됩니다. 주의해서 사용하십시오.

//







제약 조건(CONSTRAINTS) 상세 설명
**제약 조건(CONSTRAINTS)**은 사용자가 원하는 조건의 데이터만 유지하기 위해 특정 컬럼에 설정하는 규칙입니다. 데이터베이스의 데이터 무결성을 보장하는 데 중요한 역할을 합니다.

목적:

입력 데이터의 유효성 검사: 오류 데이터 입력 방지
데이터 수정/삭제 제어: 데이터 무결성 유지
데이터베이스 관리 효율성 증대
종류:

PRIMARY KEY: 테이블 내에서 각 행을 고유하게 식별하는 컬럼.
특징:
1개 이상의 컬럼으로 구성 가능
NULL 값 허용 불가
중복 값 허용 불가
테이블에 하나만 존재 가능
예시:
USER_ID 컬럼을 PRIMARY KEY로 설정하면, 동일한 ID를 가진 사용자가 두 명 이상 존재할 수 없음.
NOT NULL: 컬럼 값이 반드시 존재해야 함.
특징:
NULL 값 허용 불가
PRIMARY KEY 제약 조건과 함께 사용되는 경우가 많음
예시:
USER_NAME 컬럼에 NOT NULL 제약 조건을 설정하면, 사용자 이름을 반드시 입력해야 함.
UNIQUE: 컬럼 값이 테이블 내에서 고유해야 함.
특징:
NULL 값 허용 가능
PRIMARY KEY 제약 조건과 유사하지만, NULL 값 허용 여부에서 차이점
테이블에 여러 개 설정 가능
예시:
EMAIL 컬럼에 UNIQUE 제약 조건을 설정하면, 동일한 이메일 주소를 가진 사용자가 두 명 이상 존재할 수 없음.
CHECK: 컬럼 값이 특정 조건을 만족해야 함.
특징:
사용자 정의 조건 설정 가능
데이터 유효성 검사에 유용
예시:
AGE 컬럼에 CHECK (AGE >= 18) 제약 조건을 설정하면, 사용자 나이가 18세 이상만 허용.
FOREIGN KEY: 다른 테이블의 PRIMARY KEY와 참조 관계를 설정하는 제약 조건.
특징:
데이터베이스 간 데이터 무결성 유지에 중요
참조 무결성(referential integrity) 보장
예시:
ORDER_TABLE 테이블의 USER_ID 컬럼이 USER_TEST 테이블의 USER_ID 컬럼을 참조하는 FOREIGN KEY 제약 조건 설정.
제약 조건 설정 방법:

DDL (Data Definition Language) 사용
CREATE TABLE, ALTER TABLE 문 사용
제약 조건 삭제 방법:

DDL 사용
DROP CONSTRAINT 문 사용

계정(사용자)

- 관리자 계정 : 데이터베이스의 생성과 관리를 담당하는 계정.
                모든 권한과 책임을 가지는 계정.
                ex) sys(최고관리자), system(sys에서 권한 몇개 제외된 관리자)

- 사용자 계정 : 데이터베이스에 대하여 질의, 갱신, 보고서 작성 등의
                작업을 수행할 수 있는 계정으로
                업무에 필요한 최소한의 권한만을 가지는 것을 원칙으로 한다.
                ex) bdh계정(각자 이니셜 계정), updown, workbook 등