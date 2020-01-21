unit Financas.Controller.Connection.Factory;

interface

uses Data.DB,
     Financas.Controller.Connection.Interfaces, Financas.Model.Connection.Interfaces;

type
     TControllerConnectionFactory = class(TInterfacedObject, iControllerConnectionFactory)
     private

     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerConnectionFactory;
          function Connection: iModelConnection;
          function SQL(SQLCommand: String): TDataSet;
     end;

implementation

uses System.SysUtils, Financas.Model.Connection;

{ TModelConnectionFactory }

function TControllerConnectionFactory.Connection: iModelConnection;
begin
     Result := TModelConnection.New;
end;

constructor TControllerConnectionFactory.Create;
begin

end;

destructor TControllerConnectionFactory.Destroy;
begin
     inherited;
end;

class function TControllerConnectionFactory.New: iControllerConnectionFactory;
begin
     Result := Self.Create;
end;

function TControllerConnectionFactory.SQL(SQLCommand: String): TDataSet;
begin
     Result := TModelConnection.New.SQL(SQLCommand);
end;

end.
