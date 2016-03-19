__author__ = 'Matthew'
#Character to be used for filled seat... Â¤ .. Or I could just replace the row with number 0.
# Array of the seats
seatLayout =  [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]

rowStockArray = [0,0,0,0,0,0,0,0,0,0]


# Making orchestra rows more neater. Easier to understand.
def numToLetter(x)
    global l
    if x == 0:
        l = "J"
    elif x == 1:
        l = "I"
    elif x == 2:
        l = "H"
    elif x == 3:
        l = "G"
    elif x == 4:
        l = "F"
    elif x == 5:
        l = "E"
    elif x == 6:
        l = "D"
    elif x == 7:
        l = "C"
    elif x == 8:
        l = "B"
    elif x == 9:
        l = "A"
#prints the seat layout for customer to pick
print("This is the seat layout for the Orchestra Auditorium : ")
def callingSeatLayout():
    row = 0
    for x in range (0,10):
        numToLetter(x)
        print(l,seatLayout[row],l)
        row +=1
callingSeatLayout()
#Prerequesite variables
seatsAvailable = 150
rowsAvailable = 9
rowStock = 15
lastEntry = 0
unavailableSeats = 0
stockElement = 0
#Main Orchestra Loop
while seatsAvailable >= 0:
    while True:
        #possible improvements would be, if group is larger than 15, then allow for group to split
        #up with the remainder on another row
        #could solve by making some of the orchestra loop as a function, so I can easily call it again without
        # an excessive amount of code.

        while True:
            try:
                 userOrder = int(input("How many tickets, would you like to purchase?"))
                 break
            except ValueError:
                 print ("Hey, If you are not going to follow my instruction, I will ask you to leave..")
        if userOrder > 15:
            print("Your group will not be able to sit on the same row")
            userOrder =  int(input("Enter a smaller amount of tickets..."))

        else:
            break
        break
    userOrderCopy = userOrder
    seatsAvailable -= userOrder
    print("There are: " ,seatsAvailable, "seats available ")
    if seatsAvailable <= 0:
        break



    #Updates the new row for next time ( This crappy algorithm should be fixed )
    #Edit: Worked it out, after a break :P
    #print("Row available", rowsAvailable)

    for rowCheck in range(9,0, -1 ):
        
        if rowStockArray[rowCheck] >= userOrderCopy:
            # change the row number
            continue
        
    elif (rowStock - userOrder) <= -1:
        #print("doing the first")
        # Have it so that it uses the number of unavailable seats
        #to check the row stock to improve accuracy.
        rowsAvailable -=1
        rowStock = 15
        lastEntry = 0
        userOrderCopy = userOrder
    #print("Row available", rowsAvailable)
    # Now sorts it into the array, closest to the front...
    # filling from left to right...
    # and then replaces the entries.

    userOrderCopy += lastEntry



    #print("last entry", lastEntry)
    #print ("rowstock ", rowStock)

    #print("userordercopy", userOrderCopy)


    for w in range(lastEntry,userOrderCopy):
        seatLayout[rowsAvailable][w] = 0

    #unavailable seat ..
    for r in range(9, 0, -1):
        for c in range(0,14):
            if seatLayout[r][c] == 0:
                unavailableSeats += 1
                rowStockArray[stockElement] = 15 -  unavailableSeats
    print( " There are", unavailableSeats , "seats unavailable")

    #Uses row stock, to check if there is more space on that row.
    rowStock -= userOrder


    #print("Row Stock", rowStock)



    #the last entry added so no overlay can occur, cumulative frequency
    lastEntry += userOrder
    #print ("last entry", lastEntry)

    # Updated seatLayout
    callingSeatLayout()
# Future improvements use a for loop to detect each 0, those that are
#zero are empty space, those that are not is available space.
#for 0 in...
#   copy and past previous stock control.
#   without the column reset

#challenge
# Each time, ask if someone has cancelled seat order.
# saves each order in another array
# Order can be replaced/ fully closed



