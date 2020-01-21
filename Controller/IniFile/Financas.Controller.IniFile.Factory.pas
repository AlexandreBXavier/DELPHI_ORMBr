unit Financas.Controller.IniFile.Factory;

interface

uses Financas.Controller.IniFile.Interfaces, Financas.Model.IniFile;

type
     TControllerIniFileFactory = class(TInterfacedObject, iControllerIniFileFactory)
     private
          FIniFile: TModelIniFile;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerIniFileFactory;
          function Database: String;
          function UserName: String;
          function Password: String;
          function DriverID: String;
          function Server: String;
          function Port: String;
          procedure SetDatabase(const Value: String);
          procedure SetUserName(const Value: String);
          procedure SetPassword(const Value: String);
          procedure SetDriverID(const Value: String);
          procedure SetServer(const Value: String);
          procedure SetPort(const Value: String);
     end;

implementation

uses System.SysUtils;

{ TControllerIniFileFactory }

function TControllerIniFileFactory.Database: String;
begin
     Result := FIniFile.Database;
end;

function TControllerIniFileFactory.UserName: String;
begin
     Result := FIniFile.UserName;
end;

constructor TControllerIniFileFactory.Create;
begin
     FIniFile := TModelIniFile.Create;
end;

destructor TControllerIniFileFactory.Destroy;
begin
     FreeAndNil(FIniFile);
     //
     inherited;
end;

function TControllerIniFileFactory.Password: String;
begin
     Result := FIniFile.Password;
end;

function TControllerIniFileFactory.DriverID: String;
begin
     Result := FIniFile.DriverID;
end;

function TControllerIniFileFactory.Server: String;
begin
     Result := FIniFile.Server;
end;

procedure TControllerIniFileFactory.SetDatabase(const Value: String);
begin
     FIniFile.Database := Value;
end;

procedure TControllerIniFileFactory.SetDriverID(const Value: String);
begin
     FIniFile.DriverID := Value;
end;

procedure TControllerIniFileFactory.SetPassword(const Value: String);
begin
     FIniFile.Password := Value;
end;

procedure TControllerIniFileFactory.SetPort(const Value: String);
begin
     FIniFile.Port := Value;
end;

procedure TControllerIniFileFactory.SetServer(const Value: String);
begin
     FIniFile.Server := Value;
end;

procedure TControllerIniFileFactory.SetUserName(const Value: String);
begin
     FIniFile.UserName := Value;
end;

function TControllerIniFileFactory.Port: String;
begin
     Result := FIniFile.Port;
end;

class function TControllerIniFileFactory.New: iControllerIniFileFactory;
begin
     Result := Self.Create;
end;

end.
