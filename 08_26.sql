-- 8월 26일자 실습내용 정리

-- 가장 최근에 입사한 사원의 입사일과 가장 먼저 입사한 사원의 입사일을 출력하시오
select max(hiredate) 최근입사, min(hiredate) 가장먼저입사
from emp;

-- 30번 소속 사원중에서 커미션을 받는 사원의 수를 카운트 하시오.
select count(*)
from emp
where deptno = 30 AND comm is not null AND comm <> 0;

select count(*)
from emp
where deptno = 30 AND comm > 0;

-- job의 개수를 중복을 배제하고 출력하시오
select count(DISTINCT job) job의개수
from emp;

--- MGR 컬럼(상관의 사원번호)에서 중복을 배제하고 출력하시오
select DISTINCT mgr
from emp;

select DISTINCT decode(mgr, null, '상관없음', mgr)
from emp;

-- 날짜의 중복을 배제하고 출력하시오.
select DISTINCT hiredate
from emp;


-- 소속 부서별 사원의 수와 커미션을 받는 사원의 수를 카운트 하시오
select deptno, count(*) 사원의수, count(comm) "커미션받는사원"
from emp
group by (deptno);

-- emp 테이블에서 년도 별로 사원들이 몇명 입사했는지 카운트 하시오

select concat(to_char(hiredate, 'YYYY'),'년') 년도, concat(count(*), '명') 사원
from emp
group by to_char(hiredate, 'YYYY')
order by to_char(hiredate, 'YYYY');

select substr(hiredate, 1, 2), count(*)
from emp
group by substr(hiredate, 1, 2);

-- emp 테이블에서 월별로 사원들이 몇명 입사했는지 카운트 하시오


select concat(to_char(hiredate, 'MM'),'월') 년도, concat(count(*), '명') 사원
from emp
group by to_char(hiredate, 'MM')
order by to_char(hiredate, 'MM');


select substr(hiredate, 4, 2), count(*)
from emp
group by substr(hiredate, 4, 2)
order by substr(hiredate, 4, 2);


-- 부서별 평균급여를 구하고 그 결과 평균급여가 2000 이상인 부서만 출력하세요

select deptno, avg(sal)
from emp
group by deptno
HAVING avg(sal) >= 2000;

-- 1981년 5월 31일 이후 입사자 중 커미션이 NULL이거나 0인 사원의 커미션은 500 그렇지 않으면 기존 커미션을 출력하라.

select ename, hiredate, decode(comm, null, 500, 0, 500, comm)
from emp
where to_date(hiredate) > to_date(19810531)
ORDER BY hiredate;

-- 부서별 최대 값과 최소값을 구하되 최대 급여 2900 이상인 부서만 출력
select deptno, max(sal), min(sal)
from emp
group by deptno
HAVING max(sal) > 2900;

-- 부서별 평균급여를 구하고 그 결과 평균급여가 2000 이상인 부서만 출력하세요
select deptno, round(avg(sal),0)
from emp
group by deptno
HAVING avg(sal) >= 2000;

-- 급여가 1000 이상인 사람들로 부서별 평균급여를 구하고 그 결과 평균급여가 2000 이상인 부서만 출력하시오
select deptno, round(avg(sal), 0)
from emp
where sal >= 1000
group by deptno
HAVING avg(sal) >= 2000;

-- 이름에 'LA'가 들어 있지 않고 JOB의 합이 1000 이상인 JOB 그룹과 JOB에 속한 사원수를 출력 하시오
select job, count(*), sum(sal)
from emp
where NOT ename like '%LA%' 
group by job
HAVING sum(sal) >= 1000
ORDER BY sum(sal);




