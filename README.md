# Hospital Management System
## Overview

The Hospital Management System (HMS) is a database system designed to streamline the management of patient information, diagnosis, procedures, doctors, and visits within a hospital.
Schema Overview

The database schema includes the following tables:

    DiagnosisDimension: Stores diagnosis details.
    ProcedureDimension: Stores procedure details.
    DoctorDimension: Stores doctor details.
    PatientDimension: Stores patient details.
    DateDimension: Stores date details.
    PatientVisits_Fact: Fact table storing patient visit information.

Features

    User Roles: Roles such as Admin, Doctor, Nurse, and Patient can be registered.
    Diagnosis Management: Ability to add diagnosis details for patients.
    Patient Details: Fetch required details of a particular patient.
    Bill Generation: Prepare bills for patients at the end of checkout.
    Data Retrieval: Fetch and show data from various related tables using joins.
    Optimization:
        Views/Materialized Views: Utilize views to optimize repeated read operations.
        Indexing: Indexes created on frequently queried columns.
        Stored Procedures: Use stored procedures for bill generation.
        Triggers: Triggers to indicate when patients' medical insurance limit has expired.

Implementation

This system is implemented using MySQL. The SQL statements provided in this repository can be used to create the database schema and populate sample data.
