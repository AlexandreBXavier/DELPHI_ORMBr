unit Financas.Controller.Listbox.Clientes;

interface

uses Financas.Controller.Listbox.Interfaces, System.Classes;

type
     TControllerListboxClientes = class(TInterfacedObject, iControllerListboxMenu)
     private
          FContainer: TComponent;
     public
          constructor Create(Container: TComponent);
          destructor Destroy; override;
          class function New(Container: TComponent): iControllerListboxMenu;
          procedure Exibir;
     end;

implementation

{ TControllerListboxClientes }

uses Financas.Controller.Listbox.Factory, Financas.Controller.Listbox.Itens.Factory;

constructor TControllerListboxClientes.Create(Container: TComponent);
begin
     FContainer := Container;
end;

destructor TControllerListboxClientes.Destroy;
begin
     inherited;
end;

procedure TControllerListboxClientes.Exibir;
begin
     TControllerListboxFactory.New
          .Default(FContainer)
          .AddItem(TControllerListboxItensFactory.New.Produto.Show)
          .Exibir;
end;

class function TControllerListboxClientes.New(Container: TComponent): iControllerListboxMenu;
begin
     Result := Self.Create(Container);
end;

end.
