function Update-CWMMarketingGroupContact {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [int]$id,
        [Alias('contactId')]
        [int]$parentId,
        [Alias('groupId')]
    )

    $Endpoint = "/marketing/groups/$($parentId)/contacts/$($id)"
    Invoke-CWMUpdateMaster -Arguments $PsBoundParameters -Endpoint $Endpoint
}
