object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #51088#46041#52285#44256' '#51228#50612#54532#47196#44536#47016
  ClientHeight = 811
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 791
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 750
      Width = 464
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object btnComm: TButton
        Left = 380
        Top = 6
        Width = 75
        Height = 30
        Caption = #53685#49888#49884#51089
        TabOrder = 0
        OnClick = btnCommClick
      end
      object rgCV: TRadioGroup
        Left = 81
        Top = 2
        Width = 113
        Height = 37
        Align = alLeft
        Caption = 'CV'#51228#50612
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          #51088#46041
          #49688#46041)
        TabOrder = 1
      end
      object Panel18: TPanel
        Left = 2
        Top = 2
        Width = 79
        Height = 37
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object Label4: TLabel
          Left = 27
          Top = 21
          Width = 38
          Height = 13
          Caption = 'Receive'
        end
        object Label3: TLabel
          Left = 27
          Top = 4
          Width = 24
          Height = 13
          Caption = 'Send'
        end
        object ledSend: TComLed
          Left = 0
          Top = -2
          Width = 25
          Height = 25
          LedSignal = lsConn
          Kind = lkGreenLight
        end
        object ledReceive: TComLed
          Left = 0
          Top = 16
          Width = 25
          Height = 25
          LedSignal = lsConn
          Kind = lkGreenLight
        end
      end
      object rgSC: TRadioGroup
        Left = 194
        Top = 2
        Width = 113
        Height = 37
        Align = alLeft
        Caption = 'SC'#51228#50612
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          #51088#46041
          #49688#46041)
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 464
      Height = 750
      Align = alClient
      BevelInner = bvLowered
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #46027#50880
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object PageControl: TPageControl
        Left = 2
        Top = 2
        Width = 460
        Height = 746
        ActivePage = TabSheet1
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #46027#50880
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #53685#49888#49345#53468
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #46027#50880
          Font.Style = []
          ParentFont = False
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 450
            Height = 717
            Align = alClient
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object Panel6: TPanel
              Left = 0
              Top = 605
              Width = 450
              Height = 112
              Align = alBottom
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 0
              object mmErrorLog: TMemo
                Left = 1
                Top = 1
                Width = 448
                Height = 110
                Align = alClient
                Lines.Strings = (
                  'mmErrorLog')
                ScrollBars = ssHorizontal
                TabOrder = 0
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 603
              Width = 450
              Height = 2
              Align = alBottom
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 1
            end
            object mmCommLog: TMemo
              Left = 0
              Top = 0
              Width = 450
              Height = 603
              Align = alClient
              Lines.Strings = (
                'mmCommLog'
                '')
              ScrollBars = ssHorizontal
              TabOrder = 2
            end
          end
          object Panel5: TPanel
            Left = 450
            Top = 0
            Width = 2
            Height = 717
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
          end
        end
        object TabSheet2: TTabSheet
          Caption = #49444#48708#49345#53468
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #46027#50880
          Font.Style = []
          ImageIndex = 1
          ParentFont = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 697
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 452
            Height = 717
            Align = alClient
            BevelInner = bvLowered
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            ExplicitHeight = 697
            object GroupBox1: TGroupBox
              Left = 1
              Top = 265
              Width = 450
              Height = 451
              Align = alClient
              Caption = 'Conveyor'
              TabOrder = 0
              ExplicitHeight = 431
              object Panel13: TPanel
                Left = 2
                Top = 15
                Width = 225
                Height = 434
                Align = alLeft
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 0
                ExplicitHeight = 414
                object Panel14: TPanel
                  Left = 2
                  Top = 2
                  Width = 221
                  Height = 16
                  Align = alTop
                  Caption = 'CVC #1'
                  TabOrder = 0
                end
                object GroupBox3: TGroupBox
                  Left = 2
                  Top = 18
                  Width = 221
                  Height = 78
                  Margins.Top = 0
                  Align = alTop
                  Caption = 'CV'#51648#49884'(PC'#8594'PLC)'
                  TabOrder = 1
                  object cbCV1_go1: TCheckBox
                    Left = 3
                    Top = 18
                    Width = 55
                    Height = 17
                    Caption = '1 '#8594' 2'
                    TabOrder = 0
                  end
                  object cbCV1_go3: TCheckBox
                    Left = 78
                    Top = 18
                    Width = 55
                    Height = 17
                    Caption = '3 '#8594' 4'
                    TabOrder = 1
                  end
                  object cbCV1_go4: TCheckBox
                    Left = 78
                    Top = 37
                    Width = 55
                    Height = 17
                    Caption = '4 '#8594' 5'
                    TabOrder = 2
                  end
                  object cbCV1_go2: TCheckBox
                    Left = 3
                    Top = 37
                    Width = 55
                    Height = 17
                    Caption = '2 '#8594' 3'
                    TabOrder = 3
                  end
                  object cbCV1_go5: TCheckBox
                    Left = 153
                    Top = 18
                    Width = 55
                    Height = 17
                    Caption = '5 '#8594' 6'
                    TabOrder = 4
                  end
                  object cbCV1_go6: TCheckBox
                    Left = 153
                    Top = 37
                    Width = 55
                    Height = 17
                    Caption = '6 '#8594' 7'
                    TabOrder = 5
                  end
                  object cbCV1_Complete1: TCheckBox
                    Left = 3
                    Top = 56
                    Width = 100
                    Height = 17
                    Caption = #51089#50629#50756#47308' '#51216#47736
                    TabOrder = 6
                  end
                  object cbCV1_Complete2: TCheckBox
                    Left = 115
                    Top = 56
                    Width = 100
                    Height = 17
                    Caption = #51089#50629#50756#47308' '#51216#46321
                    TabOrder = 7
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 2
                  Top = 96
                  Width = 221
                  Height = 336
                  Align = alClient
                  Caption = 'CV'#49345#53468'(PLC'#8594'PC)'
                  TabOrder = 2
                  ExplicitLeft = 3
                  ExplicitTop = 78
                  ExplicitHeight = 356
                  object cbCV1_1: TCheckBox
                    Left = 3
                    Top = 18
                    Width = 100
                    Height = 17
                    Caption = ' '#51088#46041
                    TabOrder = 0
                  end
                  object cbCV1_2: TCheckBox
                    Left = 3
                    Top = 38
                    Width = 100
                    Height = 17
                    Caption = ' CV1 PLT ON'
                    TabOrder = 1
                  end
                  object cbCV1_3: TCheckBox
                    Left = 3
                    Top = 58
                    Width = 100
                    Height = 17
                    Caption = ' CV2 PLT ON'
                    TabOrder = 2
                  end
                  object cbCV1_4: TCheckBox
                    Left = 3
                    Top = 78
                    Width = 100
                    Height = 17
                    Caption = ' CV3 PLT ON'
                    TabOrder = 3
                  end
                  object cbCV1_5: TCheckBox
                    Left = 3
                    Top = 98
                    Width = 100
                    Height = 17
                    Caption = ' CV4 PLT ON'
                    TabOrder = 4
                  end
                  object cbCV1_6: TCheckBox
                    Left = 3
                    Top = 118
                    Width = 100
                    Height = 17
                    Caption = ' CV5 PLT ON'
                    TabOrder = 5
                  end
                  object cbCV1_7: TCheckBox
                    Left = 3
                    Top = 138
                    Width = 100
                    Height = 17
                    Caption = ' CV6 PLT ON'
                    TabOrder = 6
                  end
                  object cbCV1_8: TCheckBox
                    Left = 3
                    Top = 158
                    Width = 100
                    Height = 17
                    Caption = ' CV7 PLT ON'
                    TabOrder = 7
                  end
                  object cbCV1_9: TCheckBox
                    Left = 3
                    Top = 178
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 8
                  end
                  object cbCV1_10: TCheckBox
                    Left = 3
                    Top = 198
                    Width = 100
                    Height = 17
                    Caption = ' '#51089#50629#50756#47308
                    TabOrder = 9
                  end
                  object cbCV1_11: TCheckBox
                    Left = 3
                    Top = 218
                    Width = 100
                    Height = 17
                    Caption = ' ST1 '#52636#44256#51456#48708
                    TabOrder = 10
                  end
                  object cbCV1_12: TCheckBox
                    Left = 3
                    Top = 238
                    Width = 100
                    Height = 17
                    Caption = ' ST2 '#51077#44256#51456#48708
                    TabOrder = 11
                  end
                  object cbCV1_13: TCheckBox
                    Left = 3
                    Top = 258
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 12
                  end
                  object cbCV1_14: TCheckBox
                    Left = 3
                    Top = 278
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 13
                  end
                  object cbCV1_15: TCheckBox
                    Left = 3
                    Top = 298
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 14
                  end
                  object cbCV1_16: TCheckBox
                    Left = 3
                    Top = 318
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 15
                  end
                  object cbCV1_17: TCheckBox
                    Left = 115
                    Top = 18
                    Width = 100
                    Height = 17
                    Caption = ' 1'#8594'2 '#51649#51652#50756#47308
                    TabOrder = 16
                  end
                  object cbCV1_18: TCheckBox
                    Left = 115
                    Top = 38
                    Width = 100
                    Height = 17
                    Caption = ' 2'#8594'3 '#51649#51652#50756#47308' '
                    TabOrder = 17
                  end
                  object cbCV1_19: TCheckBox
                    Left = 115
                    Top = 58
                    Width = 100
                    Height = 17
                    Caption = ' 3'#8594'4 '#51649#51652#50756#47308
                    TabOrder = 18
                  end
                  object cbCV1_20: TCheckBox
                    Left = 115
                    Top = 78
                    Width = 100
                    Height = 17
                    Caption = ' 4'#8594'5 '#51649#51652#50756#47308
                    TabOrder = 19
                  end
                  object cbCV1_21: TCheckBox
                    Left = 115
                    Top = 98
                    Width = 100
                    Height = 17
                    Caption = ' 5'#8594'6 '#51649#51652#50756#47308
                    TabOrder = 20
                  end
                  object cbCV1_22: TCheckBox
                    Left = 115
                    Top = 118
                    Width = 100
                    Height = 17
                    Caption = ' 6'#8594'7 '#51649#51652#50756#47308
                    TabOrder = 21
                  end
                  object cbCV1_23: TCheckBox
                    Left = 115
                    Top = 138
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 22
                  end
                  object cbCV1_24: TCheckBox
                    Left = 115
                    Top = 158
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 23
                  end
                  object cbCV1_25: TCheckBox
                    Left = 115
                    Top = 178
                    Width = 100
                    Height = 17
                    Caption = ' 1'#8594'2 '#51649#51652#50640#47084
                    TabOrder = 24
                  end
                  object cbCV1_26: TCheckBox
                    Left = 115
                    Top = 198
                    Width = 100
                    Height = 17
                    Caption = ' 2'#8594'3 '#51649#51652#50640#47084
                    TabOrder = 25
                  end
                  object cbCV1_27: TCheckBox
                    Left = 115
                    Top = 218
                    Width = 100
                    Height = 17
                    Caption = ' 3'#8594'4 '#51649#51652#50640#47084
                    TabOrder = 26
                  end
                  object cbCV1_28: TCheckBox
                    Left = 115
                    Top = 238
                    Width = 100
                    Height = 17
                    Caption = ' 4'#8594'5 '#51649#51652#50640#47084
                    TabOrder = 27
                  end
                  object cbCV1_29: TCheckBox
                    Left = 115
                    Top = 258
                    Width = 100
                    Height = 17
                    Caption = ' 5'#8594'6 '#51649#51652#50640#47084
                    TabOrder = 28
                  end
                  object cbCV1_30: TCheckBox
                    Left = 115
                    Top = 278
                    Width = 100
                    Height = 17
                    Caption = ' 6'#8594'7 '#51649#51652#50640#47084
                    TabOrder = 29
                  end
                  object cbCV1_31: TCheckBox
                    Left = 115
                    Top = 298
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 30
                  end
                  object cbCV1_32: TCheckBox
                    Left = 115
                    Top = 318
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 31
                  end
                end
              end
              object Panel15: TPanel
                Left = 227
                Top = 15
                Width = 221
                Height = 434
                Align = alClient
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 1
                ExplicitHeight = 414
                object Panel16: TPanel
                  Left = 2
                  Top = 2
                  Width = 217
                  Height = 16
                  Align = alTop
                  Caption = 'CVC #2'
                  TabOrder = 0
                end
                object GroupBox4: TGroupBox
                  Left = 2
                  Top = 18
                  Width = 217
                  Height = 78
                  Margins.Top = 0
                  Align = alTop
                  Caption = 'CV'#51648#49884'(PLC'#8594'PC)'
                  TabOrder = 1
                  object cbCV2_go1: TCheckBox
                    Left = 3
                    Top = 18
                    Width = 55
                    Height = 17
                    Caption = '1 '#8594' 2'
                    TabOrder = 0
                  end
                  object cbCV2_go3: TCheckBox
                    Left = 78
                    Top = 18
                    Width = 55
                    Height = 17
                    Caption = '3 '#8594' 4'
                    TabOrder = 1
                  end
                  object cbCV2_go4: TCheckBox
                    Left = 78
                    Top = 37
                    Width = 55
                    Height = 17
                    Caption = '4 '#8594' 5'
                    TabOrder = 2
                  end
                  object cbCV2_go2: TCheckBox
                    Left = 3
                    Top = 37
                    Width = 55
                    Height = 17
                    Caption = '2 '#8594' 3'
                    TabOrder = 3
                  end
                  object cbCV2_go5: TCheckBox
                    Left = 153
                    Top = 18
                    Width = 55
                    Height = 17
                    Caption = '5 '#8594' 6'
                    TabOrder = 4
                  end
                  object cbCV2_go6: TCheckBox
                    Left = 153
                    Top = 37
                    Width = 55
                    Height = 17
                    Caption = '6 '#8594' 7'
                    TabOrder = 5
                  end
                  object cbCV2_Complete1: TCheckBox
                    Left = 3
                    Top = 56
                    Width = 100
                    Height = 17
                    Caption = #51089#50629#50756#47308' '#51216#47736
                    TabOrder = 6
                  end
                  object cbCV2_Complete2: TCheckBox
                    Left = 109
                    Top = 56
                    Width = 100
                    Height = 17
                    Caption = #51089#50629#50756#47308' '#51216#46321
                    TabOrder = 7
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 2
                  Top = 96
                  Width = 217
                  Height = 336
                  Align = alClient
                  Caption = 'CV'#49345#53468'(PLC'#8594'PC)'
                  TabOrder = 2
                  ExplicitTop = 76
                  object cbCV2_1: TCheckBox
                    Left = 3
                    Top = 18
                    Width = 100
                    Height = 17
                    Caption = ' '#51088#46041
                    TabOrder = 0
                  end
                  object cbCV2_2: TCheckBox
                    Left = 3
                    Top = 38
                    Width = 100
                    Height = 17
                    Caption = ' CV1 PLT ON'
                    TabOrder = 1
                  end
                  object cbCV2_3: TCheckBox
                    Left = 3
                    Top = 58
                    Width = 100
                    Height = 17
                    Caption = ' CV2 PLT ON'
                    TabOrder = 2
                  end
                  object cbCV2_4: TCheckBox
                    Left = 3
                    Top = 78
                    Width = 100
                    Height = 17
                    Caption = ' CV3 PLT ON'
                    TabOrder = 3
                  end
                  object cbCV2_5: TCheckBox
                    Left = 3
                    Top = 98
                    Width = 100
                    Height = 17
                    Caption = ' CV4 PLT ON'
                    TabOrder = 4
                  end
                  object cbCV2_6: TCheckBox
                    Left = 3
                    Top = 118
                    Width = 100
                    Height = 17
                    Caption = ' CV5 PLT ON'
                    TabOrder = 5
                  end
                  object cbCV2_7: TCheckBox
                    Left = 3
                    Top = 138
                    Width = 100
                    Height = 17
                    Caption = ' CV6 PLT ON'
                    TabOrder = 6
                  end
                  object cbCV2_8: TCheckBox
                    Left = 3
                    Top = 158
                    Width = 100
                    Height = 17
                    Caption = ' CV7 PLT ON'
                    TabOrder = 7
                  end
                  object cbCV2_9: TCheckBox
                    Left = 3
                    Top = 178
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 8
                  end
                  object cbCV2_10: TCheckBox
                    Left = 3
                    Top = 198
                    Width = 100
                    Height = 17
                    Caption = ' '#51089#50629#50756#47308
                    TabOrder = 9
                  end
                  object cbCV2_11: TCheckBox
                    Left = 3
                    Top = 218
                    Width = 100
                    Height = 17
                    Caption = ' ST1 '#52636#44256#51456#48708
                    TabOrder = 10
                  end
                  object cbCV2_12: TCheckBox
                    Left = 3
                    Top = 238
                    Width = 100
                    Height = 17
                    Caption = ' ST2 '#51077#44256#51456#48708
                    TabOrder = 11
                  end
                  object cbCV2_13: TCheckBox
                    Left = 3
                    Top = 258
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 12
                  end
                  object cbCV2_14: TCheckBox
                    Left = 3
                    Top = 278
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 13
                  end
                  object cbCV2_15: TCheckBox
                    Left = 3
                    Top = 298
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 14
                  end
                  object cbCV2_16: TCheckBox
                    Left = 3
                    Top = 318
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 15
                  end
                  object cbCV2_17: TCheckBox
                    Left = 109
                    Top = 18
                    Width = 100
                    Height = 17
                    Caption = ' 1'#8594'2 '#51649#51652#50756#47308
                    TabOrder = 16
                  end
                  object cbCV2_18: TCheckBox
                    Left = 109
                    Top = 38
                    Width = 100
                    Height = 17
                    Caption = ' 2'#8594'3 '#51649#51652#50756#47308' '
                    TabOrder = 17
                  end
                  object cbCV2_19: TCheckBox
                    Left = 109
                    Top = 58
                    Width = 100
                    Height = 17
                    Caption = ' 3'#8594'4 '#51649#51652#50756#47308
                    TabOrder = 18
                  end
                  object cbCV2_20: TCheckBox
                    Left = 109
                    Top = 78
                    Width = 100
                    Height = 17
                    Caption = ' 4'#8594'5 '#51649#51652#50756#47308
                    TabOrder = 19
                  end
                  object cbCV2_21: TCheckBox
                    Left = 109
                    Top = 98
                    Width = 100
                    Height = 17
                    Caption = ' 5'#8594'6 '#51649#51652#50756#47308
                    TabOrder = 20
                  end
                  object cbCV2_22: TCheckBox
                    Left = 109
                    Top = 118
                    Width = 100
                    Height = 17
                    Caption = ' 6'#8594'7 '#51649#51652#50756#47308
                    TabOrder = 21
                  end
                  object cbCV2_23: TCheckBox
                    Left = 109
                    Top = 138
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 22
                  end
                  object cbCV2_24: TCheckBox
                    Left = 109
                    Top = 158
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 23
                  end
                  object cbCV2_25: TCheckBox
                    Left = 109
                    Top = 178
                    Width = 100
                    Height = 17
                    Caption = ' 1'#8594'2 '#51649#51652#50640#47084
                    TabOrder = 24
                  end
                  object cbCV2_26: TCheckBox
                    Left = 109
                    Top = 198
                    Width = 100
                    Height = 17
                    Caption = ' 2'#8594'3 '#51649#51652#50640#47084
                    TabOrder = 25
                  end
                  object cbCV2_27: TCheckBox
                    Left = 109
                    Top = 218
                    Width = 100
                    Height = 17
                    Caption = ' 3'#8594'4 '#51649#51652#50640#47084
                    TabOrder = 26
                  end
                  object cbCV2_28: TCheckBox
                    Left = 109
                    Top = 238
                    Width = 100
                    Height = 17
                    Caption = ' 4'#8594'5 '#51649#51652#50640#47084
                    TabOrder = 27
                  end
                  object cbCV2_29: TCheckBox
                    Left = 109
                    Top = 258
                    Width = 100
                    Height = 17
                    Caption = ' 5'#8594'6 '#51649#51652#50640#47084
                    TabOrder = 28
                  end
                  object cbCV2_30: TCheckBox
                    Left = 109
                    Top = 278
                    Width = 100
                    Height = 17
                    Caption = ' 6'#8594'7 '#51649#51652#50640#47084
                    TabOrder = 29
                  end
                  object cbCV2_31: TCheckBox
                    Left = 109
                    Top = 298
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 30
                  end
                  object cbCV2_32: TCheckBox
                    Left = 109
                    Top = 318
                    Width = 100
                    Height = 17
                    Caption = ' -'
                    TabOrder = 31
                  end
                end
              end
            end
            object GroupBox2: TGroupBox
              Left = 1
              Top = 1
              Width = 450
              Height = 264
              Align = alTop
              Caption = 'Stacker Crane'
              TabOrder = 1
              object Panel9: TPanel
                Left = 2
                Top = 15
                Width = 223
                Height = 247
                Align = alLeft
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 0
                object Label2: TLabel
                  Left = 5
                  Top = 220
                  Width = 52
                  Height = 13
                  Caption = #54788#51116#50948#52824
                end
                object Label1: TLabel
                  Left = 5
                  Top = 193
                  Width = 52
                  Height = 13
                  Caption = #50640#47084#53076#46300
                end
                object Panel10: TPanel
                  Left = 2
                  Top = 2
                  Width = 219
                  Height = 16
                  Align = alTop
                  Caption = #49345#53468'(PLC'#8594'PC)'
                  TabOrder = 0
                end
                object cbSC_1: TCheckBox
                  Left = 7
                  Top = 31
                  Width = 76
                  Height = 17
                  Caption = ' '#49688#46041
                  TabOrder = 1
                end
                object cbSC_2: TCheckBox
                  Left = 7
                  Top = 49
                  Width = 76
                  Height = 17
                  Caption = ' '#51088#46041
                  TabOrder = 2
                end
                object cbSC_3: TCheckBox
                  Left = 7
                  Top = 68
                  Width = 76
                  Height = 17
                  Caption = ' '#50689#51216#54869#51064
                  TabOrder = 3
                end
                object cbSC_4: TCheckBox
                  Left = 7
                  Top = 87
                  Width = 76
                  Height = 17
                  Caption = ' '#54856#48373#44480#51473
                  TabOrder = 4
                end
                object cbSC_5: TCheckBox
                  Left = 7
                  Top = 106
                  Width = 76
                  Height = 17
                  Caption = ' '#51089#50629#45824#44592
                  TabOrder = 5
                end
                object cbSC_6: TCheckBox
                  Left = 7
                  Top = 125
                  Width = 76
                  Height = 17
                  Caption = ' '#54252#53356#49468#53552
                  TabOrder = 6
                end
                object cbSC_7: TCheckBox
                  Left = 7
                  Top = 144
                  Width = 76
                  Height = 17
                  Caption = ' '#44277#52636#44256
                  TabOrder = 7
                end
                object cbSC_8: TCheckBox
                  Left = 7
                  Top = 163
                  Width = 76
                  Height = 17
                  Caption = ' '#51060#51473#51077#44256
                  TabOrder = 8
                end
                object cbSC_9: TCheckBox
                  Left = 90
                  Top = 31
                  Width = 120
                  Height = 17
                  Caption = ' '#54036#47131#53944#26377
                  TabOrder = 9
                end
                object cbSC_10: TCheckBox
                  Left = 90
                  Top = 50
                  Width = 120
                  Height = 17
                  Caption = ' '#47001' '#51077#44256' '#50756#47308
                  TabOrder = 10
                end
                object cbSC_11: TCheckBox
                  Left = 90
                  Top = 69
                  Width = 120
                  Height = 17
                  Caption = ' '#51077#44256'ST '#51201#51116' '#50756#47308
                  TabOrder = 11
                end
                object cbSC_12: TCheckBox
                  Left = 90
                  Top = 88
                  Width = 120
                  Height = 17
                  Caption = ' '#47001' '#52636#44256' '#50756#47308
                  TabOrder = 12
                end
                object cbSC_13: TCheckBox
                  Left = 90
                  Top = 107
                  Width = 120
                  Height = 17
                  Caption = ' '#52636#44256'ST '#54616#50669' '#50756#47308
                  TabOrder = 13
                end
                object cbSC_14: TCheckBox
                  Left = 90
                  Top = 126
                  Width = 120
                  Height = 17
                  Caption = ' '#50640#47084
                  TabOrder = 14
                end
                object cbSC_15: TCheckBox
                  Left = 90
                  Top = 145
                  Width = 120
                  Height = 17
                  Caption = ' '#51077#44256#51473
                  TabOrder = 15
                end
                object cbSC_16: TCheckBox
                  Left = 90
                  Top = 164
                  Width = 120
                  Height = 17
                  Caption = ' '#52636#44256#51473
                  TabOrder = 16
                end
                object edtSC_Error: TEdit
                  Left = 60
                  Top = 190
                  Width = 150
                  Height = 21
                  TabOrder = 17
                end
                object edtSC_Loc: TEdit
                  Left = 60
                  Top = 217
                  Width = 150
                  Height = 21
                  TabOrder = 18
                end
              end
              object Panel11: TPanel
                Left = 225
                Top = 15
                Width = 223
                Height = 247
                Align = alClient
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 1
                object Label5: TLabel
                  Left = 99
                  Top = 32
                  Width = 38
                  Height = 13
                  Caption = 'ST No.'
                end
                object Label6: TLabel
                  Left = 99
                  Top = 80
                  Width = 43
                  Height = 13
                  Caption = #51648#51221' '#50672
                end
                object Label7: TLabel
                  Left = 160
                  Top = 80
                  Width = 43
                  Height = 13
                  Caption = #51648#51221' '#45800
                end
                object Label12: TLabel
                  Left = 8
                  Top = 204
                  Width = 29
                  Height = 13
                  Caption = 'Step.'
                end
                object Label13: TLabel
                  Left = 99
                  Top = 127
                  Width = 52
                  Height = 13
                  Caption = #51089#50629#48264#54840
                end
                object Panel12: TPanel
                  Left = 2
                  Top = 2
                  Width = 219
                  Height = 16
                  Align = alTop
                  Caption = #51648#49884'(PC'#8594'PLC)'
                  TabOrder = 0
                end
                object cbSC_Write_1: TCheckBox
                  Left = 7
                  Top = 31
                  Width = 76
                  Height = 17
                  Caption = ' '#51077#44256
                  TabOrder = 1
                end
                object cbSC_Write_2: TCheckBox
                  Left = 7
                  Top = 50
                  Width = 76
                  Height = 17
                  Caption = ' '#52636#44256
                  TabOrder = 2
                end
                object cbSC_Write_3: TCheckBox
                  Left = 7
                  Top = 69
                  Width = 76
                  Height = 17
                  Caption = ' '#54856#48373#44480
                  TabOrder = 3
                end
                object cbSC_Write_4: TCheckBox
                  Left = 7
                  Top = 88
                  Width = 76
                  Height = 17
                  Caption = ' '#44592#46041#50836#44396
                  TabOrder = 4
                end
                object cbSC_Write_5: TCheckBox
                  Left = 7
                  Top = 107
                  Width = 76
                  Height = 17
                  Caption = ' -'
                  TabOrder = 5
                end
                object cbSC_Write_6: TCheckBox
                  Left = 7
                  Top = 126
                  Width = 76
                  Height = 17
                  Caption = ' -'
                  TabOrder = 6
                end
                object cbSC_Write_7: TCheckBox
                  Left = 7
                  Top = 145
                  Width = 76
                  Height = 17
                  Caption = ' '#54848#49688#50676
                  TabOrder = 7
                end
                object cbSC_Write_8: TCheckBox
                  Left = 7
                  Top = 164
                  Width = 76
                  Height = 17
                  Caption = ' '#51677#49688#50676
                  TabOrder = 8
                end
                object Edit3: TEdit
                  Left = 96
                  Top = 48
                  Width = 116
                  Height = 21
                  TabOrder = 9
                end
                object edtSC_Write_Bay: TEdit
                  Left = 96
                  Top = 94
                  Width = 55
                  Height = 21
                  TabOrder = 10
                end
                object edtSC_Write_Level: TEdit
                  Left = 157
                  Top = 94
                  Width = 55
                  Height = 21
                  TabOrder = 11
                end
                object cbSC_Write_9: TCheckBox
                  Left = 7
                  Top = 182
                  Width = 120
                  Height = 17
                  Caption = ' '#51204#47732'(1)/'#54980#47732'(0)'
                  TabOrder = 12
                end
                object edtStep: TEdit
                  Left = 5
                  Top = 220
                  Width = 212
                  Height = 21
                  TabOrder = 13
                end
                object edtJobNo: TEdit
                  Left = 96
                  Top = 142
                  Width = 116
                  Height = 21
                  TabOrder = 14
                end
              end
            end
          end
        end
      end
    end
  end
  object pnlStatusBar: TPanel
    Left = 0
    Top = 791
    Width = 464
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object pnlStatusPanel4: TPanel
      Left = 385
      Top = 0
      Width = 79
      Height = 20
      Align = alClient
      TabOrder = 0
      object Label10: TLabel
        Left = 1
        Top = 1
        Width = 50
        Height = 18
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'DB'#50672#44208
        ParentBiDiMode = False
        Layout = tlCenter
      end
      object ShpDatabaseConn: TShape
        Left = 51
        Top = 2
        Width = 16
        Height = 16
        Hint = #45936#51060#53552#48288#51060#49828' '#50672#44208' '#49345#53468' - '#51221#49345'['#45433#49353'] '#51060#49345'['#51201#49353']'
        Brush.Color = 8684799
        ParentShowHint = False
        Pen.Style = psClear
        Shape = stRoundRect
        ShowHint = True
      end
    end
    object pnlStatusPanel3: TPanel
      Left = 305
      Top = 0
      Width = 80
      Height = 20
      Align = alLeft
      TabOrder = 1
      object Label9: TLabel
        Left = 1
        Top = 1
        Width = 50
        Height = 18
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'PLC#2'
        ParentBiDiMode = False
        Layout = tlCenter
      end
      object ShpMFCInterfaceConn2: TShape
        Left = 51
        Top = 2
        Width = 16
        Height = 16
        Hint = #49444#48708' '#53685#49888' '#49345#53468' - '#51221#49345'['#45433#49353'] '#51060#49345'['#51201#49353']'
        Brush.Color = 8684799
        ParentShowHint = False
        Pen.Style = psClear
        Shape = stRoundRect
        ShowHint = True
      end
    end
    object pnlStatusPanel2: TPanel
      Left = 225
      Top = 0
      Width = 80
      Height = 20
      Align = alLeft
      TabOrder = 2
      object Label11: TLabel
        Left = 1
        Top = 1
        Width = 50
        Height = 18
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'PLC#1'
        ParentBiDiMode = False
        Layout = tlCenter
        ExplicitLeft = 9
        ExplicitTop = 2
      end
      object ShpMFCInterfaceConn1: TShape
        Left = 51
        Top = 2
        Width = 16
        Height = 16
        Hint = #49444#48708' '#53685#49888' '#49345#53468' - '#51221#49345'['#45433#49353'] '#51060#49345'['#51201#49353']'
        Brush.Color = 8684799
        ParentShowHint = False
        Pen.Style = psClear
        Shape = stRoundRect
        ShowHint = True
      end
    end
    object pnlStatusPanel1: TPanel
      Left = 0
      Top = 0
      Width = 160
      Height = 20
      Align = alLeft
      TabOrder = 3
      object Label8: TLabel
        Left = 1
        Top = 1
        Width = 50
        Height = 18
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = #49892#54665#51068#49884
        Layout = tlCenter
      end
      object lblUptime: TLabel
        Left = 51
        Top = 1
        Width = 108
        Height = 18
        Align = alClient
        Alignment = taCenter
        Caption = '2020-09-23 12:21:22'
        Layout = tlCenter
        ExplicitWidth = 103
        ExplicitHeight = 13
      end
    end
    object Panel17: TPanel
      Left = 160
      Top = 0
      Width = 65
      Height = 20
      Align = alLeft
      TabOrder = 4
    end
  end
  object tmrMain: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrMainTimer
    Left = 324
    Top = 175
  end
  object FrontPLCSocket: TClientSocket
    Tag = 1
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = PLCSocketConnect
    OnDisconnect = PLCSocketDisconnect
    OnRead = PLCSocketRead
    OnWrite = PLCSocketWrite
    OnError = PLCSocketError
    Left = 366
    Top = 275
  end
  object tmrConnectDB: TTimer
    Enabled = False
    OnTimer = tmrConnectDBTimer
    Left = 364
    Top = 175
  end
  object RearPLCSocket: TClientSocket
    Tag = 2
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = PLCSocketConnect
    OnDisconnect = PLCSocketDisconnect
    OnRead = PLCSocketRead
    OnWrite = PLCSocketWrite
    Left = 414
    Top = 275
  end
  object tmrServer: TTimer
    Enabled = False
    OnTimer = tmrServerTimer
    Left = 404
    Top = 175
  end
  object tmrLogFileCheck: TTimer
    Tag = 1
    Interval = 6000000
    OnTimer = tmrLogFileCheckTimer
    Left = 323
    Top = 221
  end
  object tmrUPD_ORDSEQSEL: TTimer
    Enabled = False
    OnTimer = tmrUPD_ORDSEQSELTimer
    Left = 366
    Top = 221
  end
  object tmrEPLTOut: TTimer
    Enabled = False
    OnTimer = tmrEPLTOutTimer
    Left = 406
    Top = 221
  end
end
