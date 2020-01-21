unit Financas.Controller.Connection.Interfaces;

interface

uses Data.DB, Financas.Model.Connection.Interfaces;

type

     iControllerConnectionFactory = interface
          ['{5EBF8D54-0A15-4A32-A123-D78C2DEF7E98}']
          function Connection: iModelConnection;
          function SQL(SQLCommand: String): TDataSet;
     end;

implementation

end.
