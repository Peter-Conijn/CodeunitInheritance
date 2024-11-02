codeunit 50115 Truck
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        BaseVerhicle: Record Vehicle;
        AxleCount: Integer;
        MaxCargoWeight: Decimal;

    procedure Truck(Verhicle: Record Vehicle)
    begin
        this.BaseVerhicle := Verhicle;
    end;

    procedure Base(): Record Vehicle
    begin
        exit(this.BaseVerhicle);
    end;

    procedure NoOfAxles(AxleCount: Integer)
    begin
        this.AxleCount := AxleCount;
        this.BaseVerhicle.Wheels := AxleCount * 2;
    end;

    procedure NoOfAxles(): Integer
    begin
        exit(this.AxleCount);
    end;

    procedure MaximumCargoWeight(MaxCargoWeight: Decimal)
    begin
        this.MaxCargoWeight := MaxCargoWeight;
    end;

    procedure MaximumCargoWeight(): Decimal
    begin
        exit(this.MaxCargoWeight);
    end;
}
