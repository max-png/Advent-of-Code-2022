Get-Content "Day 3 - Rucksack Reorganization\sample.txt" | ForEach-Object {
    $TotalItemPrio = 0
    $CharArray = $_.ToCharArray()
    $Length = $_.Length
    $Half = ($_.Length / 2)
    $com1 = $CharArray[0..($Half - 1)]
    $com2 = $CharArray[$Half..$Length]

    
    $com1 | ForEach-Object {
        if ($com2 -CContains $_) {
            # TODO: Fixa en regex som jämför hela $com1 och $com2 istället för en char i taget
            Write-Host "`$com2 matches the item [$_]"
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