unit uClienteValidador;

interface

uses
    uCliente,
    System.Classes;

type
    TClienteValidador = class
    public
        class function Validar(Cliente: TCliente): TStringList;
    end;

implementation

{ TClienteValidador }

class function TClienteValidador.Validar(Cliente: TCliente): TStringList;
begin
    Result := TStringList.Create;

    if Cliente.Nome = '' then
        Result.Add('Nome n�o informado.');

    if Cliente.Endereco = '' then
        Result.Add('Endere�o n�o informado.');

    if Cliente.Bairro = '' then
        Result.Add('Bairro n�o informado.');

    if Cliente.CEP = '' then
        Result.Add('CEP n�o informado.');

    if Cliente.UF = '' then
        Result.Add('UF n�o informada.');

    if Cliente.Cidade.IDCidade = 0 then
        Result.Add('Cidade n�o informada.');
end;

end.

