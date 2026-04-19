# 📊 Data Analytics Professional Course

> **NYCTA — National Youth Computer Training Center**  
> A complete, industry-aligned data analytics curriculum covering everything from Python fundamentals to Generative AI tools — built to get you job-ready.

---

## 🗂️ Course Modules

| # | Module | Topics |
|---|---|---|
| 1 | 🐍 Python | Core syntax, data structures, OOP, libraries |
| 2 | 🗄️ SQL | Querying, joins, aggregations, subqueries |
| 3 | 🤖 Machine Learning | Supervised & unsupervised, model evaluation |
| 4 | 📐 Statistics | Descriptive, inferential, probability |
| 5 | 🌿 Git Advanced | Branching, merging, rebasing, collaboration |
| 6 | 📊 Power BI | Dashboards, DAX, data modelling |
| 7 | 📗 Excel | Pivot tables, VLOOKUP, Power Query |
| 8 | ✨ Generative AI Tools | Prompt engineering, AI-assisted workflows |
| 9 | 💼 Interview Projects | Portfolio-ready end-to-end projects |

---

## 🐍 1. Python for Data Analytics

Core Python skills every data analyst needs.

- **Fundamentals** — variables, loops, conditionals, functions
- **Data Structures** — lists, dictionaries, sets, tuples
- **OOP** — classes, objects, inheritance
- **Key Libraries** — `NumPy`, `Pandas`, `Matplotlib`, `Seaborn`
- **File Handling** — reading/writing CSV, JSON, Excel files

```python
import pandas as pd
import numpy as np

df = pd.read_csv('data.csv')
df.describe()
```

---

## 🗄️ 2. SQL

Query and manage data from relational databases.

- **Basics** — `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- **Joins** — `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`
- **Aggregations** — `GROUP BY`, `HAVING`, `COUNT`, `SUM`, `AVG`
- **Advanced** — subqueries, CTEs (`WITH`), window functions (`ROW_NUMBER`, `RANK`)
- **Database Design** — normalization, primary/foreign keys

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE status = 'Active'
GROUP BY department
HAVING AVG(salary) > 50000
ORDER BY avg_salary DESC;
```

---

## 🤖 3. Machine Learning

Build and evaluate predictive models.

- **Supervised Learning** — Linear Regression, Logistic Regression, Decision Trees, Random Forest, XGBoost
- **Unsupervised Learning** — K-Means Clustering, PCA
- **Model Evaluation** — accuracy, precision, recall, F1-score, confusion matrix, ROC-AUC
- **Workflow** — train/test split, cross-validation, hyperparameter tuning
- **Libraries** — `scikit-learn`, `XGBoost`

```python
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
model = RandomForestClassifier()
model.fit(X_train, y_train)
print(model.score(X_test, y_test))
```

---

## 📐 4. Statistics

The mathematical backbone of data analysis.

- **Descriptive Statistics** — mean, median, mode, standard deviation, variance
- **Probability** — distributions (normal, binomial, Poisson), Bayes' theorem
- **Inferential Statistics** — hypothesis testing, p-values, confidence intervals
- **Tests** — t-test, chi-square test, ANOVA
- **Correlation & Regression** — Pearson correlation, linear regression assumptions

---

## 🌿 5. Git Advanced

Professional version control and team collaboration.

- **Core Workflow** — `clone`, `add`, `commit`, `push`, `pull`
- **Branching** — `git branch`, `git checkout`, `git switch`
- **Merging & Rebasing** — resolving conflicts, `git rebase`, `git cherry-pick`
- **Collaboration** — pull requests, code reviews, forks
- **Best Practices** — `.gitignore`, commit message conventions, tagging releases

```bash
git checkout -b feature/new-analysis
git add .
git commit -m "feat: add sales trend analysis notebook"
git push origin feature/new-analysis
```

---

## 📊 6. Power BI

Create interactive dashboards and business intelligence reports.

- **Data Connection** — importing from Excel, SQL, APIs, web
- **Data Modelling** — relationships, star schema, calculated columns
- **DAX** — `CALCULATE`, `SUMX`, `FILTER`, time intelligence functions
- **Visualizations** — bar/line charts, maps, slicers, KPI cards
- **Publishing** — sharing reports, Power BI Service, scheduled refresh

---

## 📗 7. Excel for Analytics

Advanced Excel skills for business data analysis.

- **Formulas** — `VLOOKUP`, `XLOOKUP`, `INDEX-MATCH`, `IF`, `SUMIF`, `COUNTIF`
- **Pivot Tables** — grouping, filtering, calculated fields
- **Power Query** — data transformation, merging tables, cleaning
- **Charts & Dashboards** — dynamic charts, slicers, conditional formatting
- **Data Validation** — dropdowns, error alerts, input restrictions

---

## ✨ 8. Generative AI Tools

Leverage AI to supercharge your analytics workflow.

- **Prompt Engineering** — writing effective prompts for data tasks
- **AI-Assisted Coding** — using ChatGPT / Claude to debug, explain, and generate code
- **Data Analysis with AI** — using AI to interpret results and generate insights
- **AI Tools for Analysts** — ChatGPT, Claude, Gemini, GitHub Copilot, Perplexity
- **Ethics & Limitations** — hallucinations, data privacy, responsible AI use

---

## 💼 9. Interview Projects

End-to-end projects built for your portfolio and interviews.

| Project | Tools | Description |
|---|---|---|
| 🛒 Sales Performance Dashboard | Power BI + Excel | Regional sales trends, KPIs, YOY comparison |
| 🏠 Housing Price Prediction | Python + ML | Regression model with EDA and feature engineering |
| 🧹 Customer Churn Analysis | SQL + Python | Identify at-risk customers using classification |
| 📉 Exploratory Data Analysis | Pandas + Seaborn | Full EDA report on a real-world dataset |
| 🤖 AI-Assisted Reporting | Generative AI | Automated insight generation from raw data |

---

## 🛠️ Tools & Technologies

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)

---

## 📁 Repository Structure

```
Data_Analytics_Professional_Course/
│
├── 📂 Python/                  # Notebooks and scripts
├── 📂 SQL/                     # Queries and schema files
├── 📂 Machine Learning/        # Model training notebooks
├── 📂 Statistics/              # Concept notes and exercises
├── 📂 Git Advanced/            # Workflow guides
├── 📂 Power BI/                # .pbix dashboard files
├── 📂 Excel/                   # Workbooks and templates
├── 📂 Generative AI Tools/     # Prompt guides and use cases
├── 📂 Portfolio/               # Interview-ready projects
└── README.md
```

---

## 🚀 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/programmer-sahil/Data_Analytics_Professional_Course.git
   ```

2. **Install Python dependencies**
   ```bash
   pip install numpy pandas matplotlib seaborn scikit-learn jupyter
   ```

3. **Launch Jupyter**
   ```bash
   jupyter notebook
   ```

---

## 🙌 About

This course is offered by **NYCTA (National Youth Computer Training Center)** — empowering the next generation of data professionals with practical, job-ready skills.

> ⭐ Star this repo if you're following along!
