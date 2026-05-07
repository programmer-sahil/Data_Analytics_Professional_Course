# 🐍 Python Programming — Complete Learning Guide

> **Made by your Tutor — SK SAHIL**
> *Freelance AI Developer · Freelance Coding Tutor · Working in 4 Startups · Graduated from German University with Excellence Grade*

---

## 📌 What is Python?

**Python** is a **high-level, interpreted, general-purpose programming language** known for its simple, readable syntax that resembles plain English. Created by **Guido van Rossum** and released in **1991**, Python follows the philosophy: *"There should be one obvious way to do it."*

Python is **dynamically typed** (no need to declare variable types), **garbage-collected** (automatic memory management), and supports multiple programming paradigms — **procedural**, **object-oriented**, and **functional**.

---

## 🌍 Where is Python Used?

| Domain | Use Cases |
|---|---|
| **Web Development** | Django, Flask, FastAPI backends |
| **Data Science & Analytics** | Pandas, NumPy, data wrangling |
| **Machine Learning & AI** | TensorFlow, PyTorch, scikit-learn |
| **Automation & Scripting** | File handling, web scraping, bots |
| **DevOps & Cloud** | AWS Lambda, CI/CD scripts |
| **Cybersecurity** | Penetration testing, tools |
| **Finance** | Algorithmic trading, risk models |

---

## 🛠️ IDE & Tools

| Tool | Type | Link |
|---|---|---|
| **PyCharm** | Full-featured Python IDE | [jetbrains.com/pycharm](https://www.jetbrains.com/pycharm/) |
| **VS Code** | Lightweight + Python Extension | [code.visualstudio.com](https://code.visualstudio.com/) |
| **Jupyter Notebook** | Data science / interactive | [jupyter.org](https://jupyter.org/) |
| **Thonny** | Beginner-friendly IDE | [thonny.org](https://thonny.org/) |
| **Spyder** | Scientific computing IDE | [spyder-ide.org](https://www.spyder-ide.org/) |

## 🌐 Online IDE

| Tool | Link |
|---|---|
| **Replit** | [replit.com](https://replit.com/) |
| **Google Colab** | [colab.research.google.com](https://colab.research.google.com/) |
| **OneCompiler** | [onecompiler.com/python](https://onecompiler.com/python) |
| **Programiz Online** | [programiz.com/python-programming/online-compiler](https://www.programiz.com/python-programming/online-compiler/) |

## 📚 Official Documentation

- 📖 **Python Official Docs:** [docs.python.org](https://docs.python.org/)
- 📖 **W3Schools Python Tutorial:** [w3schools.com/python](https://www.w3schools.com/python/)
- 📖 **PyPI (Package Index):** [pypi.org](https://pypi.org/)

---

## ⚡ Critical Interview Concepts — Must Know

> These topics appear in **every Python interview**. Know them deeply with examples.

---

### 🔤 Variables & Dynamic Typing

Python variables are **dynamically typed** — no type declaration needed. The type is inferred at runtime.

```python
x = 10          # int
x = "hello"     # now it's str — Python allows this
x = 3.14        # now it's float

type(x)         # <class 'float'>
```
> 💡 **Interview Tip:** *"Python is dynamically typed — the variable itself has no type, but the object it points to does."*

---

### 📦 Mutable vs Immutable — Most Asked!

| Immutable (cannot change) | Mutable (can change) |
|---|---|
| `int`, `float`, `str`, `tuple`, `bool` | `list`, `dict`, `set` |

```python
# Immutable — creates a NEW object
s = "hello"
s[0] = "H"   # ❌ TypeError — strings are immutable

# Mutable — modifies IN PLACE
lst = [1, 2, 3]
lst[0] = 99   # ✅ Works — [99, 2, 3]
```
> 💡 **Interview Tip:** *"Tuples are immutable lists — use them for fixed data like coordinates or config constants."*

---

### 📋 List vs Tuple vs Set vs Dictionary

| Feature | List `[]` | Tuple `()` | Set `{}` | Dict `{k:v}` |
|---|---|---|---|---|
| Ordered | ✅ | ✅ | ❌ | ✅ (Python 3.7+) |
| Mutable | ✅ | ❌ | ✅ | ✅ |
| Duplicates | ✅ | ✅ | ❌ | Keys: ❌ |
| Indexed | ✅ | ✅ | ❌ | By key |

---

### 🏗️ OOP — The 4 Pillars

**1. Encapsulation** — Bundling data + methods; hiding internal state with `_` or `__`
**2. Inheritance** — Child class reuses parent class code
**3. Polymorphism** — Same method name, different behavior in different classes
**4. Abstraction** — Hide complexity, show only essentials

```python
class Animal:
    def speak(self):
        pass   # Abstract-like method

class Dog(Animal):
    def speak(self):
        return "Woof!"

class Cat(Animal):
    def speak(self):
        return "Meow!"

# Polymorphism in action
for animal in [Dog(), Cat()]:
    print(animal.speak())   # Woof!  Meow!
```

---

### 🔑 `__init__` vs `self`

- `__init__` is the **constructor** — called automatically when an object is created
- `self` refers to the **current instance** of the class (like `this` in Java/JS)

```python
class Person:
    def __init__(self, name, age):   # Constructor
        self.name = name             # Instance attribute
        self.age = age

p = Person("Sahil", 25)
print(p.name)   # Sahil
```

---

### 🧬 Inheritance & `super()`

```python
class Vehicle:
    def __init__(self, brand):
        self.brand = brand
    def info(self):
        return f"Brand: {self.brand}"

class Car(Vehicle):
    def __init__(self, brand, model):
        super().__init__(brand)   # Call parent constructor
        self.model = model
    def info(self):
        return f"{super().info()}, Model: {self.model}"

c = Car("Toyota", "Corolla")
print(c.info())   # Brand: Toyota, Model: Corolla
```

---

### ⚠️ Exception Handling — Try/Except

```python
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print(f"Error: {e}")
except (ValueError, TypeError) as e:
    print(f"Value or Type Error: {e}")
else:
    print("No error occurred")    # Runs if NO exception
finally:
    print("Always runs")          # Cleanup code — always executes
```
> 💡 **Interview Tip:** *"`finally` always executes — used for cleanup like closing files or DB connections."*

---

### 🔄 List Comprehension — Pythonic Way

```python
# Traditional loop
squares = []
for i in range(5):
    squares.append(i**2)

# List comprehension — one line
squares = [i**2 for i in range(5)]            # [0, 1, 4, 9, 16]
evens   = [i for i in range(10) if i % 2 == 0]  # [0, 2, 4, 6, 8]

# Dict comprehension
d = {k: k**2 for k in range(5)}              # {0:0, 1:1, 2:4, 3:9, 4:16}
```

---

### 🔢 *args and **kwargs

```python
def add(*args):           # Accepts any number of positional args
    return sum(args)

def greet(**kwargs):      # Accepts any number of keyword args
    for k, v in kwargs.items():
        print(f"{k}: {v}")

add(1, 2, 3, 4)           # 10
greet(name="Sahil", role="Tutor")  # name: Sahil  role: Tutor
```

---

### 🔁 Iterators vs Generators

**Iterator:** Object with `__iter__()` and `__next__()` — loads all data in memory.
**Generator:** Uses `yield` — produces values **one at a time**, memory efficient.

```python
# Generator function
def count_up(n):
    for i in range(n):
        yield i         # Pauses here, resumes on next()

gen = count_up(3)
print(next(gen))   # 0
print(next(gen))   # 1
print(next(gen))   # 2
```
> 💡 **Interview Tip:** *"Use generators for large datasets — they don't load everything into memory at once."*

---

### 📦 Modules & Packages

- **Module:** A single `.py` file
- **Package:** A folder with `__init__.py` containing multiple modules
- **PIP:** Python's package manager — `pip install package_name`

```python
import math
from math import sqrt, pi
import os
import json
import datetime
```

---

### 🚫 `None` in Python

`None` is Python's null value — it represents **absence of value**. It is an object of type `NoneType`.

```python
x = None
print(x is None)    # True  ← always use 'is', not '=='
print(type(x))      # <class 'NoneType'>

def greet():
    pass            # Functions with no return statement return None
```

---

### 🌐 Regular Expressions (RegEx)

```python
import re

text = "My email is sahil@gmail.com"
pattern = r'[\w.]+@[\w.]+\.\w+'

match = re.search(pattern, text)
print(match.group())   # sahil@gmail.com

# Common methods
re.search(pattern, text)    # First match
re.findall(pattern, text)   # All matches as list
re.sub(pattern, "REDACTED", text)  # Replace
re.match(pattern, text)     # Match only at START of string
```

---

### 📅 Dates & Time

```python
from datetime import datetime, date, timedelta

now = datetime.now()
print(now)                            # 2025-01-01 10:30:00
print(now.strftime("%d-%m-%Y"))       # 01-01-2025
print(date.today())                   # 2025-01-01

# Date arithmetic
future = date.today() + timedelta(days=30)
diff = date(2025, 12, 31) - date.today()
print(diff.days)                      # Days until end of year
```

---

### 🔒 Encapsulation — Access Modifiers

```python
class BankAccount:
    def __init__(self, balance):
        self.public = "Anyone can access"
        self._protected = "By convention — internal use"
        self.__private = balance       # Name mangled to _BankAccount__private

    def get_balance(self):
        return self.__private          # Access via method (getter)

acc = BankAccount(5000)
print(acc.get_balance())              # 5000
print(acc._BankAccount__private)      # 5000 — still accessible (Python doesn't truly restrict)
```

---

### 📁 File Handling — Context Manager

```python
# Writing a file
with open("data.txt", "w") as f:
    f.write("Hello, SK Sahil!\n")

# Reading a file
with open("data.txt", "r") as f:
    content = f.read()
    print(content)

# Reading line by line
with open("data.txt", "r") as f:
    for line in f:
        print(line.strip())

# File modes: 'r' read, 'w' write, 'a' append, 'rb' read binary
```
> 💡 **Interview Tip:** *"`with` statement uses a context manager — it automatically closes the file even if an exception occurs."*

---

### 🔣 String Formatting

```python
name = "Sahil"
score = 98.5

# f-strings (recommended — Python 3.6+)
print(f"Name: {name}, Score: {score:.2f}")

# .format()
print("Name: {}, Score: {:.2f}".format(name, score))

# % operator (old style)
print("Name: %s, Score: %.2f" % (name, score))
```

---

### 🖥️ User Input

```python
name = input("Enter your name: ")     # Always returns string
age  = int(input("Enter your age: ")) # Cast to int

print(f"Hello {name}, you are {age} years old!")
```

---

### 🌿 Virtual Environment

```bash
# Create virtual environment
python -m venv myenv

# Activate (Windows)
myenv\Scripts\activate

# Activate (Mac/Linux)
source myenv/bin/activate

# Install packages inside venv
pip install requests pandas

# Save dependencies
pip freeze > requirements.txt

# Install from requirements
pip install -r requirements.txt

# Deactivate
deactivate
```

---

## 📚 Topic-by-Topic Reference

### 1️⃣ Python Syntax

```python
# Python uses INDENTATION (4 spaces) instead of braces {}
# Case-sensitive: 'Name' and 'name' are different variables

if True:
    print("Indentation defines code blocks")   # ✅
print("This is outside the if block")

# Semicolons are optional but not recommended
x = 5; y = 10  # Works but not Pythonic
```

---

### 2️⃣ Python Output

```python
print("Hello, World!")
print("Name:", "Sahil", "Age:", 25)         # Multiple args
print("Line1\nLine2")                        # Newline
print("No newline", end="")                  # Custom end
print("A", "B", "C", sep="-")               # A-B-C
print(f"Value: {3.14159:.2f}")               # 3.14
```

---

### 3️⃣ Python Comments

```python
# Single-line comment

"""
Multi-line comment (docstring)
Used to document functions and classes
"""

def add(a, b):
    """Returns the sum of a and b."""   # Docstring
    return a + b

print(add.__doc__)   # Returns the sum of a and b.
```

---

### 4️⃣ Python Variables

```python
# Assignment
x = 10
name = "Sahil"

# Multiple assignment
a, b, c = 1, 2, 3

# Swap without temp variable
a, b = b, a

# Global vs Local
count = 0   # Global variable

def increment():
    global count       # Access and modify global
    count += 1

# Constants (by convention — ALL CAPS)
MAX_SIZE = 100
PI = 3.14159
```

---

### 5️⃣ Python Data Types

```python
# Check type
print(type(42))        # <class 'int'>
print(type(3.14))      # <class 'float'>
print(type("hello"))   # <class 'str'>
print(type(True))      # <class 'bool'>
print(type([1,2,3]))   # <class 'list'>
print(type((1,2)))     # <class 'tuple'>
print(type({1,2}))     # <class 'set'>
print(type({"a":1}))   # <class 'dict'>
print(type(None))      # <class 'NoneType'>
```

---

### 6️⃣ Python Numbers

```python
# Types
x = 10          # int
y = 3.14        # float
z = 2 + 3j      # complex

# Arithmetic operators
print(10 + 3)   # 13   — Addition
print(10 - 3)   # 7    — Subtraction
print(10 * 3)   # 30   — Multiplication
print(10 / 3)   # 3.33 — Division (always float)
print(10 // 3)  # 3    — Floor division (integer result)
print(10 % 3)   # 1    — Modulo (remainder)
print(10 ** 3)  # 1000 — Exponentiation

import math
print(math.sqrt(16))   # 4.0
print(math.ceil(3.2))  # 4
print(math.floor(3.9)) # 3
print(abs(-5))         # 5
print(round(3.567, 2)) # 3.57
```

---

### 7️⃣ Python Casting

```python
# Type conversion
int("42")       # 42      — string to int
float("3.14")   # 3.14    — string to float
str(100)        # "100"   — int to string
bool(0)         # False   — 0 is falsy
bool(1)         # True    — non-zero is truthy
list((1,2,3))   # [1,2,3] — tuple to list
tuple([1,2,3])  # (1,2,3) — list to tuple
set([1,2,2,3])  # {1,2,3} — list to set (removes duplicates)
```

---

### 8️⃣ Python Strings

```python
s = "Hello, Python!"

# Indexing & Slicing
print(s[0])        # H
print(s[-1])       # !
print(s[0:5])      # Hello
print(s[::2])      # Hlo yhn  (step)
print(s[::-1])     # !nohtyP ,olleH  (reverse)

# String Methods
print(s.upper())           # HELLO, PYTHON!
print(s.lower())           # hello, python!
print(s.strip())           # Remove whitespace
print(s.replace("Hello", "Hi"))  # Hi, Python!
print(s.split(", "))       # ['Hello', 'Python!']
print("Python".startswith("Py"))  # True
print("Python".endswith("on"))    # True
print(s.find("Python"))    # 7  (index)
print(len(s))              # 14

# Join
words = ["SK", "Sahil", "Tutor"]
print(" ".join(words))     # SK Sahil Tutor

# Check
print("abc".isalpha())     # True
print("123".isdigit())     # True
print("ab3".isalnum())     # True
```

---

### 9️⃣ Python Booleans

```python
print(True and False)    # False
print(True or False)     # True
print(not True)          # False

# Falsy values — evaluate to False in boolean context
# False, 0, 0.0, "", [], {}, (), None, set()

# Truthy — everything else
bool([1])     # True
bool([])      # False
bool("a")     # True
bool("")      # False
```

---

### 🔟 Python Operators

```python
# Comparison
print(5 == 5)    # True
print(5 != 3)    # True
print(5 > 3)     # True
print(5 >= 5)    # True

# Identity (checks memory address)
a = [1, 2]
b = [1, 2]
c = a
print(a == b)    # True  — same value
print(a is b)    # False — different objects
print(a is c)    # True  — same object

# Membership
print(3 in [1, 2, 3])    # True
print(4 not in [1, 2])   # True

# Bitwise
print(5 & 3)    # 1   — AND
print(5 | 3)    # 7   — OR
print(5 ^ 3)    # 6   — XOR
print(~5)       # -6  — NOT
print(5 << 1)   # 10  — Left shift
print(5 >> 1)   # 2   — Right shift

# Walrus operator := (Python 3.8+)
if (n := len("hello")) > 3:
    print(f"Length {n} is greater than 3")
```

---

### 1️⃣1️⃣ Python Lists

```python
lst = [1, 2, 3, 4, 5]

# Access
print(lst[0])      # 1
print(lst[-1])     # 5
print(lst[1:3])    # [2, 3]

# Modify
lst.append(6)          # Add to end
lst.insert(0, 0)       # Insert at index
lst.extend([7, 8])     # Add multiple items
lst.remove(3)          # Remove first occurrence of 3
lst.pop()              # Remove and return last item
lst.pop(0)             # Remove and return index 0
lst.sort()             # Sort in place
lst.reverse()          # Reverse in place
lst.clear()            # Empty the list

# Info
len(lst)               # Length
lst.count(2)           # Count occurrences
lst.index(2)           # First index of value

# Copy
copy1 = lst.copy()     # Shallow copy ✅
copy2 = lst[:]         # Shallow copy ✅
import copy
copy3 = copy.deepcopy(lst)   # Deep copy (for nested lists)

# Comprehension
doubled = [x * 2 for x in lst]
filtered = [x for x in lst if x > 3]
```

---

### 1️⃣2️⃣ Python Tuples

```python
t = (1, 2, 3, 2)

# Access (same as list, no modification methods)
print(t[0])        # 1
print(t[-1])       # 2
print(t.count(2))  # 2
print(t.index(3))  # 2

# Single item tuple needs trailing comma
single = (42,)     # ✅ tuple
not_tuple = (42)   # ❌ just an int

# Tuple unpacking
x, y, z, _ = (10, 20, 30, 40)    # _ for ignored values
first, *rest = (1, 2, 3, 4, 5)   # first=1, rest=[2,3,4,5]

# Named tuples
from collections import namedtuple
Point = namedtuple('Point', ['x', 'y'])
p = Point(3, 4)
print(p.x, p.y)    # 3 4
```

---

### 1️⃣3️⃣ Python Sets

```python
s = {1, 2, 3, 4}

# Add / Remove
s.add(5)
s.discard(10)      # No error if not found
s.remove(1)        # Raises KeyError if not found
s.pop()            # Remove and return arbitrary item

# Set operations
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}

print(a | b)       # Union        {1,2,3,4,5,6}
print(a & b)       # Intersection {3,4}
print(a - b)       # Difference   {1,2}
print(a ^ b)       # Symmetric diff {1,2,5,6}

# Frozenset — immutable set
fs = frozenset({1, 2, 3})
```

---

### 1️⃣4️⃣ Python Dictionaries

```python
d = {"name": "Sahil", "age": 25, "city": "Kolkata"}

# Access
print(d["name"])              # Sahil
print(d.get("phone", "N/A"))  # N/A (safe — no KeyError)

# Modify
d["email"] = "sahil@mail.com"   # Add
d["age"] = 26                   # Update
del d["city"]                   # Delete key
d.pop("age")                    # Remove and return value

# Iterate
for key in d:
    print(key, d[key])

for k, v in d.items():
    print(f"{k}: {v}")

# Info
d.keys()     # dict_keys([...])
d.values()   # dict_values([...])
d.items()    # dict_items([(k,v)...])

# Merge dicts (Python 3.9+)
d1 = {"a": 1}
d2 = {"b": 2}
merged = d1 | d2               # {'a':1, 'b':2}

# Dict comprehension
squares = {x: x**2 for x in range(5)}

# defaultdict
from collections import defaultdict
dd = defaultdict(int)   # Default value is 0
dd["missing"] += 1      # No KeyError
```

---

### 1️⃣5️⃣ Python If...Else

```python
age = 20

if age >= 18:
    print("Adult")
elif age >= 13:
    print("Teenager")
else:
    print("Child")

# Ternary / One-liner
status = "Adult" if age >= 18 else "Minor"

# Nested if
x = 15
if x > 0:
    if x > 10:
        print("Greater than 10")
    else:
        print("Between 1 and 10")
```

---

### 1️⃣6️⃣ Python Match (Pattern Matching — Python 3.10+)

```python
command = "quit"

match command:
    case "quit":
        print("Quitting...")
    case "help":
        print("Showing help...")
    case "start" | "begin":
        print("Starting...")
    case _:
        print(f"Unknown command: {command}")

# Match with conditions (guard)
point = (0, 5)
match point:
    case (0, y):
        print(f"On Y-axis at {y}")
    case (x, 0):
        print(f"On X-axis at {x}")
    case (x, y):
        print(f"Point at ({x}, {y})")
```

---

### 1️⃣7️⃣ Python While Loops

```python
# Basic while
count = 0
while count < 5:
    print(count)
    count += 1

# while with else (runs when condition becomes False, not on break)
n = 3
while n > 0:
    print(n)
    n -= 1
else:
    print("Done!")

# break and continue
i = 0
while True:
    if i == 5:
        break       # Exit loop
    if i % 2 == 0:
        i += 1
        continue    # Skip rest of loop body
    print(i)
    i += 1
```

---

### 1️⃣8️⃣ Python For Loops

```python
# Iterate over list
for item in [1, 2, 3]:
    print(item)

# Range
for i in range(5):          # 0,1,2,3,4
    print(i)

for i in range(1, 10, 2):   # 1,3,5,7,9
    print(i)

# Enumerate — get index + value
fruits = ["apple", "banana", "cherry"]
for i, fruit in enumerate(fruits):
    print(f"{i}: {fruit}")

# Zip — iterate multiple iterables together
names = ["Sahil", "Priya"]
scores = [95, 88]
for name, score in zip(names, scores):
    print(f"{name}: {score}")

# for with else
for i in range(5):
    if i == 10:
        break
else:
    print("Loop completed without break")

# Nested for
for i in range(3):
    for j in range(3):
        print(f"({i},{j})", end=" ")
    print()
```

---

### 1️⃣9️⃣ Python Functions

```python
# Basic function
def greet(name):
    return f"Hello, {name}!"

# Default parameters
def power(base, exp=2):
    return base ** exp

print(power(3))     # 9
print(power(3, 3))  # 27

# Keyword arguments
def profile(name, age, city="Unknown"):
    print(f"{name}, {age}, {city}")

profile(age=25, name="Sahil")   # Order doesn't matter with keywords

# Lambda — anonymous function
square = lambda x: x ** 2
add    = lambda x, y: x + y

# Higher-order functions
nums = [1, 2, 3, 4, 5]
print(list(map(lambda x: x*2, nums)))      # [2,4,6,8,10]
print(list(filter(lambda x: x>3, nums)))   # [4,5]
from functools import reduce
print(reduce(lambda x, y: x+y, nums))      # 15

# Recursion
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)

print(factorial(5))   # 120
```

---

### 2️⃣0️⃣ Python Range

```python
r = range(10)              # 0 to 9
r = range(1, 11)           # 1 to 10
r = range(0, 20, 5)        # 0, 5, 10, 15
r = range(10, 0, -1)       # 10 down to 1

print(list(range(5)))      # [0, 1, 2, 3, 4]
print(5 in range(10))      # True — fast O(1) check

# Range is lazy — doesn't create the list in memory
```

---

### 2️⃣1️⃣ Python Arrays

```python
# Python's built-in array module (typed)
from array import array
arr = array('i', [1, 2, 3, 4])   # 'i' = integer type

# NumPy arrays (for scientific computing)
import numpy as np
a = np.array([1, 2, 3])
print(a * 2)        # [2 4 6] — vectorized operation
print(a.shape)      # (3,)
print(a.dtype)      # int64

# Note: For most use cases, Python lists are used as arrays
```

---

### 2️⃣2️⃣ Python Iterators

```python
# Any object with __iter__() and __next__() is an iterator

class CountUp:
    def __init__(self, max):
        self.max = max
        self.n = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.n >= self.max:
            raise StopIteration   # Signal end of iteration
        self.n += 1
        return self.n

for i in CountUp(3):
    print(i)   # 1, 2, 3

# Built-in iterators
it = iter([10, 20, 30])
print(next(it))   # 10
print(next(it))   # 20
```

---

### 2️⃣3️⃣ Python Modules

```python
# Import entire module
import math
print(math.pi)          # 3.14159...
print(math.sqrt(25))    # 5.0

# Import specific items
from math import sqrt, floor, ceil

# Alias
import numpy as np
import pandas as pd

# Custom module — save as mymodule.py
# def greet(name): return f"Hello {name}"
# import mymodule; mymodule.greet("Sahil")

# Useful standard library modules
import os           # File system operations
import sys          # System-specific parameters
import json         # JSON parsing
import re           # Regular expressions
import random       # Random numbers
import collections  # Counter, defaultdict, deque
import itertools    # Combinations, permutations
import functools    # reduce, lru_cache
import datetime     # Date and time
import time         # Time functions
import pathlib      # Modern file paths
```

---

### 2️⃣4️⃣ Python Math

```python
import math

math.pi           # 3.14159265...
math.e            # 2.71828...
math.sqrt(16)     # 4.0
math.pow(2, 10)   # 1024.0
math.log(100, 10) # 2.0  (log base 10)
math.log2(8)      # 3.0
math.ceil(3.1)    # 4
math.floor(3.9)   # 3
math.factorial(5) # 120
math.gcd(12, 8)   # 4
math.inf          # Infinity
math.isnan(float('nan'))  # True

# Random numbers
import random
random.random()             # Float between 0 and 1
random.randint(1, 100)      # Integer between 1 and 100
random.choice([1,2,3,4,5])  # Random element
random.shuffle(lst)         # Shuffle list in place
random.sample(lst, 3)       # 3 unique random items
```

---

### 2️⃣5️⃣ Python JSON

```python
import json

# Python dict → JSON string (serialize)
data = {"name": "Sahil", "age": 25, "skills": ["Python", "AI"]}
json_str = json.dumps(data, indent=4)
print(json_str)

# JSON string → Python dict (deserialize)
parsed = json.loads(json_str)
print(parsed["name"])   # Sahil

# Write JSON to file
with open("data.json", "w") as f:
    json.dump(data, f, indent=4)

# Read JSON from file
with open("data.json", "r") as f:
    loaded = json.load(f)
```

---

### 2️⃣6️⃣ Python PIP

```bash
pip install package_name         # Install
pip install package==1.2.3       # Specific version
pip install --upgrade package    # Upgrade
pip uninstall package            # Uninstall
pip list                         # Show installed packages
pip show package                 # Package details
pip freeze > requirements.txt    # Export dependencies
pip install -r requirements.txt  # Install from file
```

---

## 🏗️ Python Classes (OOP) — Deep Dive

```python
class BankAccount:
    bank_name = "SK Bank"   # Class attribute — shared by all instances

    def __init__(self, owner, balance=0):
        self.owner = owner          # Instance attribute
        self.__balance = balance    # Private attribute (encapsulation)

    # Instance method
    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            return f"Deposited ₹{amount}. Balance: ₹{self.__balance}"

    # Getter using property
    @property
    def balance(self):
        return self.__balance

    # Class method — works on class, not instance
    @classmethod
    def get_bank_name(cls):
        return cls.bank_name

    # Static method — utility, no access to class or instance
    @staticmethod
    def validate_amount(amount):
        return amount > 0

    def __str__(self):
        return f"Account({self.owner}, ₹{self.__balance})"

    def __repr__(self):
        return f"BankAccount(owner='{self.owner}', balance={self.__balance})"

    def __eq__(self, other):
        return self.__balance == other.balance

acc = BankAccount("Sahil", 1000)
print(acc.deposit(500))          # Deposited ₹500. Balance: ₹1500
print(acc.balance)               # 1500
print(BankAccount.get_bank_name()) # SK Bank
print(BankAccount.validate_amount(100))  # True
print(acc)                       # Account(Sahil, ₹1500)
```

---

### Inheritance

```python
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        raise NotImplementedError("Subclass must implement this")

    def __str__(self):
        return f"{self.__class__.__name__}: {self.name}"

class Dog(Animal):
    def speak(self):
        return "Woof!"

class Cat(Animal):
    def speak(self):
        return "Meow!"

# Multiple inheritance
class FlyingFish(Animal):
    def fly(self):
        return "I can fly!"
    def swim(self):
        return "I can swim!"

# Check inheritance
print(isinstance(Dog("Rex"), Animal))   # True
print(issubclass(Dog, Animal))          # True
```

---

### Inner Classes

```python
class Outer:
    def __init__(self):
        self.inner = self.Inner()   # Access inner class

    class Inner:
        def greet(self):
            return "Hello from Inner class!"

obj = Outer()
print(obj.inner.greet())   # Hello from Inner class!

# Direct instantiation of inner class
inner = Outer.Inner()
print(inner.greet())
```

---

## 📁 File Handling — Complete

```python
import os

# Write
with open("test.txt", "w") as f:
    f.write("Line 1\nLine 2\nLine 3")

# Read entire file
with open("test.txt", "r") as f:
    print(f.read())

# Read lines as list
with open("test.txt", "r") as f:
    lines = f.readlines()    # ['Line 1\n', 'Line 2\n', 'Line 3']

# Append to file
with open("test.txt", "a") as f:
    f.write("\nLine 4")

# Check if file exists
print(os.path.exists("test.txt"))  # True

# File info
print(os.path.getsize("test.txt"))     # Size in bytes
print(os.path.basename("test.txt"))    # test.txt
print(os.path.dirname("/home/sahil/test.txt"))  # /home/sahil

# Delete file
os.remove("test.txt")

# Directory operations
os.makedirs("myfolder/subfolder", exist_ok=True)
os.listdir(".")         # List files in current dir
os.getcwd()             # Current working directory
```

---

## 🧠 Quick Reference — Cheat Sheet

```python
# ── DATA STRUCTURES ─────────────────────────────
lst = [1, 2, 3]          # List — ordered, mutable
tpl = (1, 2, 3)          # Tuple — ordered, immutable
st  = {1, 2, 3}          # Set — unordered, unique
dct = {"a": 1, "b": 2}   # Dict — key-value pairs

# ── STRING OPERATIONS ───────────────────────────
s.upper() / s.lower() / s.strip() / s.split()
s.replace(old, new) / s.find(sub) / len(s)
f"Hello {name}" / "{}".format(x) / s[::‑1]

# ── LIST OPERATIONS ─────────────────────────────
lst.append(x) / lst.insert(i, x) / lst.extend(other)
lst.remove(x) / lst.pop(i) / lst.sort() / lst.reverse()
sorted(lst) / len(lst) / lst.count(x) / lst.index(x)

# ── COMPREHENSIONS ──────────────────────────────
[expr for x in iterable if condition]       # List
{k: v for k, v in items.items()}            # Dict
{x for x in iterable}                       # Set
(expr for x in iterable)                    # Generator

# ── FUNCTIONS ───────────────────────────────────
def fn(*args, **kwargs): ...   # Variable arguments
lambda x: x**2                # Anonymous function
map(fn, iterable)              # Apply function
filter(fn, iterable)           # Filter by condition
zip(a, b)                      # Pair iterables
enumerate(lst)                 # Index + value

# ── OOP ─────────────────────────────────────────
class MyClass:
    class_attr = "shared"
    def __init__(self): self.inst_attr = "instance"
    @classmethod    def cm(cls): ...
    @staticmethod   def sm(): ...
    @property       def val(self): return self._val

# ── EXCEPTION ───────────────────────────────────
try: ... except ExceptionType as e: ... else: ... finally: ...
raise ValueError("message")

# ── FILE ────────────────────────────────────────
with open("f.txt", "r/w/a") as f:
    f.read() / f.write(text) / f.readlines()

# ── USEFUL BUILT-INS ────────────────────────────
len() / type() / range() / print() / input()
abs() / round() / min() / max() / sum()
list() / tuple() / set() / dict() / str() / int()
sorted() / reversed() / enumerate() / zip()
any() / all() / isinstance() / issubclass()
```

---

## 🎯 Practice Programs

### Program 1: FizzBuzz

```python
for i in range(1, 101):
    if i % 15 == 0:
        print("FizzBuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)
```

---

### Program 2: Fibonacci with Generator

```python
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

print(list(fibonacci(10)))   # [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```

---

### Program 3: Word Frequency Counter

```python
text = "the quick brown fox jumps over the lazy dog the fox"

words = text.split()
freq = {}
for word in words:
    freq[word] = freq.get(word, 0) + 1

# Sort by frequency
sorted_freq = sorted(freq.items(), key=lambda x: x[1], reverse=True)
for word, count in sorted_freq:
    print(f"{word}: {count}")

# Pythonic way using Counter
from collections import Counter
print(Counter(words).most_common(3))
```

---

### Program 4: Student Grade System (OOP)

```python
class Student:
    def __init__(self, name, marks):
        self.name = name
        self.marks = marks

    @property
    def average(self):
        return sum(self.marks) / len(self.marks)

    @property
    def grade(self):
        avg = self.average
        if avg >= 90: return 'A'
        elif avg >= 80: return 'B'
        elif avg >= 70: return 'C'
        elif avg >= 60: return 'D'
        else: return 'F'

    def __str__(self):
        return f"{self.name} | Avg: {self.average:.1f} | Grade: {self.grade}"

students = [
    Student("Sahil", [95, 88, 92, 98]),
    Student("Priya", [78, 82, 75, 80]),
    Student("Rajan", [55, 60, 58, 52]),
]

for s in students:
    print(s)

# Top student
top = max(students, key=lambda s: s.average)
print(f"\nTop Student: {top.name}")
```

---

### Program 5: File-Based Todo App

```python
import json
import os

FILENAME = "todos.json"

def load_todos():
    if os.path.exists(FILENAME):
        with open(FILENAME) as f:
            return json.load(f)
    return []

def save_todos(todos):
    with open(FILENAME, "w") as f:
        json.dump(todos, f, indent=2)

def add_todo(task):
    todos = load_todos()
    todos.append({"task": task, "done": False})
    save_todos(todos)
    print(f"Added: {task}")

def list_todos():
    todos = load_todos()
    for i, t in enumerate(todos, 1):
        status = "✅" if t["done"] else "⬜"
        print(f"{i}. {status} {t['task']}")

def complete_todo(index):
    todos = load_todos()
    todos[index - 1]["done"] = True
    save_todos(todos)
    print(f"Completed task {index}")

add_todo("Learn Python")
add_todo("Build a project")
complete_todo(1)
list_todos()
```

---

### Program 6: Decorator Example

```python
import time
import functools

# Timer decorator
def timer(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"{func.__name__} took {end-start:.4f}s")
        return result
    return wrapper

# Login required decorator
def login_required(func):
    @functools.wraps(func)
    def wrapper(user, *args, **kwargs):
        if not user.get("logged_in"):
            raise PermissionError("Login required!")
        return func(user, *args, **kwargs)
    return wrapper

@timer
def heavy_computation(n):
    return sum(i**2 for i in range(n))

@login_required
def dashboard(user):
    return f"Welcome, {user['name']}!"

print(heavy_computation(100000))
print(dashboard({"name": "Sahil", "logged_in": True}))
```

---

### Program 7: RegEx — Email & Phone Validator

```python
import re

def validate_email(email):
    pattern = r'^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$'
    return bool(re.match(pattern, email))

def validate_phone(phone):
    pattern = r'^[6-9]\d{9}$'   # Indian mobile number
    return bool(re.match(pattern, phone))

emails = ["sahil@gmail.com", "invalid.email", "test@domain.co.in"]
phones = ["9876543210", "1234567890", "8512345678"]

for e in emails:
    print(f"{e}: {'✅ Valid' if validate_email(e) else '❌ Invalid'}")

for p in phones:
    print(f"{p}: {'✅ Valid' if validate_phone(p) else '❌ Invalid'}")
```

---

### Program 8: Data Cleaning Pipeline

```python
data = [
    {"name": "  sahil ", "age": "25", "salary": "85000"},
    {"name": "PRIYA", "age": "22", "salary": None},
    {"name": "rajan", "age": "30", "salary": "60000"},
    {"name": "", "age": "25", "salary": "55000"},   # Invalid
]

def clean_record(record):
    name = record.get("name", "").strip().title()
    if not name:
        return None   # Skip empty names

    try:
        age = int(record.get("age", 0))
        salary = int(record.get("salary") or 0)
    except (ValueError, TypeError):
        age, salary = 0, 0

    return {"name": name, "age": age, "salary": salary}

cleaned = [clean_record(r) for r in data]
cleaned = [r for r in cleaned if r is not None]

for r in cleaned:
    print(r)
```

---

<div align="center">

---

**⭐ If this helped you, star this repo and share it with your batchmates! ⭐**

*Made with ❤️ by **SK SAHIL** — Freelance AI Developer & Coding Tutor*

*Graduated from German University with Excellence Grade · Working in 4 Startups*

---

</div>
