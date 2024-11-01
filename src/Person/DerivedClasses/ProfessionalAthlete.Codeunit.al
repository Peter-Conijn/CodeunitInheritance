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

    /// <summary>
    /// Constructor for the Professional Athlete class.
    /// </summary>
    /// <param name="Person">The base "Person" class.</param>
    procedure ProfessionalAthlete(Person: Codeunit Person)
    begin
        this.BasePerson := Person;
        this.Athlete.Athlete(this.BasePerson);
    end;

    /// <summary>
    /// Reference to the base class.
    /// </summary>
    /// <returns>The base "Person" class.</returns>
    procedure ProfessionalAthlete(AthleseClass: Codeunit Athlete)
    begin
        this.BasePerson := AthleseClass.Base();
        this.Athlete := AthleseClass;
    end;

    /// <summary>
    /// Reference to the base class.
    /// </summary>
    /// <returns>The base "Person" class.</returns>
    procedure Base(): Codeunit Athlete
    begin
        exit(this.Athlete);
    end;

    /// <summary>
    /// Sets the team of the professional athlete.
    /// </summary>
    /// <param name="Value">The team of the professional athlete.</param>
    procedure Team(Value: Text)
    begin
        this.PersonTeam := Value;
    end;

    /// <summary>
    /// Gets the team of the professional athlete.
    /// </summary>
    /// <returns>The team of the professional athlete.</returns>
    procedure Team(): Text
    begin
        exit(this.PersonTeam);
    end;

    /// <summary>
    /// Sets the salary of the professional athlete.
    /// </summary>    
    procedure Salary(Value: Decimal)
    begin
        this.PersonSalary := Value;
    end;

    /// <summary>
    /// Gets the salary of the professional athlete.
    /// </summary>
    /// <returns>The salary of the professional athlete.</returns>
    procedure Salary(): Decimal
    begin
        exit(this.PersonSalary);
    end;
}
