unit Financas.Model.Connection.Interfaces;

interface

uses Data.DB, Datasnap.DBClient;

type
     iModelConnection = interface
          ['{50A4403C-7DBF-48E7-AE77-9368249643ED}']
          function Connection: TCustomConnection;
          function SQL(SQLCommand: String): TDataSet;
     end;

implementation

end.
