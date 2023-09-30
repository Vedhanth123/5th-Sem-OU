def is_palindrome(num):
    # Convert the number to a string for easy comparison
    num_str = str(num)
    
    # Reverse the string and compare it to the original
    reversed_str = num_str[::-1]
    
    # Check if the reversed string is equal to the original string
    if num_str == reversed_str:
        return True
    else:
        return False

def is_even(num):
    if num % 2 == 0:
        return True
    else:
        return False

def is_composite(num):
    # Initialize a count for divisors
    divisor_count = 0
    
    # Loop through numbers from 1 to num
    for i in range(1, num + 1):
        # Check if i is a divisor of num
        if num % i == 0:
            divisor_count += 1
    
    # A composite number has more than two divisors
    # (1 and itself), so we check if divisor_count is greater than 2
    if divisor_count > 2:
        return True
    else:
        return False


