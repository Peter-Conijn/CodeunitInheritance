codeunit 50117 "Vehicle Installation"
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    Subtype = Install;

    Permissions =
        tabledata "Vehicle" = RIMD,
        tabledata "Submitted Vehicle" = RIMD;

    trigger OnInstallAppPerCompany()
    var
        Vehicle: Record "Vehicle";
        SubmittedVehicle: Record "Submitted Vehicle";
    begin
        Vehicle.DeleteAll();
        SubmittedVehicle.DeleteAll();

        InsertVehicle('TOY1', 'Toyota', 'Toyota', 'Corolla');
        InsertVehicle('TOY2', 'Toyota', 'Toyota', 'Camry');
        InsertVehicle('HON1', 'Honda', 'Honda', 'Civic');
        InsertVehicle('HON2', 'Honda', 'Honda', 'Accord');
        InsertVehicle('FOR1', 'Ford', 'Ford', 'Fusion');
        InsertVehicle('FOR2', 'Ford', 'Ford', 'Focus');
        InsertVehicle('CHE1', 'Chevrolet', 'Chevrolet', 'Malibu');
        InsertVehicle('CHE2', 'Chevrolet', 'Chevrolet', 'Impala');
    end;

    local procedure InsertVehicle(VehicleCode: Code[20]; VehicleDescription: Text[100]; VehicleMake: Code[20]; VehicleModel: Code[20])
    var
        Vehicle: Record "Vehicle";
    begin
        Vehicle.Init();
        Vehicle.Code := VehicleCode;
        Vehicle.Description := VehicleDescription;
        Vehicle.Make := VehicleMake;
        Vehicle.Model := VehicleModel;
        Vehicle.Insert(true);
    end;
}
