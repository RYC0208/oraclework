--테이블 컬럼의 정보 조회
/*
(')홀따옴표: 문자열일 때
(")쌍따옴표: 컬럼명일 때
*/
    <select>
    데이터 조회할 때 사용하는 구문
    >>RESULT SET : SELECT 문을 통해 조회된 결과물(조회된 행들의 집합)
    [표현법]
    SELECT 조회하려는 컬럼명, 조회하려는 컬럼명,///
    FROM 테이블명
    */
    SELECT*
    FROM EMPLOYEE;
    
    SELECT*
    FROM DEPARTMENT;
    --EMPLOYEE 테이블에서 사번,이름,전화번호만 조회
    SELECT EMP_ID,EMP_NAME,PHONE
    FROM EMPLOYEE;
    --1. JOB테이블에 직급명만 조회
    SELECT JOB_NAME
    FROM JOB;
    --2. DEPARTMENT 테이블에 모든 컬럼 조회
    SELECT*
    FROM DEPARTMENT;
    --3. DEPARTMENT 테이블의 부서코드 부서명만 조회
    SELECT DEPT_ID,DEPT_TITLE
    FROM DEPARTMENT;
    --4. EMPLOYEE 테이블에 사원명, 이메일 , 전화번호, 입사일, 급여 조회
    SELECT EMP_NAME,EMAIL,PHONE,HIRE_DATE,SALARY
    FROM EMPLOYEE;
    /*
    <컬럼 값을 통한 산술연산>
    SELECT절 컬럼명 작성 부분에 산술연산 기술 가능(이때 산술연산된 결과 조회)
    */
    --EMPLOYEE에서 사원명, 사원의 연봉(급여*12) 조회
    SELECT EMP_NAME, SALARY*12
    FROM EMPLOYEE;  
    --EMPLOYEE에서 사원명,급여,보너스
    SELECT EMP_NAME,SALARY,BONUS
    FROM EMPLOYEE;
    --EMPLOYEE에서 사원명,급여,보너스,연보,보너스를 포함한 연봉((보너스*급여))
    SELECT EMP_NAME 사원명,SALARY AS 급여,BONUS "보너스",
    SALARY*12 "연봉(원)",(SALARY+BONUS*SALARY)*12"총 소득"
    --()와 같이 특수 기호가 들어가면 반드시 ("")를 붙여준다.
    FROM EMPLOYEE;
    --산술연산 중 NULL이 존재하면 결과는 무조건 NULL이 됨. 별도 처리(나중에)
    
    --EMPLOYEE에서 사원명, 입사일, 근무일수(오늘 날짜 - 입사일)
    --DATE형 끼리도 연산 가능 : 결과값은 일 단위
    --* 오늘 날짜 : SYSDAYE
    SELECT EMP_NAME,HIRE_DATE,SYSDATE-HIRE_DATE
    FROM EMPLOYEE;
    --함수 수업시 DETE 날짜처리하면 초단위를 관리할 수 있음
    ----------------------------------------------------------------
    /*
    <컬럼명에 별칭 지정하기>
    산술연산시 컬럼명이 산술에 들어간 수식 그대로 컬럼명이 됨. 이때 별핑을 부여하면 깔끔하게 처리
    [표현법]
    컬럼명 별칭/ 컬럼명 AS 별칭/ 컬럼명 "별칭"/컬럼명 AS "별칭"
    
    별칭에 띄어쓰기나 특수문자 포함되면 반드시("")쌍따옴표를 넣어줘야 한다
    */
    SELECT EMP_NAME 이름,HIRE_DATE "입사 날짜",SYSDATE-HIRE_DATE AS "근무 일 수"
    FROM EMPLOYEE;
    ----------------------------------------------------------------
/*
    <리터럴>
    임의로 지정된 문자열(')
    
    SELECT절에 리터럴을 제시하면 마치 테이블상에 존재하는 데이터 처럼 조회 가능
    조회된 RESULT SET의 모든 행에 반복적으로 출력
*/
-- EMPLOYEE에 사번,사원명,급여(원) 조회
    SELECT EMP_ID, EMP_NAME, SALARY, '원' AS "단위"
    FROM EMPLOYEE;
     SELECT EMP_ID, EMP_NAME,'원' AS "단위", SALARY
    FROM EMPLOYEE;
    
------------------------------------------------------------------
/*
    <연결 연산자: ||>
    여러 칼럼값들을 마치 하나의 컬럼값인것 처럼 연결하거나, 컬럼값과 리터럴을 연결할 수 있음
*/
    --EMPLOYEE에 사번, 사원명, 급여를 하나의 컬럼으로 조회
    --EMPLOYEE에 사번, 사원명, 급여를 하나의 컬럼으로 조회
    SELECT EMP_ID || EMP_NAME ||SALARY
    FROM EMPLOYEE;
    
    SELECT EMP_ID, EMP_NAME, SALARY ||'원'
    FROM EMPLOYEE;

    --홍길동의 월급은 900000원 입니다.
    SELECT EMP_NAME||'의 월급은 ' || SALARY||'원 입니다'
        -- EMPLOYEE에 있는 이름정보 ||(연결 시켜줌) '의 월급은'(문자열은 '사용) 
    FROM EMPLOYEE;
    -- 홍길동의 전화번호는 PHONE이고 이메일은 EMAIL 입니다.
    SELECT EMP_NAME||'의 전화번호는 +'||PHONE||' 이고 이메일은 '|| EMAIL||' 입니다.'
    FROM EMPLOYEE;
    --------------------------------------------------------------
    /*
    <DISTINICT>
    컬럼의 중복된 값들을 한번씩만 표시하고자 할 때
    */
    SELECT JOB_CODE
    FROM EMPLOYEE;
    
    --EMPLOYEE 에서 직급 코드 중복제외하여 조회
    SELECT DISTINCT JOB_CODE
    FROM EMPLOYEE;
    
    --EMPLOYEE에서 부서코드 중복제외하여 조회
    SELECT DEPT_CODE
    FROM EMPLOYEE;
    
    --유의 사항 / SELECT절에서 DISTNICT는 한번만 기술할 수 있음.
    --SELECT DISTINCT DEPT_DOE, DISTINCT JOB_CODE 오류
    
    --DEPT_CODE,JOB_CODE 2개의 조합으로 만들어졌을 때 중복제외
    SELECT DISTINCT DEPT_CODE,JOB_CODE
    FROM EMPLOYEE;

--------------------------------------------------------------------------------
/*
 <WHERE>
 조회하고자 하는  테이블에서 특정 조건에 만족하는 데이터만 조회할 때
 WHERE절에 조건식을 제시
 
 [표현법}
 SELECT 컬럼,    컬럼    ,    산술연산    ,    .....
 FROM 테이블명
 WHERE 조건식;
 >> 비교 연산자
 >, <  , >=  , <=      대소비교
 =                     같은제 비교
 !=, ^=,<>             같지않은지 비교
*/
--EMPLOYEE에서 부서코드가 'D9'인 사원들의 모든 컬럼 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE에서 부서코드가 'D1'이 아닌 사원들의 사번, 사원명, 부서코드를 조회
SELECT EMP_ID, EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE<>'D1'; -- !=,<>, ^=

-- EMPLOYEE에서 급여가 400만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;

--EMPLOYEE에서 재직중인 사원의 사번,사원명,입사일 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN='N';

--연습문제--
SELECT EMP_ID, SALARY, HIRE_DATE, SALARY*12
FROM EMPLOYEE
WHERE SALARY >= 3000000;

SELECT EMP_ID, SALARY, SALARY*12, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;

SELECT EMP_ID, EMP_NAME,JOB_CODE,END_DATE
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3';

--------------------------------------------------------------------------------
/*
    >>논리 연산자
    여러개의 조건을 묶어서 제시하고자 할 때
    
    AND(~이면서, 그리고)
    OR(~이거나, 또는)
    NOT(부정):컬럼명 앞 또는 BETWEEN앞에 쓴다
*/
--부서코드가 'D9'이면서 급여가 500만원 이상인 사원들의 사원명,부서코드,급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND SALARY >=5000000;

--부서코드가 'D6'이거나 급여가 3000000만원 이상인 사원들의 사원명, 부서코드, 급여조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >=3000000;
--급여가 350만원 이상 600만원 이하인 사원의 사번 ,사원명 ,급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >=3500000 AND SALARY <=6000000;
--------------------------------------------------------------------------------
/*
 >>BETWEEN AND
 ~이상 ~이하인 범위의 조건을 제시할 때
 [표현법]
 비교대상컬럼 BETWEEN 하한값 AND 상한값
 ->해당 컬럼값이 하한값이상이고 상한값 이하인 경우
 */
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 6000000;

SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;

--입사일이 90/01/01 ~01/01/01
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
--------------------------------------------------------------------------------
/*
>>LIKE
비교하고자 하는 컬럼값이 내가 제시한 특정 패턴에 만족하는 경우 조회

[표현법]
비교대상컬럼 LIKE '특정패턴'
:특정패턴 제시시 '%''_' 와일드 카드로 사용할 수 있음

%:0글자 이상
EX) 비교대상 컬럼 '문자%' =>비교대상 컬럼값이'문자'로 시작되는 것들을 조회
    비교대상 컬럼 LIT '%문자' =>   비교대상 컬럼값이 '문자'로 끝나는 것들을 조회
     비교대상 컬럼 LIT '%문자%'
*/

--사원들 중 성이' 전'씨인 사원들의 사번, 사원명 조회
SELECT EMP_ID ,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'전%';

--사원들 이름중 '하'가 포함된 경우 사원들의 사번, 사원명 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'%하%';

--사원들 중 두번째 이름이' 하'씨인 사원들의 사번, 사원명 조회
SELECT EMP_ID ,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'_하_';

--전화번호 중 3번째 글자가 '1'인 사원의 사번 ,사원명 ,전화번호 조회

SELECT EMP_ID, EMP_NAME,PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

--이메일 중 _앞에 글자가 3글자인 사원들의 사번, 사원명, 이메일 조회
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%';
/*
와일드 카드로 인식이 됨
- 데이터와 와일드 카드를 구분지어야 됨
    :데이터 값으로 취급하고자 하는 값 앞에 나만의 와일드 카드(아무거나 문자, 숫자 , 특수문자)를
    제시하고 나만의 와일드 ㅋ카드를 ESCAPE로 등록해야함
*/
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';

--이메일 중 _앞에 글자가 3글자인 사원들을 제외한 사람들의 사번,사원명,이메일 조회
SELECT EMP_ID,EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE NOT EMAIL NOT LIKE'___e_%' ESCAPE'e';

SELECT EMP_ID,EMP_NAME,HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%연';

SELECT EMP_NAME , PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%';

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%'AND SALARY >= 2500000;

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '해외영업%';

/*
>>IS NULL/ IS NOT NULL
컬럼값에 NULL이 있는 경우 NULL값 비교에 사용되는 연산자
*/
--보너스를 받지 않는 사원의 사번, 사원명, 급여, 보너스 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
--WHERE BONUS = NULL; 조회 안됨
WHERE BONUS IS NULL;

--보너스를 받는 사원의 사번, 사원명, 급여, 보너스 조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;
--WHERE NOT BONUS IS NULL; 사용 가능

--사수가 없는 사원들의 사번 ,사원명, 사수번호 조회
SELECT EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;

--부서배치는 받지 않았지만 보너스는 받는 사원들의 사원 명, 보너스, 부서코드 조회
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
-------------------------------------------------------------------------------

/*
    >>IN/NOT IN
    IN : 칼럼값이 내가 제시한 목록중에 일치하는 값이 있는것만 조회
    NOT IN: 컬럼값이 내가 제시한 목록중에 일치하는 값을 제외한 나머지만 조회
    
    [표현법]
    비교대상 컬럼 IN('값1','값2','값3','값4......)
    
*/
--부서코드가 D5,D6,D8 인 사원의 사원명,부서코드,급여조회
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
--WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D8';
WHERE DEPT_CODE  IN('D5','D6','D8');

--부서코드가 D5,D6,D8이 아닌 사원의 사원명,부서코드,급여조회
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN('D5','D6','D8');
-------------------------------------------------------------------------------
/*
    연산자의 우선순위/
    1. ()
    2. 산술 연산자
    3. 연결 연산자
    4. 비교 연산자
    5. IS NULL/ LIKE '패턴'/ IN
    6. BETWEEN
    7. NOT(논리 연산자)
    8. AND(논리 연산자)
    9. OR(논리 연산자)
*/
-- 직급 코드가 J7이거나 J2인 사원들 중 급여가 200만원 이상인 사원들의 모든 컬럼 조회
SELECT EMP_NAME,JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN('J7','J2') AND SALARY >=2000000;

SELECT EMP_NAME, MANAGER_ID,DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;

SELECT EMP_ID, EMP_NAME,BONUS,SALARY*12 연봉
FROM EMPLOYEE
WHERE SALARY*12 >= 30000000 AND BONUS IS NULL;

SELECT EMP_ID,EMP_NAME,HIRE_DATE, DEPT_CODE
FROM EMPLOYEE
WHERE HIRE_DATE >='95/01/01' AND DEPT_CODE IS NOT NULL;

SELECT EMP_ID,EMP_NAME,SALARY,HIRE_DATE, BONUS
    FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND  5000000 
    AND HIRE_DATE >='01/01/01' 
    AND BONUS IS NULL;

SELECT EMP_ID, EMP_NAME, SALARY
    FROM EMPLOYEE
WHERE SALARY*(1+BONUS)*12 IS NOT NULL 
    AND EMP_NAME LIKE '%하%';
-------------------------------------------------------------------------------
/*
 <ORDER BY 절>
 - 정렬
 - SELECT문 가장 마지막 줄에 작성, 실행 순서또한 맨 마지막에 실행
 [표현법]
 SELECT 컬럼, 컬럼, .....
 FROM 테이블 명
 WHERE 조건식
 ORDER BY 정렬기준이 되는 컬럼명 | 별칭 | 컬럼순번 [ ASC | DESC]|[NULLS FIRST |
          NULLS LAST]
          
*ASC : 오름차순 정렬 ( 생략시 기본값 )
*DESC : 내림차순 정렬
*NULLS FIRST : 정렬하고자 하는 컬럼값에 NULL이 있는 경우 해당 데이터를 맨 앞에 배치(생략시 DESC일때는 기본값)
&NULLS LAST : 정렬하고자 하는 컬럼값에 NULL이 있는 경우 해당 데이터를 맨 뒤에 배치(생략시 ASC일때의 기본값)
*/

--보너스로 정렬
SELECT EMP_NAME, BONUS, SALARY
FROM EMPLOYEE
-- ORDER BY BONUS; 오름차순 기본값 NULL이 끝에 옴
--ORDER BY BONUS ASC;
--ORDER BY BONUS NULLS FIRST;
--ORDER BY BONUS DESC; --내림차순은 반드시 DESC 기술 , NULL은 맨 앞에 옴
ORDER BY BONUS DESC, SALARY ; --기준 여러개 가능

--전 사원의 사원명, 연봉조회 ( 연봉의 내림차순 정렬 조회)
SELECT EMP_NAME, SALARY *12 연봉
FROM EMPLOYEE
ORDER BY SALARY ;

