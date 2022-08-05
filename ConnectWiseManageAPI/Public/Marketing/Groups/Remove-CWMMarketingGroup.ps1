function Remove-CWMMarketingGroup {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification = 'Used by sub-function')]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    [Alias('Remove-CWMGroup')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('GroupId')]
        [int]$id
    )

    $Endpoint = "/marketing/groups/$($id)"
    Invoke-CWMRemoveMaster -Endpoint $Endpoint
}
