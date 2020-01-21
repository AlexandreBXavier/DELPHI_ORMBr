unit Financas.Controller.Command.Factory;

interface

uses Financas.Controller.Command.Interfaces, Financas.Model.Command;

type
     TControllerCommandFactory = class(TInterfacedObject, iControllerCommandFactory)
     private
          //
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerCommandFactory;
          function Dashboard: String;
     end;

implementation

{ TControllerCommandFactory }

uses Financas.Model.Command.Interfaces;


constructor TControllerCommandFactory.Create;
begin
     //
end;

function TControllerCommandFactory.Dashboard: String;
begin
     Result := TModelCommand.New.Dashboard;
end;

destructor TControllerCommandFactory.Destroy;
begin
     inherited;
end;

class function TControllerCommandFactory.New: iControllerCommandFactory;
begin
     Result := Self.Create;
end;

end.
