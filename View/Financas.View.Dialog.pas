unit Financas.View.Dialog;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects;

type
     TViewDialog = class(TForm)
          LayoutDialog: TLayout;
          LayoutBar: TLayout;
          PanelDialog: TPanel;
          PanelBar: TPanel;
          LabelDialog: TLabel;
          ButtonOk: TButton;
          ButtonYes: TButton;
          ButtonNo: TButton;
          ImageInformation: TImage;
          ImageWarning: TImage;
          ImageError: TImage;
          ImageConfirmation: TImage;
          procedure FormCreate(Sender: TObject);
          procedure ButtonOkClick(Sender: TObject);
          procedure ButtonNoClick(Sender: TObject);
          procedure ButtonYesClick(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
          ButtonResult: Boolean;
     end;

var
     ViewDialog: TViewDialog;

implementation

{$R *.fmx}

procedure TViewDialog.ButtonNoClick(Sender: TObject);
begin
     ButtonResult := False;
     //
     Close;
end;

procedure TViewDialog.ButtonOkClick(Sender: TObject);
begin
     ButtonResult := True;
     //
     Close;
end;

procedure TViewDialog.ButtonYesClick(Sender: TObject);
begin
     ButtonResult := True;
     //
     Close;
end;

procedure TViewDialog.FormCreate(Sender: TObject);
begin
     ButtonResult := False;
     //
     ButtonYes.Visible := False;
     ButtonNo.Visible := False;
     ButtonOk.Visible := False;
     //
     ImageInformation.Visible := False;
     ImageWarning.Visible := False;
     ImageError.Visible := False;
     ImageConfirmation.Visible := False;
end;

end.
