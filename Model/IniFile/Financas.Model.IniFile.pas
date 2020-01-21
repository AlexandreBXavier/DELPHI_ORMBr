unit Financas.Model.IniFile;

interface

uses Financas.Model.IniFile.Interfaces, IniFiles;

type
     TModelIniFile = class(TInterfacedObject, iModelIniFile)
     private
          FFileName: String;
          function GetDatabase: String;
          function GetUserName: String;
          function GetPassword: String;
          function GetDriverID: String;
          function GetServer: String;
          function GetPort: String;
          procedure SetDatabase(const Value: String);
          procedure SetUserName(const Value: String);
          procedure SetPassword(const Value: String);
          procedure SetDriverID(const Value: String);
          procedure SetServer(const Value: String);
          procedure SetPort(const Value: String);
     published
          property Database: String read GetDatabase write SetDatabase;
          property UserName: String read GetUserName write SetUserName;
          property Password: String read GetPassword write SetPassword;
          property DriverID: String read GetDriverID write SetDriverID;
          property Server: String read GetServer write SetServer;
          property Port: String read GetPort write SetPort;
          constructor Create;
          destructor Destroy; override;
          class function New: iModelIniFile;
     end;

implementation

{ TModelIniFile }

uses Winapi.Windows, System.SysUtils, System.Classes, Math, FMX.Forms;

function GetFileInfo(FileName, KeySection, KeyName, ValueDefault: String): String;
var
     IniFile: TIniFile;
     KeyResult: String;
begin
     KeyResult := '';
     //
     if FileExists(FileName) then
     begin
          IniFile := TIniFile.Create(FileName);
          //
          try
               KeyResult := IniFile.ReadString(KeySection, KeyName, ValueDefault);
          finally
               Result := KeyResult;
               //
               IniFile.Free;
          end;
     end;
end;

function SetFileInfo(FileName, KeySection, KeyName, ValueDefault: String): String;
var
     IniFile: TIniFile;
     KeyResult: String;
begin
     KeyResult := '';
     //
     IniFile := TIniFile.Create(FileName);
     //
     try
          IniFile.WriteString(KeySection, KeyName, ValueDefault);
          //
          KeyResult := ValueDefault;
     finally
          Result := KeyResult;
          //
          IniFile.Free;
     end;
end;

constructor TModelIniFile.Create;
begin
     FFileName := ChangeFileExt(ParamStr(0), '.ini');
end;

destructor TModelIniFile.Destroy;
begin
     inherited;
end;

class function TModelIniFile.New: iModelIniFile;
begin
     Result := Self.Create;
end;

function TModelIniFile.GetDatabase: String;
begin
     Result := GetFileInfo(FFileName, 'Database', 'Database', '');
end;

function TModelIniFile.GetUserName: String;
begin
     Result := GetFileInfo(FFileName, 'Database', 'UserName', '');
end;

function TModelIniFile.GetPassword: String;
begin
     Result := GetFileInfo(FFileName, 'Database', 'Password', '');
end;

function TModelIniFile.GetDriverID: String;
begin
     Result := GetFileInfo(FFileName, 'Database', 'DriverID', '');
end;

function TModelIniFile.GetServer: String;
begin
     Result := GetFileInfo(FFileName, 'Database', 'Server', '');
end;

function TModelIniFile.GetPort: String;
begin
     Result := GetFileInfo(FFileName, 'Database', 'Port', '');
end;

procedure TModelIniFile.SetDatabase(const Value: String);
begin
     SetFileInfo(FFileName, 'Database', 'Database', Value);
end;

procedure TModelIniFile.SetUserName(const Value: String);
begin
     SetFileInfo(FFileName, 'Database', 'UserName', Value);
end;

procedure TModelIniFile.SetPassword(const Value: String);
begin
     SetFileInfo(FFileName, 'Database', 'Password', Value);
end;

procedure TModelIniFile.SetDriverID(const Value: String);
begin
     SetFileInfo(FFileName, 'Database', 'DriverID', Value);
end;

procedure TModelIniFile.SetServer(const Value: String);
begin
     SetFileInfo(FFileName, 'Database', 'Server', Value);
end;

procedure TModelIniFile.SetPort(const Value: String);
begin
     SetFileInfo(FFileName, 'Database', 'Port', Value);
end;

end.
