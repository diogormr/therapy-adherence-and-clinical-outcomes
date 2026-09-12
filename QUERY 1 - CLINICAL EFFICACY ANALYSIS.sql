
-- QUERY 1 - CLINICAL EFFICACY ANALYSIS
-- Do patients who stick to the digital program experience a greater reduction in pain than those who do not?

-- Calculate individual adherence rates across all scheduled sessions
with patient_adherence as (	
	
	select
	tp.patient_id,
	round(sum(sl.completed::numeric) / count(sl.session_id) * 100 , 2) as adherence_rate
	
	from treatment_plans as tp
	join session_logs as sl
	on tp.plan_id = sl.plan_id
	
	group by tp.patient_id
	
),

-- Get individual patient Baseline and Final pain score, side by side
	patient_pain_delta as (

	select
	patient_id,
	max(case when assessment_type = 'Baseline' then pain_score end) as baseline_pain,
	max(case when assessment_type = 'Final' then pain_score end) as final_pain

	from clinical_assessments

	group by patient_id

)

-- Calculate average pain reduction in patients with high treatment adherence rates and low treatment adherence rates

select

case when adherence_rate >= 70 then 'High adherence (>=70%)' else 'Low adherence (<70%)' end as adherence_cohort,
count(pa.patient_id) as total_patients,
round(avg(adherence_rate), 2) as avg_adherence_rate,
round(avg(baseline_pain), 2) as avg_baseline_pain,
round(avg(final_pain), 2) as avg_final_pain,
round(avg(baseline_pain - final_pain), 2) as avg_pain_reduction

from patient_adherence as pa
join patient_pain_delta as ppd
on pa.patient_id = ppd.patient_id

group by 1

order by avg_pain_reduction desc;