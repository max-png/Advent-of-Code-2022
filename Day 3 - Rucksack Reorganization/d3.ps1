$TotalItemPrio = 0
Get-Content "Day 3 - Rucksack Reorganization\input.txt" | ForEach-Object {
    $itemprio = 0
    $CharArray = $_.ToCharArray()
    $Length = $_.Length
    $Half = ($_.Length / 2)

    # Unique känns jävligt fult. Problemet innan var att om det fanns flera matcher, ex. s förekom 3 gånger så la den på det. Skit i det nu.
    $com1 = $CharArray[0..($Half - 1)] | Select-Object -Unique
    $com2 = $CharArray[$Half..$Length] | Select-Object -Unique
   
    $com1 | ForEach-Object {
        if ($com2 -CContains $_) {
            $itemprio = GetItemPrio $_
            $TotalItemPrio += $itemprio
        }
    }
    Write-Host $TotalItemPrio
}

function GetItemPrio {
    param(
        [char]$character
    )
    if ($character -ge "a" -and $character -le "z") {
        return ([int]($character - ("a" -as [char])) + 1)
    }
    elseif ($character -ge "A" -and $character -le "Z") {
        return ([int]($character - ("A" -as [char])) + 27)
    }
    else {
        throw "Invalid character"
    }
}

