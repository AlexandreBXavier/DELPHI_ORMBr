unit Financas.Controller.Login;

interface

uses System.SysUtils, Datasnap.DBClient, Financas.Controller.Login.Interfaces, Financas.Controller.Entity.Interfaces;

type
     TUserLogin = class
          private
               FClientID : String;
               FUserName : String;
               FLogin: Boolean;
          public
               constructor Create;
               property ClientID: String read FClientID write FClientID;
               property UserName: String read FUserName write FUserName;
               property Login: Boolean read FLogin write FLogin;
     end;

     TControllerLogin = class(TInterfacedObject, iControllerLogin)
          private
               //
          published
               constructor Create;
               destructor Destroy; override;
               class function New: iControllerLogin;
               procedure SetClientID(const Value: String);
               procedure SetUserName(const Value: String);
               procedure SetLogin(const Value: Boolean);
               function GetClientID: String;
               function GetUserName: String;
               function GetLogin: Boolean;
               function Authentication(Username, Password: String): Boolean;
     end;

implementation

{ TControllerLogin }

uses Financas.Controller.Entities;

var
     UserLogin: TUserLogin;

constructor TUserLogin.Create;
begin
     FClientID := '';
     FUserName := '';
     FLogin := False;
end;

function TControllerLogin.Authentication(Username, Password: String): Boolean;
var
     FControllerEntities: iControllerEntities;
     cdsLocal: TClientDataSet;
begin
     Result := False;
     //
     FControllerEntities := TControllerEntities.New;
     //
     cdsLocal := TClientDataSet.Create(nil);
     //
     FControllerEntities.Entities.Usuario.DataSet(cdsLocal).OpenWhere('nomeLogin = ' + QuotedStr(Username) + ' AND nomeSenha = ' + QuotedStr(Password) + ' AND ativoUsuario = 1', 'idUsuario');
     //
     Result := (cdsLocal.Active and (cdsLocal.RecordCount > 0));
     //
     cdsLocal.Close;
     //
     FreeAndNil(cdsLocal);
end;

constructor TControllerLogin.Create;
begin
     //
end;

destructor TControllerLogin.Destroy;
begin
     inherited;
end;

function TControllerLogin.GetClientID: String;
begin
     Result := UserLogin.ClientID;
end;

function TControllerLogin.GetLogin: Boolean;
begin
     Result := UserLogin.Login;
end;

function TControllerLogin.GetUserName: String;
begin
     Result := UserLogin.UserName;
end;

class function TControllerLogin.New: iControllerLogin;
begin
     Result := Self.Create;
end;

procedure TControllerLogin.SetClientID(const Value: String);
begin
     UserLogin.ClientID := Value;
end;

procedure TControllerLogin.SetLogin(const Value: Boolean);
begin
     UserLogin.Login := Value;
end;

procedure TControllerLogin.SetUserName(const Value: String);
begin
     UserLogin.UserName := Value;
end;

initialization

     UserLogin := TUserLogin.Create;

finalization

     UserLogin.Free

end.
