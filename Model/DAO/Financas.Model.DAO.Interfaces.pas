unit Financas.Model.DAO.Interfaces;

interface

uses Data.DB, Datasnap.DBClient;

type
     iModelDAO<T> = interface
          ['{5BD503C2-17E6-4B24-980C-529989E9F1EF}']
          function DataSet(aValue: TClientDataSet): iModelDAO<T>;
          function Open: iModelDAO<T>;
          function OpenWhere(AWhere, AOrderBy: String): iModelDAO<T>;
          function ApplyUpdate: iModelDAO<T>;
          function Save: iModelDAO<T>;
          function _this: T;
          function _newthis: T;
     end;

implementation

end.
