object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Raport'
  ClientHeight = 545
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panGrid: TPanel
    Left = 0
    Top = 0
    Width = 859
    Height = 545
    Align = alClient
    Caption = 'panGrid'
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 201
      Top = 1
      Width = 657
      Height = 543
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dmMain.dsDane
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGrid1DBTableView1ExportName: TcxGridDBColumn
          Caption = 'Nazwa'
          DataBinding.FieldName = 'ExportName'
          Width = 200
        end
        object cxGrid1DBTableView1ExportDateTime: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'ExportDateTime'
          Width = 150
        end
        object cxGrid1DBTableView1UserName: TcxGridDBColumn
          Caption = 'U'#380'ytkownik'
          DataBinding.FieldName = 'UserName'
          Width = 150
        end
        object cxGrid1DBTableView1LocationName: TcxGridDBColumn
          Caption = 'Lokal'
          DataBinding.FieldName = 'LocationName'
          Width = 150
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object dxLayoutControl1: TdxLayoutControl
      Left = 1
      Top = 1
      Width = 200
      Height = 543
      Align = alLeft
      TabOrder = 1
      object dDataOd: TcxDateEdit
        Left = 10
        Top = 37
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 1
        TextHint = 'Od:'
        Width = 180
      end
      object dDataDo: TcxDateEdit
        Left = 10
        Top = 64
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 2
        TextHint = 'Do:'
        Width = 180
      end
      object btZatwierdz: TcxButton
        Left = 10
        Top = 508
        Width = 75
        Height = 25
        Caption = 'Zatwierd'#378
        TabOrder = 3
        OnClick = btZatwierdzClick
      end
      object lcbLokal: TcxLookupComboBox
        Left = 10
        Top = 10
        Properties.KeyFieldNames = 'LocationName'
        Properties.ListColumns = <
          item
            FieldName = 'LocationName'
          end>
        Properties.ListSource = dmMain.dsLokal
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 0
        Width = 180
      end
      object dxLayoutControl1Group_Root: TdxLayoutGroup
        AlignHorz = ahParentManaged
        AlignVert = avParentManaged
        ButtonOptions.Buttons = <>
        Hidden = True
        ItemIndex = 1
        ShowBorder = False
        Index = -1
      end
      object dxLayoutGroup1: TdxLayoutGroup
        Parent = dxLayoutControl1Group_Root
        CaptionOptions.Text = 'New Group'
        ButtonOptions.Buttons = <>
        ShowBorder = False
        Index = 0
      end
      object dxLayoutItem1: TdxLayoutItem
        Parent = dxLayoutGroup1
        AlignHorz = ahClient
        AlignVert = avClient
        Control = lcbLokal
        ControlOptions.OriginalHeight = 21
        ControlOptions.OriginalWidth = 73
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutItem2: TdxLayoutItem
        Parent = dxLayoutGroup1
        Control = dDataOd
        ControlOptions.OriginalHeight = 21
        ControlOptions.OriginalWidth = 121
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutItem3: TdxLayoutItem
        Parent = dxLayoutGroup1
        Control = dDataDo
        ControlOptions.OriginalHeight = 21
        ControlOptions.OriginalWidth = 276
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object dxLayoutItem4: TdxLayoutItem
        Parent = dxLayoutControl1Group_Root
        AlignHorz = ahLeft
        AlignVert = avBottom
        CaptionOptions.Text = 'cxButton1'
        CaptionOptions.Visible = False
        Control = btZatwierdz
        ControlOptions.OriginalHeight = 25
        ControlOptions.OriginalWidth = 75
        ControlOptions.ShowBorder = False
        Index = 1
      end
    end
  end
end
