function Remove-CWMMarketingGroupContact {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [int]$id
        [Alias('contactId')],
        [int]$parentId
        [Alias('groupId')]
    )

    $Endpoint = "/marketing/groups/$($parentId)/contacts/$($id)"
    Invoke-CWMRemoveMaster -Arguments $PsBoundParameters -Endpoint $Endpoint
}
