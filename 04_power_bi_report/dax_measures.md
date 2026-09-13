## 1. Patient Volume & Risk Metrics

```dax

Total Patients = DISTINCTCOUNT(patients[patient_id])

At Risk Patients = 
CALCULATE(
    COUNT(patients[patient_id]),
    patients[Is At Risk] = "At Risk"
)

```

## 2. Clinical Outcomes (Pain Scores)

```dax

Avg Baseline Pain = 
CALCULATE(
    AVERAGE(clinical_assessments[pain_score]), 
    clinical_assessments[assessment_type] = "Baseline"
)

Avg Final Pain = 
CALCULATE(
    AVERAGE(clinical_assessments[pain_score]), 
    clinical_assessments[assessment_type] = "Final"
)

Avg Pain Drop = [Avg Baseline Pain] - [Avg Final Pain]

```

## 3. Adherence Tracking

```dax

Overall Adherence Rate (%) = 
COALESCE(
    DIVIDE(
        SUM(session_logs[completed]),
        COUNTROWS(session_logs)
    ),
    0
)

```