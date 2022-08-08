function New-CWMMarketingGroupContact {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [int]$id,
        [Alias('contactId')]
        [int]$parentId,
        [Alias('groupId')]
        [string]$note
    )

    $Endpoint = "/marketing/groups/$($parentId)/contacts/$(id)"
    Invoke-CWMNewMaster -Arguments $PsBoundParameters -Endpoint $Endpoint
}
