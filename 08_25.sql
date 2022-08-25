--emp 테이블에서 입사한 달의 마지막 날을 구하는 쿼리문

select hiredate, LAST_DAY(hiredate)
from emp;

--시스템의 정보들을 출력
select * 
from nls_session_parameters
where PARAMETER in('NLS_LANGUAGE', 'NLS_TERRITORY', 'NLS_DATE_FORMAT', 'NLS_DATE_LANGUAGE', 'NLS_SORT');