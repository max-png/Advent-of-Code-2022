Get-Content "Day 3 - Rucksack Reorganization\sample.txt" | ForEach-Object {
    # $SplitContent = $_.Split()
    $CharArray = $_.ToCharArray()
    
    $Length = $_.Length
    $Half = ($_.Length / 2)
    $charAtHalf = ($_[$Half])

    $com1 = $CharArray[0..($Half - 1)]
    $com2 = $CharArray[$Half..$Length]

    $com1 | ForEach-Object {
        if ($com2 -CContains $_) {
            Write-Host "`$com2 contains the item [$_]"
        }
        
    }
}

<#
J p p M D c J P
c Q b q G q F b
Z S t g n H t s S j
G B h q F b B m s m
d j z z w g H H g g d n f w j t
M P D P M G p P l N f p L D l l
d R C t w t l C S t t P t l N P N t g v P
r D q m B s j G S p j B B s J s q q m r p
Z h W n Z h z M M f n W W T
D z B r m s m j s B c c J B
#>