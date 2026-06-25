
# Python Colab Mini Games

This repository contains three beginner-friendly Python games designed to run in **Google Colab**:

1. **Dungeon Treasure Escape**
   <img width="373" height="458" alt="image" src="https://github.com/user-attachments/assets/1846db6f-9034-4e63-820e-406dac494741" />

   
2. **Neon Snake**
   <img width="564" height="645" alt="image" src="https://github.com/user-attachments/assets/dfd71f3e-b77c-4b34-b763-1e961b244788" />

3. **Tic Tac Toe**
   <img width="851" height="393" alt="image" src="https://github.com/user-attachments/assets/8450419c-1311-4c83-8edf-ac615de4c0cf" />


The main purpose of these games is to demonstrate Python fundamentals through small, playable projects.

---

## 1. Project Overview

These games are useful for learning how basic Python concepts work in real applications. Instead of only writing theory-based examples, each game shows how variables, functions, loops, conditions, lists, classes, and event handling can be used to build interactive programs.

---

## 2. Games Included

### 2.1 Dungeon Treasure Escape

A grid-based adventure game where the player moves through a dungeon, collects gold, finds a key, avoids monsters and traps, and tries to escape through the exit.

**Main concepts used:**

- Lists for player position and game objects
- Random module for generating monsters, traps, potions, and gold
- Classes and methods for organizing the game
- Conditional statements for checking tile events
- Button-based interaction using `ipywidgets`
- HTML/CSS rendering inside Colab

---

### 2.2 Neon Snake

A visually styled snake game with score, best score, speed, food, movement, collision detection, and keyboard/button controls.

**Main concepts used:**

- Variables for score, speed, direction, and game status
- Lists of dictionaries for snake body parts
- Functions for movement, drawing, food generation, and collision detection
- Loops for updating the game continuously
- Conditions for wall collision, self-collision, and food collection
- JavaScript and HTML canvas for browser-based Colab gameplay
- Basic UI styling with HTML/CSS

---

### 2.3 Tic Tac Toe

A player-vs-computer Tic Tac Toe game with Easy, Medium, and Hard difficulty. The Hard mode uses the Minimax algorithm.

**Main concepts used:**

- Lists to represent the 3x3 board
- Functions/methods for player move, computer move, winner checking, and reset
- Conditional statements for win, lose, and draw logic
- Loops for checking available moves and winning patterns
- Classes for clean project organization
- Recursion in the Minimax algorithm
- `ipywidgets` for interactive buttons and dropdowns

---

## 3. Main Python Fundamentals Used

### 3.1 Variables

Variables store changing game data such as score, health, gold, direction, board state, and game status.

Example:

```python
score = 0
hp = 100
game_over = False
```

---

### 3.2 Data Types

The games use common Python data types:

- `int` for score, health, and steps
- `str` for player symbols and messages
- `bool` for game status
- `list` for board, snake body, positions, and game objects
- `dict` for storing coordinate values in Snake

Example:

```python
player = "X"
has_key = False
snake = [{"x": 10, "y": 11}]
```

---

### 3.3 Lists

Lists are used to store multiple related values such as board cells, monsters, traps, potions, snake body parts, and winning patterns.

Example:

```python
board = [""] * 9
winning_patterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
]
```

---

### 3.4 Dictionaries

Dictionaries are used in the Snake game to store x and y positions clearly.

Example:

```python
head = {"x": 10, "y": 11}
```

---

### 3.5 Conditional Statements

Conditions are used to make decisions in the game, such as checking whether the player won, lost, hit a wall, collected food, or stepped on a trap.

Example:

```python
if hp <= 0:
    game_over = True
```

---

### 3.6 Loops

Loops are used to repeat tasks such as checking cells, drawing grids, scanning possible moves, and updating game objects.

Example:

```python
for i in range(9):
    if board[i] == "":
        print("Empty cell found")
```

---

### 3.7 Functions

Functions divide the program into smaller reusable blocks. This makes the code cleaner and easier to debug.

Example:

```python
def check_winner():
    pass
```

---

### 3.8 Classes and Objects

Dungeon Treasure Escape and Tic Tac Toe use classes to group data and functions together.

Example:

```python
class TicTacToeGame:
    def __init__(self):
        self.board = [""] * 9
```

---

### 3.9 Methods

Methods are functions inside a class. They control actions such as moving the player, updating the board, restarting the game, and checking results.

Example:

```python
def reset_game(self):
    self.board = [""] * 9
```

---

### 3.10 Random Module

The `random` module is used to create unpredictable gameplay, such as random monster positions, potion values, gold amounts, and easy-level computer moves.

Example:

```python
import random
damage = random.randint(10, 25)
```

---

### 3.11 Recursion

The Tic Tac Toe Hard mode uses recursion in the Minimax algorithm. A recursive function calls itself to explore possible future moves.

Example:

```python
score = self.minimax(False)
```

---

### 3.12 Event-Driven Programming

The games respond to user actions such as button clicks, keyboard presses, and dropdown selections.

Example:

```python
button.on_click(lambda b: self.player_move(index))
```

---

### 3.13 Basic UI Rendering

The games use `ipywidgets`, `IPython.display`, HTML, CSS, and JavaScript to make the games interactive and visually attractive inside Google Colab.

Example:

```python
from IPython.display import display, HTML
```

---

## 4. How to Run in Google Colab

1. Open Google Colab.
2. Create a new notebook.
3. Copy one full game code into a code cell.
4. Run the cell.
5. Use buttons or keyboard controls to play.

For the Snake game, click inside the game area first, then use Arrow keys or WASD.

---

## 5. Learning Outcomes

After completing these three games, a beginner should understand:

- How to structure a Python program
- How to use variables, lists, dictionaries, and conditions
- How to create functions and classes
- How to handle user input
- How to apply loops in real projects
- How simple game logic works
- How to create interactive projects in Google Colab

---

## 6. Basic Interview Questions and Answers

### Q1. What Python fundamentals did you use in these games?

I used variables, data types, lists, dictionaries, conditional statements, loops, functions, classes, methods, random number generation, recursion, and event-driven programming.

---

### Q2. Why did you use lists in Tic Tac Toe?

I used a list to represent the 3x3 board. Each index of the list represents one cell of the board.

---

### Q3. How is the winner checked in Tic Tac Toe?

The program stores all possible winning patterns in a list. It checks whether the same symbol appears in any complete row, column, or diagonal.

---

### Q4. What is the Minimax algorithm?

Minimax is a decision-making algorithm used in two-player games. It checks all possible future moves and chooses the best move for the computer.

---

### Q5. Why is recursion used in the Tic Tac Toe game?

Recursion is used because the Minimax function repeatedly checks future game states until it finds a win, loss, or draw.

---

### Q6. What is the purpose of the random module?

The random module is used to make the game unpredictable. For example, it randomly places food, monsters, traps, gold, and potions.

---

### Q7. What is event-driven programming?

Event-driven programming means the program responds to user actions such as clicking a button, pressing a key, or selecting an option.

---

### Q8. Why did you use classes?

Classes help organize the game code. They keep related variables and functions together, making the program easier to manage and understand.

---

### Q9. What is the difference between a function and a method?

A function is a reusable block of code. A method is a function that belongs to a class.

---

### Q10. How does the Snake game detect collision?

The Snake game checks whether the snake head touches the wall or any part of its own body. If that happens, the game ends.

---

### Q11. How does the Dungeon game work?

The player moves on a grid. Each position may contain a monster, trap, potion, gold, key, or exit. The game checks the current position after every move.

---

### Q12. What is the use of conditions in these games?

Conditions control the game logic. They decide whether the player wins, loses, collects an item, takes damage, or continues playing.

---

### Q13. What is the use of loops in these games?

Loops are used to check board positions, winning patterns, available moves, snake movement, and grid rendering.

---

### Q14. What is the role of `ipywidgets`?

`ipywidgets` is used to create interactive buttons, dropdowns, and controls inside Google Colab.

---

### Q15. What did you learn from building these games?

I learned how to convert basic Python concepts into real interactive projects. I also learned how game logic, user input, conditions, loops, and functions work together.

---

## 7. Conclusion

These three games are simple but practical Python projects. They are suitable for beginners because they demonstrate core programming concepts in an interactive and enjoyable way. They can also be used as small portfolio projects to show Python fundamentals, logical thinking, and problem-solving ability.
