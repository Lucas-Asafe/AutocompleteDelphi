unit uCidade;

interface

type
    TCidade = class
    private
        FCodigo_IBGE: Integer;
        FUF: string;
        FIDCidade: Integer;
        FIsCapital: Byte;
        FNome: string;
    { private declarations }
    protected
    { protected declarations }
    public
    { public declarations }
        property IDCidade: Integer read FIDCidade write FIDCidade;
        property Nome: string read FNome write FNome;
        property UF: string read FUF write FUF;
        property IsCapital: Byte read FIsCapital write FIsCapital;
        property Codigo_IBGE: Integer read FCodigo_IBGE write FCodigo_IBGE;
    published
    { published declarations }
    end;

implementation

end.

