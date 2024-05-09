/// <summary>
/// TableExtension Customer (ID 50112) extends Record Customer.
/// </summary>
tableextension 50112 "Customer" extends Customer
{
    fields
    {
        field(50112; "Bonuses" ; Integer)
        {
            Caption = 'Bonuses';
            FieldClass = FlowField ;
            CalcFormula = count("Bonus Header" where ("Customer No"=field("No.")));
            Editable = false;
        }
    }
    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;
    
    var
        AtLeastOneBonusForCustomerExistsErr: Label 'At least one bonus for customer %1 exists.', Comment = '%1 - customer name';
        
    local procedure TestIfBonusExists()
    var
        BonusHeader: Record "Bonus Header";
    begin
        BonusHeader.SetRange("Customer No",Rec."No.");
        if not BonusHeader.IsEmpty then
            Error(AtLeastOneBonusForCustomerExistsErr,Rec.Name);
    end;
}