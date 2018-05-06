unit uFrmListarClientes;

interface

uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.StdCtrls,
    Vcl.ComCtrls,
    Vcl.ExtCtrls,
    uClienteDAO,
    System.Generics.Collections,
    uCliente,
    System.ImageList,
    Vcl.ImgList,
    uFrmCliente;

type
    TFrmListarClientes = class(TForm)
        Panel1: TPanel;
        ListViewClientes: TListView;
        Label1: TLabel;
        EdtPesquisaCliente: TEdit;
        BtnBuscarClientes: TButton;
        Panel3: TPanel;
        BtnNovo: TButton;
        procedure BtnBuscarClientesClick(Sender: TObject);
        procedure BtnNovoClick(Sender: TObject);
        procedure EdtPesquisaClienteKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
        _ListaClientes: TObjectList<TCliente>;
        procedure CarregarClientes;
    public
    { Public declarations }
    end;

var
    FrmListarClientes: TFrmListarClientes;

implementation

{$R *.dfm}

procedure TFrmListarClientes.BtnBuscarClientesClick(Sender: TObject);
begin
    CarregarClientes;
end;

procedure TFrmListarClientes.EdtPesquisaClienteKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        CarregarClientes;
end;

procedure TFrmListarClientes.CarregarClientes;
var
    I: Integer;
    Item: TListItem;
begin
    ListViewClientes.Items.Clear;
    _ListaClientes := TClienteDAO.ListarClientesPorNome(EdtPesquisaCliente.Text);
    for I := 0 to _ListaClientes.Count - 1 do
    begin
        Item := ListViewClientes.Items.Add;
        Item.Caption := IntToStr(_ListaClientes[I].IDCliente);
        Item.SubItems.Add(_ListaClientes[I].Nome);
        Item.SubItems.Add(_ListaClientes[I].Endereco + ', nº ' + _ListaClientes[I].Numero);
        Item.SubItems.Add(_ListaClientes[I].Bairro);
        Item.SubItems.Add(_ListaClientes[I].CEP);
        Item.SubItems.Add(_ListaClientes[I].Cidade.Nome);
        Item.SubItems.Add(_ListaClientes[I].UF);
        Item.Data := _ListaClientes[I];
    end;
end;

procedure TFrmListarClientes.BtnNovoClick(Sender: TObject);
begin
    try
        FrmCliente := TFrmCliente.Create(Self);
        FrmCliente.ShowModal;
    finally
        FreeAndNil(FrmCliente);
    end;
end;

end.

