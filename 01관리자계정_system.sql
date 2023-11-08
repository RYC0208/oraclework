-- 한줄 주석(ctr +/)
/*
*   여러줄 주석 (alt + shift + c)
*/
--커서가 깜빡거릴때 ctrl + enter : 그 줄 실행
--나의 계정 보기
show user;

--사용자 계정 조회
select*from DBA_USERS;

--계정 만들기
--[표현법] create user 사용자명 identified by 비밀번호;
--오라클 12버전 부터 일반 사용자는 c##을 붙여 이름을 작명한다.
--create user user1 IDENTIFIED by 1234;
create user c##user1 IDENTIFIED by user1234;
create user c##user10 IDENTIFIED by "1234";
--사용자 이름에 c## 붙이는 것을 회피하는 방법
ALTER SESSION set"_oracle_script"=true;
create user aie identified by user1234;
create user user10 identified by user1234;
-- 사용자 이름은 대소문자를 가리지 않는다
-- 실제 사용할 계정 생성
create user aie2 identified by aie;
--권한 생성
--[표현법] grant 권한1, 권한2, ...to 계정명;
grant RESOURCE, CONNECT to aie;
--테이블 스페이스에 얼마만큼의 영역을 할당할 것인지를 부여
alter user aie2 DEFAULT TABLESPACE users QUOTA UNLIMITED on users;
--테이블 스페이스에 영역을 특정 용량만큼 할당하려면
alter user user10 QUOTA 30M on users;
--user 삭제
--[표현법]drop user 사용자명; => 테이블이 없는 상태
--[표현법]drop user 사용자명 cascade; = 테이블이 있으면 테이블 까지 삭제.
drop user c##user1;