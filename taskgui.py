import tkinter as tk

# Function to check if a number is a palindrome
def is_palindrome(num):
    num_str = str(num)
    reversed_str = num_str[::-1]
    return num_str == reversed_str

# Function to check if a number is even
def is_even(num):
    return num % 2 == 0

# Function to check if a number is composite
def is_composite(num):
    divisor_count = 0
    for i in range(1, num + 1):
        if num % i == 0:
            divisor_count += 1
    return divisor_count > 2

# Function to handle the button click event
def check_number():
    input_number = int(entry.get())
    result_label.config(text="Result: ")

    if is_palindrome(input_number):
        result_label.config(text="Result: Palindrome")
    elif is_even(input_number):
        result_label.config(text="Result: Even")
    elif is_composite(input_number):
        result_label.config(text="Result: Composite")
    else:
        result_label.config(text="Result: None")

# Create the main window
window = tk.Tk()
window.title("Number Checker")

# Create and place the input entry field
entry = tk.Entry(window, width=20)
entry.pack(pady=10)

# Create and place the "Check" button
check_button = tk.Button(window, text="Check", command=check_number)
check_button.pack()

# Create a label for displaying the result
result_label = tk.Label(window, text="Result: ", font=("Arial", 14))
result_label.pack(pady=10)

# Start the GUI event loop
window.mainloop()
