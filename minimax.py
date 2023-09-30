import random

# Initialize the Tic-Tac-Toe board
def initialize_board():
    return [" " for _ in range(9)]

# Display the Tic-Tac-Toe board
def display_board(board):
    print(board[0] + "|" + board[1] + "|" + board[2])
    print("-+-+-")
    print(board[3] + "|" + board[4] + "|" + board[5])
    print("-+-+-")
    print(board[6] + "|" + board[7] + "|" + board[8])

# Check if the game is over
def is_game_over(board):
    return check_win(board, "X") or check_win(board, "O") or " " not in board

# Check if a player has won
def check_win(board, player):
    # Check rows
    for i in range(0, 9, 3):
        if board[i] == board[i + 1] == board[i + 2] == player:
            return True

    # Check columns
    for i in range(3):
        if board[i] == board[i + 3] == board[i + 6] == player:
            return True

    # Check diagonals
    if board[0] == board[4] == board[8] == player:
        return True
    if board[2] == board[4] == board[6] == player:
        return True

    return False

# Get available moves
def get_available_moves(board):
    return [i for i in range(9) if board[i] == " "]

# Minimax algorithm
def minimax(board, depth, is_maximizing):
    if check_win(board, "X"):
        return -1
    if check_win(board, "O"):
        return 1
    if len(get_available_moves(board)) == 0:
        return 0

    if is_maximizing:
        best_score = -float("inf")
        for move in get_available_moves(board):
            board[move] = "O"
            score = minimax(board, depth + 1, False)
            board[move] = " "
            best_score = max(score, best_score)
        return best_score
    else:
        best_score = float("inf")
        for move in get_available_moves(board):
            board[move] = "X"
            score = minimax(board, depth + 1, True)
            board[move] = " "
            best_score = min(score, best_score)
        return best_score

# Make the AI's move using minimax
def ai_move(board):
    best_score = -float("inf")
    best_move = None

    for move in get_available_moves(board):
        board[move] = "O"
        score = minimax(board, 0, False)
        board[move] = " "
        if score > best_score:
            best_score = score
            best_move = move

    return best_move

# Main game loop
def play_game():
    board = initialize_board()
    display_board(board)

    while not is_game_over(board):
        # Player's turn
        player_move = int(input("Enter your move (0-8): "))
        if player_move not in get_available_moves(board):
            print("Invalid move. Try again.")
            continue
        board[player_move] = "X"
        display_board(board)

        if check_win(board, "X"):
            print("You win!")
            break
        elif len(get_available_moves(board)) == 0:
            print("It's a tie!")
            break

        # AI's turn
        ai_move_index = ai_move(board)
        print(f"AI's move: {ai_move_index}")
        board[ai_move_index] = "O"
        display_board(board)

        if check_win(board, "O"):
            print("AI wins!")
            break
        elif len(get_available_moves(board)) == 0:
            print("It's a tie!")
            break

if __name__ == "__main__":
    play_game()
