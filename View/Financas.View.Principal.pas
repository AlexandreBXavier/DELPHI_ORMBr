unit Financas.View.Principal;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.ListBox, FMX.TabControl;

type
     TViewPrincipal = class(TForm)
          LayoutMenu: TLayout;
          LayoutTop: TLayout;
          PanelTop: TPanel;
          ButtonDatabase: TButton;
          ButtonException: TButton;
          LayoutDashboard: TLayout;
          PanelDashboard: TPanel;
          RectangleDashboard: TRectangle;
          RectangleTop: TRectangle;
          LayoutMain: TLayout;
          LayoutUsername: TLayout;
          RectangleUsername: TRectangle;
          LabelUser: TLabel;
          LayoutMenuArea: TLayout;
          RectangleMenu: TRectangle;
          LayoutListbox: TLayout;
          ImageUser: TImage;
          RectangleListbox: TRectangle;
          StyleBookLocal: TStyleBook;
          procedure FormCreate(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure ButtonDatabaseClick(Sender: TObject);
          procedure FormDestroy(Sender: TObject);
          procedure ButtonExceptionClick(Sender: TObject);
     private
          { Private declarations }
          procedure LoadDashboard;
     public
          { Public declarations }
     end;

var
     ViewPrincipal: TViewPrincipal;

implementation

{$R *.fmx}

uses Financas.Controller.Dialog, Financas.Controller.Login, Financas.Controller.Login.Interfaces, Financas.Controller.Analytic.Factory, Financas.Controller.ApplicationInfo.Factory, Financas.Controller.ListBox.Factory, Financas.View.Conexao, Financas.View.Login, Financas.View.Dashboard, Financas.View.Sobre;

procedure TViewPrincipal.LoadDashboard;
var
     frmEmbeded: TViewDashboard;
begin
     frmEmbeded := TViewDashboard.Create(PanelDashboard);
     frmEmbeded.Parent := TFmxObject(PanelDashboard);
     frmEmbeded.Align := TAlignLayout.Client;
     //
     Application.ProcessMessages;
end;

procedure TViewPrincipal.ButtonDatabaseClick(Sender: TObject);
begin
     TControllerAnalyticFactory.New.GetEvent(TComponent(Sender).ClassName, TButton(Sender).Text, TButton(Sender).Name);
     //
     ViewConexao := TViewConexao.Create(Self);
     ViewConexao.StyleBook := StyleBookLocal;
     //
     ViewConexao.ShowModal;
end;

procedure TViewPrincipal.ButtonExceptionClick(Sender: TObject);
begin
     TControllerAnalyticFactory.New.GetEvent(TComponent(Sender).ClassName, TButton(Sender).Text, TButton(Sender).Name);
     //
     ViewSobre := TViewSobre.Create(Self);
     ViewSobre.StyleBook := StyleBookLocal;
     //
     ViewSobre.ShowModal;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if TControllerDialog.Dialog('C', 'Deseja encerrar o sistema?') then
          Action := TCloseAction.caFree
     else
          Action := TCloseAction.caNone;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
     Caption := TControllerApplicationInfoFactory.New.CompanyName;
end;

procedure TViewPrincipal.FormDestroy(Sender: TObject);
begin
     //
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
     if not TControllerLogin.New.GetLogin then
     begin
          Application.Terminate;
          //
          Exit;
     end
     else
     begin
          TControllerAnalyticFactory.New.GetPage(Name, Caption);
          //
          LabelUser.Text := TControllerLogin.New.GetUserName;
          //
          TControllerListboxFactory.New.Principal(LayoutListbox).Exibir;
          //
          LoadDashboard;
          //
          if FileExists('Financas.style') then StyleBookLocal.Resource.LoadFromFile('Financas.style');
     end;
end;

end.
