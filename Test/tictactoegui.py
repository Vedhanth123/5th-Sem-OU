import tkinter as tk
from tkinter import messagebox

# Initialize the board
board = [" " for _ in range(9)]

# Initialize the GUI window
window = tk.Tk()
window.title("Tic-Tac-Toe")

# Function to handle a player's move
def make_move(idx):
    global current_player
    if board[idx] == " ":
        board[idx] = current_player
        buttons[idx]["text"] = current_player
        if check_win(current_player):
            messagebox.showinfo("Tic-Tac-Toe", f"Player {current_player} wins!")
            reset_game()
        elif check_tie():
            messagebox.showinfo("Tic-Tac-Toe", "It's a tie!")
            reset_game()
        else:
            current_player = "X" if current_player == "O" else "O"

# Function to check if a player has won
def check_win(player):
    win_combinations = [(0, 1, 2), (3, 4, 5), (6, 7, 8),
                        (0, 3, 6), (1, 4, 7), (2, 5, 8),
                        (0, 4, 8), (2, 4, 6)]

    for combo in win_combinations:
        if board[combo[0]] == board[combo[1]] == board[combo[2]] == player:
            return True
    return False

# Function to check if the board is full (a tie)
def check_tie():
    return " " not in board

# Function to reset the game
def reset_game():
    global current_player
    current_player = "X"
    for i in range(9):
        board[i] = " "
        buttons[i]["text"] = " "
    messagebox.showinfo("Tic-Tac-Toe", "Game Reset!")

# Create and configure buttons for the board
buttons = [None] * 9
for i in range(9):
    row, col = divmod(i, 3)
    buttons[i] = tk.Button(window, text=" ", width=10, height=2, command=lambda idx=i: make_move(idx))
    buttons[i].grid(row=row, column=col)

# Initialize the current player
current_player = "X"

# Create a reset button
reset_button = tk.Button(window, text="Reset Game", width=20, height=2, command=reset_game)
reset_button.grid(row=3, columnspan=3)

# Start the GUI main loop
window.mainloop()
