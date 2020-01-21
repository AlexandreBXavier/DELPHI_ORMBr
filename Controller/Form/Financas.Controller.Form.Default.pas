unit Financas.Controller.Form.Default;

interface

type
     TControllerFormDefault = class
          class procedure CreateForm(ClassName: String);
     end;

implementation

uses FMX.Types, System.Classes, FMX.Forms, System.SysUtils;

{ TControllerFormsDefault }

class procedure TControllerFormDefault.CreateForm(ClassName: String);
var
     ObjFMX: TFMXObjectClass;
     newForm: TCustomForm;
begin
     ObjFMX := TFMXObjectClass(GetClass(ClassName));
     try
          newForm := (ObjFMX.Create(nil) as TCustomForm);
          //
          try
               newForm.Position := TFormPosition.ScreenCenter;
               newForm.ShowModal;
          finally
               newForm.Free;
          end;
     except
          raise Exception.Create('Objeto n�o existe');
     end;
end;

end.
