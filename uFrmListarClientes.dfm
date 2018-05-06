object FrmListarClientes: TFrmListarClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lista de Clientes'
  ClientHeight = 482
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 45
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 46
      Height = 19
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtPesquisaCliente: TEdit
      Left = 69
      Top = 11
      Width = 284
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EdtPesquisaClienteKeyPress
    end
    object BtnBuscarClientes: TButton
      Left = 374
      Top = 11
      Width = 121
      Height = 28
      Caption = 'Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnBuscarClientesClick
    end
  end
  object ListViewClientes: TListView
    Left = 0
    Top = 45
    Width = 916
    Height = 397
    Align = alClient
    Columns = <
      item
        Caption = 'C'#243'digo'
        Width = 70
      end
      item
        Caption = 'Nome'
        Width = 200
      end
      item
        Caption = 'Endere'#231'o'
        Width = 150
      end
      item
        Caption = 'Bairro'
        Width = 140
      end
      item
        Caption = 'CEP'
        Width = 80
      end
      item
        Caption = 'Cidade'
        Width = 100
      end
      item
        Caption = 'UF'
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object Panel3: TPanel
    Left = 0
    Top = 442
    Width = 916
    Height = 40
    Align = alBottom
    TabOrder = 2
    object BtnNovo: TButton
      Left = 819
      Top = 1
      Width = 96
      Height = 38
      Align = alRight
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnNovoClick
    end
  end
end
