unit Financas.Model.Entity.produto;

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
     [Table('Produto', '')]
     [PrimaryKey('ID', NotInc, NoSort, False, 'Chave primária')]
     TProduto = class
     private
          { Private declarations }
          FID: nullable<Integer>;
          FDESCRICAO: nullable<String>;
     public
          { Public declarations }
          [Column('ID', ftInteger)]
          [Dictionary('ID', 'Mensagem de validação', '', '', '', taCenter)]
          property ID: nullable<Integer> read FID write FID;

          [Column('DESCRICAO', ftString, 100)]
          [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
          property DESCRICAO: nullable<String> read FDESCRICAO write FDESCRICAO;
     end;

implementation

initialization

TRegisterClass.RegisterEntity(TProduto)

end.
