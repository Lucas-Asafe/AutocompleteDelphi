unit uCliente;

interface

uses
    uCidade,
    System.SysUtils;

type
    TCliente = class
    private
        FBairro: string;
        FUF: string;
        FCEP: string;
        FNumero: string;
        FIDCliente: Integer;
        FNome: string;
        FEndereco: string;
        FComplemento: string;
        FCidade: TCidade;
    { private declarations }
    protected
    { protected declarations }
    public
    { public declarations }
        property IDCliente: Integer read FIDCliente write FIDCliente;
        property Nome: string read FNome write FNome;
        property Endereco: string read FEndereco write FEndereco;
        property Numero: string read FNumero write FNumero;
        property Complemento: string read FComplemento write FComplemento;
        property CEP: string read FCEP write FCEP;
        property Bairro: string read FBairro write FBairro;
        property UF: string read FUF write FUF;
        property Cidade: TCidade read FCidade write FCidade;
        constructor Create;
        destructor Destroy; override;
    published
    { published declarations }
    end;

implementation

constructor TCliente.Create;
begin
    inherited;
    FCidade := TCidade.Create;
    FIDCliente := 0;
    FCidade.IDCidade := 0;
end;

destructor TCliente.Destroy;
begin
    if Assigned(FCidade) then
        FreeAndNil(FCidade);

    inherited;
end;

end.

