create database HMS;
use HMS;

create table DiagnosisDimension(
DiagnosisKey int primary key,
DiagnosisID int,
DiagnosisDetails text
);

create table ProcedureDimension(
ProcedureKey int primary key,
ProcedureID int,
ProcedureName varchar(255)
);

create table DoctorDimension(
DoctorKey int primary key,
DoctorID int,
DoctorName varchar(100),
Specialty varchar(100),
ContactNumber varchar(15),
Email varchar(100)
);

create table PatientDimension(
PaitientKey int primary key,
PaitientID int,
PatientName varchar(100),
DOB Date,
Gender enum("Male","Female","Other"),
Address Text
);

create table DateDimension(
DateKey int primary key,
Date date,
Day int,
Month int,
Year int,
Weekday int
);

create table PatientVisits_Fact(
DateKey int,
PatientKey int,
DiagnosisKey int,
ProcedureKey int,
DoctorKey int,
BillAmount int,
PaymentStatus enum("paid","unpaid"),
foreign	key (DateKey) references DateDimension(DateKey),
foreign key (PatientKey) references PatientDimension(PatientKey),
foreign key (DiagnosisKey) references DiagnosisDimension(DiagnosisKey),
foreign key (ProcedureKey) references ProcedureDimension(ProcedureKey),
foreign key (DoctorKey) references DoctorDimension(DoctorKey)
);


select * from DiagnosisDimension;
select * from DateDimension;
select * from ProcedureDimension;
select * from PatientDimension;
select * from DoctorDimension;
select * from PatientVisits_Fact;

-- Inserting data in database 

insert into DiagnosisDimension (DiagnosisKey, DiagnosisID, DiagnosisDetails) values
(1, 101, 'Fever'),
(2, 102, 'Headache'),
(3, 103, 'Cold'),
(4, 104, 'Stomachache'),
(5, 105, 'Infection');

insert into ProcedureDimension (ProcedureKey, ProcedureID, ProcedureName) values
(1, 201, 'X-Ray'),
(2, 202, 'Blood Test'),
(3, 203, 'Ultrasound'),
(4, 204, 'MRI'),
(5, 205, 'Surgery');

insert into DoctorDimension (DoctorKey, DoctorID, DoctorName, Specialty, ContactNumber, Email) values
(1, 301, 'Dr. John Smith', 'Cardiologist', '123-456-7890', 'john@example.com'),
(2, 302, 'Dr. Emily Brown', 'Pediatrician', '987-654-3210', 'emily@example.com'),
(3, 303, 'Dr. Michael Johnson', 'Orthopedic Surgeon', '456-789-0123', 'michael@example.com'),
(4, 304, 'Dr. Sarah Lee', 'Dermatologist', '789-012-3456', 'sarah@example.com'),
(5, 305, 'Dr. David Wilson', 'Neurologist', '321-654-9870', 'david@example.com');

insert into PatientDimension (PatientKey, PatientID, PatientName, DOB, Gender, Address) values
(1, 401, 'Alice Johnson', '1990-05-15', 'Female', '123 Main St, City'),
(2, 402, 'Bob Smith', '1985-09-20', 'Male', '456 Oak St, Town'),
(3, 403, 'Charlie Brown', '1978-12-10', 'Male', '789 Elm St, Village'),
(4, 404, 'Diana Lee', '1992-03-25', 'Female', '567 Maple St, Suburb'),
(5, 405, 'Eva Wilson', '1980-08-05', 'Female', '890 Pine St, Countryside');

insert into DateDimension (DateKey, Date, Day, Month, Year, Weekday) values
(1, '2023-01-01', 1, 1, 2023, 2),
(2, '2023-02-15', 15, 2, 2023, 4),
(3, '2023-03-20', 20, 3, 2023, 1),
(4, '2023-04-10', 10, 4, 2023, 2),
(5, '2023-05-05', 5, 5, 2023, 5);

insert into PatientVisits_Fact (DateKey, PatientKey, DiagnosisKey, ProcedureKey, DoctorKey, BillAmount, PaymentStatus) values
(1, 1, 1, 2, 1, 500, 'paid'),
(2, 2, 2, 3, 2, 750, 'unpaid'),
(3, 3, 3, 4, 3, 1000, 'paid'),
(4, 4, 4, 5, 4, 1500, 'unpaid'),
(5, 5, 5, 1, 5, 2000, 'paid');



-- - Write necessary queries to register new user roles and personas
create table Roles(
RolesID int primary key,
RoleName varchar(50)
);

insert into Roles (RolesID, RoleName) values
(1,'Admin'),
(2,'Doctor'),
(3,'Nurse'),
(4,'Patient');

select * from Roles;

-- Write necessary queries to add to the list of diagnosis of the patient tagged by date.
insert into DiagnosisDimension (DiagnosisID, DiagnosisDetails) VALUES (106, 'Fever');

-- Write necessary queries to fetch required details of a particular patient.
select * from PatientDimension  where PatientID = 401;

-- Write necessary queries to fetch and show data from various related tables (Joins)
select 
    p.PatientName, 
    d.DiagnosisDetails, 
    dd.Date
from 
    PatientDimension p
join 
    PatientVisits_Fact dv ON p.PatientKey = dv.PatientKey
join 
    DiagnosisDimension d ON dv.DiagnosisKey = d.DiagnosisKey
join 
    DateDimension dd ON dv.DateKey = dd.DateKey;




