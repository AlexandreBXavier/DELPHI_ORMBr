unit Financas.Controller.Entities;

interface

uses Financas.Controller.Entity.Interfaces, Financas.Controller.Entity;

type
     TControllerEntities  = class(TInterfacedObject, iControllerEntities)
     private
          FControllerEntity: iControllerEntity;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerEntities;
          function Entities: iControllerEntity;
     end;

implementation

{ TControllerEntities }

constructor TControllerEntities.Create;
begin
     FControllerEntity := TControllerEntity.New;
end;

destructor TControllerEntities.Destroy;
begin
     inherited;
end;

function TControllerEntities.Entities: iControllerEntity;
begin
     Result := FControllerEntity;
end;

class function TControllerEntities.New: iControllerEntities;
begin
     Result := Self.Create;
end;

end.
