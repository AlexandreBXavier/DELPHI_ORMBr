unit Financas.Model.Analytic;

interface

uses Financas.Model.Analytic.Interfaces, System.SysUtils, System.Classes, FMX.Forms;

type
     TModelAnalytic = class(TInterfacedObject, iModelAnalytic)
     private
          FSite: String;
          FFileAnalytic: String;
          procedure RegisterDAT(aValue: String);
          procedure RegisterAnalytic(EnvStr: TStringList);
     published
          constructor Create;
          destructor Destroy; override;
          class function New: iModelAnalytic;
          procedure RegisterPage(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aDescription, aUserID, aUserAgent, aAppVersion, aScreenResolution, aSource, aReference: String);
          procedure RegisterEvent(aVersion, aTrackingID, aClientID, aCategory, aAction, aLabel, aValue: String);
     end;

implementation

{ TModelAnalytic }
{ https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide?hl=pt-br }

uses IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

procedure TModelAnalytic.RegisterDAT(aValue: String);
var
     txtAnalytic: TextFile;
begin
     AssignFile(txtAnalytic, FFileAnalytic);
     //
     if FileExists(FFileAnalytic) then
          Append(txtAnalytic)
     else ReWrite(txtAnalytic);
     //
     WriteLn(txtAnalytic, aValue);
     //
     CloseFile(txtAnalytic);
end;

procedure TModelAnalytic.RegisterAnalytic(EnvStr: TStringList);
var
     IdHTTP: TIdHTTP;
     sReturn, sResponse: String;
begin
     sReturn := '';
     sResponse := '';
     //
     IdHTTP := TIdHTTP.Create(nil);
     //
     try
          IdHTTP.HTTPOptions := [hoForceEncodeParams];
          IdHTTP.AllowCookies := True;
          //
          if (EnvStr.Text <> '') then
          begin
               try
                    sReturn := IdHTTP.Post(FSite, EnvStr);
                    //
                    Application.ProcessMessages;
                    //
                    sResponse := IdHTTP.ResponseText;
               except
                    on E: Exception do
                         sReturn := E.Message;
               end;
          end;
     finally
          IdHTTP.Free;
     end;
end;

procedure TModelAnalytic.RegisterPage(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aDescription, aUserID, aUserAgent, aAppVersion, aScreenResolution, aSource, aReference: String);
var
     sResponse: String;
     EnvStr: TStringList;
begin
     EnvStr := TStringList.Create;
     //
     try
          EnvStr.Clear;
          //
          EnvStr.Values['v'] := aVersion;
          EnvStr.Values['tid'] := aTrackingID;
          EnvStr.Values['cid'] := aClientID;
          //
          EnvStr.Values['t'] := 'pageview';
          //
          EnvStr.Values['dh']  := aAppName;
          EnvStr.Values['dp']  := aScreenName;
          EnvStr.Values['dt']  := aDescription;
          //
          EnvStr.Values['dr'] := aReference;
          EnvStr.Values['cn'] := aSource;
          EnvStr.Values['cs'] := 'Version ' + aAppVersion;
          EnvStr.Values['cm'] := aUserAgent;
          EnvStr.Values['ck'] := aUserID;
          EnvStr.Values['cc'] := aScreenResolution;
          //
          RegisterDAT(EnvStr.Text);
          RegisterAnalytic(EnvStr);
     finally
          EnvStr.Free;
     end;
end;

procedure TModelAnalytic.RegisterEvent(aVersion, aTrackingID, aClientID, aCategory, aAction, aLabel, aValue: String);
var
     sResponse: String;
     EnvStr: TStringList;
begin
     EnvStr := TStringList.Create;
     //
     try
          EnvStr.Clear;
          //
          EnvStr.Values['t'] := 'event';
          //
          EnvStr.Values['v'] := aVersion;
          EnvStr.Values['tid'] := aTrackingID;
          EnvStr.Values['cid'] := aClientID;
          //
          EnvStr.Values['ec'] := aCategory;
          EnvStr.Values['ea'] := aAction;
          EnvStr.Values['el'] := aLabel;
          EnvStr.Values['ev'] := aValue;
          //
          RegisterDAT(EnvStr.Text);
          RegisterAnalytic(EnvStr);
     finally
          EnvStr.Free;
     end;
end;

constructor TModelAnalytic.Create;
begin
     FSite := 'https://www.google-analytics.com/collect';
     //
     FFileAnalytic := ChangeFileExt(ParamStr(0), '.dat');
end;

destructor TModelAnalytic.Destroy;
begin
     inherited;
end;

class function TModelAnalytic.New: iModelAnalytic;
begin
     Result := Self.Create;
end;

end.
