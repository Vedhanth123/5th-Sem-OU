# Initialize the board
board = [" " for _ in range(9)]

# Function to print the Tic-Tac-Toe board
def print_board():
    print("   |   |   ")
    print(f" {board[0]} | {board[1]} | {board[2]} ")
    print("   |   |   ")
    print("-----------")
    print("   |   |   ")
    print(f" {board[3]} | {board[4]} | {board[5]} ")
    print("   |   |   ")
    print("-----------")
    print("   |   |   ")
    print(f" {board[6]} | {board[7]} | {board[8]} ")
    print("   |   |   ")

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

# Main game loop
current_player = "X"
while True:
    print_board()
    move = input(f"Player {current_player}, enter your move (1-9): ")

    if move.isdigit() and 1 <= int(move) <= 9 and board[int(move) - 1] == " ":
        board[int(move) - 1] = current_player

        if check_win(current_player):
            print_board()
            print(f"Player {current_player} wins! Congratulations!")
            break
        elif check_tie():
            print_board()
            print("It's a tie!")
            break

        current_player = "X" if current_player == "O" else "O"
    else:
        print("Invalid move. Please try again.")
