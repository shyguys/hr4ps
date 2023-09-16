#!/usr/bin/env pwsh

function hr4ps {
    <#
    .SYNOPSIS
        Prints horizontal rules.
    
    .EXAMPLE
        hr4ps -Length 30 "PowerShell <3"
    
        # ------ PowerShell <3 ----- #
#>

    [CmdletBinding()]
    param (
        # Total character length.
        [Parameter()]
        [int] $Length = 80,

        # Outer character(s).
        [Parameter()]
        [string] $Outer = "#",

        # Inner character.
        [Parameter()]
        [char] $Inner = "-",

        # As Paragraph.
        [Parameter()]
        [Alias("Paragraph")]
        [switch] $AsParagraph,

        # Title to insert in center.
        [Parameter(Position = 0)]
        [string] $Title
    )

    begin {
        Import-Module "$PSScriptRoot/lib.psm1"
    }

    process {
        if ($AsParagraph) {
            Write-Paragraph $Length $Outer $Inner $Title
        }
        elseif ($Title) {
            Write-Titled $Length $Outer $Inner $Title
        }
        else {
            Write-Untitled $Length $Outer $Inner
        }
    }
}
