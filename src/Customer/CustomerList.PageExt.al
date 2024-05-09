/// <summary>
/// PageExtension Customer List (ID 50112) extends Record Customer List.
/// </summary>
pageextension 50112 "Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("No of Bonuses"; Rec."Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of assigned bonuses to the customer.';
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action(Bonuses)
            {
                Caption = 'Bonuses';
                Tooltip = 'Open the list of bonuses assigend to the customer.';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "Bonus List";
                RunPageLink = "Customer No" = field("No.");
            }
        }
    }
}