unit Financas.Controller.Listbox.Itens.Produto;

interface

uses Financas.Controller.Listbox.Interfaces, Financas.Controller.Form.Interfaces, FMX.Listbox, System.Classes, FMX.Types;

type
     TControllerListboxItensProduto = class(TInterfacedObject, iControllerListboxItensForm)
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxItensForm;
          function Show: TFMXObject;
          procedure OnClick(Sender: TObject);
     end;

implementation

uses Financas.Controller.Listbox.Itens.Factory, Financas.Controller.Form.Default;

{ TControllerListboxItensProduto }

constructor TControllerListboxItensProduto.Create;
begin

end;

destructor TControllerListboxItensProduto.Destroy;
begin
     inherited;
end;

class function TControllerListboxItensProduto.New: iControllerListboxItensForm;
begin
     Result := Self.Create;
end;

procedure TControllerListboxItensProduto.OnClick(Sender: TObject);
begin
     TControllerFormDefault.CreateForm('TViewProduto');
end;

function TControllerListboxItensProduto.Show: TFMXObject;
begin
     Result := TControllerListboxItensFactory.New
                    .Default
                    .Name('btnProduto')
                    .FontColor('White')
                    .StyleLookup('listboxitemlabel')
                    .Text('Produtos')
                    .OnClick(OnClick)
                    .Item;
end;

end.
