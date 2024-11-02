page 50111 Vehicles
{
    ApplicationArea = All;
    Caption = 'Vehicles';
    PageType = List;
    SourceTable = Vehicle;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Make; Rec.Make)
                {
                }
                field(Model; Rec.Model)
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreateSubmission)
            {
                Caption = 'Create Vehicle Submission';
                ToolTip = 'Create a new vehicle submission.';
                Image = Register;

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Vehicle Submission", Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(CreateSubmission_Promoted; CreateSubmission)
                {
                }
            }
        }
    }
}
