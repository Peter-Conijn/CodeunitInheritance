codeunit 50112 Athlete
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        BasePerson: Codeunit "Person";
        PersonAvgRunTime: Decimal;
        PersonWeight: Decimal;
        PersonSport: Text[100];

    /// <summary>
    /// Constructor for the Athlete class.
    /// </summary>
    /// <param name="Person">The base "Person" class.</param>
    procedure Athlete(Person: Codeunit "Person")
    begin
        this.BasePerson := Person;
    end;

    /// <summary>
    /// Reference to the base class.
    /// </summary>
    /// <returns>The base "Person" class.</returns>
    procedure Base(): Codeunit Person
    begin
        exit(this.BasePerson);
    end;

    /// <summary>
    /// Set the average run time of the athlete.
    /// </summary>
    /// <param name="Value">The average run time of the athlete.</param>
    procedure AverageRunTime(Value: Decimal)
    begin
        this.PersonAvgRunTime := Value;
    end;

    /// <summary>
    /// Get the average run time of the athlete.
    /// </summary>
    /// <returns>The average run time of the athlete.</returns>
    procedure AverageRunTime(): Decimal
    begin
        exit(this.PersonAvgRunTime);
    end;

    /// <summary>
    /// Set the weight of the athlete.
    /// </summary>
    /// <param name="Value">The weight of the athlete.</param>
    procedure Weight(Value: Decimal)
    begin
        this.PersonWeight := Value;
    end;

    /// <summary>
    /// Get the weight of the athlete.
    /// </summary>
    /// <returns>The weight of the athlete.</returns>
    procedure Weight(): Decimal
    begin
        exit(this.PersonWeight);
    end;

    /// <summary>
    /// Set the sport of the athlete.
    /// </summary>
    /// <param name="Value">The sport of the athlete.</param>
    procedure Sport(Value: Text[100])
    begin
        this.PersonSport := Value;
    end;

    /// <summary>
    /// Get the sport of the athlete.
    /// </summary>
    /// <returns>The sport of the athlete.</returns>
    procedure Sport(): Text[100]
    begin
        exit(this.PersonSport);
    end;
}
