codeunit 50116 "Submit Registration"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure Submit(Car: Codeunit Car)
    var
        JObject: JsonObject;
    begin
        JObject.Add('type', 'Car');

        Car.VerifyLicensePlate();
        Car.Base().Wheels := 4;

        SetVehicleData(Car.Base(), JObject);

        JObject.Add('maxNoOfPassengers', Car.MaximumNoOfPassengers());
        JObject.Add('maxPassengerWeight', Car.MaxPassengerWeight());

        StoreSubmission(Car.Base(), JObject);
    end;

    procedure Submit(Truck: Codeunit Truck)
    var
        LicensePlateErr: Label 'Truck license plates must start with B.';
        MaxWeightErr: Label 'The maximum cargo weight per axle is 10,000 kg.';
        JObject: JsonObject;
    begin
        JObject.Add('type', 'Truck');

        if not Format(Truck.Base()."License Plate").StartsWith('B') then
            Error(LicensePlateErr);

        if Truck.MaximumCargoWeight() / Truck.NoOfAxles() > 10000 then
            Error(MaxWeightErr);

        Truck.Base().Wheels := Truck.NoOfAxles() * 2;
        SetVehicleData(Truck.Base(), JObject);

        JObject.Add('axleCount', Truck.NoOfAxles());
        JObject.Add('maxCargoWeight', Truck.MaximumCargoWeight());

        StoreSubmission(Truck.Base(), JObject);
    end;

    local procedure SetVehicleData(Vehicle: Record Vehicle; var JObject: JsonObject)
    begin
        JObject.Add('code', Vehicle.Code);
        JObject.Add('description', Vehicle.Description);
        JObject.Add('wheels', Vehicle.Wheels);
        JObject.Add('make', Vehicle.Make);
        JObject.Add('model', Vehicle.Model);
        JObject.Add('licensePlate', Vehicle."License Plate");
    end;

    [InherentPermissions(PermissionObjectType::TableData, Database::"Submitted Vehicle", 'RI')]
    local procedure StoreSubmission(Vehicle: Record Vehicle; VerhicleDataJObject: JsonObject)
    var
        SubmittedVehicle: Record "Submitted Vehicle";
        OutStream: OutStream;
    begin
        SubmittedVehicle.Init();
        SubmittedVehicle."Code" := Vehicle.Code;
        SubmittedVehicle."Description" := Vehicle.Description;
        SubmittedVehicle.Type := GetType(VerhicleDataJObject);
        SubmittedVehicle."License Plate" := Vehicle."License Plate";

        SubmittedVehicle."Submission Data".CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.Write(Format(VerhicleDataJObject));

        SubmittedVehicle.Insert(true);
    end;

    local procedure GetType(VehicleDataJObject: JsonObject): Text[50]
    var
        JToken: JsonToken;
    begin
        VehicleDataJObject.Get('type', JToken);
        exit(JToken.AsValue().AsText());
    end;
}
