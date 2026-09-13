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
- 🗃️ Data: [`01_data_generation/data`](01_data_generation/data.ipynb)

### Phase 2: Database Design & Querying (PostgreSQL)
- Modeled a PostgreSQL star schema optimized for analytical querying across patient cohorts.
- 📄 Code: ['02_sql_queries/00_table_creation.sql'](02_sql_queries/00_table_creation.sql)
- Leveraged Window Functions, CTEs, and conditional aggregation to calculate adherence rates and clinical efficacy, build an operational alert system for low-adherence patients, and segment patients by demographics and cohort.
- 📄 Code: ['02_sql_queries'](02_sql_queries)
- 🗃️ SQL Outputs: ['02_sql_queries'](02_sql_queries)

### Phase 3: Data Visualization & Statistics (Python - Seaborn and SciPy)

- Built Seaborn box plots to compare pain reduction distributions between High Adherence (≥ 70%) and Low Adherence (< 70%) cohorts, alongside a scatter plot with a linear regression trendline mapping pain reduction against continuous adherence rates.
- 📊 Plots: ![`03_plotting_and_stats/pain_vs_adherence_seaborn_plots.png`](03_plotting_and_stats/pain_vs_adherence_seaborn_plots.png)
- Employed a Welch’s t-test in SciPy to confirm a statistically significant difference in pain reduction between adherence groups ($p < 0.001$), and calculated a strong positive Pearson correlation coefficient to quantify the strength of the linear relationship between treatment adherence and clinical outcomes ($r = 0.724, p < 0.001$).
- 📄 Code: [`03_plotting_and_stats/plotting_and_stats.ipynb`](03_plotting_and_stats/plotting_and_stats.ipynb)

### Phase 4: BI Reporting (Power BI & DAX)

- Built an interactive Power BI report featuring dynamic demographic slicers and automated conditional formatting to flag high-risk patients ($< 50\%$ adherence).
- Identified 318 at-risk patients (31.8% of cohort), with the lowest adherence concentrated in the 56+ age demographic suffering from Lower Back Pain and Knee Osteoarthritis.
- 📄 Documentation: 04_power_bi_dashboard/dax_measures.md
- 💾 Power BI File: ![`04_power_bi_report/bi_report.pbix`](04_power_bi_report/bi_report.pbix)
- 📊 Dashboard: ![`03_plotting_and_stats/pain_vs_adherence_seaborn_plots.png`](03_plotting_and_stats/pain_vs_adherence_seaborn_plots.png)
