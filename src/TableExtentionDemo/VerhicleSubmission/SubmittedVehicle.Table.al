table 50111 "Submitted Vehicle"
{
    Caption = 'Submitted Vehicles';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            ToolTip = 'Specifies the entry number of the submitted vehicle.';
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the code of the vehicle.';
        }
        field(3; Description; Text[199])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the description of the vehicle.';
        }
        field(4; "Type"; Text[50])
        {
            Caption = 'Type';
            ToolTip = 'Specifies the type of the vehicle.';
        }
        field(5; "License Plate"; Code[10])
        {
            Caption = 'License Plate';
            ToolTip = 'Specifies the license plate of the vehicle.';
        }
        field(6; "Submission Data"; Blob)
        {
            Caption = 'Submission Data';
            ToolTip = 'Specifies the submission data of the vehicle.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
