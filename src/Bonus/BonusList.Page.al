/// <summary>
/// Page Bonus List (ID 50112).
/// </summary>
page 50112 "Bonus List"
{
    PageType = List;
    Caption = 'Bonus List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Bonus Header";
    Editable = false;
    CardPageId = "Bonus Card";

    layout
    {
        area(Content)
        {
            repeater(controll)
            {
                field("No"; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus number';
                }
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Customer number';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Starting Date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Ending Date';
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Status';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                ToolTip = 'Open customer card for the bonus';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No");
            }
        }
    }
}