unit Financas.View.Login;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Ani, FMX.Effects, FMX.Filter.Effects;

type
     TViewLogin = class(TForm)
          LayoutMain: TLayout;
          LayoutFundo: TLayout;
          ImageBackground: TImage;
          BlurEffect: TBlurEffect;
          GloomEffect: TGloomEffect;
          RectangleBackground: TRectangle;
          ImageCompany: TImage;
          LayoutLogin: TLayout;
          RectangleLogin: TRectangle;
          LayoutButton: TLayout;
          ButtonLogin: TRectangle;
          LabelButtonLogin: TLabel;
          ShadowButtonLogin: TShadowEffect;
          ShadowButton: TShadowEffect;
          ButtonCancel: TRectangle;
          LabelButtonCancel: TLabel;
          ShadowButtonCancel: TShadowEffect;
          EditPassword: TEdit;
          EditUsername: TEdit;
          LabelCompany: TLabel;
          procedure ButtonCancelClick(Sender: TObject);
          procedure FormCreate(Sender: TObject);
          function Login(UserName, Password: String): Boolean;
          procedure ButtonLoginClick(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure FormShow(Sender: TObject);
          procedure EditPasswordKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure LabelButtonLoginClick(Sender: TObject);
     private
          { Private declarations }
          FLogin: Boolean;
          FClientID: String;
          FUserName: String;
     public
          { Public declarations }
     end;

var
     ViewLogin: TViewLogin;

implementation

uses Financas.Controller.Login, Financas.Controller.Dialog;

{$R *.fmx}

procedure TViewLogin.ButtonCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TViewLogin.ButtonLoginClick(Sender: TObject);
begin
     FUserName := EditUsername.Text;
     //
     FLogin := Login(EditUsername.Text, EditPassword.Text);
     //
     if FLogin then
     begin
          TControllerLogin.New.SetLogin(FLogin);
          TControllerLogin.New.SetUserName(FUserName);
          TControllerLogin.New.SetClientID(FClientID);
          //
          Close;
     end;
end;

procedure TViewLogin.EditPasswordKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
     if Key = 13 then
          ButtonLoginClick(Sender);
end;

procedure TViewLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := TCloseAction.caFree;
end;

procedure TViewLogin.FormCreate(Sender: TObject);
var
     Uid: TGuid;
     Result: HResult;
begin
     FLogin := False;
     //
     Result := CreateGuid(Uid);
     //
     if Result = S_OK then
          FClientID := GuidToString(Uid)
     else
          FClientID := '555';
end;

procedure TViewLogin.FormShow(Sender: TObject);
begin
     EditUsername.SetFocus;
end;

procedure TViewLogin.LabelButtonLoginClick(Sender: TObject);
begin
     //
end;

function TViewLogin.Login(UserName, Password: String): Boolean;
begin
     Result := False;
     //
     if (UserName <> '') and (Password <> '') then
          Result := TControllerLogin.New.Authentication(UserName, Password);
     //
     if not Result then
          TControllerDialog.Dialog('E', 'Usuário e Senha inválidos!')
end;

end.
