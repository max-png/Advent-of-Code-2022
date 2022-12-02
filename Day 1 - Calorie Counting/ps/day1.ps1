$lines = Get-Content -Path "C:\utveckling\aoc22\Advent-of-Code-2022\Day 1 - Calorie Counting\input.txt"
$sum = 0
$maxsum = 0

foreach ($line in $lines) {
    $sum += $line
    if ($line -eq "") {  
        $currentsum = $sum
        $sum = 0
        if ($maxsum -lt $currentsum) {
            $maxsum = $currentsum
        }
    }
}
Write-Host $maxsum