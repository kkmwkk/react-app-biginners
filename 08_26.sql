-- 8월 26일자 실습내용 정리

-- 가장 최근에 입사한 사원의 입사일과 가장 먼저 입사한 사원의 입사일을 출력하시오
select max(hiredate) 최근입사, min(hiredate) 가장먼저입사
from emp;

-- 30번 소속 사원중에서 커미션을 받는 사원의 수를 카운트 하시오.
select count(*)
from emp
where deptno = 30 AND comm is not null AND comm <> 0;

