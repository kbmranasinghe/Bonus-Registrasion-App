/// <summary>
/// Table Bonus Header (ID 50112).
/// </summary>
table 50112 "Bonus Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Bonus Header';
    DrillDownPageId = "Bonus List";
    LookupPageId = "Bonus List";

    fields
    {
        field(1; "No"; Code[20])
        {
            Caption = 'No';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
            TableRelation = Customer;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TestStatus();
            end;        }
        field(3; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                "Ending Date" := "Starting Date";
            end;
        }
        field(4; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "Ending Date" < "Starting Date" then
                "Starting Date" := "Ending Date";
            end;
        }
        field(5; "Status"; Enum "Bonus Header Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        TestStatus();
        DeleteLines();
    end;
    var
        StatusCannotBeReleasedErr: Label 'Status cannot %1',Comment = '%1 status field value';

    local procedure TestStatus()
    begin
        if Status = Status::Released then
            Error(StatusCannotBeReleasedErr,Status);
    end;
    local procedure DeleteLines()
    var
        BonusLine: Record "Bonus Line";
    begin
        BonusLine.SetRange("Customer No",No);
        BonusLine.DeleteAll();
    end;
    trigger OnRename()
    begin

    end;
}