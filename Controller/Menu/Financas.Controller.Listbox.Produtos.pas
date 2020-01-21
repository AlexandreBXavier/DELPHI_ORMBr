unit Financas.Controller.Listbox.Produtos;

interface

uses Financas.Controller.Listbox.Interfaces, System.Classes;

type
     TControllerListboxProdutos = class(TInterfacedObject, iControllerListboxMenu)
     private
          FContainer: TComponent;
     public
          constructor Create(Container: TComponent);
          destructor Destroy; override;
          class function New(Container: TComponent): iControllerListboxMenu;
          procedure Exibir;
     end;

implementation

{ TControllerListboxProdutos }

uses Financas.Controller.Listbox.Factory, Financas.Controller.Listbox.Itens.Factory;

constructor TControllerListboxProdutos.Create(Container: TComponent);
begin
     FContainer := Container;
end;

destructor TControllerListboxProdutos.Destroy;
begin
     inherited;
end;

procedure TControllerListboxProdutos.Exibir;
begin
     TControllerListboxFactory.New
          .Default(FContainer)
          .AddItem(TControllerListboxItensFactory.New.Cliente.Show)
          .Exibir;
end;

class function TControllerListboxProdutos.New(Container: TComponent): iControllerListboxMenu;
begin
     Result := Self.Create(Container);
end;

end.
