

--3) S� se listeze structura tabelelor din schema HR (EMPLOYEES, DEPARTMENTS, JOBS, JOB_HISTORY, LOCATIONS, COUNTRIES, REGIONS), observ�nd tipurile de date ale coloanelor. 

desc employees;
desc departments;
desc jobs;
desc job_history;
desc locations;
desc countries;
desc regions;

--4) S� se listeze con�inutul tabelelor din schema considerat�, afi��nd valorile tuturor c�mpurilor. 

select * from employees;

--5) S� se afi�eze codul angajatului, numele, codul job-ului, data angajarii. Ce fel de opera�ie este aceasta (selec�ie sau proiec�ie)? 

select employee_id, last_name, job_id, hire_date
from employees; -- PROIECTIE

--6)Modifica?i cererea anterioar� astfel �nc�t, la rulare, capetele coloanelor s� aib� numele cod, nume, cod job, data angajarii. 

select employee_id "cod", last_name "nume", job_id "cod job", hire_date "data angajarii" 
from employees; --proiectie

--7) S� se listeze, cu �i f�r� duplicate, codurile job-urilor din tabelul EMPLOYEES. 

select job_id
from employees;
select distinct job_id
from employees;

--8) S� se afi�eze numele concatenat cu job_id-ul, separate prin virgula ?i spatiu. Eticheta?i coloana �Angajat si titlu�. 

select last_name || ', ' || job_id "Angajat si titlu"
from employees;

--9) Crea?i o cerere prin care s� se afi?eze toate datele din tabelul EMPLOYEES pe o singur� coloan�. Separa�i fiecare coloan� printr-o virgul�. Etichetati coloana �Informatii complete�. 

select last_name || ', ' || job_id || ', ' || hire_date || ', ' || salary "Informatii complete"
from employees;

--10) S� se listeze numele si salariul angaja�ilor care c�tig� mai mult de 2850. 

select last_name, salary 
from employees
where salary>2850;

--11) S� se creeze o cerere pentru a afi�a numele angajatului �i codul departamentului pentru angajatul av�nd codul 104. 

select last_name, department_id
from employees
where employee_id=104;

--12) S� se afi�eze numele �i salariul angaja�ilor al c�ror salariu nu se afl� �n intervalul [1500, 2850]. 

select last_name, salary  
from employees
where salary not between 1500 and 2850;


--13) S� se afi�eze numele, job-ul �i data la care au �nceput lucrul salaria�ii angaja�i �ntre 20 Februarie 1987 �i 1 Mai 1989. Rezultatul va fi ordonat cresc�tor dup� data de �nceput. 

select sysdate from dual;

select last_name, job_id, hire_date 
from employees 
where hire_date between '20-02-1987' and '1-02-1989'
order by hire_date;

--14) S� se afi�eze numele salaria�ilor �i codul departamentelor pentru toti angaja�ii din departamentele 10, 30 ?i 50 �n ordine alfabetic� a numelor. 

select last_name, department_id
from employees
where department_id=10 or  department_id=30 or department_id=50 
order by last_name;

--sau
select last_name, department_id
from employees
where department_id in (10,30,50)
order by last_name;

--15) S� se listeze numele �i salariile angaja?ilor care c�tig� mai mult dec�t 1500 �i lucreaz� �n departamentul 10, 30 sau 50. Se vor eticheta coloanele drept Angajat si Salariu lunar. 

select last_name "Angajat", salary "Salariu lunar"
from employees 
where salary>1500 and department_id in (10,30,50);

--16) Care este data curent�? Afi�a�i diferite formate ale acesteia. 

select sysdate
from dual;

select sysdate 
from employees;

select to_char(sysdate, 'dd-mon-year hh24:mi:ss')
from dual;

--17) S� se afi?eze numele �i data angaj�rii pentru fiecare salariat care a fost angajat �n 1987. Se cer 2 solu�ii: una �n care se lucreaz� cu formatul implicit al datei �i alta prin care se formateaz� data. 

select last_name, hire_date
from employees
where to_char(hire_date, 'yyyy')='1987';

select last_name, hire_date
from employees
where hire_date like ('%1987%');

--18) S� se afi?eze numele, prenumele ?i data angaj�rii persoanelor care au �nceput activitatea �ntr-o zi a lunii egal� cu cea a datei curente. 

select last_name, first_name, hire_date 
from employees 
where to_char(hire_date, 'dd')= to_char(sysdate, 'dd');

--19) S� se afi�eze numele �i job-ul pentru to�i angaja�ii care nu au manager. 

select last_name, job_id
from employees
where manager_id is null;

--20) S� se afi?eze numele, salariul ?i comisionul pentru toti salaria?ii care c�?tig� comision (se presupune c� aceasta �nseamn� prezen?a unei valori nenule �n coloana respectiv�). S� se sorteze datele �n ordine descresc�toare a salariilor ?i comisioanelor. 

select last_name, salary, commission_pct
from employees 
where commission_pct is not null
order by  salary desc,  commission_pct desc ;

--21) Elimina�i clauza WHERE din cererea anterioar�. Unde sunt plasate valorile NULL �n ordinea descresc�toare? 

select last_name, salary, commission_pct
from employees 
order by  salary desc,  commission_pct desc;



--22) S� se listeze numele tuturor angaja?ilor care au a treia liter� din nume �A�. 

select last_name
from employees 
where last_name like '__a%';

--23) S� se listeze numele tuturor angajatilor care au 2 litere �L� in nume �i lucreaz� �n departamentul 30 sau managerul lor este 102. 


select last_name
from employees
where (upper(last_name) like ('%L%L%') and department_id=30)  or manager_id=102;

--24) S� se afiseze numele, job-ul si salariul pentru toti salariatii al caror job con�ine �irul �CLERK� sau �REP� ?i salariul nu este egal cu 1000, 2000 sau 3000. (operatorul NOT IN) 

select last_name, job_id, salary
from employees 
where (job_id like '%CLERK%' or   job_id like '%REP%') and salary not in (1000,2000,3000);


--25) S� se afi?eze numele departamentelor care nu au manager. 

select distinct department_name
from departments
where manager_id is null;














