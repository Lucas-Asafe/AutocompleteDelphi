unit uFrmCliente;

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
    Vcl.Buttons,
    Vcl.ExtCtrls,
    uClienteDAO,
    Vcl.StdCtrls,
    Vcl.ComCtrls,
    Vcl.Mask,
    uCidade,
    uCidadeDAO,
    System.Generics.Collections,
    uCliente,
    StrUtils,
    uClienteValidador;

type
    TFrmCliente = class(TForm)
        Panel1: TPanel;
        GroupBox1: TGroupBox;
        GroupBox2: TGroupBox;
        Label1: TLabel;
        EdtNome: TEdit;
        EdtEndereco: TEdit;
        Label3: TLabel;
        EdtBairro: TEdit;
        Label4: TLabel;
        Label5: TLabel;
        EdtNumero: TEdit;
        EdtCEP: TMaskEdit;
        Label6: TLabel;
        CmbBxUF: TComboBox;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        EdtComplemento: TEdit;
        ListViewCidades: TListView;
        EdtCidade: TEdit;
        BtnCancelar: TButton;
        BtnGravar: TButton;
        procedure ListViewCidadesDblClick(Sender: TObject);
        procedure CmbBxUFChange(Sender: TObject);
        procedure BtnGravarClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure BtnCancelarClick(Sender: TObject);
        procedure EdtCidadeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure ListViewCidadesKeyPress(Sender: TObject; var Key: Char);
        procedure FormDestroy(Sender: TObject);
    procedure EdtCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewCidadesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
        Cliente: TCliente;
        _ListaCidades: TObjectList<TCidade>;
        _ListaCidadesFiltradas: TObjectList<TCidade>;
        procedure PreencherDados;
        procedure CarregarCidades(_UF: string);
        procedure LocalizarCidadeLista(_Cidade: string);
        procedure SelecionarItemListView;
    public
    { Public declarations }
    end;

var
    FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

procedure TFrmCliente.FormCreate(Sender: TObject);
begin
    _ListaCidadesFiltradas := TObjectList<TCidade>.Create;
    Cliente := TCliente.Create;
end;

procedure TFrmCliente.FormDestroy(Sender: TObject);
begin
    if Assigned(_ListaCidadesFiltradas) then
        FreeAndNil(_ListaCidadesFiltradas);

    if Assigned(Cliente) then
        FreeAndNil(Cliente);
end;

procedure TFrmCliente.CmbBxUFChange(Sender: TObject);
begin
    EdtCidade.Clear;
    ListViewCidades.Visible := False;

    CarregarCidades(CmbBxUF.Text);
end;

procedure TFrmCliente.CarregarCidades(_UF: string);
begin
    _ListaCidades := TCidadeDAO.ListarTodasCidadesUF(_UF);
end;

procedure TFrmCliente.EdtCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_DOWN) and (ListViewCidades.Visible) then
    begin
        ListViewCidades.SetFocus;
        ListViewCidades.Items[0].Selected := True;
    end;
end;

procedure TFrmCliente.EdtCidadeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if EdtCidade.Text = '' then
        Exit
    else
        LocalizarCidadeLista(EdtCidade.Text);
end;

procedure TFrmCliente.ListViewCidadesDblClick(Sender: TObject);
begin
    SelecionarItemListView;
end;

procedure TFrmCliente.ListViewCidadesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if not (Key in [VK_UP, VK_DOWN, VK_RETURN]) then
    begin
        EdtCidade.SetFocus;
        EdtCidade.SetSelText(EdtCidade.Text);
    end;
end;

procedure TFrmCliente.ListViewCidadesKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        if ListViewCidades.ItemIndex > -1 then
        begin
            SelecionarItemListView;
        end;
    end;
end;

procedure TFrmCliente.PreencherDados;
begin
    Cliente.Nome := EdtNome.Text;
    Cliente.Endereco := EdtEndereco.Text;
    Cliente.Numero := EdtNumero.Text;
    Cliente.Complemento := EdtComplemento.Text;
    Cliente.CEP := EdtCEP.Text;
    Cliente.Bairro := EdtBairro.Text;
    Cliente.UF := CmbBxUF.Text;
end;

procedure TFrmCliente.LocalizarCidadeLista(_Cidade: string);
var
    I, Index: Integer;
    tempItemCidade: TListItem;
begin
    if _ListaCidades.Count <= 0 then
        Exit;

    if _Cidade = '' then
        Exit;

    _ListaCidadesFiltradas.Clear;

    for I := 0 to _ListaCidades.Count - 1 do
    begin
        if Pos(LowerCase(_Cidade), LowerCase(_ListaCidades[I].Nome)) > 0 then
        begin
            Index := _ListaCidadesFiltradas.Add(TCidade.Create);

            _ListaCidadesFiltradas.Items[Index].IDCidade := _ListaCidades[I].IDCidade;
            _ListaCidadesFiltradas.Items[Index].Nome := _ListaCidades[I].Nome;
            _ListaCidadesFiltradas.Items[Index].UF := _ListaCidades[I].UF;
            _ListaCidadesFiltradas.Items[Index].IsCapital := _ListaCidades[I].IsCapital;
            _ListaCidadesFiltradas.Items[Index].Codigo_IBGE := _ListaCidades[I].Codigo_IBGE;
        end;
    end;

    ListViewCidades.Items.Clear;
    ListViewCidades.Visible := _ListaCidadesFiltradas.Count > 0;
    for I := 0 to _ListaCidadesFiltradas.Count - 1 do
    begin
        tempItemCidade := ListViewCidades.Items.Add;
        tempItemCidade.Caption := _ListaCidadesFiltradas[I].Nome;
        tempItemCidade.Data := _ListaCidadesFiltradas[I];
    end;
end;

procedure TFrmCliente.SelecionarItemListView;
begin
    if ListViewCidades.ItemIndex > -1 then
    begin
        Cliente.Cidade.IDCidade := TCidade(ListViewCidades.ItemFocused.Data).IDCidade;
        Cliente.Cidade.Nome := TCidade(ListViewCidades.ItemFocused.Data).Nome;
        EdtCidade.Text := Cliente.Cidade.Nome;
        ListViewCidades.Visible := False;
    end;
end;

procedure TFrmCliente.BtnCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmCliente.BtnGravarClick(Sender: TObject);
var
    tempResultadoClienteValidador: TStringList;
begin
    try
        PreencherDados;
        tempResultadoClienteValidador := TClienteValidador.Validar(Cliente);
        if tempResultadoClienteValidador.Count = 0 then
        begin
            if TClienteDAO.Inserir(Cliente) then
            begin
                MessageDlg('Cliente cadastrado com sucesso!', mtConfirmation, [mbOk], 0);
                Close;
            end;
        end
        else
            MessageDlg('A T E N Ç Ã O !' + #13 + tempResultadoClienteValidador.Text,
                mtError, [mbOk], 0);
    finally
        if Assigned(tempResultadoClienteValidador) then
            FreeAndNil(tempResultadoClienteValidador);
    end;
end;

end.

