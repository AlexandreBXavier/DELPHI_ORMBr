unit Financas.Controller.Listbox.Default;

interface

uses Financas.Controller.Listbox.Interfaces, System.Classes, FMX.Listbox, FMX.Types;

type
     TControllerListboxDefault = class(TInterfacedObject, iControllerListboxDefault)
     private
          FContainer: TComponent;
          FListbox: TListbox;
     public
          constructor Create(Container: TComponent);
          destructor Destroy; override;
          class function New(Container: TComponent): iControllerListboxDefault;
          function Name(Value: String): iControllerListboxDefault;
          function Align(Value: TAlignlayout): iControllerListboxDefault;
          function ItemHeight(Value: Integer): iControllerListboxDefault;
          function AddItem(Value: TFMXobject): iControllerListboxDefault;
          function Lista: TFMXObject;
          procedure Exibir;
     end;

implementation

uses FMX.Layouts;

{ TControllerListboxDefault }

function TControllerListboxDefault.AddItem(Value: TFMXObject): iControllerListboxDefault;
begin
     Result := Self;
     //
     FListbox.AddObject(Value);
end;

function TControllerListboxDefault.Align(Value: TAlignlayout): iControllerListboxDefault;
begin
     Result := Self;
     //
     FListbox.Align := Value;
end;

constructor TControllerListboxDefault.Create(Container: TComponent);
begin
     FContainer := Container;
     //
     FListbox := TListbox.Create(nil);
     FListbox.Name := 'ListaDefault';
     FListbox.Align := TAlignlayout.Client;
     FListbox.ItemHeight := 60;
     FListbox.StyleLookup := 'transparentlistboxstyle';
end;

destructor TControllerListboxDefault.Destroy;
begin
     inherited;
end;

procedure TControllerListboxDefault.Exibir;
begin
     TLayout(FContainer).AddObject(FListbox);
end;

function TControllerListboxDefault.ItemHeight(Value: Integer): iControllerListboxDefault;
begin
     Result := Self;
     //
     FListbox.ItemHeight := Value;
end;

function TControllerListboxDefault.Lista: TFMXObject;
begin
     Result := FListbox;
end;

function TControllerListboxDefault.Name(Value: String): iControllerListboxDefault;
begin
     Result := Self;
     //
     FListbox.Name := Value;
end;

class function TControllerListboxDefault.New(Container: TComponent): iControllerListboxDefault;
begin
     Result := Self.Create(Container);
end;

end.
