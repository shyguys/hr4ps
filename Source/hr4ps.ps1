#!/usr/bin/env pwsh

<#
    .SYNOPSIS
        Prints horizontal rules.
    
    .EXAMPLE
        hr4ps -Length 30 "PowerShell <3"
    
        # ------ PowerShell <3 ----- #
#>

[CmdletBinding()]
param (
    # Title to insert in center.
    [Parameter(Position = 0)]
    [string] $Title,

    # Show this help message and exit.
    [Parameter()]
    [switch] $Help,

    # Print two horizontal rules, BEGIN and END.
    [Parameter()]
    [Alias("Paragraph")]
    [switch] $AsParagraph,

    # Inner character (default: -).
    [Parameter()]
    [string] $Inner = "-",

    # Total character length (default: 80).
    [Parameter()]
    [int] $Length = 80,

    # Outer character(s) (default: #).
    [Parameter()]
    [string] $Outer = "#"
)

begin {
    Set-Variable PROG -Option Constant -Value "hr4ps"
    Set-Variable USAGE -Option Constant -Value "Usage: $PROG [-h] [-p] [-i STR] [-l INT] [-o STR] [title]"
    Set-Variable HELP_TXT -Option Constant -Value @"
Positional arguments:
    title               Title to insert in center.

Options:
    -h, --help          Show this help message and exit.
    -p, --as-paragraph  Print two horizontal rules, BEGIN and END.

Style proprties:
    -i, --inner STR     Inner character (default: -).
    -l, --length INT    Total character length (default: 80).
    -o, --outer STR     Outer character(s) (default: #).
"@
    if ($Help) {
        Write-Host $HELP_TEXT
        exit
    }
    $Inner = $Inner.Trim().Substring(0, 1)
    $Outer = $Outer.Trim()
    . "$PSScriptRoot/lib.ps1"
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
