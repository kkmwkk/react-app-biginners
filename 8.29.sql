


--매니저가 'KING'인 사원들의 이름과 직급을 출력하시오.

SELECT E.ENAME, E.JOB, E.MGR FROM EMP E, EMP DD
WHERE DD.EMPNO = E.MGR  // DD.EMPNO = E.MGR "상관 번호와 사원 번호가 같다.
AND DD.ENAME = 'KING';



--1. JONES와 동일한 근무지에서 근무하는 사원 이름과, 월급, 근무지를 출력하시오. (단, JONES는 제외하시오.)

SELECT F.ENAME, F.SAL, D.LOC FROM EMP E, EMP F, DEPT D
WHERE E.DEPTNO = D.DEPTNO     //EMP와 DEPT를 쓸 경우에 이 코드는 무조건 넣어준다. (그래야 근무지 가능)
AND E.DEPTNO = F.DEPTNO           // 앞서 만든 EMP E와 EMP F의 DEPTNO 부서 번호가 같다는 표시
AND E.ENAME = 'JONES'                 // EMP E에 있는 ENAME에 'JONES'와 같은 부서는 출력하겠다는 의미
AND F.ENAME <> 'JONES';              //EMP F에 있는 ENAME에 'JONES' 이름은 빼겠다는 의미


--2. 이름이 'SMITH'인 사원의 매니저 이름을 출력하시오.

SELECT E.ENAME || '의 매니져는' || M.ENAME || '입니다.'
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO         //나의 상관 번호와 사원번호는 같다.
AND E.ENAME = 'SMITH';



--3. EMP 테이블의 사원들의 이름과 그 사원의 매니져 이름을 출력하시오.

SELECT E.ENAME || '의 매니져는' || M.ENAME || '입니다.'
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;



SELECT E.ENAME || '의 매니져는' || M.ENAME || '입니다.'
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO(+); //매니저가 없는 KING도 출력할 수 있는 Outer Join 기법








--EMP 테이블에 존재하지 않는 40번 부서를 출력하는 출력문

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;  =>  없는 쪽에 (+)를 한다. EMP 테이블에는 40번 부서가 없기 때문에 EMP 쪽에 (+)



--3. 사원 이름에 'T' 자가 들어가는 사원들의 이름과 부서명을 출력하시오.

(Oracle Join)
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.ENAME LIKE '%T%';


(ANSI Join)
SELECT E.ENAME, D.DNAME
FROM EMP E NATURAL JOIN DEPT D
WHERE E.ENAME LIKE '%T%';


--4. 사원 이름과 직급, 급여, 급여등급을 출력하시오.

SELECT E.ENAME, E.JOB, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


SELECT E.ENAME, E.JOB, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL >= S.LOSAL  AND E.SAL <= S.HISAL; //이런 방식으로도 사용할 수 있음.



(ANSI Join)
SELECT E.ENAME, E.JOB, E.SAL, S.GRADE
FROM EMP E NATURAL JOIN SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;



--5. 'DALLAS'에서 근무하는 사원들의 이름, 직급, 부서번호, 부서 이름을 출력하시오.

SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'DALLAS';



(ANSI Join)
SELECT E.ENAME, E.JOB, DEPTNO, D.DNAME
FROM EMP E NATURAL JOIN DEPT D // NATURAL JOIN에 사용되는 'E.DEPTNO = D.DEPTNO' 식별자를 나눌 필요가                                                                     없기에 SELECT 절에서도 구분을 빼준다.
WHERE D.LOC = 'DALLAS';



--6. 'SMITH'의 사원 이름, 부서번호와 'SMITH'와 같은 부서에 있는 사원 이름을 출력하시오.
(해당 사원과 같은 부서에 있는 사원을 '동료'라 표시하시오.) //SELF JOIN

SELECT E.ENAME, E.DEPTNO, K.ENAME "동료"   //SELF JOIN을 잘 생각하자.
FROM EMP E, EMP K                                               
WHERE E.DEPTNO = K.DEPTNO
AND E.ENAME = 'SMITH' AND
K.ENAME ^= 'SMITH';







--6. 'JONES'의 부서명을 출력하시오.

SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES'; //JONES의 부서번호를 구하는 출력문
SELECT D.DNAME FROM DEPT WHERE DEPTNO = 20; //JONES의 
SELECT E.ENAME, E.DEPTNO, D.DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'JONES'; //JOIN을 사용해 
SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES');



--7. 'CLARK' 과 같은 부서에서 근무하는 사원의 이름과 부서번호를 출력하는 쿼리문을 작성하시오.
(단, CLARK는 제외하시오.)

SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK') AND ENAME ^= 'CLARK'; //AND를 쓸 때는 괄호를 닫아준다.



--8. 'WARD' 와 동일한 직급을 가진 사원의 이름과 월급을 출력하는 쿼리문을 작성하시오.

SELECT ENAME, SAL, JOB FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'WARD');



--9. 평균 급여보다 많이 받는 사원의 이름과 급여, 부서 번호를 출력하되, 급여가 많은 순서로 출력하시오.

SELECT ENAME, SAL, DEPTNO FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL DESC;        //ORDER BY 절을 이런식으로 사용 가능. 정렬을 볼 때는 반드시 ORDER BT 절 사용.






--10. 자신의 직속 상관이 'KING'인 사원의 이름과 급여를 출력하시오.
(SUB QUERY, JOIN)

(SUB Query)
SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

(Self Join)
SELECT E.ENAME, E.SAL FROM EMP E, EMP DD WHERE DD.EMPNO = E.MGR AND DD.ENAME = 'KING';



--11. 부서번호가 10번인 사원들 중에서 최대 급여를 받는 사원과 동일한 사람의 이름과 월급 직급을 출력하시오.

SELECT ENAME, SAL, JOB, DEPTNO FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 10);



--12. 'DALLAS'에서 근무하는 사원의 이름, 부서번호, 근무지를 출력하는 서브 쿼리문을 작성하시오.

SELECT ENAME, EMP.DEPTNO, DEPT.LOC FROM EMP, DEPT WHERE EMP.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS') AND LOC = 'DALLAS'; //테이블 이름을 적어준 것.


SELECT E.ENAME, E.DEPTNO, D.LOC FROM EMP E, DEPT D WHERE E.DEPTNO = (SELECT D.DEPTNO FROM DEPT WHERE LOC = 'DALLAS') AND LOC = 'DALLAS'; //약자를 적어준 것.


--13. 'CLARK' 보다 먼저 입사한 사원의 이름과 월급과 입사일을 출력하는 쿼리문을 작성하시오.
(JOIN, SUB QUERY 두가지로 작성)
(
SUB QUERY)
SELECT ENAME, SAL, HIREDATE FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'CLARK');

(JOIN 방법 반드시 기억할것)
SELECT E.ENAME, E.SAL, E.HIREDATE FROM EMP E, EMP K
WHERE E.HIREDATE < K.HIREDATE
AND K.ENAME = 'CLARK';











--IN 연산자를 사용하여 부서 별로 가장 급여를 많이 받는 사원의 이름, 급여 부서 번호를 출력하시오.

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);



--15. JOB이 'MANAGER'인 사원이 속한 부서의 부서 번호와 부서명, 지역을 출력하시오.

SELECT * FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER');


--16. 급여를 3000 이상 받는 사원이 속한 부서의 모든 사원을 출력하는 쿼리문을 작성하시오.

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL IN (SELECT SAL FROM EMP WHERE SAL >= 3000); //3000이상인 사원만 출력하는 출력문

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >= 3000); //3000이상인 사원이 있으면 모든 부서 사원을 출력하는 출력문


ALL
- ALL 연산자는 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모두 일치하면 참



--17. 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름과 급여를 출력하시오.

(다중행 방식)
SELECT ENAME, SAL FROM EMP WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);


(단일행 방식)
SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);



> ALL : 최대 값 보다 큰 사람

< ALL : 최소 값 보다 작은 사람

> ANY : 최소 값 보다 큰 사람

< ANY : 최대 값 보다 작은 사람 모두




--18. 30번 소속 사원 중에 가장 작은 월급을 받는 사람보다 더 많은 급여를 받는 사람을 출력하시오.

(다중행)
SELECT ENAME, SAL FROM EMP WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

(단일행)
SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);