Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module .\posh-git

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-git


# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-VcsStatus -nonewline

    Write-Host($pwd.ProviderPath) -nonewline

    $global:LASTEXITCODE = $realLASTEXITCODE

    Write-Host
    return "$ "
}

Pop-Location

Start-SshAgent -Quiet
