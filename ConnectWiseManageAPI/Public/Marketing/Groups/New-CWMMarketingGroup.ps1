function New-CWMMarketingGroup {
    # 2021.2
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification = 'Used by sub-function')]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [string]$name,
        [ValidateLength(1, 50)]
        [boolean]$publicFlag,
        [boolean]$inactiveFlag
    )

    $Endpoint = '/marketing/groups'
    Invoke-CWMRemoveMaster -Arguments $PsBoundParameters -Endpoint $Endpoint
}
