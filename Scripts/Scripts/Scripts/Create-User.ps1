<#
.SYNOPSIS
Creates a Microsoft Entra ID user.

.DESCRIPTION
Creates a standard Microsoft 365 user using Microsoft Graph.

.AUTHOR
Simphiwe Dlamini
#>

param(
    [Parameter(Mandatory)]
    [string]$DisplayName,

    [Parameter(Mandatory)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory)]
    [string]$Department
)

Write-Host "Starting user creation..." -ForegroundColor Green

$passwordProfile = @{
    ForceChangePasswordNextSignIn = $true
    Password = "TempP@ssw0rd123!"
}

$userParams = @{
    AccountEnabled = $true
    DisplayName = $DisplayName
    MailNickname = ($DisplayName -replace " ","")
    UserPrincipalName = $UserPrincipalName
    Department = $Department
    PasswordProfile = $passwordProfile
}

New-MgUser @userParams

Write-Host "User created successfully." -ForegroundColor Green
