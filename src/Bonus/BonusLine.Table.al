/// <summary>
/// Table Bonus Line (ID 50113).
/// </summary>
table 50113 "Bonus Line"
{
    DataClassification = CustomerContent;
    Caption = 'BonusLine';

    fields
    {
        field(1; "Customer No"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No';
            TableRelation = "Bonus Header";
        }
        field(2; "Type"; Enum "Bonus Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(3; "Item No"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No';
            TableRelation = if (Type = filter(Item)) Item;
        }
        field(4; "Bonus Perc"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Perc';
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(PK; "Customer No", Type, "Item No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        TestStatus();
    end;

    trigger OnModify()
    begin
        TestStatus();
    end;

    trigger OnDelete()
    begin
        TestStatus();
    end;

    trigger OnRename()
    begin
        TestStatus();
    end;

    var
        StatusCannotBeReleasedErr: Label 'Status cannot %1', Comment = '%1 status field value';

    local procedure TestStatus()
    var
        BonusHeader: Record "Bonus Header";
    begin
        if BonusHeader.Get(Rec."Customer No") then
            if BonusHeader.Status = BonusHeader.Status::Released then
                Error(StatusCannotBeReleasedErr, BonusHeader.Status);
    end;
}