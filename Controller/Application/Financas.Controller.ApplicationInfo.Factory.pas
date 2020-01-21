unit Financas.Controller.ApplicationInfo.Factory;

interface

uses Financas.Controller.ApplicationInfo.Interfaces, Financas.Model.ApplicationInfo;

type
     TControllerApplicationInfoFactory = class(TInterfacedObject, iControllerApplicationInfoFactory)
     private
          FApplicationInfo: TModelApplicationInfo;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerApplicationInfoFactory;
          function CompanyName: String;
          function FileDescription: String;
          function FileVersion: String;
          function InternalName: String;
          function LegalCopyRight: String;
          function LegalTradeMarks: String;
          function OriginalFileName: String;
          function ProductName: String;
          function ProductVersion: String;
          function Comments: String;
     end;

implementation

uses System.SysUtils;

{ TControllerApplicationInfoFactory }

function TControllerApplicationInfoFactory.Comments: String;
begin
     Result := FApplicationInfo.Comments;
end;

function TControllerApplicationInfoFactory.CompanyName: String;
begin
     Result := FApplicationInfo.CompanyName;
end;

constructor TControllerApplicationInfoFactory.Create;
begin
     FApplicationInfo := TModelApplicationInfo.Create;
end;

destructor TControllerApplicationInfoFactory.Destroy;
begin
     FreeAndNil(FApplicationInfo);
     //
     inherited;
end;

function TControllerApplicationInfoFactory.FileDescription: String;
begin
     Result := FApplicationInfo.FileDescription;
end;

function TControllerApplicationInfoFactory.FileVersion: String;
begin
     Result := FApplicationInfo.FileVersion;
end;

function TControllerApplicationInfoFactory.InternalName: String;
begin
     Result := FApplicationInfo.InternalName;
end;

function TControllerApplicationInfoFactory.LegalCopyRight: String;
begin
     Result := FApplicationInfo.LegalCopyRight;
end;

function TControllerApplicationInfoFactory.LegalTradeMarks: String;
begin
     Result := FApplicationInfo.LegalTradeMarks;
end;

class function TControllerApplicationInfoFactory.New: iControllerApplicationInfoFactory;
begin
     Result := Self.Create;
end;

function TControllerApplicationInfoFactory.OriginalFileName: String;
begin
     Result := FApplicationInfo.OriginalFileName;
end;

function TControllerApplicationInfoFactory.ProductName: String;
begin
     Result := FApplicationInfo.ProductName;
end;

function TControllerApplicationInfoFactory.ProductVersion: String;
begin
    Result := FApplicationInfo.ProductVersion;
end;

end.
