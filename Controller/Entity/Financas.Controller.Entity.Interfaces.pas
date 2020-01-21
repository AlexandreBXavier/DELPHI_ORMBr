unit Financas.Controller.Entity.Interfaces;

interface

uses Financas.Model.DAO.Interfaces, Financas.Model.Entity.Cliente, Financas.Model.Entity.Contrato, Financas.Model.Entity.ContratoParcela, Financas.Model.Entity.Produto, Financas.Model.Entity.Usuario;

type
     iControllerEntity = interface
          ['{F85C20BF-09EE-4D9E-9C33-2294AB313A58}']
          function Cliente: iModelDAO<TCliente>;
          function Contrato: iModelDAO<TContrato>;
          function ContratoParcela: iModelDAO<TContratoParcela>;
          function Produto: iModelDAO<TProduto>;
          function Usuario: iModelDAO<TUsuario>;
     end;

     iControllerEntities = interface
          ['{5AEECCC7-FC44-48DD-9673-E201D119CAB4}']
          function Entities: iControllerEntity;
     end;

implementation

end.
