unit Financas.Model.ApplicationInfo;

interface

uses Financas.Model.ApplicationInfo.Interfaces;

type
     TModelApplicationInfo = class(TInterfacedObject, iModelApplicationInfo)
     private
          FFileVersion: String;
          FProductVersion: String;
          FProductName: String;
          FLegalTradeMarks: String;
          FLegalCopyRight: String;
          FCompanyName: String;
          FFileDescription: String;
          FInternalName: String;
          FComments: String;
          FOriginalFileName: String;
          procedure SetCompanyName(const Value: String);
          procedure SetFileDescription(const Value: String);
          procedure SetFileVersion(const Value: String);
          procedure SetInternalName(const Value: String);
          procedure SetLegalCopyRight(const Value: String);
          procedure SetLegalTradeMarks(const Value: String);
          procedure SetOriginalFileName(const Value: String);
          procedure SetProductName(const Value: String);
          procedure SetProductVersion(const Value: String);
          procedure SetComments(const Value: String);
     published
          property CompanyName: String read FCompanyName write SetCompanyName;
          property FileDescription: String read FFileDescription write SetFileDescription;
          property FileVersion: String read FFileVersion write SetFileVersion;
          property InternalName: String read FInternalName write SetInternalName;
          property LegalCopyRight: String read FLegalCopyRight write SetLegalCopyRight;
          property LegalTradeMarks: String read FLegalTradeMarks write SetLegalTradeMarks;
          property OriginalFileName: String read FOriginalFileName write SetOriginalFileName;
          property ProductName: String read FProductName write SetProductName;
          property ProductVersion: String read FProductVersion write SetProductVersion;
          property Comments: String read FComments write SetComments;
          constructor Create;
          destructor Destroy; override;
          class function New: iModelApplicationInfo;
     end;

implementation

{ TModelApplicationInfo }

uses Winapi.Windows, System.SysUtils, System.Classes, Math;

function GetVersionInfo(AIdent: String): String;
type
     TLang = packed record
          Lng, Page: WORD;
     end;

     TLangs = array [0 .. 10000] of TLang;
     PLangs = ^TLangs;
var
     BLngs: PLangs;
     BLngsCnt: Cardinal;
     BLangId: String;
     RM: TMemoryStream;
     RS: TResourceStream;
     BP: PChar;
     BL: Cardinal;
     BId: String;
begin
     // Assume error
     Result := '';

     RM := TMemoryStream.Create;
     try
          // Load the version resource into memory
          RS := TResourceStream.CreateFromID(HInstance, 1, RT_VERSION);
          try
               RM.CopyFrom(RS, RS.Size);
          finally
               FreeAndNil(RS);
          end;

          // Extract the translations list
          if not VerQueryValue(RM.Memory, '\\VarFileInfo\\Translation', Pointer(BLngs), BL) then
               Exit; // Failed to parse the translations table
          BLngsCnt := BL div sizeof(TLang);
          if BLngsCnt <= 0 then
               Exit; // No translations available

          // Use the first translation from the table (in most cases will be OK)
          with BLngs[0] do
               BLangId := IntToHex(Lng, 4) + IntToHex(Page, 4);

          // Extract field by parameter
          BId := '\\StringFileInfo\\' + BLangId + '\\' + AIdent;
          if not VerQueryValue(RM.Memory, PChar(BId), Pointer(BP), BL) then
               Exit; // No such field

          // Prepare result
          Result := BP;
     finally
          FreeAndNil(RM);
     end;
end;

constructor TModelApplicationInfo.Create;
begin
     SetCompanyName(GetVersionInfo('CompanyName'));
     SetFileVersion(GetVersionInfo('FileVersion'));
     SetProductVersion(GetVersionInfo('ProductVersion'));
     SetProductName(GetVersionInfo('ProductName'));
     SetLegalTradeMarks(GetVersionInfo('LegalTradeMarks'));
     SetLegalCopyRight(GetVersionInfo('LegalCopyRight'));
     SetFileDescription(GetVersionInfo('FileDescription'));
     SetInternalName(GetVersionInfo('InternalName'));
     SetOriginalFileName(GetVersionInfo('OriginalFileName'));
     SetComments(GetVersionInfo('Comments'));
end;

destructor TModelApplicationInfo.Destroy;
begin
     inherited;
end;

class function TModelApplicationInfo.New: iModelApplicationInfo;
begin
     Result := Self.Create;
end;

procedure TModelApplicationInfo.SetComments(const Value: String);
begin
     FComments := Value;
end;

procedure TModelApplicationInfo.SetCompanyName(const Value: String);
begin
     FCompanyName := Value;
end;

procedure TModelApplicationInfo.SetFileDescription(const Value: String);
begin
     FFileDescription := Value;
end;

procedure TModelApplicationInfo.SetFileVersion(const Value: String);
begin
     FFileVersion := Value;
end;

procedure TModelApplicationInfo.SetInternalName(const Value: String);
begin
     FInternalName := Value;
end;

procedure TModelApplicationInfo.SetLegalCopyRight(const Value: String);
begin
     FLegalCopyRight := Value;
end;

procedure TModelApplicationInfo.SetLegalTradeMarks(const Value: String);
begin
     FLegalTradeMarks := Value;
end;

procedure TModelApplicationInfo.SetOriginalFileName(const Value: String);
begin
     FOriginalFileName := Value;
end;

procedure TModelApplicationInfo.SetProductName(const Value: String);
begin
     FProductName := Value;
end;

procedure TModelApplicationInfo.SetProductVersion(const Value: String);
begin
     FProductVersion := Value;
end;

end.
