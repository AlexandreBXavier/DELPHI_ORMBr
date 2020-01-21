unit Financas.Controller.Exception;

interface

uses System.SysUtils, System.Classes, FMX.Forms, FMX.Types;

type
     TControllerException = class
          private
               //
          public
               constructor Create;
               procedure LogException(Sender: TObject; E: Exception);
     end;

implementation

uses Financas.Model.LogFile, Financas.Controller.Dialog;

{ TControllerExcaption }

constructor TControllerException.Create;
begin
     Application.OnException := LogException;
end;

procedure TControllerException.LogException(Sender: TObject; E: Exception);
begin
     TControllerDialog.Dialog('E', E.Message);
     //
     TModelLogFile.New.SaveLog('====================================================================================================');
     //
     if TComponent(Sender) is TForm then
     begin
          TModelLogFile.New.SaveLog('Form: ' + TForm(Sender).Name);
          TModelLogFile.New.SaveLog('Class: ' + E.ClassName);
          TModelLogFile.New.SaveLog('Error: ' + E.Message);
     end
     else
     begin
          TModelLogFile.New.SaveLog('Component: ' + TComponent(Sender).Name);
          TModelLogFile.New.SaveLog('Class: ' + E.ClassName);
          TModelLogFile.New.SaveLog('Error: ' + E.Message);
     end;
end;

var
     LocalException: TControllerException;

initialization

     LocalException := TControllerException.Create;

finalization

     LocalException.Free

end.
