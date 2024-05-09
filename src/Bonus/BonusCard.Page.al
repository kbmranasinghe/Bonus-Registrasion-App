/// <summary>
/// Page Bonus Card (ID 50113).
/// </summary>
page 50113 "Bonus Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    Caption = 'Bonus Card';
    SourceTable = "Bonus Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No"; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Bonus Number';
                }
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Bonus Customer Number';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Bonus Starting Date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Bonus Ending Date';
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Bonus Status';
                }
            }
            part(Lines; "Bonus Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Item No" = field("No");
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
                ToolTip = 'Open customer card for the Bonus.';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No");
            }
            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                RunObject = page "Bonus Entries";
                RunPageLink = "Bonus No" = field(No);
                ToolTip = 'Open bonus entries';
            }
        }
    }
}
