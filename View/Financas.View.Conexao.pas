unit Financas.View.Conexao;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Effects, FMX.Objects;

type
     TViewConexao = class(TForm)
          EditDataBase: TEdit;
          EditUserName: TEdit;
          EditPassword: TEdit;
          EditDriverID: TEdit;
          EditPort: TEdit;
          EditServer: TEdit;
          ButtonGravar: TButton;
          LabelDatabase: TLabel;
          LabelUserName: TLabel;
          LabelPassword: TLabel;
          LabelDriverID: TLabel;
          LabelServer: TLabel;
          LabelPort: TLabel;
          ButtonCancelar: TButton;
          procedure ButtonGravarClick(Sender: TObject);
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
     ViewConexao: TViewConexao;

implementation

uses Financas.Controller.Analytic.Factory, Financas.Controller.IniFile.Factory, Financas.Controller.ApplicationInfo.Factory;

{$R *.fmx}

procedure TViewConexao.ButtonCancelarClick(Sender: TObject);
begin
     Close;
end;

procedure TViewConexao.ButtonGravarClick(Sender: TObject);
begin
     TControllerIniFileFactory.New.SetDatabase(EditDataBase.Text);
     TControllerIniFileFactory.New.SetUserName(EditUserName.Text);
     TControllerIniFileFactory.New.SetPassword(EditPassword.Text);
     TControllerIniFileFactory.New.SetDriverID(EditDriverID.Text);
     TControllerIniFileFactory.New.SetServer(EditServer.Text);
     TControllerIniFileFactory.New.SetPort(EditPort.Text);
end;

procedure TViewConexao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := TCloseAction.caFree;
end;

procedure TViewConexao.FormCreate(Sender: TObject);
begin
     Caption := TControllerApplicationInfoFactory.New.ProductName + ' - ' + Caption;
     //
     ReadIniFile;
end;

procedure TViewConexao.FormShow(Sender: TObject);
begin
     TControllerAnalyticFactory.New.GetPage(Name, Caption);
end;

procedure TViewConexao.ReadIniFile;
begin
     EditDataBase.Text := TControllerIniFileFactory.New.Database;
     EditUserName.Text := TControllerIniFileFactory.New.UserName;
     EditPassword.Text := TControllerIniFileFactory.New.Password;
     EditDriverID.Text := TControllerIniFileFactory.New.DriverID;
     EditServer.Text := TControllerIniFileFactory.New.Server;
     EditPort.Text := TControllerIniFileFactory.New.Port;
end;

end.
