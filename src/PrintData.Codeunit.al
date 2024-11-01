codeunit 50115 "Print Data"
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure PrintResult(CouchPotato: Codeunit "Couch Potato") ResultText: Text
    begin
        ResultText := 'Results:' +
            // Get the properties of the base class.
            '<br>-- Base Class --' +
            '<br>Name: ' + CouchPotato.Base().Name() +
            '<br>Age: ' + Format(CouchPotato.Base().Age()) +

            // Get the properties of the derived class.
            '<br><br>-- Derived Class --' +
            '<br>Average Sit Time: ' + Format(CouchPotato.AverageSitTime()) + ' hours' +
            '<br>Weight: ' + Format(CouchPotato.Weight()) + ' kg' +
            '<br>Favorite Program: ' + CouchPotato.FavoriteProgram();
    end;

    procedure PrintResult(ProfessionalPotato: Codeunit "Professional Potato") ResultText: Text
    begin
        ResultText := 'Results:' +
            // Get the properties of the base class. In this pattern, we use a direct approach to get the properties of the base class, using the Base classes defined in this class: CouchPotato() and Person()
            '<br>-- Base Class --' +
            '<br>Name: ' + ProfessionalPotato.Person().Name() +
            '<br>Age: ' + Format(ProfessionalPotato.Person().Age()) +

            // Get the properties of the derived class.
            '<br><br>-- Derived Class --' +
            '<br>Average Sit Time: ' + Format(ProfessionalPotato.CouchPotato().AverageSitTime()) + ' hours' +
            '<br>Weight: ' + Format(ProfessionalPotato.CouchPotato().Weight()) + ' kg' +
            '<br>Favorite Program: ' + ProfessionalPotato.CouchPotato().FavoriteProgram() +

            // Get the properties of the doubly derived class.
            '<br><br>-- Doubly Derived Class --' +
            '<br>Circumference: ' + Format(ProfessionalPotato.Circumference()) + ' cm';
    end;

    procedure PrintResult(Athlete: Codeunit Athlete) ResultText: Text
    begin
        ResultText := 'Results:' +
            // Get the properties of the base class.
            '<br>-- Base Class --' +
            '<br>Name: ' + Athlete.Base().Name() +
            '<br>Age: ' + Format(Athlete.Base().Age()) +

            // Get the properties of the derived class.
            '<br><br>-- Derived Class --' +
            '<br>Average Run Time: ' + Format(Athlete.AverageRunTime()) + ' minutes' +
            '<br>Weight: ' + Format(Athlete.Weight()) + ' kg' +
            '<br>Sport: ' + Athlete.Sport();
    end;

    procedure PrintResult(ProfessionalAthlete: Codeunit "Professional Athlete") ResultText: Text
    begin
        ResultText := 'Results:' +
            // Get the properties of the base class. In this pattern, we use a stepped approach to get the properties of the base class, using the Base of the Base: Base().Base()
            '<br>-- Base Class --' +
            '<br>Name: ' + ProfessionalAthlete.Base().Base().Name() +
            '<br>Age: ' + Format(ProfessionalAthlete.Base().Base().Age()) +

            // Get the properties of the derived class.
            '<br><br>-- Derived Class --' +
            '<br>Average Run Time: ' + Format(ProfessionalAthlete.Base().AverageRunTime()) + ' minutes' +
            '<br>Weight: ' + Format(ProfessionalAthlete.Base().Weight()) + ' kg' +
            '<br>Sport: ' + ProfessionalAthlete.Base().Sport() +

            // Get the properties of the doubly derived class.
            '<br><br>-- Doubly Derived Class --' +
            '<br>Team: ' + ProfessionalAthlete.Team() +
            '<br>Salary: ' + Format(ProfessionalAthlete.Salary());
    end;
}
