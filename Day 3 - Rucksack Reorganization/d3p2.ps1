## Part 2 ##
# Hitta autenticitetsmärket i varje grupp, grupperna består av tre ryggsäckar där märket är det enda objektet som alla tre innehar.

<#
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg

And the second group's rucksacks are the next three lines:
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw

In the first group, the only item type that appears in all three rucksacks is lowercase r; this must be their badges. In the second group, their badge item type must be Z.
#>

function FindAuthBadge {
    param(
        [string]$backpack1,
        [string]$backpack2,
        [string]$backpack3
    )

    $backpack1.ToCharArray() | Select-Object -Unique | ForEach-Object {
        if ($backpack2.ToCharArray() -CContains $_) {
            if ($backpack3.ToCharArray() -CContains $_) {
                return $_
            }
        }
    }
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

<#
$1 = "vJrwpWtwJgWrhcsFMMfFFhFp"
$2 = "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
$3 = "PmmdzqPrVvPwwTWBwg"
$AuthBadge = (FindAuthBadge $1 $2 $3)
$AuthPrio = GetItemPrio($AuthBadge)
Write-Host $AuthBadge ":" $AuthPrio
#>



# TODO: Fixa en funktion som händer 3 rader i taget. 
$lineInput = Get-Content "C:\node\aoc22\Day 3 - Rucksack Reorganization\input.txt"

$TotalAuthPrio = 0

for (($i = 0); $i -lt $lineInput.Length; $i+=3){
    $1 = $lineInput[$i]
    $2 = $lineInput[$i+1]
    $3 = $lineInput[$i+2]
    $AuthBadge = (FindAuthBadge $1 $2 $3)
    $AuthPrio = GetItemPrio($AuthBadge)
    $TotalAuthPrio += $AuthPrio
}

"`$TotalAuthPrio: $TotalAuthPrio"