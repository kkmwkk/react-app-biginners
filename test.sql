-- 문제) emp 테이블에서 ename, job의 첫번째 글자를 대문자로 표현하시오 

select INITCAP(ename), INITCAP(job) from emp;


-- 문제) EMP 테이블에서 'smith' 이름을 갖는 사원을 출력 하시오 

select LOWER(ename)
from emp
where ename = UPPER('smith');


select LOWER(ename)
from emp
where LOWER(ename) = 'smith';


--문제) emp 테이블의 사원중에 05 월에 입사한 사원들의 이름, 월급, 입사일을 출력하는 쿼리문을 작성

select ename 이름, sal 월급, hiredate 입사일
from emp
where substr(hiredate, 4, 2) = '05';

--문제) emp 테이블의 사원중에 이름의 마지막 글자가 'ES'로 끝나는 사원의 이름, 월급, 직급을 출력하는 쿼리문을 작성하시오

select ename 이름, sal 월급, job 직급
from emp
where ename like '%ES';


select ename 이름, sal 월급, job 직급
from emp
where substr(ename, length(ename)-1, 2) = 'ES';


select ename 이름, sal 월급, job 직급
from emp
where substr(ename, -2, 2) = 'ES';

--문제) emp 테이블의 사원중 이름의 4번째 글자가 'E'인 사원의 이름, 부서번호, 월급을 출력하는 쿼리문을 작성 (LIKE, INSTR, SUBSTR)

select ename 이름, deptno 부서번호, sal 월급
from emp
where ename LIKE '___E%';


select ename 이름, deptno 부서번호, sal 월급
from emp
where substr(ename, 4, 1) = 'E';



select ename 이름, deptno 부서번호, sal 월급
from emp
where Instr(ename, 'E', 4) = 4;


--문제) emp 테이블의 ename 컬럼에서 이름의 마지막 글자가 'D' 인 사원의 이름, 월급, 입사일을 출력하는 쿼리문을 사용(LIKE, INSTR, SUBSTR)

select ename 이름, sal 월급, hiredate 입사일
from emp
where ename LIKE '%D';


select ename 이름, sal 월급, hiredate 입사일
from emp
where INSTR(ename, 'D', length(ename)) = length(ename);

select ename 이름, sal 월급, hiredate 입사일
from emp
where INSTR(ename, 'D', -1, 1) = -1;


select ename 이름, sal 월급, hiredate 입사일
from emp
where SUBSTR(ename, length(ename), 1) = 'D';


select ename 이름, sal 월급, hiredate 입사일
from emp
where SUBSTR(ename, -1, 1) = 'D';












