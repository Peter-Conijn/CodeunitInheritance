codeunit 50111 "Couch Potato"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        BasePerson: Codeunit "Person";
        PersonAvgSitTime: Decimal;
        PersonWeight: Decimal;
        PersonFavoriteProgram: Text;

    /// <summary>
    /// Constructor for the Couch Potato class.
    /// </summary>
    /// <param name="Person">The base "Person" class.</param>
    procedure CouchPotato(Person: Codeunit "Person")
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
    /// Set the average sit time of the couch potato.
    /// </summary>
    /// <param name="Value">The average sit time of the couch potato.</param>
    procedure AverageSitTime(Value: Decimal)
    begin
        this.PersonAvgSitTime := Value;
    end;

    /// <summary>
    /// Get the average sit time of the couch potato.
    /// </summary>
    /// <returns>The average sit time of the couch potato.</returns>
    procedure AverageSitTime(): Decimal
    begin
        exit(this.PersonAvgSitTime);
    end;

    /// <summary>
    /// Set the weight of the couch potato.
    /// </summary>
    /// <param name="Value">The weight of the couch potato.</param>
    procedure Weight(Value: Decimal)
    begin
        this.PersonWeight := Value;
    end;

    /// <summary>
    /// Get the weight of the couch potato.
    /// </summary>
    /// <returns>The weight of the couch potato.</returns>
    procedure Weight(): Decimal
    begin
        exit(this.PersonWeight);
    end;

    /// <summary>
    /// Set the favorite program of the couch potato.
    /// </summary>
    /// <param name="Value">The favorite program of the couch potato.</param>
    procedure FavoriteProgram(Value: Text)
    begin
        this.PersonFavoriteProgram := Value;
    end;

    /// <summary>
    /// Get the favorite program of the couch potato.
    /// </summary>
    /// <returns>The favorite program of the couch potato.</returns>
    procedure FavoriteProgram(): Text
    begin
        exit(this.PersonFavoriteProgram);
    end;
}
