unit Financas.Controller.Listbox.Itens.Factory;

interface

uses Financas.Controller.Listbox.Interfaces, Financas.Controller.Form.Interfaces;

type
     TControllerListboxItensFactory = class(TInterfacedObject, iControllerListboxItensFactory)
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxItensFactory;
          function Default: iControllerListboxItensDefault;
          function Cliente: iControllerListboxItensForm;
          function Produto: iControllerListboxItensForm;
     end;

implementation

uses Financas.Controller.Listbox.Itens.Default, Financas.Controller.Listbox.Itens.Cliente, Financas.Controller.Listbox.Itens.Produto;

{ TControllerListboxItensFactory }

function TControllerListboxItensFactory.Cliente: iControllerListboxItensForm;
begin
     Result := TControllerListboxItensCliente.New;
end;

constructor TControllerListboxItensFactory.Create;
begin

end;

function TControllerListboxItensFactory.Default: iControllerListboxItensDefault;
begin
     Result := TControllerListboxItensDefault.New;
end;

destructor TControllerListboxItensFactory.Destroy;
begin
     inherited;
end;

class function TControllerListboxItensFactory.New: iControllerListboxItensFactory;
begin
     Result := Self.Create;
end;

function TControllerListboxItensFactory.Produto: iControllerListboxItensForm;
begin
     Result := TControllerListboxItensProduto.New;
end;

end.
