unit Financas.Controller.Listbox.Factory;

interface

uses Financas.Controller.Listbox.Interfaces, System.Classes;

type
     TControllerListboxFactory = class(TInterfacedObject, iControllerListboxFactory)
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxFactory;
          function Default(Container: TComponent): iControllerListboxDefault;
          function Principal(Container: TComponent): iControllerListboxMenu;
          function Produtos(Container: TComponent): iControllerListboxMenu;
          function Clientes(Container: TComponent): iControllerListboxMenu;
     end;

implementation

uses Financas.Controller.Listbox.Default, Financas.Controller.Listbox.Principal, Financas.Controller.Listbox.Clientes, Financas.Controller.Listbox.Produtos;

{ TControllerListboxFactory }

function TControllerListboxFactory.Clientes(Container: TComponent): iControllerListboxMenu;
begin
     Result := TControllerListBoxClientes.New(Container);
end;

constructor TControllerListboxFactory.Create;
begin

end;

function TControllerListboxFactory.Default(Container: TComponent): iControllerListboxDefault;
begin
     Result := TControllerListboxDefault.New(Container);
end;

destructor TControllerListboxFactory.Destroy;
begin
     inherited;
end;

class function TControllerListboxFactory.New: iControllerListboxFactory;
begin
     Result := Self.Create;
end;

function TControllerListboxFactory.Principal(Container: TComponent): iControllerListboxMenu;
begin
     Result := TControllerListboxPrincipal.New(Container);
end;

function TControllerListboxFactory.Produtos(Container: TComponent): iControllerListboxMenu;
begin
     Result := TControllerListBoxProdutos.New(Container);
end;

end.
