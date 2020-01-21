unit Financas.Controller.Listbox.Interfaces;

interface

uses
     System.Classes, FMX.Types, Financas.Controller.Form.Interfaces;

type
     iControllerListboxItensDefault = interface;
     iControllerListboxDefault = interface;

     iControllerListboxMenu = interface
          ['{259EE633-DE95-464C-8A8F-218FBBEBA64A}']
          procedure Exibir;
     end;

     iControllerListboxItensFactory = interface
          ['{C2594544-AD66-4F60-8BEE-FF43F58210B0}']
          function Default: iControllerListboxItensDefault;
          function Cliente: iControllerListboxItensForm;
          function Produto: iControllerListboxItensForm;
     end;

     iControllerListboxFactory = interface
          ['{BD946BB0-3AA0-4F62-8323-3D9995592331}']
          function Default(Container: TComponent): iControllerListboxDefault;
          function Principal(Container: TComponent): iControllerListboxMenu;
          function Produtos(Container: TComponent): iControllerListboxMenu;
          function Clientes(Container: TComponent): iControllerListboxMenu;
     end;

     iControllerListboxItensDefault = interface
          ['{6D81B601-2E7B-4E92-BF5F-723EBAB09EB5}']
          function Name(Value: String): iControllerListboxItensDefault;
          function Text(Value: String): iControllerListboxItensDefault;
          function StyleLookup(Value: String): iControllerListboxItensDefault;
          function FontColor(Value: String): iControllerListboxItensDefault;
          function OnClick(Value: TNotifyEvent): iControllerListboxItensDefault;
          function Item: TFMXObject;
     end;

     iControllerListboxDefault = interface
          ['{CB4EA7BB-65B7-4637-B48F-4790AB28F887}']
          function Name(Value: String): iControllerListboxDefault;
          function Align(Value: TAlignlayout): iControllerListboxDefault;
          function ItemHeight(Value: Integer): iControllerListboxDefault;
          function AddItem(Value: TFMXobject): iControllerListboxDefault;
          function Lista: TFMXObject;
          procedure Exibir;
     end;

implementation

end.
