/*
   -서브 쿼리(SUBQUERY)
   하나의 SQL문 안에 포함된 또다른 SELECT문
   메인 SQL문의 보조 역할을 하는 쿼리문
*/

--박정보 사원과 같은 부서에 속한 사원들 조회
--1. 박정보 사원 부서코드 조회
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '박정보';
--2. 부서코드가 'D9'인 사원의 정보 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';
--> 위의 두 쿼리문을 하나로 하면
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                   FROM EMPLOYEE
                   WHERE EMP_NAME = '박정보');
--전 직원의 평균급여보다 급여를 더 많이 받는 사원의 사번, 사원명, 급여, 직급코드 조회
SELECT EMP_ID, EMP_NAME, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY)
                 FROM EMPLOYEE);
--------------------------------------------------------------------------------
/*
   -서브쿼리의 구분
    서브쿼리를 수행한 결과값이 몇 행 몇 열이냐에 따라 분류
    
    *단일행 서브쿼리: 서브쿼리의 조회 결과값이 오로지 1개일 때(1행 1열)
    *다중행 서브쿼리: 서브쿼리의 조회 결과값이 여러행 일 때 (여러행 1열)
    *다중열 서브쿼리: 서브쿼리의 조회 결과값이 여러열 일 때 (1행 여러열)
    *다중행 다중열 서브쿼리: 서브쿼리의 조회 결과값이 여러행 여러열 일 때(여러행 여러열)
    >>서브쿼리의 종류가 무엇이냐에 따라 서브쿼리 앞에 부는 연산자가 달라짐
*/
/*
  1.단일행 서브쿼리(SINGLE ROW SUBQUERY)
    서버브리의 조회 결과값이 오로지 1개일 때(1행 1열)
    
    일반 비교연산자 사용
    =,!=,>,<,....등
*/
--1) 전 직원의 평균 급여보다 급여를 적게 받는 사원의 사원명, 급여 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEE)
ORDER BY SALARY;

--2)최저 급여를 받는 사원의 사원명, 급여 조회
SELECT EMP_NAME,SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY)
                FROM EMPLOYEE);

-- 3)박정보 사원의 급여보다 더 많이 받는 사원의 사원명, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '박정보');
--JOIN +SUBQUERY
--4)박정보 사원의 급여볻 더 많이 받는 사원의 사번 , 사원명, 부서코드, 부서이름, 급여 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE , SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND SALARY > (SELECT SALARY
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '박정보');
                    
-->>ANSI 구문
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE , SALARY
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE SALARY > (SELECT SALARY
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '박정보');
--5. 왕정보 사원과 같은 부서원들의 사번, 사원명, 전화번호, 부서명 조회 단, 왕정보는 제외
SELECT EMP_ID, EMP_NAME, PHONE, DEPT_TITLE
FROM EMPLOYEE,DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND DEPT_CODE = (SELECT DEPT_CODE
                   FROM EMPLOYEE
                   WHERE EMP_NAME='왕정보')
AND EMP_NAME != '왕정보';

SELECT EMP_ID, EMP_NAME, PHONE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE DEPT_CODE = (SELECT DEPT_CODE
                   FROM EMPLOYEE
                   WHERE EMP_NAME='왕정보')
AND EMP_NAME != '왕정보';

-- GROUP+SUBQUERY
--6)부서별 급여합이 가장 큰 부서의 부서코드,급여합 조회
--6.1 부서별 급여합 중 가장 큰 합 조회
/*
SELECT DEPT_CODE ,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 2 DESC;
*/
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 6.2 부서별 급여합이 17,700,000 인 부서 조회
SELECT DEPT_CODE, SUM(SALARY) 급여합
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = 17700000;

--위 두개를 합치면!
SELECT DEPT_CODE, SUM(SALARY) 급여합
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE);
--------------------------------------------------------------------------------
/*
    2. 다중행 서브쿼리(MULTI ROW SUBQUERY)
       서브쿼리의 조회 결과값이 여러행 일 때(여러행 1열)
       -IN 서브쿼리 : 여러개의 결과값 중 한개라도 일치하는 값이 있다면
       
       -  >ANY 서브쿼리 : 여러개의 결과값 중 "한개라도" 클 경우
            (여러개의 결과값 중 가장 작은값 보다 클 경우)
       -  <ANY 서브쿼리 : 여러개의 결과값 중 "한개라도" 작은 경우
            (여러개의 결과값 중 가장 큰값 보다 작을 경우)
        비교대상>ANY(값1,값2,값3)
        비교대상 > 값1 OR 비교대상 > 값2 OR 비교대상 > 값3
            .....................................
            개개개개개개개개개개개개개개개개개개개개개개개개
*/
-- 1) 조정연 또는 전지연과 같은 직급인 사원들의 사번, 사원명, 직급코드, 급여
-- 1.1 조정연 또는 전지연이 어떤 직급인지
SELECT JOB_CODE
FROM EMPLOYEE
--WHERE EMP_NAME ='조정연' OR EMP_NAME = '전지연' ;
WHERE EMP_NAME IN('조정연','전지연');
--1.2 직급 코드가 J3, J7인 사원의 사번 사원명 직급코드 급여를 가져와
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN(SELECT JOB_CODE
                FROM EMPLOYEE 
                WHERE EMP_NAME IN('조정연','전지연'));
-- 대표=>부사장=>부장=>차장=>과장=>대리=>사원
-- 2)대리 직급임에도 불구하고 과장직급의 급여들중 최소 급여보다 많이 받는 직원의 사번, 사원명, 직급, 급여
-- 2.1 과장 직급인 사원들의 급여 조회
SELECT SALARY
FROM EMPLOYEE , DEPARTMENT
JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE = 'J5';

-- 2.2 직급이 대리이면서 급여가 위의 목록값 중에 하나라도 큰 사원
SELECT EMP_ID, EMP_NAME,JOB_NAME,SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리'
        AND SALARY > ANY(SELECT SALARY
                         FROM EMPLOYEEL
                         JOIN JOB USING(JOB_CODE)
                         WHERE JOB_NAME = '과장');
                         
