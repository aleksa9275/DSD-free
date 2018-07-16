object FreeInsertPlaneDialog: TFreeInsertPlaneDialog
  Left = 239
  Top = 210
  BorderStyle = bsDialog
  Caption = 'Insert multiple points'
  ClientHeight = 237
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 22
    Width = 212
    Height = 202
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 12
      Top = 8
      Width = 191
      Height = 181
      Caption = 'Insert multiple vertices on a plane.  '
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 136
        Width = 42
        Height = 13
        Caption = 'Distance'
      end
      object Label2: TLabel
        Left = 14
        Top = 92
        Width = 49
        Height = 13
        Caption = 'Min. value'
      end
      object Label4: TLabel
        Left = 96
        Top = 110
        Width = 3
        Height = 13
        Caption = '-'
      end
      object Label5: TLabel
        Left = 14
        Top = 110
        Width = 52
        Height = 13
        Caption = 'Max. value'
      end
      object Label3: TLabel
        Left = 96
        Top = 92
        Width = 3
        Height = 13
        Caption = '-'
      end
      object RadioButton1: TRadioButton
        Left = 8
        Top = 22
        Width = 113
        Height = 17
        Caption = 'Transverse plane'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 8
        Top = 44
        Width = 113
        Height = 17
        Caption = 'Horizontal plane'
        TabOrder = 1
        OnClick = RadioButton2Click
      end
      object RadioButton3: TRadioButton
        Left = 8
        Top = 66
        Width = 113
        Height = 17
        Caption = 'Vertical plane'
        TabOrder = 2
        OnClick = RadioButton3Click
      end
      object Edit1: TEdit
        Left = 82
        Top = 128
        Width = 83
        Height = 21
        TabOrder = 3
        Text = '0.000'
        OnKeyPress = Edit1KeyPress
      end
      object CheckBox1: TCheckBox
        Left = 12
        Top = 154
        Width = 125
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Add control curve'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 212
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TSpeedButton
      Left = 84
      Top = 1
      Width = 60
      Height = 19
      Caption = 'OK'
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TSpeedButton
      Left = 144
      Top = 1
      Width = 60
      Height = 19
      Caption = 'Cancel'
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      OnClick = BitBtn2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 224
    Width = 212
    Height = 13
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
end
