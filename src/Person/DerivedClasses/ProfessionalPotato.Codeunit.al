codeunit 50114 "Professional Potato"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        BasePerson: Codeunit "Person";
        BaseCouchPotato: Codeunit "Couch Potato";
        PotatoCircumference: Decimal;

    /// <summary>
    /// Constructor for the Professional Potato class.
    /// </summary>
    /// <param name="Person">The base "Person" class.</param>
    procedure ProfessionalPotato(BasePersonInstance: Codeunit "Person")
    begin
        this.BasePerson := BasePersonInstance;
        this.BaseCouchPotato.CouchPotato(this.BasePerson);
    end;

    /// <summary>
    /// Constructor for the Professional Potato class.
    /// </summary>
    /// <param name="CouchPotatoClass">The base "Couch Potato" class.</param>
    procedure ProfessionalPotato(BaseCouchPotatoInstance: Codeunit "Couch Potato")
    begin
        this.BasePerson := BaseCouchPotatoInstance.Base();
        this.BaseCouchPotato := BaseCouchPotatoInstance;
    end;

    /// <summary>
    /// Reference to the base class.
    /// </summary>
    /// <returns>The base "CouchPotato" class.</returns>
    procedure CouchPotato(): Codeunit "Couch Potato"
    begin
        exit(this.BaseCouchPotato);
    end;

    /// <summary>
    /// Reference to the base class.
    /// </summary>
    /// <returns>The base "Person" class.</returns>
    procedure Person(): Codeunit "Person"
    begin
        exit(this.BasePerson);
    end;

    /// <summary>
    /// Set the circumference of the professional potato.
    /// </summary>
    /// <param name="Value">The circumference of the professional potato.</param>
    procedure Circumference(Value: Decimal)
    begin
        this.PotatoCircumference := Value;
    end;

    /// <summary>
    /// Get the circumference of the professional potato.
    /// </summary>
    /// <returns>The circumference of the professional potato.</returns>
    procedure Circumference(): Decimal
    begin
        exit(this.PotatoCircumference);
    end;
}
