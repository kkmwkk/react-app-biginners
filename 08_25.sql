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


-- emp 테이블에서 급여를 W88,950 처럼 나오게 하라
select ename 이름, trim(to_char(sal, 'L99,999'))급여
from emp;


-- 커미션을 받지 않은 사원의 월급을 1500원 인상해 지급하고 COMM 컬럼에 인상된 금액을 표시하시오. 단 숫자 0은 받는걸로 취급함
select ename, sal, comm, nvl(comm, to_char(sal + 1500)) "인상된 금액", nvl(comm, '1500') 커미션
from emp
where comm is NULL
ORDER BY SAL;

-- 09월에 입사한 사원의 comm을 2000추가하여 월급을 산출하시오 sal + comm 값이 나오도록 쿼리를 만드시오.
select ename, hiredate, nvl(comm, 0) + 2000, (sal + nvl(comm, 0) + 2000) 월급
from emp
where to_char(hiredate, 'MM') = '09';

-- emp 테이블에서 상관이 없는 사원만 출력하되  MGL 컬럼에 NULL 대신 CEO 라고 출력되도록 하시오
select ename 이름, decode(mgr, null, 'CEO') 직책
from emp
where MGR is NULL;

-- to_char(null) = 0 처리 되는가 ? nvl(0, 'CEO') 하면 답이 나오긴함.
select ename 이름, nvl(to_char(mgr,'999'), 'CEO')mgr
from emp
where MGR is NULL;

-- 직급에 따라 급여를 인상합니다 직급이 ANAIYST 인 사원은 5% 인상 SALESMAN 은 10% 인상 MANAGER 은 15% CLERK 20 % 인상한 금액을 출력하시오
select ename 이름, sal 월급, job 직급, decode(job, 'ANAIYST', sal * 1.05, 'SALESMAN', sal * 1.1, 'MANAGER', sal * 1.15, 'CLERK', sal * 1.2, sal) 인상된월급
from emp;