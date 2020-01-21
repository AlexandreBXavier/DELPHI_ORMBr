unit Financas.Model.Connection;

interface

uses Data.DB, Datasnap.DBClient, Financas.Model.Connection.Interfaces,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
     FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.FMXUI.Wait,
     // ormbr
     ormbr.factory.firedac, ormbr.container.fdmemtable, ormbr.factory.interfaces, ormbr.dml.generator.sqlite, ormbr.container.clientdataset, ormbr.container.dataset.interfaces, ormbr.criteria, ormbr.container.objectset, ormbr.container.objectset.interfaces, ormbr.factory.sqlite3, SQLiteTable3;

type
     TModelConnection = class(TInterfacedObject, iModelConnection)
     private
          FDGUIxWaitCursor: TFDGUIxWaitCursor;
          FConnection: TFDConnection;
          oConn: IDBConnection;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelConnection;
          function Connection: TCustomConnection;
          function SQL(SQLCommand: String): TDataSet;
     end;

implementation

uses Financas.Controller.IniFile.Factory, System.SysUtils;

{ TModelConnection }

var
     LClientDataSet: TClientDataSet;

function ConvertToDataSet(LResultSet: IDBResultSet): TDataSet;
var
     Contador: Integer;
     FieldName: String;
     FieldType: TFieldType;
     FieldSize: Integer;
begin
     try
          LClientDataSet.Close;
          LClientDataSet.FieldDefs.Clear;
          //
          for Contador := 0 to LResultSet.FieldDefs.Count-1 do
          begin
               FieldName := LResultSet.FieldDefs[Contador].Name;
               //
               if LResultSet.FieldDefs[Contador].Size > 300 then
                    FieldSize := 300
               else FieldSize := LResultSet.FieldDefs[Contador].Size;
               //
               if LResultSet.FieldDefs[Contador].DataType = ftWideString then
                    FieldType := ftString
               else FieldType := LResultSet.FieldDefs[Contador].DataType;
               //
               LClientDataSet.FieldDefs.Add(FieldName, FieldType, FieldSize, False);
          end;
          //
          LClientDataSet.CreateDataSet;
          //
          LClientDataSet.Open;
          //
          while LResultSet.NotEof do
          begin
               LClientDataSet.Insert;
               //
               for Contador := 0 to LClientDataSet.FieldCount-1 do
                    LClientDataSet.Fields[Contador].Value := LResultSet.FieldByName(LClientDataSet.Fields[Contador].FieldName).Value;
               //
               LClientDataSet.Post;
          end;
     finally
          Result := LClientDataSet;
     end;
end;

function TModelConnection.Connection: TCustomConnection;
begin
     Result := FConnection;
end;

constructor TModelConnection.Create;
begin
     FConnection := TFDConnection.Create(nil);
     FConnection.Params.DriverID := TControllerIniFileFactory.New.DriverID;
     FConnection.Params.Database := TControllerIniFileFactory.New.Database;
end;

destructor TModelConnection.Destroy;
begin
     FreeAndNil(FConnection);
     //
     inherited;
end;

class function TModelConnection.New: iModelConnection;
begin
     Result := Self.Create;
end;

function TModelConnection.SQL(SQLCommand: String): TDataSet;
var
     LResultSet: IDBResultSet;
     LDataSet: TDataSet;
begin
     oConn := TFactoryFireDAC.Create(FConnection, dnSQLite);
     //
     try
          LResultSet := oConn.CreateResultSet(SQLCommand);
          //
          LDataSet := ConvertToDataSet(LResultSet);
     finally
          Result := LDataSet;
     end;
end;

initialization

     LClientDataSet := TClientDataSet.Create(nil);

finalization

     LClientDataSet.Free;

end.
