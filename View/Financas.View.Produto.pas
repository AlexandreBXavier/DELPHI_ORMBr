unit Financas.View.Produto;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.StdCtrls, Financas.View.Modelo, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid,
     Data.Bind.DBScope, Data.DB, FMX.Edit, FMX.Layouts, FMX.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Financas.Controller.Entity.Interfaces, FMX.TabControl, Datasnap.DBClient;

type
     TViewProduto = class(TViewModelo)
          ButtonException: TButton;
          procedure ButtonEditorClick(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          procedure ButtonFindClick(Sender: TObject);
          procedure ButtonExceptionClick(Sender: TObject);
          procedure BindNavigatorClick(Sender: TObject; Button: TNavigateButton);
     private
          { Private declarations }
          FControllerEntities: iControllerEntities;
     public
          { Public declarations }
     end;

var
     ViewProduto: TViewProduto;

implementation

{$R *.fmx}

uses Financas.Controller.Analytic.Factory, Financas.Controller.Entities;

procedure TViewProduto.ButtonExceptionClick(Sender: TObject);
var
     Contador: Integer;
begin
     TControllerAnalyticFactory.New.GetEvent('Erro', 'Erro na conversão', Name);
     //
     try
          Contador := StrToInt('A');
     except
          raise Exception.Create('Erro na conversão');
     end;
end;

procedure TViewProduto.ButtonFindClick(Sender: TObject);
begin
     inherited;
     //
     if EditFind.Text = '' then
     begin
          FControllerEntities.Entities.Produto.DataSet(CDSLocal).Open;
     end
     else
     begin
          FControllerEntities.Entities.Produto.DataSet(CDSLocal).OpenWhere('DESCRICAO LIKE ' + QuotedStr('%' + EditFind.Text + '%'), 'DESCRICAO');
     end;
     //
     if Assigned(CDSLocal) then
     begin
          StringGrid.Columns[0].Visible := False;
          //
          StringGrid.SetFocus;
     end;
end;

procedure TViewProduto.FormCreate(Sender: TObject);
begin
     inherited;
     //
     FControllerEntities := TControllerEntities.New;
end;

procedure TViewProduto.BindNavigatorClick(Sender: TObject; Button: TNavigateButton);
begin
     if (Button = TNavigateButton.nbPost) or (Button = TNavigateButton.nbDelete) then
          FControllerEntities.Entities.Produto.ApplyUpdate;
end;

procedure TViewProduto.ButtonEditorClick(Sender: TObject);
begin
     with FControllerEntities.Entities.Produto._newthis do
     begin
          DESCRICAO := 'Nova informação';
     end;
     //
     FControllerEntities.Entities.Produto.Save;
end;

initialization

RegisterFmxClasses([TViewProduto]);

end.
