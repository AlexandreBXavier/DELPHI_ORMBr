unit Financas.Model.Entity.Usuario;

interface

uses
     DB, Classes, SysUtils, Generics.Collections,
     /// orm
     ormbr.types.blob, ormbr.types.lazy, ormbr.types.mapping, ormbr.types.nullable, ormbr.mapping.Classes, ormbr.mapping.register, ormbr.mapping.attributes;

type
     [Entity]
     [Table('Usuario', '')]
     [PrimaryKey('idUsuario', NotInc, NoSort, False, 'Chave prim�ria')]
     TUsuario = class
     private
          { Private declarations }
          FidUsuario: nullable<Integer>;
          FnomeUsuario: nullable<String>;
          FnomeLogin: nullable<String>;
          FnomeSenha: nullable<String>;
          FativoUsuario: nullable<Boolean>;
     public
          { Public declarations }
          [Column('idUsuario', ftInteger)]
          [Dictionary('idUsuario', 'Mensagem de valida��o', '', '', '', taCenter)]
          property idUsuario: nullable<Integer> read FidUsuario write FidUsuario;

          [Column('nomeUsuario', ftString, 100)]
          [Dictionary('nomeUsuario', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
          property nomeUsuario: nullable<String> read FnomeUsuario write FnomeUsuario;

          [Column('nomeLogin', ftString, 30)]
          [Dictionary('nomeLogin', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
          property nomeLogin: nullable<String> read FnomeLogin write FnomeLogin;

          [Column('nomeSenha', ftString, 30)]
          [Dictionary('nomeSenha', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
          property nomeSenha: nullable<String> read FnomeSenha write FnomeSenha;

          [Column('ativoUsuario', ftBoolean)]
          [Dictionary('ativoUsuario', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
          property ativoUsuario: nullable<Boolean> read FativoUsuario write FativoUsuario;
     end;

implementation

initialization

TRegisterClass.RegisterEntity(TUsuario)

end.
