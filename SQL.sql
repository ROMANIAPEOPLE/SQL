DESC 테이블명;
-- 테이블의 구조를 참조하는 명령어

INTEGER 형
-- 수치형의 하나로, 정수 값을 저장할 수 있는 자료형. 소수점은 포함할 수 없음.
CHAR 형
-- 문자열형의 하나로, 문자열을 저장할 수 있는 자료형. 문자열형에서는 열의 최대길이를 지정
-- CHAR(10) 이라면, 최대 10문자까지만 가능.
VARCHAR 형
-- CHAR형과 동일하지만, ㅊ데이터 크기에 맞춰 저장공간의 크기를 지정하는 가변 길이 문자열
DATA 형
-- DATA형은 날짜값을 저장하는 자료형.
TIME 형
--  시간을 저장하는 자료형


-- no의 값이 2인 값을 검색
select  * from sample21 where  no =2;

-- no의 값이 2가 아닌값을 모두 검색
Select * from sample21 WHERE no <> 2;

-- birthday가 null인 값만 검색 : = 연산자로 null을 검색할 수 없음.
select * from sample 21 where birthday is NULL;

-- AND나 OR을 검색할때
select * from sample.sample24 WHERE no=1 OR 2;
-- 위 쿼리문처럼 상수만 지정하면 올바른 결과를 얻을 수 없음.
select * from sample.sample24 WHERE no=1 or no=2;
-- 위 쿼리문처럼 해야 올바른 결과를 얻을 수 있다.

-- 연산자의 우선순위도 잘 생각해야한다.
select * from sample.sample24 where (a=1 OR a=2) AND (b=1 OR b=2);
select * from sample.sample24 where a=1 OR a=2 AND b=1 OR b=2;
-- 위 쿼리문은 서로 다른 결과를 나타낸다.  :  AND는 OR에비해 우선순위가 높다.

-- LIKE문 : %은 임의의 문자열을 뜻한다.
select * from sample.sample25 WHERE text LIKE 'SQL%'

-- ORDER BY 사용하기 (역순정렬/정렬)
select * from sample.sample31 ORDER BY address DESC
select * from sample.sample31 ORDER BY address
--  먼저 a열을 정리하고, 값이 동일한 부분은 b로 정렬
select * from sample.sample32 ORDER BY a,b;
-- OFFSET 지정 : 페이징기능으로, LIMIT과 함께 offset을 사용할 수 있다.
select * from sample.sample32 LIMIT 3 OFFSET 3;

--  금액 계산하기
select *, price*quantity from sample.sample34
-- 금액 계산하기 행 이름 설정 :  단, select 구에서 설정한 별명(amount)를 where구에서는 사용할 수 없다.
select *, price*quantity as amount from sample.sample34
select *, price*quantity as amount from sample.sample34 where price*quantity>2000

-- 반올림 ROUND  , 소숫점 자리 선택
select amount, ROUND(amount) from sample.sample341;
select amount, ROUND(amount,1) from sample.sample341;

-- 문자열 연결하기 concat
select concat(quantity,unit) FROM sample.sample35

-- 날짜, 시간 데이터를 저장하는 방법은 DB 사용 제품에 따라 크게 달라진다. 날짜와 시간 전부를 저장할 수 있는 자료형을 지원하거나,
-- 혹은 날짜는 DATE형, 시간은 TIME형, 날짜와 시간은 DATETIME형과 같이 세분화해 지원하는 DB 제품도 있다.
