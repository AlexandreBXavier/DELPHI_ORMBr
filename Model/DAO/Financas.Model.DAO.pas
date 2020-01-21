unit Financas.Model.DAO;

interface

uses Financas.Model.DAO.Interfaces, Financas.Model.Connection.Interfaces, Data.DB, Datasnap.DBClient,
     // ormbr
     ormbr.factory.firedac, ormbr.manager.dataset, ormbr.container.clientdataset, ormbr.factory.interfaces, ormbr.dml.generator.sqlite, ormbr.container.dataset.interfaces, ormbr.criteria, ormbr.container.objectset, ormbr.container.objectset.interfaces, ormbr.factory.sqlite3, SQLiteTable3;

type
     TModelDAO<T: class, constructor> = class(TInterfacedObject, iModelDAO<T>)
     private
          oConn: IDBConnection;
          FManager: TManagerDataSet;
          FConnection: iModelConnection;
          FNewThis: T;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iModelDAO<T>;
          function DataSet(aValue: TClientDataSet): iModelDAO<T>;
          function Open: iModelDAO<T>;
          function OpenWhere(AWhere, AOrderBy: String): iModelDAO<T>;
          function ApplyUpdate: iModelDAO<T>;
          function Save: iModelDAO<T>;
          function _this: T;
          function _newthis: T;
     end;

implementation

uses Financas.Controller.Connection.Factory, System.SysUtils;

{ TModelDAO }

function TModelDAO<T>.ApplyUpdate: iModelDAO<T>;
begin
     Result := Self;
     //
     oConn.StartTransaction;
     //
     try
          FManager.ApplyUpdates<T>(-1);
          //
          oConn.Commit;
     except
          on E: Exception do
          begin
               oConn.Rollback;
               //
               raise Exception.Create(E.Message);
          end;
     end;
end;

constructor TModelDAO<T>.Create;
begin
     FConnection := TControllerConnectionFactory.New.Connection;
     FNewThis := nil;
     //
     oConn := TFactoryFireDAC.Create(FConnection.Connection, dnSQLite);
     //
     FManager := TManagerDataSet.Create(oConn);
end;

function TModelDAO<T>.DataSet(aValue: TClientDataSet): iModelDAO<T>;
begin
     Result := Self;
     //
     FManager.AddAdapter<T>(aValue).Open<T>;
end;

destructor TModelDAO<T>.Destroy;
begin
     FManager.Free;
     //
     inherited;
end;

class function TModelDAO<T>.New: iModelDAO<T>;
begin
     Result := Self.Create;
end;

function TModelDAO<T>.Open: iModelDAO<T>;
begin
     Result := Self;
     //
     FManager.Open<T>;
end;

function TModelDAO<T>.OpenWhere(AWhere, AOrderBy: String): iModelDAO<T>;
begin
     Result := Self;
     //
     FManager.OpenWhere<T>(AWhere, AOrderBy);
end;

function TModelDAO<T>.Save: iModelDAO<T>;
begin
     Result := Self;
     //
     FManager.Save<T>(FNewThis);
     //
     Self.ApplyUpdate;
     //
     FNewThis := nil;
end;

function TModelDAO<T>._newthis: T;
begin
     if FNewThis = nil then FNewThis := FManager.Current<T>;
     //
     Result := FNewThis;
end;

function TModelDAO<T>._this: T;
begin
     Result := FManager.Current<T>;
end;

end.
