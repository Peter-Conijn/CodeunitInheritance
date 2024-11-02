page 50110 Person
{
    ApplicationArea = All;
    Caption = 'Person';
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Name; this.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Specifies the name of the person';
                }
                field(Age; this.Age)
                {
                    ApplicationArea = All;
                    Caption = 'Age';
                    ToolTip = 'Specifies the age of the person';
                }
                field(Weight; this.Weight)
                {
                    ApplicationArea = All;
                    Caption = 'Weight (kg)';
                    ToolTip = 'Specifies the weight of the person';
                    DecimalPlaces = 0 : 2;
                }
                field(ActivityTime; this.ActivityTime)
                {
                    ApplicationArea = All;
                    Caption = 'Activity Time';
                    ToolTip = 'Specifies the activity time of the person';
                    DecimalPlaces = 0 : 2;
                }
            }

            group(Result)
            {
                Caption = 'Result';
                field(ResultText; this.ResultText)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    ToolTip = 'Specifies the result of the processing';
                    InstructionalText = 'The result of the processing will be displayed here.';
                    MultiLine = true;
                    Editable = false;
                    Enabled = false;
                    ExtendedDatatype = RichContent;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ProcessCouchPotatoAction)
            {
                ApplicationArea = All;
                Caption = 'Process as Couch Potato';
                ToolTip = 'Process the person as a couch potato.';

                trigger OnAction()
                begin
                    this.ProcessCouchPotato();
                end;
            }
            action(ProcessAthleteAction)
            {
                ApplicationArea = All;
                Caption = 'Process as Athlete';
                ToolTip = 'Process the person as an athlete.';

                trigger OnAction()
                begin
                    this.ProcessAthlete();
                end;
            }
            action(ProcessProfessionalAthleteAction)
            {
                ApplicationArea = All;
                Caption = 'Process as Professional Athlete';
                ToolTip = 'Process the person as a professional athlete.';

                trigger OnAction()
                begin
                    this.ProcessProfessionalAthlete();
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(ProcessCouchPotatoAction_Promoted; ProcessCouchPotatoAction)
                {
                }
                group(AthleteGroup)
                {
                    Caption = 'Athlete';
                    ShowAs = SplitButton;

                    actionref(ProcessAthleteAction_Promoted; ProcessAthleteAction)
                    {
                    }
                    actionref(ProcessProfessionalAthleteAction_Promoted; ProcessProfessionalAthleteAction)
                    {
                    }
                }
            }
        }
    }

    local procedure ProcessCouchPotato()
    var
        CouchPotato: Codeunit "Couch Potato";
        Person: Codeunit Person;
    begin
        // Initialize the Couch Potato class using the constructor
        CouchPotato.CouchPotato(Person);

        // Set the properties of the base class
        CouchPotato.Base().Name(this.Name);
        CouchPotato.Base().Age(this.Age);

        // Set the properties of the derived class
        CouchPotato.AverageSitTime(this.ActivityTime);
        CouchPotato.Weight(this.Weight);
        CouchPotato.FavoriteProgram('The Great British Bake Off');

        this.PrintResult(CouchPotato);
    end;

    local procedure ProcessAthlete()
    var
        Athlete: Codeunit Athlete;
    begin
        ProcessAthleteClass(Athlete);

        this.PrintResult(Athlete);
    end;

    local procedure ProcessProfessionalAthlete()
    var
        ProfessionalAthlete: Codeunit "Professional Athlete";
        Athlete: Codeunit Athlete;
    begin
        ProcessAthleteClass(Athlete);
        ProfessionalAthlete.ProfessionalAthlete(Athlete);

        ProfessionalAthlete.Team('Team A');
        ProfessionalAthlete.Salary(10000);

        this.PrintResult(ProfessionalAthlete);
    end;

    local procedure PrintResult(CouchPotato: Codeunit "Couch Potato")
    begin
        this.ResultText := 'Name: ' + CouchPotato.Base().Name() +
            '<br>Age: ' + Format(CouchPotato.Base().Age()) +
            '<br>Average Sit Time: ' + Format(CouchPotato.AverageSitTime()) + ' hours' +
            '<br>Weight: ' + Format(CouchPotato.Weight()) + ' kg' +
            '<br>Favorite Program: ' + CouchPotato.FavoriteProgram();
    end;

    local procedure PrintResult(Athlete: Codeunit Athlete)
    begin
        this.ResultText := 'Name: ' + Athlete.Base().Name() +
            '<br>Age: ' + Format(Athlete.Base().Age()) +
            '<br>Average Run Time: ' + Format(Athlete.AverageRunTime()) + ' minutes' +
            '<br>Weight: ' + Format(Athlete.Weight()) + ' kg' +
            '<br>Sport: ' + Athlete.Sport();
    end;

    local procedure PrintResult(ProfessionalAthlete: Codeunit "Professional Athlete")
    begin
        this.ResultText := 'Name: ' + ProfessionalAthlete.Base().Base().Name() +
            '<br>Age: ' + Format(ProfessionalAthlete.Base().Base().Age()) +
            '<br>Average Run Time: ' + Format(ProfessionalAthlete.Base().AverageRunTime()) + ' minutes' +
            '<br>Weight: ' + Format(ProfessionalAthlete.Base().Weight()) + ' kg' +
            '<br>Sport: ' + ProfessionalAthlete.Base().Sport() +
            '<br>Team: ' + ProfessionalAthlete.Team() +
            '<br>Salary: ' + Format(ProfessionalAthlete.Salary());
    end;

    local procedure ProcessAthleteClass(var Athlete: Codeunit Athlete)
    var
        Person: Codeunit Person;
    begin
        Athlete.Athlete(Person);

        // Set the properties of the base class
        Athlete.Base().Name(this.Name);
        Athlete.Base().Age(this.Age);

        // Set the properties of the derived class
        Athlete.AverageRunTime(this.ActivityTime);
        Athlete.Weight(this.Weight);
        Athlete.Sport('Running');
    end;

    var
        Age: Integer;
        Name: Text[100];
        ResultText: Text;
        ActivityTime: Decimal;
        Weight: Decimal;
}
