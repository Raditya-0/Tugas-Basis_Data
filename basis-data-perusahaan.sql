-- Table: Dept
CREATE TABLE Dept (
    dno int NOT NULL PRIMARY KEY,
    dname varchar(20) NOT NULL,
    dloc varchar(20) NOT NULL
);

-- Table: jenjang_pendidikan
CREATE TABLE jenjang_pendidikan (
    kode_jenjang_pendidikan char(1) NOT NULL PRIMARY KEY,
    nama_jenjang varchar(11) NOT NULL
);

-- Table: employee
CREATE TABLE employee (
    empid char(2) NOT NULL PRIMARY KEY,
    empname varchar(20) NOT NULL,
    dept_dno int NOT NULL,
    job_id char(1) NULL,
    CONSTRAINT employee_dept FOREIGN KEY (dept_dno) REFERENCES Dept (dno)
);

-- Table: dependent
CREATE TABLE dependent (
    dp_id int NOT NULL PRIMARY KEY,
    dp_name varchar(20) NOT NULL,
    fk_jejang_pendidikan char(1) NOT NULL,
    empid char(2) NOT NULL,
    CONSTRAINT fk_empid FOREIGN KEY (empid) REFERENCES employee(empid),
    CONSTRAINT fk_jejang FOREIGN KEY (fk_jejang_pendidikan) REFERENCES jenjang_pendidikan(kode_jenjang_pendidikan)
);

-- Masukkan data Dept
INSERT INTO Dept (dno, dname, dloc) 
VALUES 
    (1, 'Sales', 'main office'),
    (2, 'Finance', 'main office'),
    (3, 'Human Resource', 'branch 1');

-- Masukkan data jenjang_pendidikan
INSERT INTO jenjang_pendidikan (kode_jenjang_pendidikan, nama_jenjang) 
VALUES 
    ('A', 'SD'),
    ('B', 'SMP'),
    ('C', 'SMA'),
    ('D', 'Universitas');

-- Masukkan data employee
INSERT INTO employee (empid, empname, dept_dno, job_id) 
VALUES 
    ('11', 'Belvany', 1, 'A'),
    ('14', 'Jonathan', 3, NULL),
    ('27', 'Radit', 1, 'B'),
    ('29', 'Wayan', 2, NULL);

-- Masukkan data dependent
INSERT INTO dependent (dp_id, dp_name, fk_jejang_pendidikan, empid) 
VALUES 
    (1, 'Belvany', 'D', '11'),
    (2, 'Jonathan', 'D', '14'),
    (3, 'Radit', 'D', '27'),
    (4, 'Wayan', 'D', '29');

-- Query: Ambil detail karyawan beserta informasi departemen, tanggungan, dan jenjang pendidikan
SELECT * 
FROM employee e 
INNER JOIN Dept dpt ON dpt.dno = e.dept_dno 
INNER JOIN dependent d ON d.empid = e.empid 
INNER JOIN jenjang_pendidikan j ON j.kode_jenjang_pendidikan = d.fk_jejang_pendidikan;