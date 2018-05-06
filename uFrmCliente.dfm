object FrmCliente: TFrmCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 422
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 382
    Width = 485
    Height = 40
    Align = alBottom
    TabOrder = 2
    object BtnCancelar: TButton
      Left = 388
      Top = 1
      Width = 96
      Height = 38
      Align = alRight
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
    object BtnGravar: TButton
      Left = 1
      Top = 1
      Width = 96
      Height = 38
      Align = alLeft
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnGravarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 485
    Height = 64
    Align = alTop
    Caption = 'Dados pessoais'
    TabOrder = 0
    object Label1: TLabel
      Left = 33
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object EdtNome: TEdit
      Left = 33
      Top = 35
      Width = 428
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 64
    Width = 485
    Height = 318
    Align = alClient
    Caption = 'Endere'#231'o'
    TabOrder = 1
    object Label3: TLabel
      Left = 33
      Top = 32
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label4: TLabel
      Left = 33
      Top = 80
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label5: TLabel
      Left = 361
      Top = 32
      Width = 12
      Height = 13
      Caption = 'N'#186
    end
    object Label6: TLabel
      Left = 33
      Top = 130
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label7: TLabel
      Left = 33
      Top = 178
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label8: TLabel
      Left = 130
      Top = 178
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 201
      Top = 130
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object EdtEndereco: TEdit
      Left = 33
      Top = 51
      Width = 304
      Height = 21
      TabOrder = 0
    end
    object EdtBairro: TEdit
      Left = 33
      Top = 99
      Width = 428
      Height = 21
      TabOrder = 2
    end
    object EdtNumero: TEdit
      Left = 361
      Top = 51
      Width = 100
      Height = 21
      TabOrder = 1
    end
    object EdtCEP: TMaskEdit
      Left = 33
      Top = 146
      Width = 120
      Height = 21
      EditMask = '99999\-999;1;_'
      MaxLength = 9
      TabOrder = 3
      Text = '     -   '
    end
    object CmbBxUF: TComboBox
      Left = 33
      Top = 197
      Width = 71
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      TabOrder = 5
      OnChange = CmbBxUFChange
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
    end
    object EdtComplemento: TEdit
      Left = 202
      Top = 146
      Width = 259
      Height = 21
      TabOrder = 4
    end
    object ListViewCidades: TListView
      Left = 130
      Top = 219
      Width = 331
      Height = 94
      Columns = <
        item
          Caption = 'Cidade'
          Width = 300
        end>
      DoubleBuffered = True
      GridLines = True
      ParentDoubleBuffered = False
      ShowColumnHeaders = False
      TabOrder = 7
      TabStop = False
      ViewStyle = vsReport
      Visible = False
      OnDblClick = ListViewCidadesDblClick
      OnKeyDown = ListViewCidadesKeyDown
      OnKeyPress = ListViewCidadesKeyPress
    end
    object EdtCidade: TEdit
      Left = 130
      Top = 197
      Width = 331
      Height = 21
      TabOrder = 6
      OnKeyDown = EdtCidadeKeyDown
      OnKeyUp = EdtCidadeKeyUp
    end
  end
end
