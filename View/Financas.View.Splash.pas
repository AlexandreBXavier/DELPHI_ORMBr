unit Financas.View.Splash;

interface

uses
     System.SysUtils, System.Types, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, System.UITypes, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects;

type
     TViewSplash = class(TForm)
          TimerSplash: TTimer;
          LayoutMain: TLayout;
          LabelSystem: TLabel;
          LabelVersion: TLabel;
          LabelCompany: TLabel;
          ImageBackground: TImage;
          BlurEffect: TBlurEffect;
          ShadowEffect: TShadowEffect;
          procedure FormShow(Sender: TObject);
          procedure TimerSplashTimer(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure ReadVersionInfo;
          procedure FormCreate(Sender: TObject);
     private
          { Private declarations }
          FCompanyName: String;
          FSystemName: String;
          FVersion: String;
     public
          { Public declarations }
     end;

var
     ViewSplash: TViewSplash;

implementation

{$R *.fmx}

uses Financas.Controller.ApplicationInfo.Factory;

procedure TViewSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := TCloseAction.caFree;
end;

procedure TViewSplash.FormCreate(Sender: TObject);
begin
     ReadVersionInfo;
end;

procedure TViewSplash.FormShow(Sender: TObject);
begin
     LabelCompany.Text := FCompanyName;
     LabelSystem.Text := FSystemName;
     LabelVersion.Text := FVersion;
     //
     TimerSplash.Enabled := True;
end;

procedure TViewSplash.ReadVersionInfo;
begin
     FSystemName := TControllerApplicationInfoFactory.New.ProductName;
     FCompanyName := TControllerApplicationInfoFactory.New.LegalCopyRight + ', ' + TControllerApplicationInfoFactory.New.LegalTradeMarks + '.';
     FVersion := 'Versão ' + TControllerApplicationInfoFactory.New.FileVersion;
end;

procedure TViewSplash.TimerSplashTimer(Sender: TObject);
begin
     Close;
end;

end.
