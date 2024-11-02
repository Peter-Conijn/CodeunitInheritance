codeunit 50114 Car
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        BaseVerhicle: Record Vehicle;
        MaxNoOfPassengers: Integer;

    procedure Car(Verhicle: Record Vehicle)
    begin
        this.BaseVerhicle := Verhicle;
        this.BaseVerhicle.Wheels := 4;
    end;

    procedure Base(): Record Vehicle
    begin
        exit(this.BaseVerhicle);
    end;

    procedure MaximumNoOfPassengers(MaxNoOfPassengers: Integer)
    begin
        this.MaxNoOfPassengers := MaxNoOfPassengers;
    end;

    procedure MaximumNoOfPassengers(): Integer
    begin
        exit(this.MaxNoOfPassengers);
    end;

    procedure MaxPassengerWeight(): Decimal
    begin
        exit(this.MaxNoOfPassengers * 70);
    end;

    procedure VerifyLicensePlate()
    var
        LicensePlateErr: Label 'License Plate is required.';
    begin
        if this.BaseVerhicle."License Plate" = '' then
            Error(LicensePlateErr);
    end;
}
