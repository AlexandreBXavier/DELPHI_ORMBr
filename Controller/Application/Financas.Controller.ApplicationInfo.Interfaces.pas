unit Financas.Controller.ApplicationInfo.Interfaces;

interface

type
     iControllerApplicationInfoFactory = interface
          ['{CAAF492F-F49F-4E81-96A6-5BAEE1974DC9}']
          function CompanyName: String;
          function FileDescription: String;
          function FileVersion: String;
          function InternalName: String;
          function LegalCopyRight: String;
          function LegalTradeMarks: String;
          function OriginalFileName: String;
          function ProductName: String;
          function ProductVersion: String;
          function Comments: String;
     end;

implementation

end.
