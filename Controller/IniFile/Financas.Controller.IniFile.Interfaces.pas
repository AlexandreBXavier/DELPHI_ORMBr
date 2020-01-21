unit Financas.Controller.IniFile.Interfaces;

interface

type
     iControllerIniFileFactory = interface
          ['{71ABF879-779C-4012-94EC-422E06133ACF}']
          function Database: String;
          function UserName: String;
          function Password: String;
          function DriverID: String;
          function Server: String;
          function Port: String;
          procedure SetDatabase(const Value: String);
          procedure SetUserName(const Value: String);
          procedure SetPassword(const Value: String);
          procedure SetDriverID(const Value: String);
          procedure SetServer(const Value: String);
          procedure SetPort(const Value: String);
     end;

implementation

end.
