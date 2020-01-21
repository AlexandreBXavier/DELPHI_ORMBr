unit Financas.Model.Entity.contratoparcela;

interface

uses
     DB, Classes, SysUtils, Generics.Collections,

     /// orm
     Financas.Model.Entity.contrato,
     ormbr.types.blob,
     ormbr.types.lazy,
     ormbr.types.mapping,
     ormbr.types.nullable,
     ormbr.mapping.Classes,
     ormbr.mapping.register,
     ormbr.mapping.attributes;

type

     [Entity]
     [Table('ContratoParcela', '')]
     [PrimaryKey('IDCONTRATO, PARCELA', NotInc, NoSort, False, 'Chave prim�ria')]
     TContratoParcela = class
     private
          { Private declarations }
          FIDCONTRATO: Integer;
          FPARCELA: Integer;
          FVENCIMENTO: TDateTime;
          FCOBRADO: Integer;
          FRECEBIDO: nullable<Integer>;
          FPAGAMENTO: nullable<TDateTime>;

          FContrato_0: TContrato;
     public
          { Public declarations }
          constructor Create;
          destructor Destroy; override;
          [Restrictions([NotNull])]
          [Column('IDCONTRATO', ftInteger)]
          [ForeignKey('FK_0', 'IDCONTRATO', 'Contrato', 'ID', SetNull, SetNull)]
          [Dictionary('IDCONTRATO', 'Mensagem de valida��o', '', '', '', taCenter)]
          property IDCONTRATO: Integer read FIDCONTRATO write FIDCONTRATO;

          [Restrictions([NotNull])]
          [Column('PARCELA', ftInteger)]
          [Dictionary('PARCELA', 'Mensagem de valida��o', '', '', '', taCenter)]
          property PARCELA: Integer read FPARCELA write FPARCELA;

          [Restrictions([NotNull])]
          [Column('VENCIMENTO', ftDateTime)]
          [Dictionary('VENCIMENTO', 'Mensagem de valida��o', 'Date', '', '!##/##/####;1;_', taCenter)]
          property VENCIMENTO: TDateTime read FVENCIMENTO write FVENCIMENTO;

          [Restrictions([NotNull])]
          [Column('COBRADO', ftInteger)]
          [Dictionary('COBRADO', 'Mensagem de valida��o', '', '', '', taCenter)]
          property COBRADO: Integer read FCOBRADO write FCOBRADO;

          [Column('RECEBIDO', ftInteger)]
          [Dictionary('RECEBIDO', 'Mensagem de valida��o', '', '', '', taCenter)]
          property RECEBIDO: nullable<Integer> read FRECEBIDO write FRECEBIDO;

          [Column('PAGAMENTO', ftDateTime)]
          [Dictionary('PAGAMENTO', 'Mensagem de valida��o', '', '', '', taCenter)]
          property PAGAMENTO: nullable<TDateTime> read FPAGAMENTO write FPAGAMENTO;

          [Association(OneToOne, 'IDCONTRATO', 'Contrato', 'ID')]
          property contrato: TContrato read FContrato_0 write FContrato_0;

     end;

implementation

constructor TContratoParcela.Create;
begin
     FContrato_0 := TContrato.Create;
end;

destructor TContratoParcela.Destroy;
begin
     if Assigned(FContrato_0) then
          FContrato_0.Free;

     inherited;
end;

initialization

TRegisterClass.RegisterEntity(TContratoParcela)

end.
