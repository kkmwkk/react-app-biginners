--emp 테이블에서 입사한 달의 마지막 날을 구하는 쿼리문

select hiredate, LAST_DAY(hiredate)
from emp;

--시스템의 정보들을 출력
select * 
from nls_session_parameters
where PARAMETER in('NLS_LANGUAGE', 'NLS_TERRITORY', 'NLS_DATE_FORMAT', 'NLS_DATE_LANGUAGE', 'NLS_SORT');

--현재 날짜를 문자형을 변환하여 출력하는 쿼리문

select sysdate, to_char(sysdate, 'yyyy-mm-dd')
from dual;

select sysdate, to_number(sysdate)
from dual;

--사원들의 입사일을 출력하되, 요일까지 함께 출력하는 쿼리문
select concat(to_char(hiredate, 'yyyy-mm-dd dy'), '요일') 입사일
from emp;

--현재 날짜와 시간을 출력하는 쿼리문
select to_char(sysdate, 'YYYY-MM-DD, HH/MI/SS')
from dual;

-- 각 지역별 통화 기호를 앞에 붙이고 천 단위마다 콤마를 붙여서 출력하는 쿼리문
select ename, sal, TRIM(to_char(sal, 'L999,999')) 단위
from emp;

-- 1981년 2월 20일에 입사한 사원을 검색하는 쿼리문
SELECT ENAME, HIREDATE 
FROM EMP 
WHERE HIREDATE = to_date(19810220);


-- 며칠이 지났는지 현재 날짜에서 2021/12/20 을 뺀 결과를 출력하는 쿼리문
select concat(to_date(sysdate)-to_date(20211220), '일') "며칠이 지났을까~~"
from dual;

-- 정답
select sysdate, TRUNC(sysdate - to_date('2021/12/20')) from dual;
