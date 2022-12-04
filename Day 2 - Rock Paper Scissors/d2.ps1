<# Parse the strategy guide to determine what your opponent will play in each round and what you should play in response.

For each round, calculate the score for the shape you selected based on the following: Rock = 1, Paper = 2, Scissors = 3.

Determine the outcome of the round and add the corresponding score to your total score: Loss = 0, Draw = 3, Win = 6.

Repeat this process for each round until you have gone through the entire strategy guide.

Add up all the scores for each round to get your total score. #>


<# Parse the strategy guide to determine that in the first round your opponent will play Rock (A) and you should play Paper (Y), 
in the second round your opponent will play Paper (B) and you should play Rock (X), and in the third round your opponent will play Scissors (C) and you should play Scissors (Z).

For the first round, your score would be 2 because you selected Paper (Y) and won the round.
For the second round, your score would be 1 because you selected Rock (X) and lost the round.
For the third round, your score would be 3 because you selected Scissors (Z) and the round was a draw.

Add the corresponding scores for the outcome of each round to your total score: 0 for the loss in the second round,
6 for the win in the first round, and 3 for the draw in the third round. This gives you a total score of 9 (0 + 6 + 3).

Repeat this process for each round until you have gone through the entire strategy guide.

Add up all the scores for each round to get your total score, which in this example would be 15 (8 + 1 + 6). #>

# Check if the input file exists
if (!(Test-Path "Day 2 - Rock Paper Scissors\input.txt")) {
    Write-Error "Input file not found!"
    return
}

# Rock A/X = 1 point
# Paper B/Y = 2 points
# Scissors C/Z = 3 points

$score = 0

# Read the input file and process each line
Get-Content "Day 2 - Rock Paper Scissors\input.txt" | ForEach-Object {
    $elf = $_[0]
    $me = $_[2]
    
    switch ($me) {
        # Rock
        "X" {
            $score += 1
            switch ($elf) {
                "A" {
                    $score += 3
                }
                "B" {
                }
                "C" {
                    $score += 6
                }
            }
        }
        # Paper
        "Y" {
            $score += 2
            switch ($elf) {
                "A" {
                    $score += 6
                }
                "B" {
                    $score += 3
                }
                "C" {
                }
            }
        }
        # Scissors
        "Z" {
            $score += 3
            switch ($elf) {
                "A" {
                }
                "B" {
                    $score += 6
                }
                "C" {
                    $score += 3
                }
            }
        }
        Default {}
    }
    
}

Write-Host "Total score:" $score
