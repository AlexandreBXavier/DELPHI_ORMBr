unit Financas.Controller.Dialog;

interface

type
     TControllerDialog = class(TInterfacedObject)
     private
          { Private declarations }
     public
          { Public declarations }
          class function Dialog(Tipo: Char; Texto: String): Boolean;
     end;

implementation

{ TControllerDialog }

uses FMX.Forms, System.SysUtils, FMX.Controls, Financas.View.Dialog;

class function TControllerDialog.Dialog(Tipo: Char; Texto: String): Boolean;
var
     frm: TViewDialog;
begin
     Result := False;
     //
     frm := TViewDialog.Create(nil);
     //
     try
          frm.LabelDialog.Text := Texto;
          //
          case (Tipo) of
               'I':
                    begin
                         frm.Caption := 'Informação';
                         frm.LabelDialog.Visible := True;
                         frm.ImageInformation.Visible := True;
                         frm.ButtonOK.Visible := True;
                    end;
               'C':
                    begin
                         frm.Caption := 'Confirmação';
                         frm.LabelDialog.Visible := True;
                         frm.ImageConfirmation.Visible := True;
                         frm.ButtonYes.Visible := True;
                         frm.ButtonNo.Visible := True;
                    end;
               'A':
                    begin
                         frm.Caption := 'Aviso';
                         frm.LabelDialog.Visible := True;
                         frm.ImageWarning.Visible := True;
                         frm.ButtonOK.Visible := True;
                    end;
               'E':
                    begin
                         frm.Caption := 'Error';
                         frm.LabelDialog.Visible := True;
                         frm.ImageError.Visible := True;
                         frm.ButtonOK.Visible := True;
                    end
          end;
          //
          frm.ShowModal;
          //
          Result := frm.ButtonResult;
     finally
          if (frm <> nil) then
               FreeAndNil(frm);
     end;
end;

end.

