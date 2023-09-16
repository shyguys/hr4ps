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

    $SpareLen = $Length - $Outer.Length * 2 - $Title.Length - 4
    if ($SpareLen -lt 2) {
        throw "Length insufficient, $(2 - $SpareLen) more required."
    }
    $RSpareLen = [Math]::Floor($SpareLen / 2)
    $LSpareLen = $SpareLen - $RSpareLen
    Write-Host "$Outer $($Inner * $LSpareLen) $Title $($Inner * $RSpareLen) $Outer"
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

    $SpareLen = $Length - $Outer.Length * 2 - 2
    if ($SpareLen -lt 1) {
        throw "Length insufficient, $(1 - $SpareLen) more required."
    }
    Write-Host "$Outer $($Inner * $SpareLen) $Outer"
}
