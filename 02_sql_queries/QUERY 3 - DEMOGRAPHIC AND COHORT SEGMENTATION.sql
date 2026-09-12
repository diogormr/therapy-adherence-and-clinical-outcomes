-- QUERY 3 - DEMOGRAPHIC AND COHORT SEGMENTATION
-- Which patient demographics struggle the most with our digital platform?
-- Are older patients less adherent? Does the specific medical condition affect compliance?

-- Calculate adherence rate by patient condition and age group

select
condition,
case
when age < 40 then 'Under 40'
when age between 40 and 59 then '40 - 59'
else '60 and Over'
end as age_group,
count(distinct p.patient_id) as patient_count,
round(sum(completed::decimal) / count(session_id) * 100, 2) as adherence_rate

from patients as p
join treatment_plans as tp
on p.patient_id = tp.patient_id
join session_logs as sl
on tp.plan_id = sl.plan_id

group by condition, age_group

order by condition, min(age)