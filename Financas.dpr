program Financas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Financas.View.Splash in 'View\Financas.View.Splash.pas' {ViewSplash},
  Financas.View.Login in 'View\Financas.View.Login.pas' {ViewLogin},
  Financas.View.Principal in 'View\Financas.View.Principal.pas' {ViewPrincipal},
  Financas.View.Modelo in 'View\Financas.View.Modelo.pas' {ViewModelo},
  Financas.View.Cliente in 'View\Financas.View.Cliente.pas' {ViewCliente},
  Financas.View.Produto in 'View\Financas.View.Produto.pas' {ViewProduto},
  Financas.View.Sobre in 'View\Financas.View.Sobre.pas' {ViewSobre},
  Financas.View.Conexao in 'View\Financas.View.Conexao.pas' {ViewConexao},
  Financas.View.Dashboard in 'View\Financas.View.Dashboard.pas' {ViewDashboard: TFrame},
  Financas.View.Dialog in 'View\Financas.View.Dialog.pas' {ViewDialog},
  Financas.Controller.Entity in 'Controller\Entity\Financas.Controller.Entity.pas',
  Financas.Controller.ApplicationInfo.Factory in 'Controller\Application\Financas.Controller.ApplicationInfo.Factory.pas',
  Financas.Controller.ApplicationInfo.Interfaces in 'Controller\Application\Financas.Controller.ApplicationInfo.Interfaces.pas',
  Financas.Controller.IniFile.Factory in 'Controller\IniFile\Financas.Controller.IniFile.Factory.pas',
  Financas.Controller.IniFile.Interfaces in 'Controller\IniFile\Financas.Controller.IniFile.Interfaces.pas',
  Financas.Controller.Form.Default in 'Controller\Form\Financas.Controller.Form.Default.pas',
  Financas.Controller.Form.Interfaces in 'Controller\Form\Financas.Controller.Form.Interfaces.pas',
  Financas.Controller.Listbox.Clientes in 'Controller\Menu\Financas.Controller.Listbox.Clientes.pas',
  Financas.Controller.Listbox.Default in 'Controller\Menu\Financas.Controller.Listbox.Default.pas',
  Financas.Controller.Listbox.Factory in 'Controller\Menu\Financas.Controller.Listbox.Factory.pas',
  Financas.Controller.Listbox.Interfaces in 'Controller\Menu\Financas.Controller.Listbox.Interfaces.pas',
  Financas.Controller.Listbox.Principal in 'Controller\Menu\Financas.Controller.Listbox.Principal.pas',
  Financas.Controller.Listbox.Produtos in 'Controller\Menu\Financas.Controller.Listbox.Produtos.pas',
  Financas.Controller.Listbox.Itens.Cliente in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Cliente.pas',
  Financas.Controller.Listbox.Itens.Default in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Default.pas',
  Financas.Controller.Listbox.Itens.Factory in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Factory.pas',
  Financas.Controller.Listbox.Itens.Produto in 'Controller\Menu\Item\Financas.Controller.Listbox.Itens.Produto.pas',
  Financas.Controller.Entity.Interfaces in 'Controller\Entity\Financas.Controller.Entity.Interfaces.pas',
  Financas.Controller.Entities in 'Controller\Entity\Financas.Controller.Entities.pas',
  Financas.Controller.Exception in 'Controller\Exception\Financas.Controller.Exception.pas',
  Financas.Controller.Analytic.Factory in 'Controller\Analytic\Financas.Controller.Analytic.Factory.pas',
  Financas.Controller.Analytic.Interfaces in 'Controller\Analytic\Financas.Controller.Analytic.Interfaces.pas',
  Financas.Controller.Login in 'Controller\Login\Financas.Controller.Login.pas',
  Financas.Controller.Login.Interfaces in 'Controller\Login\Financas.Controller.Login.Interfaces.pas',
  Financas.Controller.Connection.Interfaces in 'Controller\Connection\Financas.Controller.Connection.Interfaces.pas',
  Financas.Controller.Connection.Factory in 'Controller\Connection\Financas.Controller.Connection.Factory.pas',
  Financas.Model.ApplicationInfo in 'Model\Application\Financas.Model.ApplicationInfo.pas',
  Financas.Model.Entity.Cliente in 'Model\Entity\Financas.Model.Entity.Cliente.pas',
  Financas.Model.Entity.Contrato in 'Model\Entity\Financas.Model.Entity.Contrato.pas',
  Financas.Model.Entity.ContratoParcela in 'Model\Entity\Financas.Model.Entity.ContratoParcela.pas',
  Financas.Model.Entity.Produto in 'Model\Entity\Financas.Model.Entity.Produto.pas',
  Financas.Model.Connection.Interfaces in 'Model\Connection\Financas.Model.Connection.Interfaces.pas',
  Financas.Model.ApplicationInfo.Interfaces in 'Model\Application\Financas.Model.ApplicationInfo.Interfaces.pas',
  Financas.Model.IniFile.Interfaces in 'Model\IniFile\Financas.Model.IniFile.Interfaces.pas',
  Financas.Model.IniFile in 'Model\IniFile\Financas.Model.IniFile.pas',
  Financas.Model.DAO in 'Model\DAO\Financas.Model.DAO.pas',
  Financas.Model.DAO.Interfaces in 'Model\DAO\Financas.Model.DAO.Interfaces.pas',
  Financas.Model.Connection in 'Model\Connection\Financas.Model.Connection.pas',
  Financas.Model.LogFile.Interfaces in 'Model\LogFile\Financas.Model.LogFile.Interfaces.pas',
  Financas.Model.LogFile in 'Model\LogFile\Financas.Model.LogFile.pas',
  Financas.Model.Analytic in 'Model\Analytic\Financas.Model.Analytic.pas',
  Financas.Model.Analytic.Interfaces in 'Model\Analytic\Financas.Model.Analytic.Interfaces.pas',
  Financas.Model.Command in 'Model\Command\Financas.Model.Command.pas',
  Financas.Model.Command.Interfaces in 'Model\Command\Financas.Model.Command.Interfaces.pas',
  Financas.Controller.Command.Factory in 'Controller\Command\Financas.Controller.Command.Factory.pas',
  Financas.Controller.Command.Interfaces in 'Controller\Command\Financas.Controller.Command.Interfaces.pas',
  Financas.Controller.Dialog in 'Controller\Dialog\Financas.Controller.Dialog.pas',
  Financas.Model.Entity.Usuario in 'Model\Entity\Financas.Model.Entity.Usuario.pas';

{$R *.res}

begin
     ReportMemoryLeaksOnShutdown := DebugHook <> 0;
     //
     Application.Initialize;
     //
     ViewSplash := TViewSplash.Create(nil);
     ViewSplash.ShowModal;
     //
     Application.ProcessMessages;
     //
     ViewLogin := TViewLogin.Create(nil);
     ViewLogin.ShowModal;
     //
     Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TViewDialog, ViewDialog);
  Application.Run;
end.
