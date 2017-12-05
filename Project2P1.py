import sys
def main():
  # Return the factorial for the specified number
  def factorial(n):
    if n== 0:   # Base case
      return 1
    elif n< 0:
      print("Oops! You can't use a negative integer!")
      sys.exit()
    else:
      return n * (factorial(n - 1)) # Recursive call

  n = int(raw_input("Enter a non-negative integer: "))
  print("Factorial of", n, "is", factorial(n))

main() # Call the main function
