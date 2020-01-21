unit Financas.View.Modelo;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Rtti, System.Bindings.Outputs, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Grid.Style, FMX.Layouts, FMX.Bind.Navigator, FMX.Grid, FMX.Bind.DBEngExt, FMX.Bind.Grid, FMX.Bind.Editors, Data.DB,
     Data.Bind.Controls, Data.Bind.Components, Data.Bind.DBScope, Data.Bind.EngExt, Data.Bind.Grid, Datasnap.DBClient, Financas.Controller.Entity.Interfaces, FMX.TabControl, Financas.View.Principal;

type
     TViewModelo = class(TForm)
          BindNavigator: TBindNavigator;
          PanelTop: TPanel;
          ButtonFind: TButton;
          EditFind: TEdit;
          LabelFind: TLabel;
          DataSource: TDataSource;
          BindSourceDB: TBindSourceDB;
          BindingsList: TBindingsList;
          TabControlDataSet: TTabControl;
          TabList: TTabItem;
          TabData: TTabItem;
          StringGrid: TStringGrid;
          LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
          CDSLocal: TClientDataSet;
          procedure FormShow(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     ViewModelo: TViewModelo;

implementation

uses Financas.Controller.Analytic.Factory;

{$R *.fmx}

procedure TViewModelo.FormShow(Sender: TObject);
begin
     TControllerAnalyticFactory.New.GetPage(Name, Caption);
end;

end.
