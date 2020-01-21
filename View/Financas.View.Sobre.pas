unit Financas.View.Sobre;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Effects, FMX.Objects;

type
     TViewSobre = class(TForm)
          LabelSystem: TLabel;
          LabelVersion: TLabel;
          LabelCompany: TLabel;
          LabelSite: TLabel;
          procedure ButtonCancelarClick(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
     private
          procedure ReadIniFile;
          { Private declarations }
     public
          { Public declarations }
     end;

var
     ViewSobre: TViewSobre;

implementation

uses Financas.Controller.Analytic.Factory, Financas.Controller.ApplicationInfo.Factory;

{$R *.fmx}

procedure TViewSobre.ButtonCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TViewSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := TCloseAction.caFree;
end;

procedure TViewSobre.FormCreate(Sender: TObject);
begin
     Caption := TControllerApplicationInfoFactory.New.ProductName + ' - ' + Caption;
     //
     ReadIniFile;
end;

procedure TViewSobre.FormShow(Sender: TObject);
begin
     TControllerAnalyticFactory.New.GetPage(Name, Caption);
end;

procedure TViewSobre.ReadIniFile;
begin
     LabelCompany.Text := TControllerApplicationInfoFactory.New.CompanyName;
     LabelSystem.Text := TControllerApplicationInfoFactory.New.ProductName;
     LabelVersion.Text := TControllerApplicationInfoFactory.New.ProductVersion;
     LabelSite.Text := TControllerApplicationInfoFactory.New.Comments;
end;

end.
