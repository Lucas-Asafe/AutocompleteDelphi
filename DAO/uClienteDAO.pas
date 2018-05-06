unit uClienteDAO;

interface

uses
    uCliente,
    classes,
    DB,
    SysUtils,
    generics.defaults,
    generics.collections,
    Dialogs,
    uDM;

type
    TClienteDAO = class
    public
        class function Inserir(tempCliente: TCliente): boolean;
        class function ListarClientesPorNome(_Nome: string): TObjectList<TCliente>;
    end;

implementation

var
    ListaCliente: TObjectList<TCliente>;

{ TClienteDAO }

class function TClienteDAO.Inserir(tempCliente: TCliente): boolean;
var
    Sql: string;
begin
    try
        Result := False;
        Sql := ' INSERT INTO cliente ' +
            ' (Nome, Endereco, Numero, CEP, Bairro, IDCidade, UF, Complemento)' +
            ' VALUES (' + QuotedStr(tempCliente.Nome) + ',' + QuotedStr(tempCliente.Endereco)
            + ',' + QuotedStr(tempCliente.Numero) + ',' + QuotedStr(tempCliente.CEP)
            + ',' + QuotedStr(tempCliente.Bairro) + ',' + IntToStr(tempCliente.Cidade.IDCidade)
            + ',' + QuotedStr(tempCliente.UF) + ',' + QuotedStr(tempCliente.Complemento)
            + ')';

        Result := DM.FDConnection.ExecSQL(Sql) > 0;
    except
        on E: Exception do
        begin
            raise Exception.Create('Falha ao incluir Cliente' + #13 +
                'Erro Original: ' + E.Message);
        end;
    end;
end;

class function TClienteDAO.ListarClientesPorNome(_Nome: string): TObjectList<TCliente>;
var
    Sql: string;
    Index: Integer;
begin
    try
        Index := 0;
        Sql := ' SELECT C.IDCliente, C.Nome, C.Endereco,    ' +
            '        C.Numero, C.CEP, C.Bairro, C.UF, C.Complemento, C.IDCidade,         ' +
            '        I.Nome NomeCidade                                                   ' +
            '   FROM cliente C, cidade I                                                 ' +
            '  WHERE C.Nome like ' + QuotedStr('%' + _Nome + '%') +
            '    and C.IDCidade = I.IDCidade                                             ' +
            '  ORDER BY C.Nome                                                           ';
        DM.FDQuery.SQL.Text := Sql;
        DM.FDQuery.Open;

        if not Assigned(ListaCliente) then
            ListaCliente := TObjectList<TCliente>.Create;

        ListaCliente.Clear;

        while not DM.FDQuery.Eof do
        begin
            ListaCliente.Add(TCliente.Create);
            ListaCliente.Items[Index].IDCliente := DM.FDQuery.FieldByName('IDCliente').AsInteger;
            ListaCliente.Items[Index].Nome := DM.FDQuery.FieldByName('Nome').AsString;
            ListaCliente.Items[Index].Endereco := DM.FDQuery.FieldByName('Endereco').AsString;
            ListaCliente.Items[Index].Numero := DM.FDQuery.FieldByName('Numero').AsString;
            ListaCliente.Items[Index].CEP := DM.FDQuery.FieldByName('CEP').AsString;
            ListaCliente.Items[Index].Bairro := DM.FDQuery.FieldByName('Bairro').AsString;
            ListaCliente.Items[Index].UF := DM.FDQuery.FieldByName('UF').AsString;
            ListaCliente.Items[Index].Complemento := DM.FDQuery.FieldByName('Complemento').AsString;
            ListaCliente.Items[Index].Cidade.IDCidade := DM.FDQuery.FieldByName('IDCidade').AsInteger;
            ListaCliente.Items[Index].Cidade.Nome := DM.FDQuery.FieldByName('NomeCidade').AsString;

            DM.FDQuery.Next;
            Index := Index + 1;
        end;

        Result := ListaCliente;

    except
        on E: Exception do
        begin
            raise Exception.Create('Falha ao carregar Clientes' + #13 +
                'Erro Original: ' + E.Message);
        end;
    end;
end;

initialization

finalization
    if ListaCliente <> nil then
        ListaCliente.Free;

end.

