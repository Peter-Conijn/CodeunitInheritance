codeunit 50110 Person
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        PersonName: Text[100];
        PersonAge: Integer;

    /// <summary>
    /// Set the name of the person.
    /// </summary>
    /// <param name="NewName">The new name of the person.</param>
    procedure Name(NewName: Text[100])
    begin
        this.PersonName := NewName;
    end;

    /// <summary>
    /// Get the name of the person.
    /// </summary>
    /// <returns>The name of the person.</returns>    
    procedure Name(): Text[100]
    begin
        exit(this.PersonName);
    end;

    /// <summary>
    /// Set the age of the person.
    /// </summary>
    /// <param name="NewAge">The new age of the person.</param>
    procedure Age(NewAge: Integer)
    begin
        this.PersonAge := NewAge;
    end;

    /// <summary>
    /// Get the age of the person.
    /// </summary>
    /// <returns>The age of the person.</returns>
    procedure Age(): Integer
    begin
        exit(this.PersonAge);
    end;
}
