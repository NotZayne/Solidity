# Price of a house is 1M. If buyer has good credit then 10%, else 20%. Print down payment
price = 1000000
good_credit = False

if good_credit:
    down_payment = price * 0.10
    print(f"Your Down payment is {down_payment}")
else:
    down_payment = price * 0.20
    print(f"Your Down payment is {down_payment}")

# If name is less than 3 characters long, say that the name must be at least 3 characters long
# Otherwise if it;s more than 50 characters long,  say name can be a maximum of 50 characters
# Otherwise, say name looks go

name = "Jodin"

if len(name) < 3:   # Using the len function we are counting the characters in the string above
    print("The name must be at least 3 characters long")
elif len(name) > 50:
    print("The name can be a maximum of 50 characters")
else:
    print("The name looks good!")

# Ask user for their weight, then ask whether they inputted their weight in pounds or kg,
# if kg output the weight in pounds and vice versa

weight = int(input("What is your weight? "))    # turning the string into an integer
weight_unit = input("(L)Pounds or (K)Kilograms ")    # Asking the user whether the inputted value is K or L
if weight_unit.upper() == "L":
    converted_value = weight * 0.45     # Converting L to K
    print(f"You are {converted_value} Kilos")
else:
    converted_value = weight / 0.45     # Converting K to L
    print(f"Your weight is {converted_value} Pounds")

# While Loops!

i = 1       # i starts at 1
while i <= 5:       # Since (i = 1) if within the parameters then it is printed
    print("*" * i)  #
    i = i + 1       # i is then added by 1 until it reaches 5 and the code is repeated
print("Done")       # Once i reaches 5 we print Done

# Guessing Game Program

secret_number = 9
guess_count = 0
guess_limit = 3
while guess_count < guess_limit:    # This while loop will keep on looping until user makes more guesses than limit.
    guess = int(input("Guess: "))
    guess_count += 1
    if guess == secret_number:      # If the user makes the correct guess under the limit of 3 guesses loop stops.
        print("You won!")
        break
else:                               # Otherwise it will print this if limit exceeded
    print("Sorry, you didn't guess correctly!")

# Car game

command = ""    # Whatever the user inputs will be the command variable
started = False
while True:
    command = input("> ").lower()   # Whatever the user inputs will be converted to lowercase
    if command == "start":          # When the user enters start it will output 1/2 statements
        if started:
            print("Car is already started!")
        else:
            started = True
            print("Car started....")
    elif command == "stop":         # When the user enters stop it will output 1/2 statements
        if not started:
            print("Car is already stopped!")
        else:
            started = False
            print("Car stopped.")
    elif command == "help":
        print("""
        Start: Start the car
        Stop: Stop the car
        Quit: Exit the game
       """)
    elif command == "quit":         # The while loop will break when 1 of these commands has been inputted
        break
    else:
        print("I do not understand that...")
