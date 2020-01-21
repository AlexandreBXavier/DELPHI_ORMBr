unit Financas.Controller.Listbox.Itens.Default;

interface

uses Financas.Controller.Listbox.Interfaces, FMX.Listbox, System.Classes, FMX.Types, System.UITypes, System.UIConsts;

type
     TControllerListboxItensDefault = class(TInterfacedObject, iControllerListboxItensDefault)
     private
          FListboxItem: TListboxItem;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerListboxItensDefault;
          function Name(Value: String): iControllerListboxItensDefault;
          function Text(Value: String): iControllerListboxItensDefault;
          function StyleLookup(Value: String): iControllerListboxItensDefault;
          function FontColor(Value: String): iControllerListboxItensDefault;
          function OnClick(Value: TNotifyEvent): iControllerListboxItensDefault;
          function Item: TFMXObject;
     end;

implementation

{ TControllerListBoxItensDefault }

constructor TControllerListboxItensDefault.Create;
begin
     FListboxItem := TListboxItem.Create(nil);
     FListboxItem.Name := 'btnDefault';
     FListboxItem.Text := 'Default';
end;

destructor TControllerListboxItensDefault.Destroy;
begin
     inherited;
end;

function TControllerListboxItensDefault.FontColor(Value: String): iControllerListboxItensDefault;
begin
     Result := Self;
     //
     if Value = 'White' then FListboxItem.TextSettings.FontColor := claWhite;
     //
     if Value = 'Black' then FListboxItem.TextSettings.FontColor := claBlack;
end;

function TControllerListboxItensDefault.Item: TFMXObject;
begin
     Result := FListboxItem;
end;

function TControllerListboxItensDefault.Name(Value: String): iControllerListboxItensDefault;
begin
     Result := Self;
     //
     FListboxItem.Name := Value;
end;

class function TControllerListboxItensDefault.New: iControllerListboxItensDefault;
begin
     Result := Self.Create;
end;

function TControllerListboxItensDefault.OnClick(Value: TNotifyEvent): iControllerListboxItensDefault;
begin
     Result := Self;
     //
     FListboxItem.OnClick := Value;
end;

function TControllerListboxItensDefault.StyleLookup(Value: String): iControllerListboxItensDefault;
begin
     Result := Self;
     //
     FListboxItem.StyleLookup := Value;
end;

function TControllerListboxItensDefault.Text(Value: String): iControllerListboxItensDefault;
begin
     Result := Self;
     //
     FListboxItem.Text := Value;
end;

end.
