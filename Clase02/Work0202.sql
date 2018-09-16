/*
Ejemplo de %ROWTYPE
*/


CREATE OR REPLACE PROCEDURE SCOTT.PR_SHOW_EMP
( P_EMPNO SCOTT.EMP.EMPNO%TYPE )
IS
  R SCOTT.EMP%ROWTYPE;
BEGIN
  SELECT * INTO R FROM SCOTT.EMP 
  WHERE EMPNO = P_EMPNO;
  DBMS_OUTPUT.PUT_LINE('CODIGO: ' || R.EMPNO);
  DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || R.ENAME);
  DBMS_OUTPUT.PUT_LINE('SALARIO: ' || R.SAL);
END;


SELECT * FROM SCOTT.EMP;

CALL SCOTT.PR_SHOW_EMP(7369);

CALL SCOTT.PR_SHOW_EMP(9999);


/*
Excepciones
*/

CREATE OR REPLACE PROCEDURE SCOTT.PR_SHOW_EMP
( P_EMPNO SCOTT.EMP.EMPNO%TYPE )
IS
  R SCOTT.EMP%ROWTYPE;
BEGIN
  SELECT * INTO R FROM SCOTT.EMP 
  WHERE EMPNO = P_EMPNO;
  DBMS_OUTPUT.PUT_LINE('CODIGO: ' || R.EMPNO);
  DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || R.ENAME);
  DBMS_OUTPUT.PUT_LINE('SALARIO: ' || R.SAL);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Empleado no existe.');
END;

CALL SCOTT.PR_SHOW_EMP(9999);

