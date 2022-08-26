-- 8월 26일자 실습내용 정리

-- 가장 최근에 입사한 사원의 입사일과 가장 먼저 입사한 사원의 입사일을 출력하시오
select max(hiredate) 최근입사, min(hiredate) 가장먼저입사
from emp;