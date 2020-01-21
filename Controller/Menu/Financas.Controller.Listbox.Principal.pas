unit Financas.Controller.Listbox.Principal;

interface

uses Financas.Controller.Listbox.Interfaces, System.Classes, FMX.Listbox, FMX.Types;

type
     TControllerListboxPrincipal = class(TInterfacedObject, iControllerListboxMenu)
     private
          FContainer: TComponent;
     public
          constructor Create(Container: TComponent);
          destructor Destroy; override;
          class function New(Container: TComponent): iControllerListboxMenu;
          procedure Exibir;
     end;

implementation

uses Financas.Controller.Listbox.Factory, Financas.Controller.Listbox.Itens.Factory;

{ TControllerListboxPrincipal }

constructor TControllerListboxPrincipal.Create(Container: TComponent);
begin
     FContainer := Container;
end;

destructor TControllerListboxPrincipal.Destroy;
begin
     inherited;
end;

procedure TControllerListboxPrincipal.Exibir;
begin
     TControllerListboxFactory.New
                    .Default(FContainer)
                    .AddItem(TControllerListboxItensFactory.New.Cliente.Show)
                    .AddItem(TControllerListboxItensFactory.New.Produto.Show)
                    .Exibir;
end;

class function TControllerListboxPrincipal.New(Container: TComponent): iControllerListboxMenu;
begin
     Result := Self.Create(Container);
end;

end.
