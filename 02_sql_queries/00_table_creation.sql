-- Creating "patients" table

create table patients (
patient_id int primary key,
age int,
gender varchar(10),
condition varchar(50)
);

-- Creating "treatment_plans" table

create table treatment_plans (
plan_id int primary key,
patient_id int references patients(patient_id),
start_date date,
end_date date,
prescribed_sessions_per_week int
);

-- Creating "session_logs" table

create table session_logs (
session_id int primary key,
plan_id int references treatment_plans(plan_id),
session_date date,
duration_minutes int,
completed int,
pain_pre numeric,
pain_post numeric
);

-- Creating "clinical_assessments" table

create table clinical_assessments (
assessment_id int primary key,
patient_id int references patients(patient_id),
assessment_date date,
assessment_type varchar(20),
pain_score numeric
)
