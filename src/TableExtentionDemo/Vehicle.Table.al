table 50110 Vehicle
{
    Caption = 'Vehicle';
    DataClassification = CustomerContent;
    LookupPageId = Vehicles;
    DrillDownPageId = Vehicles;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the code of the vehicle.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the description of the vehicle.';
        }
        field(3; Wheels; Integer)
        {
            Caption = 'Wheels';
            ToolTip = 'Specifies the number of wheels of the vehicle.';
        }
        field(4; Make; Code[20])
        {
            Caption = 'Make';
            ToolTip = 'Specifies the make of the vehicle.';
        }
        field(5; Model; Code[50])
        {
            Caption = 'Model';
            ToolTip = 'Specifies the model of the vehicle.';
        }
        field(6; "License Plate"; Code[10])
        {
            Caption = 'License Plate';
            ToolTip = 'Specifies the license plate of the vehicle.';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
