-- 매니저가 'KING'인 사원들의 이름과 직급을 출력하시오
SELECT E.ename, E.job, E.mgr
FROM EMP E, EMP DD
WHERE DD.Empno = E.mgr
AND DD.ename = 'KING';

-- JONES와 동일한 근무지에서 근무하는 사원 이름과, 월급, 근무지를 출력하시오. (단 JONES는 제외하시오.)
SELECT E.ename, E.sal, d.loc
FROM EMP E, EMP F, DEPT D
WHERE E.deptno = D.deptno
AND E.deptno = F.deptno
AND E.ename = 'JONES'
AND F.ename <> 'JONES';

-- 이름이 'SMITH'인 사원의 매니저 이름을 출력하시오
SELECT E.ename || '의 매니저는' || M.ename || '입니다.'
FROM EMP E, EMP M
WHERE E.mgr = M.empno
AND E.ename = 'SMITH';

-- EMP 테이블의 사원들의 이름과 그 사원의 매니저 이름을 출력하시오.
SELECT E.ename || '의 매니저는' || M.ename || '입니다.'
FROM EMP E, EMP M
WHERE E.mgr = M.empno;

-- 매니저가 없는 KING도 출력할 수 있는 Outer Join 기법
SELECT E.ename || '의 매니저는' || M.ename || '입니다.'
FROM EMP E, EMP M
WHERE E.mgr = M.empno(+);

-- EMP 테이블에 존재하지 않는 40번 부서를 출력하는 출력문

