page 50113 "Vehicle Submission"
{
    ApplicationArea = All;
    Caption = 'Vehicle Submission';
    PageType = Document;
    SourceTable = Vehicle;
    UsageCategory = Documents;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Make; Rec.Make)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field(Type; this.Type)
                {
                    Caption = 'Submit as Type';
                    ToolTip = 'Specifies the type of the vehicle you want to submit.';
                    ShowMandatory = true;
                }
                field("License Plate"; Rec."License Plate")
                {
                    ShowMandatory = true;
                }
            }
            group(Details)
            {
                Caption = 'Details';

                group(CarDetails)
                {
                    ShowCaption = false;
                    Visible = Type = Type::Car;

                    field(MaxPassengerCount; this.MaxPassengerCount)
                    {
                        Caption = 'Max Passenger Count';
                        ToolTip = 'Specifies the maximum number of passengers the car can carry.';
                    }
                }
                group(TruckDetails)
                {
                    ShowCaption = false;
                    Visible = Type = Type::Truck;

                    field(AxleCount; this.AxleCount)
                    {
                        Caption = 'No. of Axles';
                        ToolTip = 'Specifies the number of axles the truck has.';
                        DecimalPlaces = 0 : 2;
                        MinValue = 3;
                        ShowMandatory = Type = Type::Truck;
                    }
                    field(MaxLoadWeight; this.MaxLoadWeight)
                    {
                        Caption = 'Max Load Weight (kg)';
                        ToolTip = 'Specifies the maximum load weight the truck can carry. This has a maximum value of 10000 kg per axle';
                        DecimalPlaces = 0 : 2;
                        ShowMandatory = Type = Type::Truck;
                    }
                }
            }
            part(SubmittedVehicles; "Submitted Vehicles")
            {
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Submit)
            {
                ApplicationArea = All;
                Caption = 'Submit';
                Image = Register;

                trigger OnAction()
                begin
                    case Type of
                        Type::Car:
                            SubmitVehicleAsCar();
                        Type::Truck:
                            SubmitVehicleAsTruck();
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(Submit_Promoted; Submit)
                {
                }
            }
        }
    }

    var
        SubmitRegistration: Codeunit "Submit Registration";
        Type: Option " ",Car,Truck;
        MaxPassengerCount: Integer;
        MaxLoadWeight: Decimal;
        AxleCount: Decimal;

    trigger OnOpenPage()
    begin
        AxleCount := 3;
    end;

    local procedure SubmitVehicleAsCar()
    var
        Car: Codeunit Car;
    begin
        Car.Car(Rec);
        Car.MaximumNoOfPassengers(MaxPassengerCount);

        SubmitRegistration.Submit(Car);
    end;

    local procedure SubmitVehicleAsTruck()
    var
        Truck: Codeunit Truck;
    begin
        Truck.Truck(Rec);
        Truck.NoOfAxles(AxleCount);
        Truck.MaximumCargoWeight(MaxLoadWeight);

        SubmitRegistration.Submit(Truck);
    end;
}
