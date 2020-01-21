unit Financas.View.Cliente;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.StdCtrls, System.Rtti, FMX.Grid.Style, Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB,
     FMX.Edit, FMX.Layouts, FMX.Bind.Navigator, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Financas.View.Modelo, Financas.Controller.Entity.Interfaces, FMX.TabControl, Datasnap.DBClient;

type
     TViewCliente = class(TViewModelo)
          EditID: TEdit;
          EditNome: TEdit;
          EditDocumento: TEdit;
          LabelID: TLabel;
          LabelNome: TLabel;
          LabelDocumento: TLabel;
          procedure FormCreate(Sender: TObject);
          procedure ButtonFindClick(Sender: TObject);
          procedure BindNavigatorClick(Sender: TObject; Button: TNavigateButton);
     private
          { Private declarations }
     public
          { Public declarations }
          FControllerEntities: iControllerEntities;
          LinkControlToField: TLinkControlToField;
     end;

var
     ViewCliente: TViewCliente;

implementation

{$R *.fmx}

uses Financas.Controller.Entities;

procedure TViewCliente.BindNavigatorClick(Sender: TObject; Button: TNavigateButton);
begin
     inherited;
     //
     if (Button = TNavigateButton.nbPost) or (Button = TNavigateButton.nbDelete) then
          FControllerEntities.Entities.Cliente.ApplyUpdate;
end;

procedure TViewCliente.ButtonFindClick(Sender: TObject);
begin
     if EditFind.Text = '' then
     begin
          FControllerEntities.Entities.Cliente.DataSet(CDSLocal).Open;
     end
     else
     begin
          FControllerEntities.Entities.Cliente.DataSet(CDSLocal).OpenWhere('NOME LIKE ' + QuotedStr('%' + EditFind.Text + '%'), 'NOME');
     end;
     //
     if Assigned(CDSLocal) then
     begin
          StringGrid.Columns[0].Visible := False;
          //
          StringGrid.SetFocus;
     end;
end;

procedure TViewCliente.FormCreate(Sender: TObject);
begin
     inherited;
     //
     FControllerEntities := TControllerEntities.New;
     //
     LinkControlToField := TLinkControlToField.Create(Self);
     LinkControlToField.Name := 'LinkControlToFieldNOME';
     LinkControlToField.Category := 'Quick Bindings';
     LinkControlToField.DataSource := BindSourceDB;
     LinkControlToField.FieldName := 'NOME';
     LinkControlToField.Control := EditNome;
     LinkControlToField.AutoActivate := True;
     LinkControlToField.Track := True;
end;

initialization

RegisterFmxClasses([TViewCliente]);

end.
