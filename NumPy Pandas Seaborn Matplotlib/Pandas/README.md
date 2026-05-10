# 🐼 Pandas — Complete Learning Guide

> **Made by your Tutor — SK SAHIL**
> *Freelance AI Developer · Freelance Coding Tutor · Working in 4 Startups · Graduated from German University with Excellence Grade*

---

## 📌 What is Pandas?

**Pandas** is an open-source Python library used for **data manipulation, analysis, and cleaning**. The name comes from **"Panel Data"** — a term used in statistics and econometrics. It is built on top of **NumPy** and provides two powerful data structures:

- **Series** — A single column of data (1D)
- **DataFrame** — A full table with rows and columns (2D)

Think of Pandas as **Excel for Python** — but with the power of code. You can load data, clean it, filter it, group it, merge tables, and analyze it all with just a few lines of Python.

```python
import pandas as pd   # pd is the universal alias
```

---

## 🌍 Where is Pandas Used?

| Domain | Use Case |
|---|---|
| **Data Science** | EDA, feature engineering, data cleaning |
| **Data Analytics** | Business reports, KPI dashboards |
| **Machine Learning** | Preparing datasets before model training |
| **Finance** | Stock analysis, portfolio tracking |
| **Healthcare** | Patient record analysis |
| **E-Commerce** | Sales trends, customer segmentation |
| **Academia** | Survey data analysis, research datasets |

---

## 🛠️ IDE & Tools

| Tool | Type | Link |
|---|---|---|
| **Jupyter Notebook** | Best for data analysis (cell-by-cell) | [jupyter.org](https://jupyter.org/) |
| **VS Code + Jupyter** | Code editor with notebook support | [code.visualstudio.com](https://code.visualstudio.com/) |
| **PyCharm** | Full Python IDE | [jetbrains.com/pycharm](https://www.jetbrains.com/pycharm/) |
| **Anaconda** | Data science distribution (includes Jupyter) | [anaconda.com](https://www.anaconda.com/) |

## 🌐 Online IDE

| Tool | Link |
|---|---|
| **Google Colab** | [colab.research.google.com](https://colab.research.google.com/) |
| **Kaggle Notebooks** | [kaggle.com/code](https://www.kaggle.com/code) |
| **Binder** | [mybinder.org](https://mybinder.org/) |
| **JupyterLite** | [jupyter.org/try](https://jupyter.org/try) |

## 📚 Official Documentation

- 📖 **Pandas Docs:** [pandas.pydata.org/docs](https://pandas.pydata.org/docs/)
- 📖 **W3Schools Pandas:** [w3schools.com/python/pandas](https://www.w3schools.com/python/pandas/)
- 📖 **Pandas Cheat Sheet (Official):** [pandas.pydata.org/Pandas_Cheat_Sheet.pdf](https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf)

---

## ⚡ Critical Interview Concepts — Read This First!

> These are the **most-asked Pandas interview topics**. Understand each one with the example.

---

### 🔢 Series vs DataFrame

```python
import pandas as pd

# Series = One column (1D)
s = pd.Series([10, 20, 30], index=["Math", "Science", "English"])
# Math       10
# Science    20
# English    30

# DataFrame = Full table (2D) — like an Excel sheet
df = pd.DataFrame({
    "Name":  ["Ali", "Sara", "John"],
    "Marks": [85, 90, 78]
})
#    Name  Marks
# 0   Ali     85
# 1  Sara     90
# 2  John     78
```

> 💡 **Interview Tip:** *"A DataFrame is a collection of Series objects sharing the same index. Each column is a Series."*

---

### 🔍 loc[] vs iloc[]

This is one of the **most commonly asked** interview questions about Pandas.

| | `loc[]` | `iloc[]` |
|---|---|---|
| Based on | **Label** (column/index name) | **Position** (integer number) |
| End value | **Inclusive** | **Exclusive** |
| Use when | You know the label | You know the position number |

```python
df = pd.DataFrame({
    "Name":  ["Ali", "Sara", "John", "David"],
    "Marks": [85, 90, 78, 88]
}, index=[10, 20, 30, 40])   # Custom index

# loc — uses LABEL
df.loc[10]              # Row with label 10 → Ali
df.loc[10:30]           # Labels 10 to 30 (INCLUSIVE — all 3 rows)
df.loc[10, "Name"]      # Specific cell → "Ali"

# iloc — uses POSITION
df.iloc[0]              # First row (position 0) → Ali
df.iloc[0:2]            # Positions 0 to 1 (EXCLUSIVE — 2 rows only)
df.iloc[0, 0]           # Row 0, Column 0 → "Ali"
```

> 💡 **Interview Tip:** *"`loc` is label-based — end is INCLUDED. `iloc` is position-based — end is EXCLUDED, just like Python slicing."*

---

### 🚫 Handling Missing Values — isnull, fillna, dropna

```python
df.isnull()             # True where value is NaN
df.isnull().sum()       # Count missing values per column
df.notnull()            # Opposite of isnull()

# Fill missing values
df["Marks"].fillna(0)                    # Replace NaN with 0
df["Marks"].fillna(df["Marks"].mean())   # Fill with column mean
df.fillna(method="ffill")               # Forward fill (use prev value)
df.fillna(method="bfill")               # Backward fill

# Drop rows/columns with NaN
df.dropna()             # Drop any row with NaN
df.dropna(axis=1)       # Drop any column with NaN
df.dropna(thresh=2)     # Keep rows with at least 2 non-NaN values
```

> 💡 **Interview Tip:** *"Always check `df.isnull().sum()` first during EDA. Decide: fill or drop based on how much data is missing."*

---

### 👥 groupby() — Split → Apply → Combine

```python
# groupby splits data into groups, applies a function, then combines results

df.groupby("Department")["Marks"].mean()     # Avg marks per department
df.groupby("Department")["Marks"].sum()      # Total marks per department

# Multiple aggregations at once
df.groupby("Department")["Marks"].agg(["mean", "max", "min", "count"])

# Group by multiple columns
df.groupby(["Department", "Gender"])["Marks"].mean()
```

> 💡 **Interview Tip:** *"groupby() follows the 'Split-Apply-Combine' pattern — it splits data into groups, applies an aggregation, then combines the results."*

---

### 🔗 merge() vs concat() vs join()

```python
# concat() — Stack DataFrames (rows or columns)
pd.concat([df1, df2])           # Stack rows (axis=0, default)
pd.concat([df1, df2], axis=1)   # Stack columns side by side

# merge() — SQL-style join on a common column
pd.merge(students, marks, on="ID")                    # INNER JOIN
pd.merge(students, marks, on="ID", how="left")        # LEFT JOIN
pd.merge(students, marks, on="ID", how="outer")       # FULL OUTER JOIN

# join() — Join on INDEX
df1.join(df2)                   # Left join on index by default
```

> 💡 **Interview Tip:** *"`merge()` is like SQL JOIN — use it when tables share a common column. `concat()` is for stacking DataFrames together."*

---

### ⚙️ apply() vs map() vs replace()

| Function | Works On | Use Case |
|---|---|---|
| `apply()` | Series or DataFrame | Apply any custom function |
| `map()` | Series only | Map values using dict or function |
| `replace()` | Series or DataFrame | Replace specific values |

```python
# apply() — custom logic per row/cell
df["Result"] = df["Marks"].apply(lambda x: "Pass" if x >= 40 else "Fail")

# apply() on rows (axis=1)
df["Total"] = df.apply(lambda row: row["Math"] + row["Science"], axis=1)

# map() — map values via dictionary
df["Remark"] = df["Grade"].map({"A": "Excellent", "B": "Good", "C": "Average"})

# replace() — simple value replacement
df["Dept"] = df["Dept"].replace("CS", "CSE")
```

---

### 📊 pivot_table() vs crosstab()

```python
# pivot_table — aggregate data into a summary table
pivot = df.pivot_table(
    values="Marks",
    index="Department",
    columns="Gender",
    aggfunc="mean"
)

# crosstab — frequency table (counts)
table = pd.crosstab(df["Department"], df["Gender"])
```

> 💡 **Interview Tip:** *"`pivot_table()` aggregates values (sum, mean, count). `crosstab()` counts frequency of combinations — great for categorical analysis."*

---

### 🔁 Duplicates

```python
df.duplicated()                   # True for duplicate rows
df.duplicated().sum()             # Total duplicate count
df.drop_duplicates()              # Remove duplicate rows
df.drop_duplicates(subset=["Name"])  # Remove by specific column
df.drop_duplicates(keep="last")   # Keep last occurrence
```

---

### 📅 DateTime Operations

```python
# Convert string to datetime
df["Date"] = pd.to_datetime(df["Date"])

# Extract components with .dt accessor
df["Year"]  = df["Date"].dt.year
df["Month"] = df["Date"].dt.month
df["Day"]   = df["Date"].dt.day
df["Weekday"] = df["Date"].dt.day_name()

# Date math
df["Days_Since"] = pd.Timestamp.today() - df["Date"]
```

---

### 🔡 String Operations with .str

```python
df["Name"].str.upper()           # Uppercase
df["Name"].str.lower()           # Lowercase
df["Name"].str.title()           # Title Case
df["Name"].str.strip()           # Remove whitespace
df["Name"].str.len()             # String length
df["Name"].str.contains("Ali")   # Boolean: contains substring
df["Name"].str.startswith("A")   # Starts with
df["Name"].str.replace("old","new")  # Replace in string
df["Name"].str.split(" ")        # Split into list
```

---

## 📚 Topic-by-Topic Reference

### 🟢 BASIC PANDAS

---

#### 1️⃣ Import Pandas

```python
import pandas as pd

print(pd.__version__)   # Check version
```

---

#### 2️⃣ Create a Series

```python
# Series — 1D labeled array
s = pd.Series([10, 20, 30, 40, 50])
# 0    10
# 1    20
# 2    30
# dtype: int64

# Series with custom index
s2 = pd.Series([90, 85, 88], index=["Math", "English", "Science"])
print(s2["Math"])   # 90

# Series from dictionary
s3 = pd.Series({"a": 1, "b": 2, "c": 3})
```

---

#### 3️⃣ Create a DataFrame

```python
# From dictionary (most common way)
data = {
    "Name":   ["Madhu", "Rahul", "Priya", "Arjun", "Neha"],
    "Age":    [20, 21, 19, 22, 20],
    "Course": ["MSC", "BSc", "BBA", "BCA", "BSc"],
    "Marks":  [85, 78, 92, 74, 88]
}
df = pd.DataFrame(data)

# From list of dicts
records = [{"Name": "Ali", "Marks": 85}, {"Name": "Sara", "Marks": 90}]
df2 = pd.DataFrame(records)

# From CSV
df3 = pd.read_csv("data.csv")

# From Excel
df4 = pd.read_excel("data.xlsx")
```

---

#### 4️⃣ View Data — head(), tail(), shape, info(), describe()

```python
df.head()        # First 5 rows (default)
df.head(10)      # First 10 rows
df.tail()        # Last 5 rows
df.tail(3)       # Last 3 rows

df.shape         # (rows, columns) → (5, 4)
df.columns       # Column names → Index(['Name','Age','Course','Marks'])
df.index         # Row index → RangeIndex(start=0, stop=5, step=1)
df.dtypes        # Data type of each column

df.info()        # Column names + non-null count + dtypes — essential for EDA
df.describe()    # Stats summary: count, mean, std, min, quartiles, max
df.describe(include="all")  # Include categorical columns too
```

---

#### 5️⃣ Select Columns

```python
# Select ONE column → returns Series
df["Name"]
df.Name           # Dot notation (use only for simple names, no spaces)

# Select MULTIPLE columns → returns DataFrame
df[["Name", "Marks"]]
df[["Name", "Course", "Marks"]]
```

---

#### 6️⃣ Select Rows — loc[] and iloc[]

```python
# loc — label/index based
df.loc[0]                          # Row at index label 0
df.loc[0:2]                        # Rows 0, 1, 2 (INCLUSIVE)
df.loc[0, "Name"]                  # Single cell
df.loc[1:3, ["Name", "Marks"]]     # Rows + specific columns

# iloc — position based
df.iloc[0]                         # First row
df.iloc[0:2]                       # Rows 0,1 (EXCLUSIVE — not row 2)
df.iloc[0, 0]                      # Row 0, Column 0
df.iloc[1:3, 0:2]                  # Rows 1–2, Columns 0–1

# at / iat — single cell (faster)
df.at[0, "Name"]                   # label-based single cell
df.iat[0, 0]                       # position-based single cell
```

---

#### 7️⃣ Filter Data

```python
# Single condition
df[df["Marks"] > 85]
df[df["Course"] == "BSc"]

# Multiple conditions
df[(df["Marks"] > 80) & (df["Course"] == "BSc")]   # AND
df[(df["Marks"] > 90) | (df["Age"] < 20)]          # OR
df[~(df["Course"] == "BBA")]                        # NOT

# isin() — match multiple values
df[df["Course"].isin(["BSc", "BCA"])]

# between() — range filter
df[df["Marks"].between(75, 90)]

# query() — SQL-like filtering
df.query("Marks > 80 and Course == 'BSc'")
```

---

#### 8️⃣ Add / Modify Columns

```python
# Add new column
df["Pass"] = ["Yes", "No", "Yes", "No", "Yes"]

# Calculated column
df["Updated_Marks"] = df["Marks"] + 5
df["Total"] = df["Math"] + df["Science"] + df["English"]
df["Average"] = df["Total"] / 3

# Using np.where (conditional column)
import numpy as np
df["Grade"] = np.where(df["Marks"] >= 80, "Pass", "Fail")
```

---

#### 9️⃣ Aggregate Functions on Column

```python
df["Marks"].mean()    # Average
df["Marks"].sum()     # Total
df["Marks"].max()     # Highest
df["Marks"].min()     # Lowest
df["Marks"].count()   # Count of non-NaN values
df["Marks"].std()     # Standard deviation
df["Marks"].var()     # Variance
df["Marks"].median()  # Median

df["Marks"].idxmax()  # Index of max value → use with loc[]
df["Marks"].idxmin()  # Index of min value
```

---

#### 🔟 value_counts()

```python
# Count occurrences of each unique value
df["Course"].value_counts()           # Sorted by count (desc)
df["Course"].value_counts(normalize=True)  # Proportions (0 to 1)
df["Course"].value_counts(ascending=True)  # Sort ascending

# unique() and nunique()
df["City"].unique()     # Array of unique values
df["City"].nunique()    # Number of unique values (integer)
```

---

#### 1️⃣1️⃣ Sort Values

```python
# Sort ascending (default)
df.sort_values("Marks")

# Sort descending
df.sort_values("Marks", ascending=False)

# Sort by multiple columns
df.sort_values(by=["Department", "Marks"], ascending=[True, False])

# Sort index
df.sort_index()
```

---

#### 1️⃣2️⃣ Rename Columns

```python
# Temporary (doesn't change df)
df.rename(columns={"Marks": "Score"})

# Permanent
df = df.rename(columns={"Marks": "Score"})

# Or use inplace
df.rename(columns={"Score": "Marks"}, inplace=True)
```

---

#### 1️⃣3️⃣ Missing Values — isnull, fillna, dropna

```python
# Check missing values
df.isnull()           # Boolean mask
df.isnull().sum()     # Count per column
df.isnull().sum().sum()  # Total missing in entire df

# Fill missing values
df["Score"].fillna(0)                         # Fill with 0
df["Score"] = df["Score"].fillna(df["Score"].mean())  # Fill with mean
df.fillna(method="ffill", inplace=True)       # Forward fill

# Drop rows with NaN
df.dropna(inplace=True)         # Remove all rows with any NaN
df.dropna(subset=["Score"])     # Remove only where Score is NaN
```

---

#### 1️⃣4️⃣ Drop Column / Row

```python
# Drop column
df.drop("Pass", axis=1)                    # Temporary
df.drop(["Pass", "Updated_Marks"], axis=1) # Multiple columns

# Drop row
df.drop(0, axis=0)               # Drop row at index 0
df.drop([0, 2], axis=0)          # Drop multiple rows

# Use inplace=True to save change
df.drop("Pass", axis=1, inplace=True)
```

---

#### 1️⃣5️⃣ Save & Read Files

```python
# Save to CSV
df.to_csv("student_data.csv", index=False)  # index=False avoids extra column

# Read CSV
df = pd.read_csv("student_data.csv")

# Save to Excel
df.to_excel("student_data.xlsx", index=False)

# Read Excel
df = pd.read_excel("student_data.xlsx")

# Read with specific options
df = pd.read_csv("data.csv", usecols=["Name", "Marks"])  # Select columns
df = pd.read_csv("data.csv", nrows=100)                   # Read only 100 rows
df = pd.read_csv("data.csv", skiprows=2)                  # Skip first 2 rows
```

---

### 🔵 INTERMEDIATE & ADVANCED PANDAS

---

#### 1️⃣6️⃣ groupby() — Aggregation

```python
# Group by one column
df.groupby("Department")["Marks"].mean()
df.groupby("Department")["Marks"].sum()
df.groupby("Department")["Marks"].count()

# Multiple aggregations with agg()
df.groupby("Department")["Marks"].agg(["mean", "max", "min", "sum", "count"])

# agg with custom names
df.groupby("Department")["Marks"].agg(
    avg="mean",
    highest="max",
    lowest="min"
)

# Group by multiple columns
df.groupby(["Department", "Gender"])["Marks"].mean()
```

---

#### 1️⃣7️⃣ apply()

```python
# Apply custom function to a column
def check_result(mark):
    return "Pass" if mark >= 40 else "Fail"

df["Result"] = df["Marks"].apply(check_result)

# Lambda version
df["Result"] = df["Marks"].apply(lambda x: "Pass" if x >= 40 else "Fail")

# Apply on each ROW (axis=1)
df["Total"] = df.apply(lambda row: row["Math"] + row["Science"], axis=1)

# Apply to entire DataFrame
df[["Math", "Science"]] = df[["Math", "Science"]].apply(lambda x: x * 1.1)
```

---

#### 1️⃣8️⃣ map() and replace()

```python
# map() — transform Series values via dict or function
remarks = {"A": "Excellent", "B": "Good", "C": "Average", "D": "Poor"}
df["Remark"] = df["Grade"].map(remarks)

# map with function
df["Marks_Scaled"] = df["Marks"].map(lambda x: round(x / 100, 2))

# replace() — direct value substitution
df["Dept"] = df["Dept"].replace("CS", "CSE")
df["Status"] = df["Status"].replace({"Y": "Yes", "N": "No"})   # Dict form
```

---

#### 1️⃣9️⃣ Duplicates

```python
df.duplicated()                               # True for duplicate rows
df.duplicated(subset=["Name"])                # Duplicate by column
df.duplicated().sum()                         # Count of duplicates

df.drop_duplicates()                          # Remove all duplicates
df.drop_duplicates(subset=["Name"])           # Remove duplicate names
df.drop_duplicates(keep="first")             # Keep first occurrence (default)
df.drop_duplicates(keep="last")              # Keep last occurrence
df.drop_duplicates(keep=False)               # Remove ALL copies
```

---

#### 2️⃣0️⃣ String Methods with .str

```python
df["Name"].str.upper()              # UPPERCASE
df["Name"].str.lower()              # lowercase
df["Name"].str.title()              # Title Case
df["Name"].str.strip()              # Remove leading/trailing spaces
df["Name"].str.lstrip()             # Remove left spaces only
df["Name"].str.rstrip()             # Remove right spaces only

df["Name"].str.len()                # Length of each string
df["Name"].str.contains("Ali")      # True/False
df["Name"].str.startswith("A")      # True/False
df["Name"].str.endswith("n")        # True/False

df["Name"].str.replace("old","new") # Replace substring
df["Name"].str.split(" ")           # Split → list
df["Name"].str.split(" ").str[0]    # Get first part after split
df["Name"].str.zfill(5)             # Pad with zeros on left
```

---

#### 2️⃣1️⃣ set_index() and reset_index()

```python
# Set a column as index
df2 = df.set_index("Roll")          # Roll becomes the index
df2 = df.set_index("Roll", drop=True)  # Drop Roll from columns (default)

# Access rows by custom index
df2.loc[101]                         # Row where Roll = 101

# Reset back to default integer index
df3 = df2.reset_index()             # Roll becomes a column again
df.reset_index(drop=True)           # Drop old index entirely
```

---

#### 2️⃣2️⃣ DateTime Operations

```python
# Convert string to datetime
df["Date"] = pd.to_datetime(df["Date"])
df["Date"] = pd.to_datetime(df["Date"], format="%d-%m-%Y")  # Custom format

# Extract parts using .dt accessor
df["Year"]    = df["Date"].dt.year
df["Month"]   = df["Date"].dt.month
df["Day"]     = df["Date"].dt.day
df["Weekday"] = df["Date"].dt.day_name()   # "Monday", "Tuesday" etc.
df["Quarter"] = df["Date"].dt.quarter

# Date arithmetic
df["Days_Active"] = pd.Timestamp.today() - df["Join_Date"]
df["Deadline"] = df["Start_Date"] + pd.Timedelta(days=30)
```

---

#### 2️⃣3️⃣ pivot_table() and crosstab()

```python
# pivot_table — summary with aggregation
pivot = df.pivot_table(
    values="Marks",
    index="Department",
    columns="Gender",
    aggfunc="mean",
    fill_value=0
)

# Multiple aggregations in pivot
pivot2 = df.pivot_table(
    values="Marks",
    index="Department",
    aggfunc=["mean", "sum", "count"]
)

# crosstab — frequency/count table
table = pd.crosstab(df["Department"], df["Gender"])
table_pct = pd.crosstab(df["Department"], df["Gender"], normalize=True)  # Proportions
```

---

#### 2️⃣4️⃣ concat()

```python
# Vertical stacking (add more rows)
result = pd.concat([df1, df2])
result = pd.concat([df1, df2], ignore_index=True)  # Reset index

# Horizontal stacking (add more columns)
result = pd.concat([df1, df2], axis=1)

# Concat with keys (to trace which df each row came from)
result = pd.concat([df1, df2], keys=["batch_1", "batch_2"])
```

---

#### 2️⃣5️⃣ merge()

```python
# INNER JOIN — only matching rows
result = pd.merge(students, marks, on="ID")

# LEFT JOIN — all from left + matching from right
result = pd.merge(students, marks, on="ID", how="left")

# RIGHT JOIN
result = pd.merge(students, marks, on="ID", how="right")

# OUTER JOIN — all rows from both
result = pd.merge(students, marks, on="ID", how="outer")

# Merge on different column names
result = pd.merge(df1, df2, left_on="student_id", right_on="ID")

# Merge on multiple columns
result = pd.merge(df1, df2, on=["ID", "Year"])
```

---

#### 2️⃣6️⃣ join()

```python
# Join on index (default: LEFT JOIN)
result = df1.join(df2)
result = df1.join(df2, how="inner")

# join is a simplified merge for index-based joins
```

---

#### 2️⃣7️⃣ Basic Plotting with Pandas

```python
import matplotlib.pyplot as plt

# Bar chart
df.plot(x="Name", y="Marks", kind="bar")
plt.title("Student Marks")
plt.show()

# Line chart
df.plot(x="Name", y="Average", kind="line", marker="o")
plt.show()

# Histogram
df["Marks"].plot(kind="hist", bins=10)
plt.show()

# Scatter
df.plot(x="Age", y="Marks", kind="scatter")
plt.show()
```

---

#### 2️⃣8️⃣ Basic EDA Workflow

```python
# Step-by-step Exploratory Data Analysis

# 1. Load data
df = pd.read_csv("data.csv")

# 2. View shape and first rows
print(df.shape)
print(df.head())

# 3. Check data types
print(df.dtypes)

# 4. Statistical summary
print(df.describe())

# 5. Check missing values
print(df.isnull().sum())

# 6. Handle missing values
df["Marks"].fillna(df["Marks"].mean(), inplace=True)

# 7. Check and remove duplicates
print(df.duplicated().sum())
df.drop_duplicates(inplace=True)

# 8. Explore categories
print(df["Department"].value_counts())

# 9. Group analysis
print(df.groupby("Department")["Marks"].mean())

# 10. Export cleaned data
df.to_csv("cleaned_data.csv", index=False)
```

---

## 🧠 CHEAT SHEET — Complete Pandas Reference

```python
# ════════════════════════════════════════════════
# 📦 IMPORT
# ════════════════════════════════════════════════
import pandas as pd
import numpy as np

# ════════════════════════════════════════════════
# 🏗️ CREATE
# ════════════════════════════════════════════════
pd.Series([1, 2, 3])                          # 1D series
pd.Series([1,2], index=["a","b"])             # Custom index
pd.DataFrame({"A":[1,2],"B":[3,4]})          # From dict
pd.DataFrame(list_of_dicts)                   # From records
pd.read_csv("file.csv")                       # From CSV
pd.read_excel("file.xlsx")                    # From Excel
pd.read_json("file.json")                     # From JSON

# ════════════════════════════════════════════════
# 👀 EXPLORE
# ════════════════════════════════════════════════
df.head(n)         # First n rows
df.tail(n)         # Last n rows
df.shape           # (rows, cols)
df.columns         # Column names
df.index           # Index labels
df.dtypes          # Column types
df.info()          # Summary: types + non-null counts
df.describe()      # Stats: count, mean, std, min, quartiles, max

# ════════════════════════════════════════════════
# 🎯 SELECT
# ════════════════════════════════════════════════
df["col"]                         # Column → Series
df[["col1","col2"]]               # Columns → DataFrame
df.loc[label]                     # Row by label (inclusive end)
df.loc[0:3, ["A","B"]]            # Rows+cols by label
df.iloc[position]                 # Row by position (exclusive end)
df.iloc[0:3, 0:2]                 # Rows+cols by position
df.at[0, "col"]                   # Single cell (label)
df.iat[0, 0]                      # Single cell (position)

# ════════════════════════════════════════════════
# 🔍 FILTER
# ════════════════════════════════════════════════
df[df["col"] > 80]                # Single condition
df[(df["A"] > 5) & (df["B"] == "x")]   # AND
df[(df["A"] > 5) | (df["B"] == "x")]   # OR
df[~(df["A"] > 5)]                # NOT
df[df["col"].isin([1,2,3])]       # isin
df[df["col"].between(10, 20)]     # range
df.query("A > 5 and B == 'x'")   # SQL-like

# ════════════════════════════════════════════════
# ✏️ MODIFY
# ════════════════════════════════════════════════
df["new_col"] = values            # Add column
df["col"] = df["col"] * 2        # Update column
df.rename(columns={"old":"new"})  # Rename
df.drop("col", axis=1)            # Drop column
df.drop(0, axis=0)                # Drop row
df.sort_values("col")             # Sort asc
df.sort_values("col", ascending=False)   # Sort desc
df.sort_values(["A","B"], ascending=[True,False])  # Multi-col

# ════════════════════════════════════════════════
# 📊 AGGREGATE
# ════════════════════════════════════════════════
df["col"].mean()    df["col"].sum()    df["col"].count()
df["col"].max()     df["col"].min()    df["col"].median()
df["col"].std()     df["col"].var()    df["col"].nunique()
df["col"].idxmax()  df["col"].idxmin()
df["col"].value_counts()           # Frequency of each value
df["col"].unique()                 # Unique values array

# ════════════════════════════════════════════════
# 👥 GROUPBY
# ════════════════════════════════════════════════
df.groupby("col")["val"].mean()
df.groupby("col")["val"].agg(["mean","max","min"])
df.groupby(["A","B"])["val"].sum()

# ════════════════════════════════════════════════
# 🚫 MISSING VALUES
# ════════════════════════════════════════════════
df.isnull()                       # Boolean mask
df.isnull().sum()                 # Count per column
df.notnull()
df["col"].fillna(0)               # Fill with value
df["col"].fillna(df["col"].mean()) # Fill with mean
df.fillna(method="ffill")        # Forward fill
df.dropna()                       # Drop rows with NaN
df.dropna(subset=["col"])         # Drop if specific col is NaN

# ════════════════════════════════════════════════
# 🔁 DUPLICATES
# ════════════════════════════════════════════════
df.duplicated()                   # True for duplicates
df.duplicated().sum()             # Count
df.drop_duplicates()              # Remove all
df.drop_duplicates(subset=["col"])  # By column

# ════════════════════════════════════════════════
# 🔤 STRING METHODS
# ════════════════════════════════════════════════
df["col"].str.upper() / lower() / title() / strip()
df["col"].str.len() / contains("x") / startswith("x")
df["col"].str.replace("old","new") / split(" ")

# ════════════════════════════════════════════════
# ⚙️ TRANSFORM
# ════════════════════════════════════════════════
df["col"].apply(func)             # Apply function
df["col"].map({"a":1,"b":2})     # Map values
df["col"].replace("old","new")   # Replace value
df.apply(func, axis=1)           # Apply across rows

# ════════════════════════════════════════════════
# 🔗 COMBINE
# ════════════════════════════════════════════════
pd.concat([df1,df2])              # Stack rows
pd.concat([df1,df2], axis=1)      # Stack columns
pd.merge(df1,df2,on="col")        # INNER JOIN
pd.merge(df1,df2,on="col",how="left")   # LEFT JOIN
df1.join(df2)                     # Index-based join

# ════════════════════════════════════════════════
# 📅 DATETIME
# ════════════════════════════════════════════════
pd.to_datetime(df["col"])
df["col"].dt.year / month / day / day_name()

# ════════════════════════════════════════════════
# 📋 PIVOT
# ════════════════════════════════════════════════
df.pivot_table(values="v", index="r", columns="c", aggfunc="mean")
pd.crosstab(df["A"], df["B"])     # Frequency table

# ════════════════════════════════════════════════
# 🗂️ INDEX
# ════════════════════════════════════════════════
df.set_index("col")               # Set column as index
df.reset_index()                  # Reset to integer index

# ════════════════════════════════════════════════
# 💾 SAVE / EXPORT
# ════════════════════════════════════════════════
df.to_csv("file.csv", index=False)
df.to_excel("file.xlsx", index=False)
df.to_json("file.json")
```

---

## 🎯 Practice Programs

### Program 1: Student Marks Analysis Dashboard

```python
import pandas as pd
import matplotlib.pyplot as plt

# ─── Step 1: Create dataset ───────────────────────────────────────────────
data = {
    "Name":    ["Madhu", "Rahul", "Priya", "Arjun", "Neha"],
    "Math":    [85, 78, 92, 74, 88],
    "Science": [90, 82, 89, 70, 91],
    "English": [88, 75, 95, 72, 84]
}
df = pd.DataFrame(data)

# ─── Step 2: Basic info ───────────────────────────────────────────────────
print("Shape:", df.shape)
print(df.describe())

# ─── Step 3: Add calculated columns ──────────────────────────────────────
df["Total"]   = df["Math"] + df["Science"] + df["English"]
df["Average"] = df["Total"] / 3

# ─── Step 4: Grade column ─────────────────────────────────────────────────
def assign_grade(avg):
    if avg >= 90: return "A"
    elif avg >= 80: return "B"
    elif avg >= 70: return "C"
    else: return "D"

df["Grade"] = df["Average"].apply(assign_grade)

# ─── Step 5: Analysis ─────────────────────────────────────────────────────
print("Highest Total:", df["Total"].max())
print("Lowest Total:", df["Total"].min())
print("Class Average:", round(df["Average"].mean(), 2))

# Find topper using idxmax()
topper = df.loc[df["Total"].idxmax()]
print(f"\nTopper: {topper['Name']} with {topper['Total']} marks")

# ─── Step 6: Charts ───────────────────────────────────────────────────────
fig, axes = plt.subplots(1, 3, figsize=(15, 5))

# Bar chart
axes[0].bar(df["Name"], df["Total"], color="steelblue")
axes[0].set_title("Total Marks")
axes[0].set_xlabel("Student")

# Line chart
axes[1].plot(df["Name"], df["Average"], marker="o", color="green")
axes[1].set_title("Average Marks Trend")
axes[1].set_xlabel("Student")

# Pie chart
axes[2].pie(df["Total"], labels=df["Name"], autopct="%1.1f%%")
axes[2].set_title("Marks Distribution")

plt.tight_layout()
plt.savefig("student_analysis.png")
plt.show()

print("\nFinal DataFrame:")
print(df)
```

---

### Program 2: Sales Data Analysis (groupby + merge + EDA)

```python
import pandas as pd
import numpy as np

# ─── Create Sales Data ────────────────────────────────────────────────────
sales_data = {
    "Order_ID":   [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008],
    "Product":    ["Laptop","Phone","Tablet","Laptop","Mouse","Phone","Tablet","Mouse"],
    "Category":   ["Electronics","Electronics","Electronics","Electronics",
                   "Accessories","Electronics","Electronics","Accessories"],
    "Region":     ["North","South","East","West","North","East","South","West"],
    "Units":      [2, 5, 3, 1, 10, 7, 4, 15],
    "Price":      [55000, 25000, 30000, 55000, 500, 25000, 30000, 500],
    "Date":       ["2024-01-15","2024-01-20","2024-02-10","2024-02-14",
                   "2024-03-05","2024-03-12","2024-03-20","2024-04-01"]
}
df = pd.DataFrame(sales_data)

# ─── EDA ──────────────────────────────────────────────────────────────────
print("Shape:", df.shape)
print("\nMissing Values:\n", df.isnull().sum())
print("\nData Types:\n", df.dtypes)

# ─── Add Revenue Column ───────────────────────────────────────────────────
df["Revenue"] = df["Units"] * df["Price"]

# ─── DateTime ─────────────────────────────────────────────────────────────
df["Date"]  = pd.to_datetime(df["Date"])
df["Month"] = df["Date"].dt.month_name()

# ─── Analysis ─────────────────────────────────────────────────────────────
print("\nTotal Revenue:", df["Revenue"].sum())

# Revenue by category
print("\nRevenue by Category:")
print(df.groupby("Category")["Revenue"].sum())

# Revenue by region
print("\nRevenue by Region:")
print(df.groupby("Region")["Revenue"].sum().sort_values(ascending=False))

# Product performance
print("\nProduct Summary:")
print(df.groupby("Product")["Revenue"].agg(
    Total_Revenue="sum",
    Total_Units="sum",
    Avg_Price="mean"
))

# Monthly revenue
print("\nMonthly Revenue:")
print(df.groupby("Month")["Revenue"].sum())

# ─── Top Product ──────────────────────────────────────────────────────────
top_product = df.groupby("Product")["Revenue"].sum().idxmax()
print(f"\nBest Selling Product: {top_product}")
```

---

### Program 3: Data Cleaning Pipeline

```python
import pandas as pd
import numpy as np

# ─── Dirty Dataset ────────────────────────────────────────────────────────
raw = {
    "Name":       ["  Ali ", "SARA", "john", "Ali", "David", None],
    "Age":        [25, 22, None, 25, 30, 28],
    "Department": ["CS", "IT", "CSE", "CS", "ECE", "IT"],
    "Salary":     [50000, 45000, 60000, 50000, None, 55000],
    "Email":      ["ali@mail.com","sara@mail.com","john@mail.com",
                   "ali@mail.com","david@mail.com","emp@mail.com"]
}
df = pd.DataFrame(raw)

print("─── RAW DATA ───────────────────────────────")
print(df)
print("\nMissing Values:")
print(df.isnull().sum())

# ─── Step 1: Clean Name Column ────────────────────────────────────────────
df["Name"] = df["Name"].str.strip().str.title()

# ─── Step 2: Standardize Department ──────────────────────────────────────
df["Department"] = df["Department"].replace("CS", "CSE")

# ─── Step 3: Fill Missing Values ─────────────────────────────────────────
df["Age"].fillna(df["Age"].median(), inplace=True)
df["Salary"].fillna(df["Salary"].mean(), inplace=True)
df.dropna(subset=["Name"], inplace=True)   # Drop rows with no name

# ─── Step 4: Remove Duplicates ────────────────────────────────────────────
before = len(df)
df.drop_duplicates(inplace=True)
after = len(df)
print(f"\nRemoved {before - after} duplicate(s)")

# ─── Step 5: Reset Index ──────────────────────────────────────────────────
df.reset_index(drop=True, inplace=True)

# ─── Step 6: Add ID Column ────────────────────────────────────────────────
df.insert(0, "ID", range(101, 101 + len(df)))

print("\n─── CLEANED DATA ───────────────────────────")
print(df)

# ─── Save ─────────────────────────────────────────────────────────────────
df.to_csv("cleaned_employees.csv", index=False)
print("\nFile saved: cleaned_employees.csv")
```

---

### Program 4: merge() + pivot_table() — Department Report

```python
import pandas as pd

# ─── Table 1: Employees ───────────────────────────────────────────────────
employees = pd.DataFrame({
    "ID":         [1, 2, 3, 4, 5, 6],
    "Name":       ["Ali", "Sara", "John", "David", "Emma", "Priya"],
    "Dept_ID":    [10, 10, 20, 20, 10, 30],
    "Salary":     [85000, 90000, 78000, 88000, 91000, 75000],
    "Gender":     ["Male", "Female", "Male", "Male", "Female", "Female"]
})

# ─── Table 2: Departments ─────────────────────────────────────────────────
departments = pd.DataFrame({
    "Dept_ID":   [10, 20, 30],
    "Dept_Name": ["Engineering", "Marketing", "HR"]
})

# ─── Merge ────────────────────────────────────────────────────────────────
merged = pd.merge(employees, departments, on="Dept_ID", how="left")
print("Merged DataFrame:")
print(merged)

# ─── Aggregation ──────────────────────────────────────────────────────────
print("\nDepartment Summary:")
print(merged.groupby("Dept_Name")["Salary"].agg(
    Count="count",
    Avg_Salary="mean",
    Max_Salary="max"
).round(2))

# ─── Pivot Table — Avg Salary by Dept and Gender ─────────────────────────
pivot = merged.pivot_table(
    values="Salary",
    index="Dept_Name",
    columns="Gender",
    aggfunc="mean",
    fill_value=0
)
print("\nPivot — Avg Salary by Dept & Gender:")
print(pivot.round(0))

# ─── Crosstab — Count by Dept and Gender ─────────────────────────────────
ctab = pd.crosstab(merged["Dept_Name"], merged["Gender"])
print("\nCrosstab — Headcount:")
print(ctab)
```

---

<div align="center">

---

**⭐ If this helped you, share it with your batchmates and star the repo! ⭐**

*Made with ❤️ by **SK SAHIL** — Freelance AI Developer & Coding Tutor*

*Graduated from German University with Excellence Grade · Working in 4 Startups*

> *"Pandas is used to work with table data in Python, just like Excel but with code."*

---

</div>
