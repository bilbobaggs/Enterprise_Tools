function Switch-Proxy () {
    <#
    .SYNOPSIS
        Switch-Proxy toggles proxy settings on and off.

    .DESCRIPTION
        Switch-Proxy will automatically detect if the state of the proxy and toggle it to the oppsite.

    .INPUTS
        None

    .OUTPUTS
        None

    .NOTES
        Use the Common Parameters at your own risk, I'm not sure if they will work.
    #>

    $proxyScript = 'https://pac.menlosecurity.com/af-5cf035477276/wpad.dat'
    $currentValue = Get-ItemProperty -Path HKCU:"Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name AutoConfigURL -ErrorAction SilentlyContinue

    if ([string]::IsNullOrEmpty($currentValue)) {
        Set-ItemProperty -Path HKCU:"Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name AutoConfigURL -Value $proxyScript
    } else {
        Remove-ItemProperty -Path HKCU:"Software\Microsoft\Windows\CurrentVersion\Internet Settings" -Name AutoConfigURL
    }
}