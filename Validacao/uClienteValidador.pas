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
        Result.Add('Nome não informado.');

    if Cliente.Endereco = '' then
        Result.Add('Endereço não informado.');

    if Cliente.Bairro = '' then
        Result.Add('Bairro não informado.');

    if Cliente.CEP = '' then
        Result.Add('CEP não informado.');

    if Cliente.UF = '' then
        Result.Add('UF não informada.');

    if Cliente.Cidade.IDCidade = 0 then
        Result.Add('Cidade não informada.');
end;

end.

