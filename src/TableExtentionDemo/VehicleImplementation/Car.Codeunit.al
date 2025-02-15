codeunit 50119 Car
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        BaseVerhicle: Record Vehicle;
        MaxNoOfPassengers: Integer;

    /// <summary>
    /// Initializes a new instance of the Car class.
    /// </summary>
    /// <param name="Verhicle">The vehicle base object.</param>
    procedure Car(Verhicle: Record Vehicle)
    begin
        this.BaseVerhicle := Verhicle;
    end;

    /// <summary>
    /// Gets the base vehicle.
    /// </summary>
    /// <returns>The base vehicle.</returns>
    procedure Base(): Record Vehicle
    begin
        exit(this.BaseVerhicle);
    end;

    /// <summary>
    /// Sets the maximum number of passengers.
    /// </summary>
    /// <param name="MaxNoOfPassengers">The maximum number of passengers.</param>
    procedure MaximumNoOfPassengers(MaxNoOfPassengers: Integer)
    begin
        this.MaxNoOfPassengers := MaxNoOfPassengers;
    end;

    /// <summary>
    /// Gets the maximum number of passengers.
    /// </summary>
    /// <returns>The maximum number of passengers.</returns>
    procedure MaximumNoOfPassengers(): Integer
    begin
        exit(this.MaxNoOfPassengers);
    end;

    /// <summary>
    /// Gets the maximum passenger weight.
    /// </summary>
    /// <returns>The maximum passenger weight.</returns>
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
