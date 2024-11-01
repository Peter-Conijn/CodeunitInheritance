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
            action(ProcessProfessionalPotatoAction)
            {
                ApplicationArea = All;
                Caption = 'Process as Professional Potato';
                ToolTip = 'Process the person as a professional potato.';

                trigger OnAction()
                begin
                    this.ProcessProfessionalPotato();
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

                group(PotatoGroup)
                {
                    Caption = 'Potato';
                    ShowAs = SplitButton;

                    actionref(ProcessCouchPotatoAction_Promoted; ProcessCouchPotatoAction)
                    {
                    }
                    actionref(ProcessProfessionalPotatoAction_Promoted; ProcessProfessionalPotatoAction)
                    {
                    }
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
    begin
        ProcessCouchPotatoClass(CouchPotato);

        this.ResultText := PrintData.PrintResult(CouchPotato);
    end;

    local procedure ProcessProfessionalPotato()
    var
        ProfessionalPotato: Codeunit "Professional Potato";
        CouchPotato: Codeunit "Couch Potato";
    begin
        ProcessCouchPotatoClass(CouchPotato);

        // Initialize the Professional Couch Potato class using the constructor using the previously inherited Couch Potato class
        // This will also instantiate the base Person class
        ProfessionalPotato.ProfessionalPotato(CouchPotato);

        // Now we add properties specific to the Professional Potato class, which is a grandchild of the Person class
        ProfessionalPotato.Circumference(ProfessionalPotato.CouchPotato().Weight() * 2);

        this.ResultText := PrintData.PrintResult(ProfessionalPotato);
    end;

    local procedure ProcessAthlete()
    var
        Athlete: Codeunit Athlete;
    begin
        ProcessAthleteClass(Athlete);

        this.ResultText := PrintData.PrintResult(Athlete);
    end;

    local procedure ProcessProfessionalAthlete()
    var
        ProfessionalAthlete: Codeunit "Professional Athlete";
        Athlete: Codeunit Athlete;
    begin
        ProcessAthleteClass(Athlete);

        // Initialize the Professional Athlete class using the constructor using the previously inherited Athlete class
        // This will also instantiate the base Person class
        ProfessionalAthlete.ProfessionalAthlete(Athlete);

        // Now we add properties specific to the Professional Athlete class, which is a grandchild of the Person class
        ProfessionalAthlete.Team('Team A');
        ProfessionalAthlete.Salary(10000);

        this.ResultText := PrintData.PrintResult(ProfessionalAthlete);
    end;

    local procedure ProcessAthleteClass(var Athlete: Codeunit Athlete)
    var
        Person: Codeunit Person;
    begin
        // Initialize the Athlete class using the constructor
        Athlete.Athlete(Person);

        // Set the properties of the base class
        Athlete.Base().Name(this.Name);
        Athlete.Base().Age(this.Age);

        // Set the properties of the derived class
        Athlete.AverageRunTime(this.ActivityTime);
        Athlete.Weight(this.Weight);
        Athlete.Sport('Running');
    end;

    local procedure ProcessCouchPotatoClass(var CouchPotato: Codeunit "Couch Potato")
    var
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
        CouchPotato.FavoriteProgram('The Great British Bake-Off');
    end;

    var
        PrintData: Codeunit "Print Data";
        Age: Integer;
        Name: Text[100];
        ResultText: Text;
        ActivityTime: Decimal;
        Weight: Decimal;
}
