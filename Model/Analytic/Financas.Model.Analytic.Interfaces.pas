unit Financas.Model.Analytic.Interfaces;

interface

type
     iModelAnalytic= interface
          ['{5B42329C-5BF4-4BB0-B3BA-424576392402}']
          procedure RegisterPage(aVersion, aTrackingID, aClientID, aAppName, aScreenName, aDescription, aUserID, aUserAgent, aAppVersion, aScreenResolution, aSource, aReference: String);
          procedure RegisterEvent(aVersion, aTrackingID, aClientID, aCategory, aAction, aLabel, aValue: String);
     end;

implementation

end.
