<# 
Rock A/X = 1
Paper B/Y = 2 
Scissors C/Z = 3
Loss = 0, Draw = 3, Win = 6 #>
#>

# Har bara räknat ut poängen själv
$scores = @{
    "A" = @{"X" = 4; "Y" = 8; "Z" = 3 }
    "B" = @{"X" = 1; "Y" = 5; "Z" = 9 }
    "C" = @{"X" = 7; "Y" = 2; "Z" = 6 }
}
$score = 0
Get-Content "Day 2 - Rock Paper Scissors\input.txt" | ForEach-Object {
    $score += $scores[[string]$_[0]][[string]$_[2]]
}
Write-Host $score

#### Del 2

<#
    X = förlust 0
    Y = oavgjort 3
    Z = vinst 6
#>

$scores2 = @{
    "A" = @{"X" = 3; "Y" = 4; "Z" = 8 }
    "B" = @{"X" = 1; "Y" = 5; "Z" = 9 }
    "C" = @{"X" = 2; "Y" = 6; "Z" = 7 }
}

$score2 = 0
Get-Content "Day 2 - Rock Paper Scissors\input.txt" | ForEach-Object {
    $score2 += $scores2[[string]$_[0]][[string]$_[2]]
}
Write-Host $score2