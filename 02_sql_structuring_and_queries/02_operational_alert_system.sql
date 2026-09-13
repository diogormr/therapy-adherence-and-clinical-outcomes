-- QUERY 2 - OPERATIONAL ALERT SYSTEM
-- Can we flag patients who have completely missed 3 scheduled app sessions in a row?

-- Create patient session history with 3 consecutive session windows

with three_session_windows as (

	select
	patient_id,
	session_date,
	completed,
	lag(completed, 1) over (partition by patient_id order by session_date asc) as prev_session_1,
	lag(completed, 2) over (partition by patient_id order by session_date asc) as prev_session_2
	
	from session_logs as sl
	join treatment_plans as tp
	on sl.plan_id = tp.plan_id

)

-- Filter for patients who missed 3 consecutive sessions at any time during their treatment plan

select distinct
p.patient_id,
p.age,
p.condition

from three_session_windows as tsw
join patients as p
on tsw.patient_id = p.patient_id

where
completed = 0 and
prev_session_1 = 0 and
prev_session_2 = 0

order by patient_id
