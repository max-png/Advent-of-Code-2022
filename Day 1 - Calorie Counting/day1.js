/* --- Day 1: Calorie Counting ---
Santa's reindeer typically eat regular reindeer food, but they need a lot of magical energy to deliver presents on Christmas. For that, their favorite snack is a special type of star fruit that only grows deep in the jungle. The Elves have brought you on their annual expedition to the grove where the fruit grows.

To supply enough magical energy, the expedition needs to retrieve a minimum of fifty stars by December 25th. Although the Elves assure you that the grove has plenty of fruit, you decide to grab any fruit you see along the way, just in case.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

The jungle must be too overgrown and difficult to navigate in vehicles or access from the air; the Elves' expedition traditionally goes on foot. As your boats approach land, the Elves begin taking inventory of their supplies. One important consideration is food - in particular, the number of Calories each Elf is carrying (your puzzle input).

The Elves take turns writing down the number of Calories contained by the various meals, snacks, rations, etc. that they've brought with them, one item per line. Each Elf separates their own inventory from the previous Elf's inventory (if any) by a blank line.

For example, suppose the Elves finish writing their items' Calories and end up with the following list:

1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
This list represents the Calories of the food carried by five Elves:

The first Elf is carrying food with 1000, 2000, and 3000 Calories, a total of 6000 Calories.
The second Elf is carrying one food item with 4000 Calories.
The third Elf is carrying food with 5000 and 6000 Calories, a total of 11000 Calories.
The fourth Elf is carrying food with 7000, 8000, and 9000 Calories, a total of 24000 Calories.
The fifth Elf is carrying one food item with 10000 Calories.
In case the Elves get hungry and need extra snacks, they need to know which Elf to ask: they'd like to know how many Calories are being carried by the Elf carrying the most Calories. In the example above, this is 24000 (carried by the fourth Elf).

Find the Elf carrying the most Calories. How many total Calories is that Elf carrying? */

foods = [
    {
        "name": "jordgubbar",
        "calories": 1000
    },
    {
        "name": "vegansk prinskorv",
        "calories": 2000
    },
    {
        "name": "senapssill",
        "calories": 3000
    },
    {
        "name": "skånsk sill",
        "calories": 4000
    },
    {
        "name": "kanderad grönkål",
        "calories": 5000
    },
    {
        "name": "tiramisu",
        "calories": 6000
    },
    {
        "name": "ris á la malta",
        "calories": 7000
    },
    {
        "name": "knäck",
        "calories": 8000
    },
    {
        "name": "pepparkakshus",
        "calories": 9000
    },
    {
        "name": "spädbarnsgris",
        "calories": 10000
    }
]

let elves = [{
    name: "Stefan",
    pouch: [],
    caloryValue: 0
},
{
    name: "Pekka",
    pouch: [],
    caloryValue: 0
},
{
    name: "Janne",
    pouch: [],
    caloryValue: 0
},
{
    name: "Brunolf",
    pouch: [],
    caloryValue: 0
},
{
    name: "Max",
    pouch: [],
    caloryValue: 0
},
]

giveFood(foods[0], elves[0])
giveFood(foods[1], elves[0])
giveFood(foods[2], elves[0])

giveFood(foods[3], elves[1])

giveFood(foods[4], elves[2])
giveFood(foods[5], elves[2])

giveFood(foods[6], elves[3])
giveFood(foods[7], elves[3])
giveFood(foods[8], elves[3])

giveFood(foods[9], elves[4])


findElfWithMostCalories()

function giveFood(food, elf) {
    elf.pouch.push(food)
    elf.name + " fick lite " + food.name
    return elf
}

function checkFood(elf) {
    let foodResult = elf.name
    let caloryValue = 0

    if (elf.pouch.length > 0) {
        foodResult += " har lite "
        for (food in elf.pouch) {
            caloryValue += elf.pouch[food].calories

            foodResult += elf.pouch[food].name
            if ((food) < (elf.pouch.length - 1)) {
                foodResult += " och lite "
            }
        }
        elf.caloryValue = caloryValue
        /*         console.log(foodResult)
                console.log("Det är " + elf.caloryValue + " kalorier\n") */
        return elf
    }

}

function findElfWithMostCalories() {
    let richestElf = elves[0]
    for (elf in elves) {
        currentCalory = checkFood(elves[elf]).caloryValue
        if (currentCalory > richestElf.caloryValue) {
            richestElf = elves[elf]
        }
    }
    console.log(richestElf.name + " har mat till ett värde av " + richestElf.caloryValue + " kalorier")
}