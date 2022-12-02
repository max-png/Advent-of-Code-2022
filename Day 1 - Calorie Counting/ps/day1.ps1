$lines = Get-Content -Path "C:\node\aoc22\Day 1 - Calorie Counting\input.txt" -Head 20

foreach ($line in $lines)
{
    if($line -eq "")
    {
        Write-Host "tomt"
    }
    Write-Host $line
}