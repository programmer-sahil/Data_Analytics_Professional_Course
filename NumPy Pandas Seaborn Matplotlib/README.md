
# 📊 Data Science Libraries Cheat Sheet

A quick-reference guide covering the four essential Python libraries for data science — **NumPy**, **Pandas**, **Matplotlib**, and **Seaborn**. Designed for fast lookup during analysis, coursework, or interviews.

---

## 📦 Libraries Covered

| Library | Purpose |
|---|---|
| `NumPy` | Numerical computing & array operations |
| `Pandas` | Data manipulation & analysis |
| `Matplotlib` | Core plotting & visualization |
| `Seaborn` | Statistical & high-level visualization |

---

## 🔢 1. NumPy

```python
import numpy as np
```

### Array Creation

| Function | Description |
|---|---|
| `np.array([1, 2, 3])` | Create a 1D array from a list |
| `np.array([[1, 2], [3, 4]])` | Create a 2D array (matrix) |
| `np.arange(start, stop, step)` | Array of evenly spaced values (step-based) |
| `np.linspace(start, stop, num)` | Array of evenly spaced values (count-based) |
| `np.zeros((rows, cols))` | Array filled with zeros |
| `np.ones((rows, cols))` | Array filled with ones |

### Array Inspection & Reshaping

| Property / Method | Description |
|---|---|
| `arr.shape` | Returns dimensions as a tuple (rows, columns) |
| `arr.ndim` | Returns the number of dimensions |
| `arr.dtype` | Data type of array elements |
| `arr.reshape(rows, cols)` | Reshape array without changing data |

### Math & Statistics

| Function | Description |
|---|---|
| `np.mean(arr)` / `np.median(arr)` | Calculate mean and median |
| `np.std(arr)` / `np.var(arr)` | Standard deviation and variance |
| `np.min(arr)` / `np.max(arr)` | Find minimum and maximum values |
| `np.argmin(arr)` / `np.argmax(arr)` | Index of the min/max value |

---

## 🐼 2. Pandas

Pandas is built on top of NumPy and provides high-performance, easy-to-use data structures like **Series** (1D) and **DataFrames** (2D).

```python
import pandas as pd
```

### Loading & Saving Data

| Method | Description |
|---|---|
| `pd.read_csv('file.csv')` | Read a comma-separated values file |
| `pd.read_excel('file.xlsx')` | Read an Excel file |
| `df.to_csv('output.csv', index=False)` | Save DataFrame to a CSV |

### Inspecting Data

| Method | Description |
|---|---|
| `df.head(n)` / `df.tail(n)` | First / last n rows (default 5) |
| `df.info()` | Index, datatype, and memory info |
| `df.describe()` | Summary statistics for numerical columns |
| `df.shape` | Number of rows and columns |

### Selection & Filtering

| Code | Description |
|---|---|
| `df['column_name']` | Select a single column (returns Series) |
| `df[['col1', 'col2']]` | Select multiple columns (returns DataFrame) |
| `df.iloc[0:5]` | Select rows by integer index position |
| `df.loc[df['Age'] > 30]` | Filter rows based on a condition |

### Data Cleaning & Grouping

| Method | Description |
|---|---|
| `df.isnull().sum()` | Count missing values in each column |
| `df.dropna()` | Drop rows with missing values |
| `df.fillna(value)` | Replace missing values with `value` |
| `df.groupby('col').mean()` | Group by a column and calculate mean |
| `df['col'].value_counts()` | Count unique values in a column |

---

## 📈 3. Matplotlib

Matplotlib is the core plotting library. The `pyplot` module provides a MATLAB-like interface for creating static, animated, and interactive visualizations.

```python
import matplotlib.pyplot as plt
```

### Basic Plots

```python
# 1. Line Plot (Trends over time)
plt.plot(x, y, color='blue', linestyle='--', marker='o')

# 2. Scatter Plot (Relationships between two variables)
plt.scatter(x, y)

# 3. Bar Chart (Categorical comparisons)
plt.bar(categories, values, color='green')

# 4. Histogram (Distributions)
plt.hist(data, bins=20)
```

### Customizing Plots

```python
plt.title("Main Plot Title")
plt.xlabel("X-Axis Label")
plt.ylabel("Y-Axis Label")
plt.legend(["Line 1", "Line 2"])
plt.grid(True)
plt.show()  # Display the plot
```

---

## 🎨 4. Seaborn

Seaborn is built on top of Matplotlib. It provides a high-level interface for drawing attractive and informative statistical graphics. It plays exceptionally well with Pandas DataFrames.

```python
import seaborn as sns

# Set default styling
sns.set_theme(style="whitegrid")
```

### Relational Plots (Continuous vs Continuous)

| Code | Description |
|---|---|
| `sns.scatterplot(data=df, x='A', y='B', hue='Category')` | Scatter plot colored by category |
| `sns.lineplot(data=df, x='Time', y='Value')` | Line plot with automatic error bands |

### Categorical Plots (Categorical vs Continuous)

| Code | Description |
|---|---|
| `sns.barplot(data=df, x='Category', y='Value')` | Bar plot with confidence intervals |
| `sns.boxplot(data=df, x='Category', y='Value')` | Box plot showing quartiles and outliers |
| `sns.violinplot(data=df, x='Cat', y='Value')` | Combines boxplot with KDE (density) |

### Distribution & Matrix Plots

| Code | Description |
|---|---|
| `sns.histplot(data=df, x='Value', kde=True)` | Histogram with a smooth density curve |
| `sns.pairplot(df, hue='Category')` | Scatterplots for all combinations of variables |
| `sns.heatmap(df.corr(), annot=True, cmap='coolwarm')` | Correlation matrix visualizer |

---

## 💡 Pro Tip

Always check the official documentation or use the built-in `help()` function:

```python
help(pd.read_csv)
help(np.linspace)
```

- [NumPy Docs](https://numpy.org/doc/)
- [Pandas Docs](https://pandas.pydata.org/docs/)
- [Matplotlib Docs](https://matplotlib.org/stable/contents.html)
- [Seaborn Docs](https://seaborn.pydata.org/)

---

> ⭐ Star this repo if you find it useful!
