/*
   <GROUP BY절>  
 그룹 기준을 제시할 수 있는 구문(여러 그룹 기준별로 여러 그룹으로 묶을 수 있음)
 여러개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용
*/
SELECT SUM(SALARY)
FROM EMPLOYEE; -- 전체 사원을 하나의 그룹으로 묶어서 총합을 구함

-- 각 부서별 총 급여의 합을 조회
SELECT DEPT_CODE ,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--각 부서별 사원의 수 조회
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 급여 합계와 사원의 수를 조회
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;--DEPT_CODE의 오름차순

--각 직급별 사원 수, 급여의 합계 조회, 직급별 내림차순
SELECT JOB_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE DESC;
--각 직급별 총 사원수, 보너스를 받는 사원수, 급여 합 , 평균 급여, 최저 급여, 최고 급여 조회( 직급 별 오름차순 정렬)
SELECT JOB_CODE, COUNT(*)"직급 인원 수",COUNT(BONUS)"보너스 포함 인원"
      , SUM(SALARY)"급여"
      , ROUND(AVG(SALARY),2)"직급 평균 급여"
      , MIN(SALARY)"최저 급여"
      , MAX(SALARY)"최고 급여"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1; -- 컬럼의 번호!

--GROUB BY 절에 함수식도 기술 가능
--여성별, 남성별의 사원 수
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여'),COUNT(*) --DECODE로 1,2의 자리에 남,여를 타이핑
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1); --만약 1,2,3,4 다 테이블안에 있으면 GROUP BY SUBSTR(EMP_NO,8,1

-- 부서코드, 직급 코드 별 사원 수, 급여 합
SELECT DEPT_CODE, JOB_CODE, COUNT (*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY 1;
----------------------------------------------------------------------------------
/*
    <HAVING절>
    그룹에 대한 조건을 제시할 때 사용되는 구문(주로 그룹함수식을 가지고 조건을 제시할 때 사용) 
*/
--각 부서별 평균 급여 조회(부서 코드, 평균급여)
SELECT DEPT_CODE, CEIL(AVG(SALARY))--CEIL 무조건 올림)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 2;
--각 부서별 평균 급여가 300만원 이상인 부서만 조회
SELECT DEPT_CODE, CEIL(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING CEIL(AVG(SALARY)) >= 3000000
ORDER BY 2;
---------------------------<SELECT문 순서>---------------------------------------
/*
    실행되는 순서
    FROM
    WHERE       WHERE 와 
    GROUP BY        GROUP BY는 동시에 나올 수 없음.
    HAVING
    SELECT
    ORDER BY
*/
---------------------------<실습 문제>------------------------------------------
--1. 직급별 총 금여액(단, 직급별 급여 합이 1000만원 이상인 직급만 조회)- 직급코드, 급여합
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY  JOB_CODE
HAVING SUM(SALARY) >= 10000000
ORDER BY 2;

--2 부서별 보너스를 받는 사원이 없는 부서만 부서코드 조회 - 부서코드
SELECT DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0;
--------------------------------------------------------------------------------
/*
    <집계 함수>
    그룹별 산출된 결과 값에 중간 집계를 계산해 주는 함수
    ROLLUP,CUBE
    = > GROUP BY절에 기술하는 함수
    - ROLLUP(컬럼1, 컬럼2) : 컬럼1을 가지고 다시 중간 집계를 내는 함수
    - CUBE(컬럼1, 컬럼2) : 컬럼1을 가지고 다시 중간 집계를 내고 
                         컬럼2를  가지고 다시 중간 집계를 내는 함수
*/
--각 직급별 급여 합
SELECT JOB_CODE , SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

--컬럼이 1개일 때 할 필요가 없음
SELECT JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(JOB_CODE)
ORDER BY 1;
--컬럼이 2개일 때 
SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,JOB_CODE
ORDER BY 1;

--CUBE, ROLLUP의 차이점을 보려면 그룹 기준이 컬럼 2개는 있어야 가능
SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,JOB_CODE
ORDER BY 1;

--CUBE(컬럼1,컬럼2)
SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE,JOB_CODE)
ORDER BY 1;
--------------------------------------------------------------------------------
/*
    <집합 연산자 == SET OPERATION>
    여러개의 쿼리문을 가지고 하나의 쿼리문으로 만드는 연산자
    
    -UNION : OR | 합집합(두 쿼리문을 수행한 결과값을 더한 후 중복되는 값은 한 번만 더해준다
    -INTERSECT:  AND | 교집합(두 쿼리문을 수행한 결과값의 중복된 결과값을 가져옴)
    -UNION ALL : 합집합 + 교집합(중복되는 값은 두번 표현됨)
    -MINUS : 차집합(첫번째 집합에서 두번째 집합의 값을 뺀 나머지)
*/
------------------------------1.UNION-------------------------------------------
--부서 코드가 D5인 사원 또는 급여가 300만원 초과인 사원을 조회하시오
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'; --6명

SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; --8명

--UNION
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; -- 12명

-- OR절로도 가능함
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' OR SALARY > 3000000; --12명

----------------------------------2. INTERSECT ---------------------------------
-- 부서 코드가 D5인 사원 이면서 급여가 300만원 초과인 사원을 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

--AND절로도 가능함
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY > 3000000;
--※주의 사항
--집합 연산자를 사용할 경우, 컬럼의 개수와 컬럼명이 동일 해야함
------------------------------------3.UNION ALL --------------------------------
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
----------------------------------4.MINUS---------------------------------------
--직급 코드가 'D5'인 사원들중 급여가 300만원 초과인 사원을 제외한 사원 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

--다음 처럼도 가능함
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE   
WHERE DEPT_CODE = 'D5' AND SALARY <= 3000000;