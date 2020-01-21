unit Financas.Model.LogFile;

interface

uses Financas.Model.LogFile.Interfaces;

type
     TModelLogFile = class(TInterfacedObject, iModelLogFile)
     private
          FLogFile: String;
     published
          constructor Create;
          destructor Destroy; override;
          class function New: iModelLogFile;
          procedure SaveLog(aValue: String);
     end;

implementation

{ TModelIniFile }

uses System.SysUtils;

procedure TModelLogFile.SaveLog(aValue: String);
var
     txtLog: TextFile;
begin
     AssignFile(txtLog, FLogFile);
     //
     if FileExists(FLogFile) then
          Append(txtLog)
     else ReWrite(txtLog);
     //
     if Copy(aValue, 1, 1) = '=' then
          WriteLn(txtLog, aValue)
     else WriteLn(txtLog, FormatDateTime('dd/mm/YYYY hh:nn:ss - ', Now) + aValue);
     //
     CloseFile(txtLog);
end;

constructor TModelLogFile.Create;
begin
     FLogFile := ChangeFileExt(ParamStr(0), '.log');
end;

destructor TModelLogFile.Destroy;
begin
     inherited;
end;

class function TModelLogFile.New: iModelLogFile;
begin
     Result := Self.Create;
end;

end.
