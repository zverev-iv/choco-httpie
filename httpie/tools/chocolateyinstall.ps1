$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$nuspecPath =  "$(Join-Path (Split-Path -parent $toolsDir) ($env:ChocolateyPackageName + ".nuspec"))"
[XML]$nuspec = Get-Content $nuspecPath
$pipVersion = $nuspec.package.metadata.version
pip install "$($env:ChocolateyPackageName)==$($pipVersion)"
