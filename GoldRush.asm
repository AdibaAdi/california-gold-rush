#GoldRush.asm
#Adiba Akter
#
.intel_syntax noprefix
.data


GoldCoin:
.ascii "              v\n\0"
GoldCoin1:
.ascii "       \\             /\n\0"
GoldCoin2:
.ascii "\n\0"
GoldCoin3:
.ascii "          _________\n\0"
GoldCoin4:
.ascii " `       /         \\      '\n\0"
GoldCoin5:
.ascii "        /  \\     /  \\\n\0"
GoldCoin6:
.ascii "       /             \\\n\0"
GoldCoin7:
.ascii "_     /   _ _  _ _    \\    _ \n\0"
GoldCoin8:
.ascii "      \\               / \n\0"
GoldCoin9:
.ascii "       \\             / \n\0"
GoldCoin10:
.ascii "        \\  /     \\  / \n\0"
GoldCoin11:
.ascii " '       \\_________/      `\n\0"
GoldCoin12:
.ascii "\n\0"
GoldCoin13:
.ascii "\n\0"
GoldCoin14:
.ascii "       /             \\\n\0"
GoldCoin15:
.ascii "              ^\n\0"

#ascii art a man going for hunt

hunt0:
.ascii "           ,;~;,\n\0"  
hunt01:
.ascii "               /\\\n\0"
hunt2:
.ascii "              (  /\n\0"
hunt3:
.ascii "              (()      ;,;\n\0"
hunt4:
.ascii "              | \\\\  ,,;;'(\n\0"
hunt5:
.ascii "          __ _(  )m=(((((((((((((================--------\n\0"
hunt6:
.ascii "        /'  '\\'()/~' ' /'\\.)\n\0"
hunt7:
.ascii "     ,;(      )||     (\n\0"
hunt8:
.ascii "    ,;' \\    /-(.;,   )\n\0"
hunt9:
.ascii "         ) /       ) /     \n\0"
hunt10:
.ascii "        //         ||      \n\0"
hunt11:
.ascii "       (_\\         (_\\\n\0"


Title:
    .ascii "CALIFORNIA GOLD RUSH\n\0"
Rules:
    .ascii "Rules:\n\0"
Rules1:
    .ascii "1. 20 weeks (5 months)\n\0"
Rules2:
    .ascii "2. Your endurance drops 10% to 30% and food drops 15% to 25%\0"
Rules2a:
    .ascii " each week. If they reaches 0%, the game ends.\n\0"
Rules3:
    .ascii "3. Going to camp adds 50% to 75% to your endurance, but costs \0"
Rules3a:
    .ascii "$25 to $100.\n\0"
Rules4:
    .ascii "4. Going for hunting adds 60% to 80% to your food and 20% \0"
Rules4a:
    .ascii "to 40% to your endurance.\n\0"
Rules5:
    .ascii "5. Gambling adds/subs gold from your funds and add/subs 15%\0"
Rules5a:
    .ascii " to 20% to your endurance\n\0"
Rules6:
    .ascii "6. Staking out a new claim will cost a week of work.\n\0"
Week:
    .ascii "\n\nWeek \0"
Day:
    .ascii "\n\nIt's Sunday!\n\0"
Fund:
    .ascii "You have $\0"
endurance:
    .ascii "\nYour Endurance is at \0"
endurance1:
    .ascii "%\n\0"
foodText:
    .ascii "You have \0"
foodText1:
    .ascii "% of Food in stock.\n\n\0"
Choice1:
    .ascii "1. Do nothing\n\0"
Choice2:
    .ascii "2. Go to camp (-$25 to -$100)\n\0"
Choice3:
    .ascii "3. Go to Hunting\n\0"
Choice4:
    .ascii "4. Go to Gambling\n\0"
Choice5:
    .ascii "5. Stake a new claim\n\0"
Gold:
    .ascii "\nYou mined $\0"
Gold1:
    .ascii " in gold.\n\0"
Endlost:
    .ascii "You lost \0"
Endlost1:
    .ascii "% endurance.\n\0"
foodlost:
    .ascii "You lost \0"
foodlost1:
    .ascii "% of your food.\n\0"
Claim:
    .ascii "\nYou head off into the wilderness to stake a new claim. \0"
Claim1:
    .ascii "You left $\0"
Claim2:
    .ascii " behind\n\n\0"
end: 
    .ascii "GAME OVER\n\0"
Leftover:
    .ascii "\nYou ended the game with $\0"
Leftover1:
    .ascii "\nYour endurance was \0"
Leftover2:
    .ascii "%\n\0"
town:
    .ascii "\nGoing to town cost you $\0"
regain:
    .ascii "\nYou regained \0"
regain1:
    .ascii "% endurance\n\n\0"
hunt:
    .ascii "Well done! You secured your food for this week. You added \0"
hunt1:
    .ascii "% food in your stock.\n\0"
LeftFood:
    .ascii "You had \0"
LeftFood1:
    .ascii "% of food left in the stock.\n\0"
gamb:
    .ascii "Let's play Chuck-a-Luck\n\0"
Total:
    .ascii "\nYou have $\0"
Question:
    .ascii "\nHow much are you betting?\n\0"
Die1:
    .ascii "\nFirst die is: \0"
Die2:
    .ascii "\nSecond die is: \0"
Die3:
    .ascii "\nThird die is: \0"
Result1:
    .ascii "\n\nYou Lose!\n\0"
Result2:
    .ascii "\n\nYou Win!\n\0"
art1:
    .ascii "\n\n-------------------------\n\0"
art2:
    .ascii "-------------------------\n\0"
art3:
    .ascii "\n--------------------\n\0"
art4:
    .ascii "--------------------\n\0"
Balance:
    .quad 100

die1:
    .quad 0
die2:
    .quad 0
die3:
    .quad 0
Bet:
    .quad 0

Funds:
    .quad 100

Endurance:
    .quad 100

week:
    .quad 1

Food:
    .quad 100

choose:
    .quad 1

Mined:
     .quad 0

Available:
     .quad 0

Cost:
     .quad 0

Gain:
     .quad 0

FoodLost:
     .quad 0

FoodAdd:
     .quad 0
Loss:
     .quad 0

#Gaining endurance from hunting = GEH
GEH: 
     .quad 0

#Gaining endurance from Gambling = GEG
GEG: 
     .quad 0

#losing  endurance from Gambling = LEG
LEG: 
     .quad 0

.text
.global _start
_start:

     mov rcx, 3
     call SetForeColor 
     lea rcx, art1
     call PrintStringZ
     lea rcx, art2
     call PrintStringZ
     lea rcx, Title
     call PrintStringZ
     lea rcx, art2
     call PrintStringZ
     lea rcx, art2
     call PrintStringZ


     lea rcx, GoldCoin
     call PrintStringZ
     lea rcx, GoldCoin1
     call PrintStringZ
     lea rcx, GoldCoin2
     call PrintStringZ
     lea rcx, GoldCoin3
     call PrintStringZ
     lea rcx, GoldCoin4
     call PrintStringZ
     lea rcx, GoldCoin5
     call PrintStringZ
     lea rcx, GoldCoin6
     call PrintStringZ
     lea rcx, GoldCoin7
     call PrintStringZ
     lea rcx, GoldCoin8
     call PrintStringZ
     lea rcx, GoldCoin9
     call PrintStringZ
     lea rcx, GoldCoin10
     call PrintStringZ
     lea rcx, GoldCoin11
     call PrintStringZ
     lea rcx, GoldCoin12
     call PrintStringZ
     lea rcx, GoldCoin13
     call PrintStringZ
     lea rcx, GoldCoin14
     call PrintStringZ
     lea rcx, GoldCoin15
     call PrintStringZ

 #Printing the options
     mov rcx, 1
     call SetForeColor 

     lea rcx, Rules
     call PrintStringZ

     lea rcx, Rules1
     call PrintStringZ
     lea rcx, Rules2
     call PrintStringZ
     lea rcx, Rules2a
     call PrintStringZ
     lea rcx, Rules3
     call PrintStringZ
     lea rcx, Rules3a
     call PrintStringZ
     lea rcx, Rules4
     call PrintStringZ
     lea rcx, Rules4a
     call PrintStringZ
     lea rcx, Rules5
     call PrintStringZ
     lea rcx, Rules5a
     call PrintStringZ
     lea rcx, Rules6
     call PrintStringZ


     mov rcx, 7
     call SetForeColor 

 #Setup the Available
     mov rcx, 1000
     call Random
     add rcx, 1
     mov Available, rcx



 #Assign Cost
    mov rcx, 76
    call Random
    add rcx, 25
    mov Cost, rcx

 #Assign Gain
    mov rcx, 26
    call Random
    add rcx, 50
    mov Gain, rcx

  #Starting While loop

While:

  #Setting Condition week<=20 and endurance>0

     mov rcx, week
     cmp rcx, 20
     jg End
     mov rcx, Endurance
     cmp rcx, 0
     jle End
     mov rcx, Food
     cmp rcx, 0
     jle End

  #calling weeks in loops

      lea rcx, Week
      call PrintStringZ
      mov rcx, week
      call PrintInt


      lea rcx, Day
      call PrintStringZ
      lea rcx, Fund
      call PrintStringZ
      mov rcx, 2
      call SetForeColor 
      mov rcx, Funds
      call PrintInt
      mov rcx, 7
      call SetForeColor 
      lea rcx, endurance
      call PrintStringZ
      mov rcx, 2
      call SetForeColor 
      mov rcx, Endurance
      call PrintInt 
      mov rcx, 7
      call SetForeColor 
      lea rcx, endurance1
      call PrintStringZ
      lea rcx, foodText
      call PrintStringZ
      mov rcx, 2
      call SetForeColor 
      mov rcx, Food
      call PrintInt
      mov rcx, 7
      call SetForeColor 
      lea rcx, foodText1
      call PrintStringZ
      mov rcx, 4
      call SetForeColor 
      lea rcx, Choice1
      call PrintStringZ
      lea rcx, Choice2
      call PrintStringZ
      lea rcx, Choice3
      call PrintStringZ
      lea rcx, Choice4
      call PrintStringZ
      lea rcx, Choice5
      call PrintStringZ
      mov rcx, 7
      call SetForeColor 


  #User input for activity option and start of switch statements
      mov rcx, 1
      call SetForeColor 
      
      call ScanInt


      cmp rcx, 1
      je basic
      cmp rcx, 2
      je Camp
      cmp rcx, 3
      je Hunting
      cmp rcx, 4
      je Gambling
      cmp rcx, 5
      je StakeClaim
     
  #Assigning CanMine

CanMine:
     mov rcx, Available
     call Random
     add rcx, 1
     mov Mined, rcx        

     lea rcx, Gold
     call PrintStringZ   

  #Adding Mined to Funds

     mov rcx, Mined
     add Funds, rcx

  #Substracting Mined from Available

     mov rcx, Available
     sub rcx, Mined
     mov Available, rcx

  #Printing Mined Gold
     mov rcx, 2
     call SetForeColor 
     mov rcx, Mined
     call PrintInt
     mov rcx, 7
     call SetForeColor 
     lea rcx, Gold1
     call PrintStringZ
     jmp EnduranceLost


  #case1
basic:
      mov rcx, 7
      call SetForeColor 

      jmp CanMine
   
     

EnduranceLost:
     
     lea rcx, Endlost
     call PrintStringZ
  
  #Assign Loss

     mov rcx, 21
     call Random
     add rcx, 10
     mov Loss, rcx
 
     mov rcx, Endurance
     sub rcx, Loss
     mov Endurance, rcx
     mov rcx, 2
     call SetForeColor 
     mov rcx, Loss
     call PrintInt
     mov rcx, 7
     call SetForeColor 


     lea rcx, Endlost1
     call PrintStringZ
 
   #Assign Foodlost

     mov rcx, 11
     call Random
     add rcx, 15
     mov FoodLost, rcx
     lea rcx, foodlost
     call PrintStringZ
     mov rcx, 2
     call SetForeColor 
     mov rcx, FoodLost
     call PrintInt
     mov rcx, 7
     call SetForeColor 
     lea rcx, foodlost1
     call PrintStringZ
 
     mov rcx, Food
     sub rcx, FoodLost
     mov Food, rcx 
     jmp default


  #case2

Camp:
      mov rcx, 7
      call SetForeColor 

    lea rcx, town
    call PrintStringZ

    mov rcx, Funds
    sub rcx, Cost
    mov Funds, rcx
    mov rcx, 2
    call SetForeColor 
    mov rcx, Cost
    call PrintInt
    mov rcx, 7
    call SetForeColor 
    

    lea rcx, regain
    call PrintStringZ

    mov rcx, Endurance
    add rcx, Gain
    mov Endurance, rcx
    mov rcx, 2
    call SetForeColor 
    mov rcx, Gain
    call PrintInt
    mov rcx, 7
    call SetForeColor 


    lea rcx, regain1
    call PrintStringZ
    jmp CanMine

  #case3

Hunting:

      mov rcx, 5
      call SetForeColor 
      lea rcx, hunt0
      call PrintStringZ
      lea rcx, hunt01
      call PrintStringZ
      lea rcx, hunt2
      call PrintStringZ
      lea rcx, hunt3
      call PrintStringZ
      lea rcx, hunt4
      call PrintStringZ
      lea rcx, hunt5
      call PrintStringZ
      lea rcx, hunt6
      call PrintStringZ
      lea rcx, hunt7
      call PrintStringZ
      lea rcx, hunt8
      call PrintStringZ
      lea rcx, hunt9
      call PrintStringZ
      lea rcx, hunt10
      call PrintStringZ
      lea rcx, hunt11
      call PrintStringZ
      mov rcx, 7
      call SetForeColor 
      lea rcx, hunt
      call PrintStringZ
      
      mov rcx, 21
      call Random
      add rcx, 60
      mov FoodAdd, rcx
      mov rcx, 2
      call SetForeColor 
      mov rcx, FoodAdd
      call PrintInt
      mov rcx, 7
      call SetForeColor 

      
      lea rcx, hunt1
      call PrintStringZ

   #gain endurance from hunt
  
      mov rcx, 21
      call Random
      add rcx, 20
      mov GEH, rcx
      lea rcx, regain
      call PrintStringZ
      mov rcx, 2
      call SetForeColor 
      mov rcx, GEH
      call PrintInt
      mov rcx, 7
      call SetForeColor 
      lea rcx, regain1
      call PrintStringZ
      mov rcx, Endurance
      add rcx, GEH
      mov Endurance, rcx


      mov rcx, Food
      add rcx, FoodAdd
      mov Food, rcx
      jmp CanMine      

  #case4

Gambling:
      mov rcx, 3
      call SetForeColor 
      lea rcx, gamb
      call PrintStringZ
      mov rcx, 7
      call SetForeColor 


  
    WhileGamb:
    lea rcx, Total
    call PrintStringZ
    mov rcx, 2
    call SetForeColor 
    mov rcx, Funds
    call PrintInt
    mov rcx, 7
    call SetForeColor 


    lea rcx, Question
    call PrintStringZ
    call ScanInt
    mov Bet, rcx
    cmp rcx, 0
    jle CanMine
    cmp rcx, Funds
    jg CanMine
  
    lea rcx, Die1
    call PrintStringZ
    mov rcx, 6
    call Random
    add rcx, 1
    call PrintInt
    mov die1, rcx

    lea rcx, Die2
    call PrintStringZ
    mov rcx, 6
    call Random
    add rcx, 1
    call PrintInt
    mov die2, rcx

    lea rcx, Die3
    call PrintStringZ
    mov rcx, 6
    call Random
    add rcx, 1
    call PrintInt
    mov die3, rcx

    cmpq die1, 6
    je ResultWin

    cmpq die2, 6
    je ResultWin
   
    cmpq die3, 6
    je ResultWin

    jmp PrintDefault

#if wins, funds and endurance rises
ResultWin:
    mov rcx, 2
    call SetForeColor 
    lea rcx, Result2
    call PrintStringZ
    mov rcx, 7
    call SetForeColor 
    mov rcx, Bet
    add Funds, rcx

#add endurance

    mov rcx, 6
    call Random
    add rcx, 15
    mov GEG, rcx 
    lea rcx, regain
    call PrintStringZ 
    mov rcx, 2
    call SetForeColor 
    mov rcx, GEG
    call PrintInt
    mov rcx, 7
    call SetForeColor 
    lea rcx, regain1
    call PrintStringZ 
    
    mov rcx, Endurance
    add rcx, GEG
    mov Endurance, rcx
    jmp WhileGamb

PrintDefault:
    mov rcx, 2
    call SetForeColor 

    lea rcx, Result1
    call PrintStringZ
    mov rcx, 7
    call SetForeColor 
    mov rcx, Bet
    sub Funds, rcx

#substract endurance

    mov rcx, 6
    call Random
    add rcx, 15
    mov LEG, rcx
    lea rcx, Endlost
    call PrintStringZ 
    mov rcx, 2
    call SetForeColor 
    mov rcx, LEG
    call PrintInt
    mov rcx, 7
    call SetForeColor 
    lea rcx, Endlost1
    call PrintStringZ 


    mov rcx, Endurance
    sub rcx, LEG
    mov Endurance, rcx
    jmp WhileGamb



  #case5 

StakeClaim:
    mov rcx, 7
    call SetForeColor 
    lea rcx, Claim
    call PrintStringZ
    lea rcx, Claim1
    call PrintStringZ
    mov rcx, 2
    call SetForeColor 
    mov rcx, Available
    call PrintInt 
    mov rcx, 7
    call SetForeColor 
    lea rcx, Claim2
    call PrintStringZ
 

  #Set a new value for Available
    mov rcx, 1000
    call Random
    add rcx, 1
    mov Available, rcx

  #declaring loss of week, assiging CanMine false

    mov rcx, week
    add rcx, 1
    mov week, rcx
    jmp EnduranceLost


default:
    mov rcx, week
    add rcx, 1
    mov week, rcx
 
    jmp While
 
End:
    mov rcx, 1
    call SetForeColor 

     lea rcx, art3
     call PrintStringZ
     lea rcx, art4
     call PrintStringZ
     lea rcx, end
     call PrintStringZ
     lea rcx, art4
     call PrintStringZ
     lea rcx, art4
     call PrintStringZ

     mov rcx, 7
     call SetForeColor 


  #Printing Leftover funds

    lea rcx, Leftover  
    call PrintStringZ

    mov rcx, 2
    call SetForeColor 

    mov rcx, Funds
    call PrintInt
    mov rcx, 7
    call SetForeColor 

#Printing Leftover Endurance

    lea rcx, Leftover1  
    call PrintStringZ
    mov rcx, 2
    call SetForeColor 

    mov rcx, Endurance
    call PrintInt
    mov rcx, 7
    call SetForeColor 

    lea rcx, Leftover2  
    call PrintStringZ
  
#Printing Leftover Foods
    
    lea rcx, LeftFood
    call PrintStringZ
    mov rcx, 2
    call SetForeColor 

    mov rcx, Food
    call PrintInt
    mov rcx, 7
    call SetForeColor 
 
    lea rcx, LeftFood1
    call PrintStringZ
    call Exit
