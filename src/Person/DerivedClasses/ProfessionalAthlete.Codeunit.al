codeunit 50113 "Professional Athlete"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        BasePerson: Codeunit Person;
        Athlete: Codeunit Athlete;
        PersonTeam: Text;
        PersonSalary: Decimal;

    procedure ProfessionalAthlete(Person: Codeunit Person)
    begin
        this.BasePerson := Person;
        this.Athlete.Athlete(this.BasePerson);
    end;

    procedure ProfessionalAthlete(AthleseClass: Codeunit Athlete)
    begin
        this.BasePerson := AthleseClass.Base();
        this.Athlete := AthleseClass;
    end;

    procedure Base(): Codeunit Athlete
    begin
        exit(this.Athlete);
    end;

    procedure Team(Value: Text)
    begin
        this.PersonTeam := Value;
    end;

    procedure Team(): Text
    begin
        exit(this.PersonTeam);
    end;

    procedure Salary(Value: Decimal)
    begin
        this.PersonSalary := Value;
    end;

    procedure Salary(): Decimal
    begin
        exit(this.PersonSalary);
    end;
}
