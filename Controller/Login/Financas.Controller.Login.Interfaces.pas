unit Financas.Controller.Login.Interfaces;

interface

type
     iControllerLogin = interface
          ['{257CE535-6059-4ED6-ACEF-C1593D677B51}']
          procedure SetClientID(const Value: String);
          procedure SetUserName(const Value: String);
          procedure SetLogin(const Value: Boolean);
          function GetClientID: String;
          function GetUserName: String;
          function GetLogin: Boolean;
          function Authentication(Username, Password: String): Boolean;
     end;

implementation

end.
