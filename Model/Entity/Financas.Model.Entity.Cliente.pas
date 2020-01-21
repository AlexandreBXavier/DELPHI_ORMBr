unit Financas.Model.Entity.Cliente;

interface

uses
     DB, Classes, SysUtils, Generics.Collections,

     /// orm
     ormbr.types.blob,
     ormbr.types.lazy,
     ormbr.types.mapping,
     ormbr.types.nullable,
     ormbr.mapping.Classes,
     ormbr.mapping.register,
     ormbr.mapping.attributes;

type

     [Entity]
     [Table('Cliente', '')]
     [PrimaryKey('ID', NotInc, NoSort, False, 'Chave prim�ria')]
     TCliente = class
     private
          { Private declarations }
          FID: nullable<Integer>;
          FNOME: String;
          FDOCUMENTO: String;
     public
          { Public declarations }
          [Column('ID', ftInteger)]
          [Dictionary('C�digo', 'Mensagem de valida��o', '', '', '', taCenter)]
          property ID: nullable<Integer> read FID write FID;

          [Restrictions([NotNull])]
          [Column('NOME', ftString, 100)]
          [Dictionary('Nome', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
          property NOME: String read FNOME write FNOME;

          [Restrictions([NotNull])]
          [Column('DOCUMENTO', ftString, 14)]
          [Dictionary('Documento', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
          property DOCUMENTO: String read FDOCUMENTO write FDOCUMENTO;
     end;

implementation

initialization

TRegisterClass.RegisterEntity(TCliente)

end.
