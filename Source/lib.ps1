function Write-Paragraph {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int] $Length,
    
        [Parameter(Mandatory = $true)]
        [string] $Outer,
    
        [Parameter(Mandatory = $true)]
        [string] $Inner,
    
        [Parameter()]
        [string] $Title
    )

    if ($Title) {
        $Begin = "BEGIN $Title"
        $End = "END $Title"
    }
    else {
        $Begin = "BEGIN"
        $End = "END"
    }

    Write-Titled $Length $Outer $Inner $Begin
    Write-Titled $Length $Outer $Inner $End
}

function Write-Titled {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int] $Length,
    
        [Parameter(Mandatory = $true)]
        [string] $Outer,
    
        [Parameter(Mandatory = $true)]
        [string] $Inner,
    
        [Parameter(Mandatory = $true)]
        [string] $Title
    )

    $SpareLength = $Length - $Outer.Length * 2 - $Title.Length - 4
    if ($SpareLength -lt 2) {
        throw "length insufficient, $(2 - $SpareLength) more required"
    }
    $RightSpareLength = [Math]::Floor($SpareLength / 2)
    $LeftSpareLength = $SpareLength - $RightSpareLength
    Write-Host "$Outer $($Inner * $LeftSpareLength) $Title $($Inner * $RightSpareLength) $Outer"
}

function Write-Untitled {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int] $Length,
    
        [Parameter(Mandatory = $true)]
        [string] $Outer,
    
        [Parameter(Mandatory = $true)]
        [string] $Inner
    )

    $SpareLength = $Length - $Outer.Length * 2 - 2
    if ($SpareLength -lt 1) {
        throw "length insufficient, $(1 - $SpareLength) more required"
    }
    Write-Host "$Outer $($Inner * $SpareLength) $Outer"
}
