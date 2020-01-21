unit Financas.Controller.Analytic.Interfaces;

interface

type

     iControllerAnalyticFactory = interface
          ['{FBA98A86-C948-4155-B37B-7B01232160D4}']
          procedure GetPage(aScreenName, aDescription: String);
          procedure GetEvent(aCategory, aAction, aLabel: String);
     end;

implementation

end.
