page 50112 "Submitted Vehicles"
{
    ApplicationArea = All;
    Caption = 'Submitted Vehicles';
    PageType = ListPart;
    SourceTable = "Submitted Vehicle";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Editable = false;

                field("Code"; Rec."Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Type"; Rec."Type")
                {
                }
                field("License Plate"; Rec."License Plate")
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ShowSubmission)
            {
                Caption = 'Show Submission Data';
                ToolTip = 'Show the submittion data.';

                trigger OnAction()
                var
                    SubmittedData: Text;
                    InStream: InStream;
                begin
                    Rec.CalcFields("Submission Data");
                    Rec."Submission Data".CreateInStream(InStream, TextEncoding::UTF8);
                    InStream.ReadText(SubmittedData);
                    Message('Submission Data:\%1', SubmittedData);
                end;
            }
        }
    }
}
