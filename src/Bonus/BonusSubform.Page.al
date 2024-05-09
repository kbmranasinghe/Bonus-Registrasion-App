/// <summary>
/// Page MyPage (ID 50114).
/// </summary>
page 50114 "Bonus Subform"
{
    PageType = ListPart;
    Caption = 'Lines';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bonus Line";

    layout
    {
        area(Content)
        {
            repeater(lines)
            {
                field("Type"; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Type of Bonus';
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the  Item No of Bonus';
                }
                field("Bonus Perc"; Rec."Bonus Perc")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Bonus Perc';
                }
            }
        }
    }
}