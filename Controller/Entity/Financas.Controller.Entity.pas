unit Financas.Controller.Entity;

interface

uses Financas.Controller.Entity.Interfaces, Financas.Model.DAO.Interfaces, Financas.Model.Entity.Cliente, Financas.Model.Entity.Contrato, Financas.Model.Entity.ContratoParcela, Financas.Model.Entity.Produto, Financas.Model.Entity.Usuario;

type
     TControllerEntity = class(TInterfacedObject, iControllerEntity)
     private
          FCliente: iModelDAO<TCliente>;
          FProduto: iModelDAO<TProduto>;
          FContrato: iModelDAO<TContrato>;
          FContratoParcela: iModelDAO<TContratoParcela>;
          FUsuario: iModelDAO<TUsuario>;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerEntity;
          function Cliente: iModelDAO<TCliente>;
          function Contrato: iModelDAO<TContrato>;
          function ContratoParcela: iModelDAO<TContratoParcela>;
          function Produto: iModelDAO<TProduto>;
          function Usuario: iModelDAO<TUsuario>;
     end;

implementation

uses Financas.Model.DAO;

{ TControllerEntity }

function TControllerEntity.Cliente: iModelDAO<TCliente>;
begin
     if not Assigned(FCliente) then FCliente := TModelDAO<TCliente>.New;
     //
     Result := FCliente;
end;

function TControllerEntity.Contrato: iModelDAO<TContrato>;
begin
     if not Assigned(FContrato) then FContrato := TModelDAO<TContrato>.New;
     //
     Result := FContrato;
end;

function TControllerEntity.ContratoParcela: iModelDAO<TContratoParcela>;
begin
     if not Assigned(FContratoParcela) then FContratoParcela := TModelDAO<TContratoParcela>.New;
     //
     Result := FContratoParcela;
end;

constructor TControllerEntity.Create;
begin
     //
end;

destructor TControllerEntity.Destroy;
begin
     inherited;
end;

class function TControllerEntity.New: iControllerEntity;
begin
     Result := Self.Create;
end;

function TControllerEntity.Produto: iModelDAO<TProduto>;
begin
     if not Assigned(FProduto) then FProduto := TModelDAO<TProduto>.New;
     //
     Result := FProduto;
end;

function TControllerEntity.Usuario: iModelDAO<TUsuario>;
begin
     if not Assigned(FUsuario) then FUsuario := TModelDAO<TUsuario>.New;
     //
     Result := FUsuario;
end;

end.
