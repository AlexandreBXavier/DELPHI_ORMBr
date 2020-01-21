unit Financas.Model.Entity.contrato;

interface

uses
     DB, Classes, SysUtils, Generics.Collections,

     /// orm
     Financas.Model.Entity.cliente,
     ormbr.types.blob,
     ormbr.types.lazy,
     ormbr.types.mapping,
     ormbr.types.nullable,
     ormbr.mapping.Classes,
     ormbr.mapping.register,
     ormbr.mapping.attributes;

type

     [Entity]
     [Table('Contrato', '')]
     [PrimaryKey('ID', NotInc, NoSort, False, 'Chave primária')]
     TContrato = class
     private
          { Private declarations }
          FID: Integer;
          FIDCLIENTE: Integer;
          FDATA: TDateTime;
          FOBSERVACAO: nullable<String>;

          FCliente_0: TCliente;
     public
          { Public declarations }
          constructor Create;
          destructor Destroy; override;
          [Restrictions([NotNull])]
          [Column('ID', ftInteger)]
          [Dictionary('ID', 'Mensagem de validação', '', '', '', taCenter)]
          property ID: Integer read FID write FID;

          [Restrictions([NotNull])]
          [Column('IDCLIENTE', ftInteger)]
          [ForeignKey('FK_0', 'IDCLIENTE', 'Cliente', 'ID', SetNull, SetNull)]
          [Dictionary('IDCLIENTE', 'Mensagem de validação', '', '', '', taCenter)]
          property IDCLIENTE: Integer read FIDCLIENTE write FIDCLIENTE;

          [Restrictions([NotNull])]
          [Column('DATA', ftDateTime)]
          [Dictionary('DATA', 'Mensagem de validação', 'Date', '', '!##/##/####;1;_', taCenter)]
          property DATA: TDateTime read FDATA write FDATA;

          [Column('OBSERVACAO', ftString, 400)]
          [Dictionary('OBSERVACAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
          property OBSERVACAO: nullable<String> read FOBSERVACAO write FOBSERVACAO;

          [Association(OneToOne, 'IDCLIENTE', 'Cliente', 'ID')]
          property cliente: TCliente read FCliente_0 write FCliente_0;

     end;

implementation

constructor TContrato.Create;
begin
     FCliente_0 := TCliente.Create;
end;

destructor TContrato.Destroy;
begin
     if Assigned(FCliente_0) then
          FCliente_0.Free;

     inherited;
end;

initialization

TRegisterClass.RegisterEntity(TContrato)

end.
