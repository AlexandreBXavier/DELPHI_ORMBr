unit Financas.Controller.Analytic.Factory;

interface

uses Financas.Controller.Analytic.Interfaces, Financas.Model.Analytic, Financas.Controller.Login, Financas.Controller.Login.Interfaces, System.Types;

type
     TControllerAnalyticFactory = class(TInterfacedObject, iControllerAnalyticFactory)
     private
          FVersion: String;
          FTrackingID: String;
          FClientID: String;
          FAppName: String;
          FUserID: String;
          FUserAgent: String;
          FAppVersion: String;
          FScreenResolution: String;
          FSource: String;
          FReference: String;
          FAnalytic: TModelAnalytic;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerAnalyticFactory;
          procedure GetPage(aScreenName, aDescription: String);
          procedure GetEvent(aCategory, aAction, aLabel: String);
     end;

implementation

{ TControllerIniFileFactory }

uses System.SysUtils, FMX.Forms, Financas.Controller.ApplicationInfo.Factory;

constructor TControllerAnalyticFactory.Create;
var
     OSVersion: TOSVersion;
     ScreenSize: TSize;
begin
     ScreenSize := Screen.Size;
     //
     FClientID := TControllerLogin.New.GetClientID;
     FUserID := TControllerLogin.New.GetUserName;
     //
     FVersion := '1';
     FTrackingID := 'UA-128990494-3';
     FSource := 'App';
     //
     FAppName := TControllerApplicationInfoFactory.New.ProductName;
     FReference := TControllerApplicationInfoFactory.New.Comments;
     FAppVersion := TControllerApplicationInfoFactory.New.FileVersion;
     //
     FUserAgent := OSVersion.Name; //OSVersion.ToString
     FScreenResolution := IntToStr(ScreenSize.Width) + ' x ' + IntToStr(ScreenSize.Height);
     //
     FAnalytic := TModelAnalytic.Create;
end;

destructor TControllerAnalyticFactory.Destroy;
begin
     FreeAndNil(FAnalytic);
     //
     inherited;
end;

procedure TControllerAnalyticFactory.GetEvent(aCategory, aAction, aLabel: String);
begin
     FAnalytic.RegisterEvent(FVersion, FTrackingID, FClientID, aCategory, aAction, aLabel, '1');
end;

procedure TControllerAnalyticFactory.GetPage(aScreenName, aDescription: String);
begin
     FAnalytic.RegisterPage(FVersion, FTrackingID, FClientID, FAppName, aScreenName, aDescription, FUserID, FUserAgent, FAppVersion, FScreenResolution, FSource, FReference);
end;

class function TControllerAnalyticFactory.New: iControllerAnalyticFactory;
begin
     Result := Self.Create;
end;

end.
