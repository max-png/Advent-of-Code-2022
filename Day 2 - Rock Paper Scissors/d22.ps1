$scores = @{
    "A" = @{"X" = 4; "Y" = 8; "Z" = 3 }
    "B" = @{"X" = 1; "Y" = 5; "Z" = 9 }
    "C" = @{"X" = 7; "Y" = 2; "Z" = 6 }
}

<# 
Rock A/X = 1 point
Paper B/Y = 2 points
Scissors C/Z = 3 points
Loss = 0, Draw = 3, Win = 6 #>
#>

$score = 0

Get-Content "Day 2 - Rock Paper Scissors\input.txt" | ForEach-Object {
    $elf = [string]$_[0]
    $me = [string]$_[2]
    $score += $scores[$elf][$me]
}

Write-Host $score