# import math

# def calculate_factorial(n):
#     try:
#         factorial = math.factorial(n)
#         return factorial
#     except ValueError as ve:
#         return None

# while True:
#     print("\nFactorial Calculator Menu:")
#     print("1. Calculate factorial of a number")
#     print("2. Quit")

#     choice = input("Enter your choice (1/2): ")

#     if choice == '1':
#         try:
#             num_str = input("Enter a non-negative integer: ")
#             while (type(num_str) == 'float')

#             if num_str.isdigit():
#                 num = int(num_str)
#                 if num >= 0:
#                     result = calculate_factorial(num)
#                     if result is not None:
#                         print(f"The factorial of {num} is {result}")
#                     else:
#                         print("Factorial calculation error: Enter a non-negative integer.")
#                 else:
#                     print("Invalid input: Enter a non-negative integer.")
#             else:
#                 print("Invalid input: Enter a non-negative integer.")
#         except Exception as e:
#             print(f"An error occurred: {str(e)}")

#     elif choice == '2':
#         print("Exiting the program.")
#         break

#     else:
#         print("Invalid choice. Please select a valid option (1/2).")


num = float(input("Enter : "))
num = int(num)
print(type(num), num)