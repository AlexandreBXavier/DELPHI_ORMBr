unit Financas.Model.Command;

interface

uses Financas.Model.Command.Interfaces,
     // ORMBr
     cqlbr.interfaces, cqlbr.select.sqlite, cqlbr.serialize.sqlite, criteria.query.language;

type
     TModelCommand = class(TInterfacedObject, iModelCommand)
     private
          //
     published
          constructor Create;
          destructor Destroy; override;
          class function New: iModelCommand;
          function Dashboard: String;
     end;

implementation

{ TModelCommand }

constructor TModelCommand.Create;
begin
     //
end;

function TModelCommand.Dashboard: String;
var
     SQLCommand: String;
     DBName: TDBName;
begin
     try
          DBName := dbnSQLite;
          //
          SQLCommand := TCQL.New(DBName)
                                   .Select
                                        .Column('Vencimento').&As('LABEL')
                                        .Column('Cobrado').&As('VALUE')
                                        .Column(CQL.Q('000, 208, 194')).&As('RGB')
                                   .From('ContratoParcela')
                                   .GroupBy('Vencimento')
                                   .OrderBy('Vencimento')
                                   .AsString;
          //
          Result := SQLCommand;
     except
          Result := '';
     end;
end;

destructor TModelCommand.Destroy;
begin
     inherited;
end;

class function TModelCommand.New: iModelCommand;
begin
     Result := Self.Create;
end;

end.
