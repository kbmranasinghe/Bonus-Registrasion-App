/// <summary>
/// Unknown BonusPermissionSet (ID 50110).
/// </summary>
permissionset 50110 "BonusPermissionSet"
{
    Assignable = true;
    Caption = 'BonusPermissionSet';
    Permissions = 
        tabledata "Bonus Header" = RMID ,
        tabledata "Bonus Line" = RMID ,
        tabledata "Bonus Entry" = RMID ;
}