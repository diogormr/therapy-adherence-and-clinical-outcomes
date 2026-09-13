# Digital Therapy Adherence & Clinical Outcomes

## 📌 Summary

Designed and deployed an end-to-end clinical analytics pipeline that simulates patient adherence to a digital musculoskeletal therapy program and individual clinical outcomes. This project generates synthetic healthcare data in Python, and uses PostgreSQL to structure data relationships via a star schema and run analytical SQL queries. It then performs statistical testing and plotting using SciPy and Seaborn, and delivers an interactive Power BI dashboard that evaluates treatment efficacy and flags low-adherence "at-risk" patients. Patients with high adherence rates demonstrated a statistically significant reduction in pain scores compared to low-adherence patients.

## 🛠️ Tech Stack & System Requirements

- Languages & Libraries: Python 3.13.9 (pandas, numpy, matplotlib, seaborn, scipy)
- Database Management: PostgreSQL 18 / pgAdmin 4
- Business Intelligence: Power BI Desktop (DAX Modeling)
- Dependencies: Documented in 📄 [`requirements.txt`](requirements.txt)

## 🚀 Project Pipeline

### Phase 1: Synthetic Data Generation (Python - NumPy and Pandas)

- Generated a synthetic multi-table relational dataset containing treatment plans, session logs, and clinical assessments from 1,000 patients that mirrors real-world digital health engagement patterns.
- Modeled higher pain score reductions for high-adherence (≥ 70%) patients using probability distributions.
- 📄 Code: [`01_data_generation/data_generation.ipynb`](01_data_generation/data_generation.ipynb)

### Phase 2: Database Design & Relational SQL (PostgreSQL)
- Modeled a PostgreSQL star schema optimized for performant analytical queries across patient cohorts.
- Authored SQL queries utilizing Window Functions, CTEs, and conditional aggregation to calculate adherence rates and cohort drop-off percentages prior to BI ingestion.📄 Code: 02_sql_queries/cohort_adherence_analysis.sql

### Phase 3: Data Visualization & Inferential Statistics (Python - Seaborn and SciPy)

- Built heatmaps and distribution plots using seaborn and matplotlib to isolate potential collinearity between age brackets, treatment conditions, and adherence rates.📄 Code: 03_python_eda/eda_and_statistics.ipynb
- Conducted Welch's Two-Sample t-test (scipy.stats.ttest_ind, equal_var=False) comparing high-adherence ($\ge 70\%$) and low-adherence ($< 70\%$) patient cohorts, confirming a statistically significant difference in pain score reduction ($p < 0.05$).

### Phase 4: BI Reporting (Power BI & DAX)

- Built an interactive Power BI report featuring dynamic demographic slicers and automated conditional formatting to flag high-risk patients ($< 50\%$ adherence).Clinical Insight: Identified 318 at-risk patients (31.8% of cohort), with the lowest adherence concentrated in the 56+ age demographic suffering from Lower Back Pain and Knee Osteoarthritis.📄 Documentation: 04_power_bi_dashboard/dax_measures.md
