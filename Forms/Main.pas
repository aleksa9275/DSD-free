{#############################################################################################}
{    This code is distributed as part of the FREE!ship project. FREE!ship is an               }
{    open source surface-modelling program based on subdivision surfaces and intended for     }
{    designing ships.                                                                         }
{                                                                                             }
{    Copyright © 2005, by Martijn van Engeland                                                }
{    e-mail                  : Info@FREEship.org                                              }
{    FREE!ship project page  : https://sourceforge.net/projects/freeship                      }
{    FREE!ship homepage      : www.FREEship.org                                               }
{                                                                                             }
{    This program is free software; you can redistribute it and/or modify it under            }
{    the terms of the GNU General Public License as published by the                          }
{    Free Software Foundation; either version 2 of the License, or (at your option)           }
{    any later version.                                                                       }
{                                                                                             }
{    This program is distributed in the hope that it will be useful, but WITHOUT ANY          }
{    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A          }
{    PARTICULAR PURPOSE. See the GNU General Public License for more details.                 }
{                                                                                             }
{    You should have received a copy of the GNU General Public License along with             }
{    this program; if not, write to the Free Software Foundation, Inc.,                       }
{    59 Temple Place, Suite 330, Boston, MA 02111-1307 USA                                    }
{                                                                                             }
{#############################################################################################}

//{$DEFINE MEMCHECK}

unit Main;

interface

uses Windows,
     Messages,
     SysUtils,
     Variants,
     Classes,
     Graphics,
     Controls,
     Forms,
     Math,
     Dialogs,
     ExtCtrls,
     ActnList,
     StdCtrls,
     ImgList,
     ComCtrls,
     {$IFDEF MEMCHECK}
        MemCheck,     // Memcheck is used for memory-leak tracking (debugging all)
     {$ENDIF}
     FreeGeometry,
     FreeShipUnit,
     FreeVersionUnit,
     FreeHullformWindow,
     Menus,
     ToolWin,
     Buttons,
     jpeg;

type TMainForm         = class(TForm)
                              FreeShip                   : TFreeShip;
                              ActionList1                : TActionList;
                              LoadFile                   : TAction;
                              StatusBar                  : TPanel;
                              MenuImages                 : TImageList;
                              ExitProgram                : TAction;
                              ShowControlNet             : TAction;
                              ShowInteriorEdges          : TAction;
                              MainMenu1                  : TMainMenu;
                              File1                      : TMenuItem;
                              Mediumtelelens130mm1       : TMenuItem;
                              ExitProgram1               : TMenuItem;
                              Visibility1                : TMenuItem;
                              ShowControlNet1            : TMenuItem;
                              ShowInteriorEdges1         : TMenuItem;
                              Window1                    : TMenuItem;
                              Cascade1                   : TMenuItem;
                              ile1                       : TMenuItem;
                              NewWindow1                 : TMenuItem;
                              NewWindow                  : TAction;
                              TileWindow                 : TAction;
                              CascadeWindow              : TAction;
                              N1                         : TMenuItem;
                              BothSides                  : TAction;
                              Showbothsides1             : TMenuItem;
                              FileSaveas                 : TAction;
                              Save1                      : TMenuItem;
                              LayerAutoGroup             : TAction;
                              Layer1                     : TMenuItem;
                              Autogroup1                 : TMenuItem;
                              NewLayer                   : TAction;
                              New1                       : TMenuItem;
                              Delete: TAction;
                              ToolBar: TToolBar;
                              ToolButton1: TToolButton;
                              ToolButton3: TToolButton;
                              ToolButton4: TToolButton;
                              ToolButton5: TToolButton;
                              ToolButton6: TToolButton;
                              LayerBox: TComboBox;
                              ToolButton7: TToolButton;
                              ToolButton8: TToolButton;
                              ToolButton9: TToolButton;
                              ToolButton10: TToolButton;
                              PrecisionBox: TComboBox;
                              Edit1: TMenuItem;
                              ToolButton12: TToolButton;
                              Point1: TMenuItem;
                              Edge1: TMenuItem;
                              Face1: TMenuItem;
                              EdgeCollapse: TAction;
                              ToolButton11: TToolButton;
                              ToolButton13: TToolButton;
                              Collapse1: TMenuItem;
                              ToolButton14: TToolButton;
                              ToolButton15: TToolButton;
                              Delete1: TMenuItem;
                              NewEdge: TAction;
                              ToolButton16: TToolButton;
                              New2: TMenuItem;
                              ImportFEF: TAction;
                              ImportOff1: TMenuItem;
                              EdgeCrease: TAction;
                              ToolButton17: TToolButton;
                              Crease1: TMenuItem;
                              DeselectAll: TAction;
                              Selection1: TMenuItem;
                              Clearselection1: TMenuItem;
                              PointCollapse: TAction;
                              ToolButton18: TToolButton;
                              ToolButton19: TToolButton;
                              PointCollapse1: TMenuItem;
                              Panel1: TPanel;
                              ColorDialog: TColorDialog;
                              ActiveLayerColor: TAction;
                              Activelayercolor1: TMenuItem;
                              DeleteEmptyLayers: TAction;
                              Deleteempty1: TMenuItem;
                              LayerDialog: TAction;
                              Deleteempty2: TMenuItem;
                              NewModel: TAction;
                              ToolButton20: TToolButton;
                              New3: TMenuItem;
                              ShowStations: TAction;
                              ToolButton21: TToolButton;
                              Stations1: TMenuItem;
                              ShowButtocks: TAction;
                              ToolButton22: TToolButton;
                              ShowWaterlines: TAction;
                              ToolButton23: TToolButton;
                              Buttocks1: TMenuItem;
                              Waterlines1: TMenuItem;
                              NewFace: TAction;
                              ToolButton24: TToolButton;
                              ToolButton25: TToolButton;
                              New4: TMenuItem;
                              IntersectionDialog: TAction;
                              ToolButton26: TToolButton;
                              EdgeExtrude: TAction;
                              ToolButton27: TToolButton;
                              Extrude1: TMenuItem;
                              ToolButton28: TToolButton;
                              About1: TMenuItem;
                              EdgeSplit: TAction;
                              ToolButton29: TToolButton;
                              Split1: TMenuItem;
                              ExportFEF: TAction;
                              ExportFEFfile1: TMenuItem;
                              EditProjectSettings: TAction;
                              Project1: TMenuItem;
                              Projectsettings1: TMenuItem;
                              CheckModel: TAction;
                              ools1: TMenuItem;
                              Analyzesurface1: TMenuItem;
                              ToolButton30: TToolButton;
                              ShowNormals: TAction;
                              DesignHydrostatics: TAction;
                              Calculations1: TMenuItem;
                              Hydrostatics1: TMenuItem;
                              Normals1: TMenuItem;
                              ImportVRML: TAction;
                              Export1: TMenuItem;
                              VRML1: TMenuItem;
                              Import1: TMenuItem;
                              RemoveNegative: TAction;
                              Removenegative1: TMenuItem;
                              RotateModel: TAction;
                              Rotatemodel1: TMenuItem;
                              ScaleModel: TAction;
                              Scale3D1: TMenuItem;
                              ShowGrid: TAction;
                              ToolButton31: TToolButton;
                              Analyzesurface2: TMenuItem;
                              Undo: TAction;
                              Undo1: TMenuItem;
                              Panel2: TPanel;
                              HydrostaticsDialog: TAction;
                              Hydrostatics2: TMenuItem;
                              ExportObj: TAction;
                              WavefrontfileObj1: TMenuItem;
                              InvertFace: TAction;
                              Invert1: TMenuItem;
                              ToolButton32: TToolButton;
                              ToolButton33: TToolButton;
                              Preferences: TAction;
                              Preferences1: TMenuItem;
                              N2: TMenuItem;
                              ImportBodyplan: TAction;
                              ExportDXF3DPolylines: TAction;
                              ExportDXFPolylines1: TMenuItem;
                              ExportDXFFaces: TAction;
                              DXF3Dfaces1: TMenuItem;
                              ImportHullFile: TAction;
                              Carlssonhulfile1: TMenuItem;
                              ExportOffsets: TAction;
                              Offsets1: TMenuItem;
                              MoveModel: TAction;
                              Deselectall2: TMenuItem;
                              AddPoint: TAction;
                              Add1: TMenuItem;
                              Intersections1: TMenuItem;
                              DevelopLayers: TAction;
                              Developplates1: TMenuItem;
                              ExportArchimedes: TAction;
                              N3: TMenuItem;
                              ArchimedesMB1: TMenuItem;
                              ToolButton34: TToolButton;
                              ShowLinesplan: TAction;
                              Linesplan1: TMenuItem;
                              ShowDiagonals: TAction;
                              ToolButton35: TToolButton;
                              Diagonals1: TMenuItem;
                              Recentfiles: TMenuItem;
                              N4: TMenuItem;
                              ImportCarene: TAction;
                              Carenefile1: TMenuItem;
                              ShowMarkers: TAction;
                              ToolButton36: TToolButton;
                              Markers1: TMenuItem;
                              DeleteMarkers: TAction;
                              Deletemarkers1: TMenuItem;
                              ImportSurface: TAction;
                              Surface1: TMenuItem;
                              Showcurvature: TAction;
                              ToolButton37: TToolButton;
                              IncreaseCurvatureScale: TAction;
                              DecreaseCurvatureScale: TAction;
                              N5: TMenuItem;
                              Decrcurvaturescale1: TMenuItem;
                              Incrcurvaturescale1: TMenuItem;
                              FileSave: TAction;
                              ToolButton38: TToolButton;
                              Save2: TMenuItem;
                              Curvature1: TMenuItem;
                              ImportChines: TAction;
                              Chines1: TMenuItem;
                              Curve1: TMenuItem;
                              ShowControlCurves: TAction;
                              Controlcurves1: TMenuItem;
                              ToolButton2: TToolButton;
                              NewCurve: TAction;
                              AddCurve1: TMenuItem;
                              ToolButton39: TToolButton;
                              ToolButton40: TToolButton;
                              ExportCoordinates: TAction;
                              Coordinates1: TMenuItem;
                              InsertPlane: TAction;
                              InsertPlane1: TMenuItem;
                              ToolButton41: TToolButton;
                              PointsLock: TAction;
                              PointsLock1: TMenuItem;
                              PointsUnlock: TAction;
                              Unlockpoints1: TMenuItem;
                              ToolButton42: TToolButton;
                              ToolButton43: TToolButton;
                              PointsUnlockAll: TAction;
                              Unlockallpoints1: TMenuItem;
                              ToolButton44: TToolButton;
                              Markers2: TMenuItem;
                              ImportMarkers: TAction;
                              Import2: TMenuItem;
                              ExportMichlet: TAction;
                              MichletCFD1: TMenuItem;
                              ResistanceKaper: TAction;
                              Resistance1: TMenuItem;
                              Kaper1: TMenuItem;
                              ResistanceDelft: TAction;
                              Delftyachtseries1: TMenuItem;
                              Panel3: TPanel;
                              PointAlign: TAction;
                              ToolButton45: TToolButton;
                              Projectline1: TMenuItem;
                              ImportMichletWaves: TAction;
                              N6: TMenuItem;
                              ImportMichletWaves1: TMenuItem;
                              ShowHydrostatics: TAction;
                              ToolButton46: TToolButton;
                              Hydrostaticdata1: TMenuItem;
                              MirrorFace: TAction;
                              ransform1: TMenuItem;
                              MirrorFace1: TMenuItem;
                              ExportDXF2DPolylines: TAction;
                              DXF2DPolylines1: TMenuItem;
                              Panel4: TPanel;
                              TransformLackenby: TAction;
                              Lackenby1: TMenuItem;
                              ExportIGES: TAction;
                              IGES1: TMenuItem;
                              ExportPart: TAction;
                              Part1: TMenuItem;
                              ImportPart: TAction;
                              Part2: TMenuItem;
                              LayerIntersection: TAction;
                              ToolButton47: TToolButton;
                              Saveas1: TMenuItem;
    KeelRudderWizard: TAction;
    Deleteempty3: TMenuItem;
    Redo: TAction;
    Archimedes1: TMenuItem;
    ClearUndo: TAction;
    N7: TMenuItem;
    Undohistory1: TMenuItem;
    Clear1: TMenuItem;
    ShowUndoHistory: TAction;
    Show1: TMenuItem;
    ImportPolyCad: TAction;
    PolyCad1: TMenuItem;
    RemoveUnusedPoints: TAction;
    Removeunusedpoints1: TMenuItem;
    ExportGHS: TAction;
    GHS1: TMenuItem;
    ShowFlowlines: TAction;
    Flowlines1: TMenuItem;
    ToolButton48: TToolButton;
    AddCylinder: TAction;
    AddCylinder1: TMenuItem;
    SelectAll: TAction;
    Selectall1: TMenuItem;
    ExportSTL: TAction;
    STL1: TMenuItem;
    CrossCurves: TAction;
    Crosscurves1: TMenuItem;
                              procedure LoadFileExecute(Sender   : TObject);
                              procedure ExitProgramExecute(Sender: TObject);
                              procedure FormShow(Sender: TObject);
                              procedure ShowControlNetExecute(Sender: TObject);
                              procedure ShowInteriorEdgesExecute(Sender: TObject);
                              procedure NewWindowExecute(Sender: TObject);
                              procedure TileWindowExecute(Sender: TObject);
                              procedure CascadeWindowExecute(Sender: TObject);
                              procedure BothSidesExecute(Sender: TObject);
                              procedure FreeShipFileChanged(Sender: TObject);
                              procedure PrecisionBoxChange(Sender: TObject);
                              procedure FileSaveasExecute(Sender: TObject);
                              procedure LayerAutoGroupExecute(Sender: TObject);
                              procedure FormClose(Sender: TObject; var Action: TCloseAction);
                              procedure NewLayerExecute(Sender: TObject);
                              procedure DeleteExecute(Sender: TObject);
                              procedure EdgeCollapseExecute(Sender: TObject);
                              procedure NewEdgeExecute(Sender: TObject);
                              procedure ImportFEFExecute(Sender: TObject);
                              procedure EdgeCreaseExecute(Sender: TObject);
                              procedure DeselectAllExecute(Sender: TObject);
                              procedure PointCollapseExecute(Sender: TObject);
                              procedure LayerBoxChange(Sender: TObject);
                              procedure Panel1Click(Sender: TObject);
                              procedure ActiveLayerColorExecute(Sender: TObject);
                              procedure DeleteEmptyLayersExecute(Sender: TObject);
                              procedure LayerDialogExecute(Sender: TObject);
                              procedure NewModelExecute(Sender: TObject);
                              procedure FormCreate(Sender: TObject);
                              procedure ShowStationsExecute(Sender: TObject);
                              procedure ShowButtocksExecute(Sender: TObject);
                              procedure ShowWaterlinesExecute(Sender: TObject);
                              procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
                              procedure NewFaceExecute(Sender: TObject);
                              procedure IntersectionDialogExecute(Sender: TObject);
                              procedure EdgeExtrudeExecute(Sender: TObject);
                              procedure About1Click(Sender: TObject);
                              procedure EdgeSplitExecute(Sender: TObject);
                              procedure ExportFEFExecute(Sender: TObject);
                              procedure EditProjectSettingsExecute(Sender: TObject);
                              procedure CheckModelExecute(Sender: TObject);
                              procedure ShowNormalsExecute(Sender: TObject);
                              procedure DesignHydrostaticsExecute(Sender: TObject);
                              procedure ImportVRMLExecute(Sender: TObject);
                              procedure RemoveNegativeExecute(Sender: TObject);
                              procedure RotateModelExecute(Sender: TObject);
                              procedure ScaleModelExecute(Sender: TObject);
                              procedure ShowGridExecute(Sender: TObject);
                              procedure UndoExecute(Sender: TObject);
                              procedure FreeShipUpdateUndoData(Sender: TObject);
                              procedure HydrostaticsDialogExecute(Sender: TObject);
                              procedure ExportObjExecute(Sender: TObject);
                              procedure InvertFaceExecute(Sender: TObject);
                              procedure PreferencesExecute(Sender: TObject);
                              procedure ImportBodyplanExecute(Sender: TObject);
                              procedure ExportDXF3DPolylinesExecute(Sender: TObject);
                              procedure ExportDXFFacesExecute(Sender: TObject);
                              procedure ImportHullFileExecute(Sender: TObject);
                              procedure ExportOffsetsExecute(Sender: TObject);
                              procedure MoveModelExecute(Sender: TObject);
                              procedure AddPointExecute(Sender: TObject);
                              procedure DevelopLayersExecute(Sender: TObject);
                              procedure ExportArchimedesExecute(Sender: TObject);
                              procedure ShowLinesplanExecute(Sender: TObject);
                              procedure ShowDiagonalsExecute(Sender: TObject);
                              procedure FreeShipUpdateRecentFileList(Sender: TObject);
                              procedure ImportCareneExecute(Sender: TObject);
                              procedure ShowMarkersExecute(Sender: TObject);
                              procedure DeleteMarkersExecute(Sender: TObject);
                              procedure ImportSurfaceExecute(Sender: TObject);
                              procedure ShowcurvatureExecute(Sender: TObject);
                              procedure IncreaseCurvatureScaleExecute(Sender: TObject);
                              procedure DecreaseCurvatureScaleExecute(Sender: TObject);
                              procedure FileSaveExecute(Sender: TObject);
                              procedure ImportChinesExecute(Sender: TObject);
                              procedure ShowControlCurvesExecute(Sender: TObject);
                              procedure NewCurveExecute(Sender: TObject);
                              procedure ExportCoordinatesExecute(Sender: TObject);
                              procedure InsertPlaneExecute(Sender: TObject);
                              procedure PointsLockExecute(Sender: TObject);
                              procedure PointsUnlockExecute(Sender: TObject);
                              procedure PointsUnlockAllExecute(Sender: TObject);
                              procedure ImportMarkersExecute(Sender: TObject);
                              procedure ExportMichletExecute(Sender: TObject);
                              procedure ResistanceKaperExecute(Sender: TObject);
                              procedure ResistanceDelftExecute(Sender: TObject);
                              procedure FreeShipChangeCursorIncrement(Sender: TObject);
                              procedure Panel3Click(Sender: TObject);
                              procedure PointAlignExecute(Sender: TObject);
                              procedure ImportMichletWavesExecute(Sender: TObject);
                              procedure ShowHydrostaticsExecute(Sender: TObject);
                              procedure MirrorFaceExecute(Sender: TObject);
                              procedure ExportDXF2DPolylinesExecute(Sender: TObject);
                              procedure FreeShipUpdateGeometryInfo(Sender: TObject);
                              procedure TransformLackenbyExecute(Sender: TObject);
                              procedure ExportIGESExecute(Sender: TObject);
                              procedure ExportPartExecute(Sender: TObject);
                              procedure ImportPartExecute(Sender: TObject);
                              procedure LayerIntersectionExecute(Sender: TObject);
    procedure KeelRudderWizardExecute(Sender: TObject);
    procedure RedoExecute(Sender: TObject);
    procedure ClearUndoExecute(Sender: TObject);
    procedure ShowUndoHistoryExecute(Sender: TObject);
    procedure ImportPolyCadExecute(Sender: TObject);
    procedure RemoveUnusedPointsExecute(Sender: TObject);
    procedure ExportGHSExecute(Sender: TObject);
    procedure ShowFlowlinesExecute(Sender: TObject);
    procedure AddCylinderExecute(Sender: TObject);
    procedure SelectAllExecute(Sender: TObject);
    procedure ExportSTLExecute(Sender: TObject);
    procedure CrossCurvesExecute(Sender: TObject);
                           private    { Private declarations }
                              procedure FLoadRecentFile(sender:TObject);
                              procedure FreeShipChangeLayerData(Sender: TObject);
                              procedure FreeShipChangeActiveLayer(Sender: TObject;Layer: TFreeSubdivisionLayer);
                              procedure FOnSelectItem(Sender:TObject);
                              procedure FOpenHullWindows;   // Creates 4 different views on the hullform
                           public     { Public declarations }
                              procedure SetCaption;
                              procedure UpdateMenu;
                         end;

var MainForm: TMainForm;
	F:	TextFile;

implementation

uses FreeSplashWndw,
     FreeLinesplanFrm,
     FreeControlPointFrm,
     FreeKeelWizardDlg,
     FreeLanguageSupport;

{$R *.dfm}

procedure TMainForm.FOnselectItem(Sender:TObject);
var Face1 : TFreeSubdivisionControlFace;
    Face2 : TFreeSubdivisionControlFace;
    Diff  : Boolean;
    I     : Integer;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FOnselectItem(Sender:TObject) .\n');
    CloseFile(f);
   if (Sender is TFreeSubdivisionControlPoint) and (Sender=FreeShip.ActiveControlPoint) and (FreeShip.ActiveControlPoint.Selected=false) then
   begin
      // The active controlpoint was deselected, probably internally by the subdivision surface.
      // Set the FreeShip.ActiveControlPoint to nil (which also closes the controlpoint window)
      FreeShip.ActiveControlPoint:=nil;
   end;
   if FreeShip.NumberOfSelectedControlFaces>0 then
   begin
      // set the layerbox itemindex to the index of the layer of the selected controlfaces
      Face1:=FreeShip.SelectedControlFace[0];
      // check if all selected controlfaces belong to the same layer
      Diff:=False;
      for I:=1 to FreeShip.NumberOfSelectedControlFaces do
      begin
         Face2:=FreeShip.SelectedControlFace[I-1];
         if Face1.Layer<>Face2.Layer then
         begin
            Diff:=True;
            Break;
         end;
      end;
      if not Diff then
      begin
         FreeShipChangeActiveLayer(self,Face1.Layer);
      end else FreeShipChangeActiveLayer(self,nil);
   end else FreeShipChangeActiveLayer(self,FreeShip.ActiveLayer);
   UpdateMenu;
end;{TMainForm.FOnselectItem}

// Creates 4 different views on the hullform
procedure TMainForm.FOpenHullWindows;
var HullformWindow: TFreeHullWindow;
    I             : Integer;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FOpenHullWindows .\n');
    CloseFile(f);
   if MDIChildCount=0 then
   begin
      for I:=0 to 3 do
      begin
         // open a new window
         HullformWindow:=TFreeHullWindow.Create(self);
         // Connect viewport to freeship component
         HullformWindow.FreeShip:=FreeShip;
         HullformWindow.Viewport.ViewType:=TFreeViewType(I);
         ShowTranslatedValues(HullformWindow);
         HullformWindow.SetCaption;
      end;
      TileMode := tbHorizontal;
      Tile;
   end;
   SetCaption;
end;{TMainForm.FOpenHullWindows}

procedure TMainForm.SetCaption;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.SetCaption .\n');
    CloseFile(f);
   // Skip translation
   if FreeShip.FileChanged then Caption:='FREE!ship    : '+FreeShip.Filename+' ('+Userstring(280)+')'
                           else Caption:='FREE!ship    : '+FreeShip.Filename+' ('+Userstring(281)+')';
   // End Skip translation
end;{TMainForm.SetCaption}

procedure TMainForm.UpdateMenu;
var I       : Integer;
    NLayers : Integer;
// In this procedure all actions are set to enabled/disabled according to the current state
// and selected items
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.UpdateMenu .\n');
    CloseFile(f);
   NLayers:=0;
   For I:=1 to Freeship.NumberOfLayers do if Freeship.Layer[I-1].Count>0 then inc(NLayers);
   // File menu
   FileSaveas.Enabled:=(FreeShip.Surface.NumberOfControlPoints>0) or (Freeship.FileChanged) or (Freeship.FilenameSet);
   FileSave.Enabled:=(FileSaveas.Enabled) and (Freeship.FilenameSet);
   ImportMichletWaves1.Enabled:=(MDIChildCount>0) and (Freeship.Surface.NumberOfControlFaces>1);
   ExportFEF.Enabled:=Freeship.Surface.NumberOfControlPoints>0;
   ExportObj.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   ExportSTL.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   ExportDXF3DPolylines.Enabled:=((FreeShip.NumberofStations>0) and (FreeShip.Visibility.ShowStations)) or
                                 ((Freeship.NumberofButtocks>0) and (Freeship.Visibility.ShowButtocks)) or
                                 ((Freeship.NumberofWaterlines>0) and (FreeShip.Visibility.ShowWaterlines)) or
                                 ((FreeShip.NumberofDiagonals>0) and (FreeShip.Visibility.ShowDiagonals)) or
                                 ((FreeShip.NumberofControlcurves>0) and (FreeShip.Visibility.ShowControlcurves));
   ExportDXF2DPolylines.Enabled:=((FreeShip.NumberofStations>0) and (FreeShip.Visibility.ShowStations)) or
                                 ((Freeship.NumberofButtocks>0) and (Freeship.Visibility.ShowButtocks)) or
                                 ((Freeship.NumberofWaterlines>0) and (FreeShip.Visibility.ShowWaterlines));
   ExportDXFFaces.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   ExportIGES.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   ExportOffsets.Enabled:=FreeShip.NumberofStations+Freeship.NumberofButtocks+Freeship.NumberofWaterlines+
                          Freeship.NumberofDiagonals+Freeship.NumberOfControlCurves>0;
   ExportArchimedes.Enabled:=FreeShip.NumberofStations>0;
   ExportGHS.Enabled:=FreeShip.NumberofStations>0;
   ExportMichlet.Enabled:=(Freeship.Surface.NumberOfControlFaces>0) and (Freeship.ProjectSettings.MainparticularsHasBeenset);
   RecentFiles.Enabled:=RecentFiles.Count>0;
   ExportCoordinates.Enabled:=Freeship.Surface.NumberOfControlPoints>0;
   ExportPart.Enabled:=(Freeship.Surface.NumberOfControlFaces>0);
   ImportPart.Enabled:=(Freeship.Surface.NumberOfControlFaces>0) and (MDIChildCount>0);
   // Show controledges and controlpoints
   ShowControlNet.Enabled:=FreeShip.Surface.NumberOfControlPoints>0;
   ShowControlNet.Checked:=FreeShip.Visibility.ShowControlNet;
   // Show interior edges
   ShowInteriorEdges.Enabled:=FreeShip.Surface.NumberOfControlFaces>0;
   ShowInteriorEdges.Checked:=FreeShip.Visibility.ShowInteriorEdges;
   // Show both sides
   BothSides.Checked:=Freeship.Visibility.ModelView=mvBoth;
   BothSides.Enabled:=FreeShip.Surface.NumberOfControlFaces>0;
   // Delete
   Delete.Enabled:=Freeship.NumberOfSelectedControlPoints+FreeShip.NumberOfSelectedControlEdges+
                   Freeship.NumberOfSelectedControlFaces+Freeship.NumberOfSelectedControlCurves+
                   Freeship.NumberOfSelectedFlowLines+Freeship.NumberOfselectedMarkers>0;
   // Window menu actions
   TileWindow.Enabled:=MDIChildCount>0;
   CascadeWindow.Enabled:=MDIChildCount>0;
   // Precision
   PrecisionBox.ItemIndex:=Ord(FreeShip.Precision);
   // Layers
   LayerAutoGroup.Enabled:=(Freeship.Surface.NumberOfControlFaces>1) and (FreeShip.Visibility.ShowInteriorEdges);
   // Tools
   CheckModel.Enabled:=FreeShip.Surface.NumberOfControlFaces>0;
   DevelopLayers.Enabled:=False;
   for I:=1 to FreeShip.NumberOfLayers do if (FreeShip.Layer[I-1].Developable) and (FreeShip.Layer[I-1].Count>0) then
   begin
      DevelopLayers.Enabled:=True;
      break;
   end;
   KeelRudderWizard.Enabled:=MDIChildCount>0;
   DeleteMarkers.Enabled:=Freeship.NumberofMarkers>0;
   // Calculations
   DesignHydrostatics.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   Hydrostaticsdialog.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   CrossCurves.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   // edit commands
   AddPoint.Enabled:=(MDIChildCount>0) and (FreeShip.Visibility.ShowControlNet);
   Insertplane.Enabled:=(Freeship.Surface.NumberOfControlEdges>0) and (Freeship.Visibility.ShowControlNet);
   LayerIntersection.Enabled:=NLayers>1;
   EdgeCollapse.Enabled:=FreeShip.NumberOfSelectedControlEdges>0;
   NewEdge.Enabled:=FreeShip.NumberOfSelectedControlPoints>1;
   EdgeCrease.Enabled:=FreeShip.NumberOfSelectedControlEdges>0;
   DeselectAll.Enabled:=(Freeship.NumberOfSelectedControlPoints+FreeShip.NumberOfSelectedControlEdges+Freeship.NumberOfSelectedControlFaces+Freeship.NumberOfSelectedControlCurves>0) or
                        (Freeship.ActiveControlPoint<>nil);
   NewCurve.Enabled:=FreeShip.NumberOfSelectedControlEdges>0;
   PointCollapse.Enabled:=Freeship.NumberOfSelectedControlPoints>0;
   DeleteEmptyLayers.Enabled:=False;
   for I:=1 to Freeship.NumberOfLayers do if (FreeShip.Layer[I-1].Count=0) and (FreeShip.NumberOfLayers>0) then
   begin
      DeleteEmptyLayers.Enabled:=True;
      break;
   end;
   RemoveUnusedPoints.Enabled:=False;
   for I:=1 to Freeship.Surface.NumberOfControlPoints do if Freeship.Surface.ControlPoint[I-1].NumberOfFaces=0 then
   begin
      RemoveUnusedPoints.Enabled:=True;
      break;
   end;
   InvertFace.Enabled:=Freeship.NumberOfSelectedControlFaces>0;
   ShowStations.Enabled:=Freeship.NumberofStations>0;
   ShowStations.Checked:=FreeShip.Visibility.ShowStations;
   ShowButtocks.Enabled:=Freeship.NumberofButtocks>0;
   ShowButtocks.Checked:=FreeShip.Visibility.ShowButtocks;
   ShowWaterlines.Enabled:=Freeship.NumberofWaterlines>0;
   ShowWaterlines.Checked:=FreeShip.Visibility.ShowWaterlines;
   ShowDiagonals.Enabled:=Freeship.NumberofDiagonals>0;
   ShowDiagonals.Checked:=FreeShip.Visibility.ShowDiagonals;
   ShowNormals.Checked:=FreeShip.Visibility.ShowNormals;
   ShowNormals.Enabled:=FreeShip.NumberOfSelectedControlFaces>0;
   ShowGrid.Checked:=Freeship.Visibility.ShowGrid;
   ShowGrid.Enabled:=Freeship.NumberofStations+Freeship.NumberofButtocks+Freeship.NumberofWaterlines+Freeship.NumberofDiagonals>0;
   ShowMarkers.Checked:=FreeShip.Visibility.ShowMarkers;
   ShowMarkers.Enabled:=Freeship.NumberofMarkers>0;
   ShowCurvature.Checked:=FreeShip.Visibility.ShowCurvature;
   ShowCurvature.Enabled:=Freeship.NumberofStations+Freeship.NumberofButtocks+Freeship.NumberofWaterlines+Freeship.NumberofDiagonals+Freeship.NumberOfControlCurves>0;
   ShowControlCurves.Checked:=FreeShip.Visibility.ShowControlCurves;
   ShowControlCurves.Enabled:=Freeship.Surface.NumberOfControlCurves>0;
   ShowHydrostatics.Checked:=Freeship.Visibility.ShowHydrostaticData;
   ShowHydrostatics.Enabled:=(Freeship.Surface.NumberOfControlFaces>2) and (Freeship.ProjectSettings.MainparticularsHasBeenset);
   ShowFlowlines.Checked:=Freeship.Visibility.ShowFlowlines;
   ShowFlowlines.Enabled:=Freeship.NumberOfFlowLines>0; 

   NewFace.Enabled:=FreeShip.NumberOfSelectedControlPoints>2;
   IntersectionDialog.Enabled:=FreeShip.Surface.NumberOfControlFaces>0;
   EdgeExtrude.Enabled:=FreeShip.NumberOfSelectedControlEdges>0;
   EdgeSplit.Enabled:=FreeShip.NumberOfSelectedControlEdges>0;
   RotateModel.Enabled:=FreeShip.Surface.NumberOfControlPoints>0;
   ScaleModel.Enabled:=FreeShip.Surface.NumberOfControlPoints>0;
   MoveModel.Enabled:=FreeShip.Surface.NumberOfControlPoints>0;
   Mirrorface.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
   // Skip translation
   if (Freeship.Undoposition-1>=0) and (Freeship.Undoposition-1<Freeship.UndoCount) then
   begin
      Undo.Caption:=Userstring(290)+#32+Freeship.UndoObject[Freeship.Undoposition-1].Undotext;
   end else
   begin
      Undo.Caption:=Userstring(290);
   end;
   Undo.Enabled:=(FreeShip.UndoCount>0) and (Freeship.UndoPosition>0);
   //if Undo.Enabled then Undo.Caption:='Undo '+Freeship.UndoObject[Freeship.Undoposition-1].Undotext
   //                else Undo.Caption:='Undo';
   Redo.Enabled:=(FreeShip.UndoCount>0) and (Freeship.UndoPosition<Freeship.UndoCount);
//   if Redo.Enabled then Redo.Caption:='Redo '+Freeship.UndoObject[Freeship.Undoposition].Undotext
//                   else Undo.Caption:='Redo';
   // End Skip translation
   Undohistory1.Enabled:=Freeship.UndoCount>0;
   ClearUndo.Enabled:=Freeship.UndoCount>0;
   PointsLock.Enabled:=(Freeship.NumberOfSelectedControlPoints>0) and (Freeship.NumberOfSelectedLockedPoints<Freeship.NumberOfSelectedControlPoints);
   PointsUnlock.Enabled:=Freeship.NumberOfSelectedLockedPoints>0;
   PointsUnlockAll.Enabled:=Freeship.NumberOfLockedPoints>0;
   PointAlign.Enabled:=Freeship.NumberOfSelectedControlPoints>2;
   TransformLackenby.Enabled:=Freeship.Surface.NumberOfControlFaces>0;
end;{TMainForm.UpdateMenu}

procedure TMainForm.LoadFileExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.LoadFileExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_Load;
   FOpenHullWindows;
   SetCaption;
   UpdateMenu;
end;{TMainForm.LoadFileExecute}

procedure TMainForm.ExitProgramExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExitProgramExecute(Sender: TObject) .\n');
    CloseFile(f);
   UpdateMenu;
   Close;
end;{TMainForm.ExitProgramExecute}

procedure TMainForm.FormShow(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FormShow(Sender: TObject) .\n');
    CloseFile(f);
   // Initialize some data
   FreeShip.OnChangeActiveLayer:=FreeShipChangeActiveLayer;
   Freeship.OnChangeLayerData:=FreeShipChangeLayerData;
   FreeShip.OnSelectItem:=FOnSelectItem;
   FreeShip.Preferences.Load;
   FreeShip.Clear;
   if ParamCount<>0 then
   begin
      // Skip translation
      if (FileExists(ParamStr(1))) and (Uppercase(ExtractFileExt(ParamStr(1)))='.FBM') then
      begin
         FOpenHullWindows;
         FreeShip.Edit.File_Load(ParamStr(1));
      end else MessageDlg(Userstring(106)+#32+ParamStr(1),mtError,[mbOk],0);
      // End Skip translation
   end;
   SetCaption;
   UpdateMenu;
end;{TMainForm.FormShow}

procedure TMainForm.ShowControlNetExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowControlNetExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowControlNet:=not FreeShip.Visibility.ShowControlNet;
   UpdateMenu;
end;{TMainForm.ShowControlNetExecute}

procedure TMainForm.ShowInteriorEdgesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowInteriorEdgesExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowInteriorEdges:=not FreeShip.Visibility.ShowInteriorEdges;
   UpdateMenu;
end;{TMainForm.ShowInteriorEdgesExecute}

procedure TMainForm.NewWindowExecute(Sender: TObject);
var HullformWindow : TFreeHullWindow;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.NewWindowExecute(Sender: TObject) .\n');
    CloseFile(f);
   // open a new window
   HullformWindow:=TFreeHullWindow.Create(self);
   // Connect viewport to freeship component
   HullformWindow.FreeShip:=FreeShip;
   HullformWindow.Viewport.ViewType:=fvPerspective;
   HullformWindow.SetCaption;
   UpdateMenu;
end;{TMainForm.NewWindowExecute}

procedure TMainForm.TileWindowExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.TileWindowExecute(Sender: TObject) .\n');
    CloseFile(f);
   TileMode := tbHorizontal;
   Tile;
end;{TMainForm.TileWindowExecute}

procedure TMainForm.CascadeWindowExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.CascadeWindowExecute(Sender: TObject) .\n');
    CloseFile(f);
   Cascade;
end;{TMainForm.CascadeWindowExecute}

procedure TMainForm.BothSidesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.BothSidesExecute(Sender: TObject) .\n');
    CloseFile(f);
   if FreeShip.Visibility.ModelView=mvBoth then FreeShip.Visibility.ModelView:=mvPort
                                           else FreeShip.Visibility.ModelView:=mvBoth;
   UpdateMenu;
end;{TMainForm.BothSidesExecute}

procedure TMainForm.FreeShipFileChanged(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FreeShipFileChanged(Sender: TObject) .\n');
    CloseFile(f);
   SetCaption;
end;{TMainForm.FreeShipFileChanged}

procedure TMainForm.PrecisionBoxChange(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.PrecisionBoxChange(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Precision:=TFreePrecisionType(PrecisionBox.ItemIndex);
   UpdateMenu;
end;{TMainForm.PrecisionBoxChange}

procedure TMainForm.FileSaveasExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FileSaveasExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_SaveAs;
   UpdateMenu;
   SetCaption;
end;{TMainForm.SaveFileExecute}

procedure TMainForm.LayerAutoGroupExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.LayerAutoGroupExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Layer_AutoGroup;
   UpdateMenu;
end;{TMainForm.LayerAutoGroupExecute}

procedure TMainForm.FLoadRecentFile(sender:TObject);
var Menu    : TMenuItem;
    Filename: string;
    N       : Integer;
    Answer  : word;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FLoadRecentFile(sender:TObject)nu .\n');
    CloseFile(f);
   if sender is TMenuItem then
   begin
      Menu:=sender as TMenuItem;
      // Skip translation
      Filename:=Menu.Caption+'.fbm';
      repeat
         N:=Pos('&',Filename);
         if N<>0 then system.Delete(Filename,N,1);
      until N=0;
      // End Skip translation
      if fileexists(Filename) then
      begin
         if Freeship.FileChanged then
         begin
            Answer:=MessageDlg(Userstring(103)+EOL+Userstring(104),mtConfirmation,[mbYes,mbNo,mbCancel],0);
            if Answer=mrCancel then exit;
            if Answer=mrYes then
            begin
               Freeship.Edit.File_SaveAs;
               if Freeship.FileChanged then exit; // Apparently saving was not successfull, abort
            end;
         end;
         Freeship.Edit.File_Load(Filename);
         FOpenHullWindows;
         SetCaption;
         UpdateMenu;
      end;
   end;
end;{TMainForm.FLoadRecentFile}

procedure TMainForm.FreeShipChangeLayerData(Sender: TObject);
var I : Integer;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FreeShipChangeLayerData(Sender: TObject) .\n');
    CloseFile(f);
   // Fill the layerbox with the current layers
   LayerBox.Items.BeginUpdate;
   LayerBox.Items.Clear;
   try
      for I:=1 to Freeship.NumberOfLayers do
      begin
         Layerbox.Items.AddObject(FreeShip.Layer[I-1].Name,FreeShip.Layer[I-1]);
      end;
   finally
      LayerBox.Items.EndUpdate;
      I:=LayerBox.Items.IndexOfObject(FreeShip.ActiveLayer);
      Layerbox.ItemIndex:=I;
   end;
end;{TMainForm.FreeShipChangeLayerData}

procedure TMainForm.FreeShipChangeActiveLayer(Sender: TObject;Layer: TFreeSubdivisionLayer);
var Index : Integer;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FreeShipChangeActiveLayer(Sender: TObject;Layer: TFreeSubdivisionLayer) .\n');
    CloseFile(f);
   if (FreeShip.NumberOfSelectedControlFaces<>0) and (FreeShip.ActiveLayer=Layer) then
   begin
      // do not switch to the active layer when controlfaces are selected
   end else
   begin
      if Layer=nil then
      begin
         Index:=-1;
         Layerbox.ItemIndex:=Index;
         Panel1.Color:=clBtnface;
      end else
      begin
         Index:=Layerbox.Items.IndexOfObject(Layer);
         Layerbox.ItemIndex:=Index;
         Panel1.Color:=Layer.Color;
      end;
   end;
end;{TMainForm.FreeShipChangeActiveLayer}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FormClose(Sender: TObject; var Action: TCloseAction) .\n');
    CloseFile(f);
   FreeShip.Preferences.Save;
   FreeShip.OnChangeActiveLayer:=nil;
   Freeship.OnChangeLayerData:=nil;
   FreeShip.OnSelectItem:=nil;
end;{TMainForm.FormClose}

procedure TMainForm.NewLayerExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.NewLayerExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Layer_New;
   UpdateMenu;
end;{TMainForm.NewLayerExecute}

procedure TMainForm.DeleteExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.DeleteExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Selection_Delete;
   UpdateMenu;
end;{TMainForm.DeleteExecute}

procedure TMainForm.EdgeCollapseExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.EdgeCollapseExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Edge_Collapse;
   UpdateMenu;
end;{TMainForm.EdgeCollapseExecute}

procedure TMainForm.NewEdgeExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.NewEdgeExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Edge_Connect;
   UpdateMenu;
end;{TMainForm.NewEdgeExecute}

procedure TMainForm.ImportFEFExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportFEFExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ImportFEF;
   FOpenHullWindows;
   SetCaption;
   UpdateMenu;
end;{TMainForm.ImportFEFExecute}

procedure TMainForm.EdgeCreaseExecute(Sender: TObject);
begin
    AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.EdgeCreaseExecute(Sender: TObject) .\n');
    CloseFile(f);
    FreeShip.Edit.Edge_Crease;
    UpdateMenu;
end;{TMainForm.EdgeCreaseExecute}

procedure TMainForm.DeselectAllExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.DeselectAllExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Selection_Clear;
   UpdateMenu;
end;{TMainForm.ClearSelectionExecute}

procedure TMainForm.PointCollapseExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.PointCollapseExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_Collapse;
   UpdateMenu;
end;{TMainForm.PointCollapseExecute}

procedure TMainForm.LayerBoxChange(Sender: TObject);
var Layer   : TFreeSubdivisionLayer;
    I,Index : Integer;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.LayerBoxChange(Sender: TObject) .\n');
    CloseFile(f);
   Index:=Layerbox.ItemIndex;
   if index=-1 then Index:=0;
   Layer:=Layerbox.Items.Objects[index] as TFreeSubdivisionLayer;
   if Freeship.NumberOfSelectedControlFaces=0 then
   begin
      // change the active layer
      if Layer<>FreeShip.ActiveLayer then FreeShip.ActiveLayer:=Layer;
   end else
   begin
      // Assign all selected controlfaces to the new layer
      for I:=FreeShip.NumberOfSelectedControlFaces downto 1 do
         FreeShip.SelectedControlFace[I-1].Layer:=Layer;
      FreeShip.FileChanged:=True;
      FreeShip.Redraw;
   end;
   UpdateMenu;
end;{TMainForm.LayerBoxChange}

procedure TMainForm.Panel1Click(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.Panel1Click(Sender: TObject) .\n');
    CloseFile(f);
   ActiveLayerColorExecute(self);
end;{TMainForm.Panel1Click}

procedure TMainForm.ActiveLayerColorExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ActiveLayerColorExecute(Sender: TObject) .\n');
    CloseFile(f);
   // change the color of the currently active layer
   ColorDialog.Color:=FreeShip.ActiveLayer.Color;
   if ColorDialog.Execute then
   begin
      FreeShip.ActiveLayer.Color:=ColorDialog.Color;
      FreeShip.FileChanged:=True;
      FreeShip.Redraw;
      FreeShipChangeActiveLayer(self,Freeship.ActiveLayer);
      UpdateMenu;
   end;
end;{TMainForm.ActiveLayerColorExecute}

procedure TMainForm.DeleteEmptyLayersExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.DeleteEmptyLayersExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Layer_DeleteEmpty(False);
   UpdateMenu;
end;{TMainForm.DeleteEmptyLayersExecute}

procedure TMainForm.LayerDialogExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.LayerDialogExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Layer_Dialog;
   UpdateMenu;
end;{TMainForm.LayerDialogExecute}

procedure TMainForm.NewModelExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.NewModelExecute(Sender: TObject) .\n');
    CloseFile(f);
   if FreeShip.Edit.Model_New then FOpenHullWindows;
   Updatemenu;
end;{TMainForm.NewModelExecute}

procedure TMainForm.FormCreate(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FormCreate(Sender: TObject) .\n');
    CloseFile(f);
   {$IFDEF MEMCHECK}
      // Initialize memcheck, for memory-leak tracking
      MemChk;
   {$ENDIF}
end;{TMainForm.FormCreate}

procedure TMainForm.ShowStationsExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowStationsExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowStations:=not FreeShip.Visibility.ShowStations;
   UpdateMenu;
end;{TMainForm.ShowStationsExecute}

procedure TMainForm.ShowButtocksExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowButtocksExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowButtocks:=not FreeShip.Visibility.ShowButtocks;
   UpdateMenu;
end;{TMainForm.ShowButtocksExecute}

procedure TMainForm.ShowWaterlinesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowWaterlinesExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowWaterlines:=not FreeShip.Visibility.ShowWaterlines;
   UpdateMenu;
end;{TMainForm.ShowWaterlinesExecute}

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Answer:word;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean) .\n');
    CloseFile(f);
   if Freeship.FileChanged then
   begin
      Answer:=MessageDlg(Userstring(103)+EOL+Userstring(282)+'?',mtWarning,[mbYes,mbNo],0);
      CanClose:=Answer=mrYes;
   end;
end;{TMainForm.FormCloseQuery}

procedure TMainForm.NewFaceExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.NewFaceExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Face_New;
   UpdateMenu;
end;{TMainForm.NewFaceExecute}

procedure TMainForm.IntersectionDialogExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.IntersectionDialogExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Intersection_Dialog;
   UpdateMenu;
end;{TMainForm.IntersectionDialogExecute}

procedure TMainForm.EdgeExtrudeExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.EdgeExtrudeExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Edge_Extrude;
   UpdateMenu;
end;{TMainForm.EdgeExtrudeExecute}

procedure TMainForm.About1Click(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.About1Click(Sender: TObject) .\n');
    CloseFile(f);
   // Show splash screen again
   FreeSplashWindow:=TFreeSplashWindow.Create(Application);
   ShowTranslatedValues(FreeSplashWindow);
   FreeSplashWindow.Show;
   FreeSplashWindow.Refresh;
end;{TMainForm.About1Click}

procedure TMainForm.EdgeSplitExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.EdgeSplitExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Edge_Split;
   UpdateMenu;
end;{TMainForm.EdgeSplitExecute}

procedure TMainForm.ExportFEFExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportFEFExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ExportFEF;
   UpdateMenu;
end;{TMainForm.ExportFEFExecute}

procedure TMainForm.EditProjectSettingsExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.EditProjectSettingsExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.ProjectSettings.Edit;
   UpdateMenu;
end;{TMainForm.EditProjectSettingsExecute}

procedure TMainForm.CheckModelExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.CheckModelExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Model_Check(True);
   UpdateMenu;
end;{TMainForm.AnalyzeSurfaceExecute}

procedure TMainForm.ShowNormalsExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowNormalsExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowNormals:=not FreeShip.Visibility.ShowNormals;
   UpdateMenu;
end;{TMainForm.ShowNormalsExecute}

procedure TMainForm.DesignHydrostaticsExecute(Sender: TObject);
var Calculation : TFreeHydrostaticCalc;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.DesignHydrostaticsExecute(Sender: TObject) .\n');
    CloseFile(f);
   Calculation:=Freeship.Edit.Hydrostatics_Calculate(Freeship.ProjectSettings.ProjectDraft,0.0,0.0);
   if Calculation<>nil then
   begin
      Calculation.Destroy;
   end;
end;{TMainForm.DesignHydrostaticsExecute}

procedure TMainForm.ImportVRMLExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportVRMLExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ImportVRML;
   FOpenHullWindows;
   UpdateMenu;
end;{TMainForm.ImportVRMLExecute}

procedure TMainForm.RemoveNegativeExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.RemoveNegativeExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Face_DeleteNegative;
   UpdateMenu;
end;{TMainForm.RemoveNegativeExecute}

procedure TMainForm.RotateModelExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.RotateModelExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Face_Rotate;
   UpdateMenu;
end;{TMainForm.RotateModelExecute}

procedure TMainForm.ScaleModelExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ScaleModelExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Face_Scale;
   UpdateMenu;
end;{TMainForm.ScaleModelExecute}

procedure TMainForm.ShowGridExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowGridExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Visibility.ShowGrid:=not Freeship.Visibility.ShowGrid;
   UpdateMenu;
end;{TMainForm.ShowGridExecute}

procedure TMainForm.UndoExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.UndoExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Undo;
   UpdateMenu;
   SetCaption;
end;{TMainForm.UndoExecute}

   // Update undo memory usage
procedure TMainForm.FreeShipUpdateUndoData(Sender: TObject);
var Memory : Integer;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FreeShipUpdateUndoData(Sender: TObject) .\n');
    CloseFile(f);
   Memory:=Trunc(Freeship.UndoMemory/1024);
   if Memory<1024 then Panel2.Caption:=Userstring(283)+' : '+IntToStr(Memory)+' Kb.'
                  else Panel2.Caption:=Userstring(283)+' : '+Truncate(Memory/1024,3)+' Mb.';
   Undo.Enabled:=FreeShip.UndoCount>0;
   SetCaption;
   UpdateMenu;
end;{TMainForm.FreeShipUpdateUndoData}

procedure TMainForm.HydrostaticsDialogExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.HydrostaticsDialogExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Hydrostatics_Dialog;
   UpdateMenu;
end;{TMainForm.HydrostaticsDialogExecute}

procedure TMainForm.ExportObjExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportObjExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ExportObj;
   UpdateMenu;
end;{TMainForm.ExportObjExecute}

procedure TMainForm.InvertFaceExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.InvertFaceExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Face_Flip;
   UpdateMenu;
end;{TMainForm.InvertFaceExecute}

procedure TMainForm.PreferencesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.PreferencesExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Preferences.Edit;
   UpdateMenu;
end;{TMainForm.PreferencesExecute}

procedure TMainForm.ImportBodyplanExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportBodyplanExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.ImportFrames;
   FOpenHullWindows;
   SetCaption;
   UpdateMenu;
end;{TMainForm.ImportBodyplanExecute}

procedure TMainForm.ExportDXF3DPolylinesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportDXF3DPolylinesExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ExportDXF_3DPolylines;
   UpdateMenu;
end;{TMainForm.ExportDXFPolylinesExecute}

procedure TMainForm.ExportDXFFacesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportDXFFacesExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ExportDXF_Faces;
   UpdateMenu;
end;{TMainForm.ExportDXFFacesExecute}

procedure TMainForm.ImportHullFileExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportHullFileExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ImportHull;
   FOpenHullWindows;
   UpdateMenu;
end;{TMainForm.ImportHullFileExecute}

procedure TMainForm.ExportOffsetsExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportOffsetsExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ExportOffsets;
   UpdateMenu;
end;{TMainForm.ExportOffsetsExecute}

procedure TMainForm.MoveModelExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.MoveModelExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Face_Move;
   UpdateMenu;
end;{TMainForm.MoveModelExecute}

procedure TMainForm.AddPointExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.AddPointExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_New;
   UpdateMenu;
end;{TMainForm.AddPointExecute}

procedure TMainForm.DevelopLayersExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.DevelopLayersExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Layer_Develop;
   UpdateMenu;
end;{TMainForm.DevelopLayersExecute}

procedure TMainForm.ExportArchimedesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportArchimedesExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ExportArchimedes;
   UpdateMenu;
end;{TMainForm.ExportArchimedesExecute}

procedure TMainForm.ShowLinesplanExecute(Sender: TObject);
var I          : Integer;
    AlreadyOpen: Boolean;
    Form       : TFreeLinesplanForm;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowLinesplanExecute(Sender: TObject) .\n');
    CloseFile(f);
   if not Freeship.ProjectSettings.MainparticularsHasBeenset then
   begin
      MessageDlg(Userstring(96),mtWarning,[mbOk],0);
      exit;
   end;
   AlreadyOpen:=False;
   for I:=1 to MDIChildCount do if MDIChildren[I-1] is TFreeLinesplanForm then
   begin
      AlreadyOpen:=True;
      MDIChildren[I-1].BringToFront;
      break;
   end;
   if not AlreadyOpen then
   begin
      Form:=TFreeLinesplanForm.Create(self);
      ShowTranslatedValues(Form.LinesplanFrame);
      ShowTranslatedValues(Form);
      Form.LinesplanFrame.FreeShip:=FreeShip;
      Form.LinesplanFrame.Viewport.ZoomExtents;
   end;
end;{TMainForm.ShowLinesplanExecute}

procedure TMainForm.ShowDiagonalsExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowDiagonalsExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowDiagonals:=not FreeShip.Visibility.ShowDiagonals;
   UpdateMenu;
end;{TMainForm.ShowDiagonalsExecute}

procedure TMainForm.FreeShipUpdateRecentFileList(Sender: TObject);
var I    : Integer;
    Item : TMenuItem;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FreeShipUpdateRecentFileList(Sender: TObject) .\n');
    CloseFile(f);
   // delete old menu items
   RecentFiles.Clear;
   // add the new data
   for I:=1 to FreeShip.Edit.RecentFileCount do
   begin
      Item:=TMenuItem.Create(self);
      Item.Caption:=Freeship.Edit.RecentFile[I-1];
      Item.OnClick:=FLoadRecentFile;
      RecentFiles.Add(Item);
   end;
   UpdateMenu;
end;{TMainForm.FreeShipUpdateRecentFileList}

procedure TMainForm.ImportCareneExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportCareneExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ImportCarene;
   FOpenHullWindows;
   UpdateMenu;
end;{TMainForm.ImportCareneExecute}

procedure TMainForm.ShowMarkersExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowMarkersExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowMarkers:=not FreeShip.Visibility.ShowMarkers;
   UpdateMenu;
end;{TMainForm.ShowMarkersExecute}

procedure TMainForm.DeleteMarkersExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.DeleteMarkersExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Marker_Delete;
   UpdateMenu;
end;{TMainForm.DeleteMarkersExecute}

procedure TMainForm.ImportSurfaceExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportSurfaceExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ImportSurface;
   FOpenHullWindows;
   SetCaption;
   UpdateMenu;
end;{TMainForm.ImportSurfaceExecute}

procedure TMainForm.ShowcurvatureExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowcurvatureExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowCurvature:=not FreeShip.Visibility.ShowCurvature;
   UpdateMenu;
end;{TMainForm.ShowcurvatureExecute}

procedure TMainForm.IncreaseCurvatureScaleExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.IncreaseCurvatureScaleExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Visibility.IncreaseCurvatureScale;
end;{TMainForm.IncreaseCurvatureScaleExecute}

procedure TMainForm.DecreaseCurvatureScaleExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.DecreaseCurvatureScaleExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Visibility.DecreaseCurvatureScale;
end;{TMainForm.DecreaseCurvatureScaleExecute}

procedure TMainForm.FileSaveExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FileSaveExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_Save;
   UpdateMenu;
end;{TMainForm.FileSaveExecute}

procedure TMainForm.ImportChinesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportChinesExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ImportChines;
   FOpenHullWindows;
   SetCaption;
   UpdateMenu;
end;{TMainForm.ImportChinesExecute}

procedure TMainForm.ShowControlCurvesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowControlCurvesExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Visibility.ShowControlCurves:=not FreeShip.Visibility.ShowControlCurves;
   UpdateMenu;
end;{TMainForm.ShowControlCurvesExecute}

procedure TMainForm.NewCurveExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.NewCurveExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Curve_Add;
   UpdateMenu;
end;{TMainForm.AddCurveExecute}

procedure TMainForm.ExportCoordinatesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportCoordinatesExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ExportCoordinates;
   UpdateMenu;
end;{TMainForm.ExportCoordinatesExecute}

procedure TMainForm.InsertPlaneExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.InsertPlaneExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_InsertPlane;
   UpdateMenu;
end;{TMainForm.InsertPlaneExecute}

procedure TMainForm.PointsLockExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.PointsLockExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_Lock;
   UpdateMenu;
end;{TMainForm.PointsLockExecute}

procedure TMainForm.PointsUnlockExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.PointsUnlockExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_Unlock;
   UpdateMenu;
end;{TMainForm.UnlockPointsExecute}

procedure TMainForm.PointsUnlockAllExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.PointsUnlockAllExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_UnlockAll;
   UpdateMenu;
end;{TMainForm.PointsUnlockAllExecute}

procedure TMainForm.ImportMarkersExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportMarkersExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Marker_Import;
   UpdateMenu;
end;{TMainForm.ImportMarkersExecute}

procedure TMainForm.ExportMichletExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportMichletExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_Export_Michlet;
   UpdateMenu;
end;{TMainForm.ExportMichletExecute}

procedure TMainForm.ResistanceKaperExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ResistanceKaperExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Resistance_Kaper;
   Updatemenu;
end;{TMainForm.ResistanceKaperExecute}

procedure TMainForm.ResistanceDelftExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ResistanceDelftExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Resistance_Delft;
   Updatemenu;
end;{TMainForm.ResistanceDelftExecute}

procedure TMainForm.FreeShipChangeCursorIncrement(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FreeShipChangeCursorIncrement(Sender: TObject) .\n');
    CloseFile(f);
   Panel3.Caption:=Userstring(284)+': '+Truncate(Freeship.Visibility.CursorIncrement,5);
end;{TMainForm.FreeShipChangeCursorIncrement}

procedure TMainForm.Panel3Click(Sender: TObject);
var Str  : Ansistring;
    I    : integer;
    Value: TFloatType;
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.Panel3Click(Sender: TObject) .\n');
    CloseFile(f);
   if Freeship.Surface.NumberOfControlPoints=0 then exit;
   Str:=Truncate(Freeship.Visibility.CursorIncrement,5);
   if InputQuery('',Userstring(285)+':',Str) then
   begin
      Val(Str,Value,I);
      if I=0 then Freeship.Visibility.CursorIncrement:=Value;
   end;
end;{TMainForm.Panel3Click}

procedure TMainForm.PointAlignExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.PointAlignExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_ProjectStraightLine;
   UpdateMenu;
end;{TMainForm.PointProjectLineExecute}

procedure TMainForm.ImportMichletWavesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportMichletWavesExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_Import_MichletWaves;
   UpdateMenu;
end;{TMainForm.ImportMichletWavesExecute}

procedure TMainForm.ShowHydrostaticsExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowHydrostaticsExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Visibility.ShowHydrostaticData:=not Freeship.Visibility.ShowHydrostaticData;
   updatemenu;
end;{TMainForm.ShowHydrostaticsExecute}

procedure TMainForm.MirrorFaceExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.MirrorFaceExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Face_MirrorPlane;
   UpdateMenu;
end;{TMainForm.MirrorFaceExecute}

procedure TMainForm.ExportDXF2DPolylinesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportDXF2DPolylinesExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ExportDXF_2DPolylines;
   UpdateMenu;
end;{TMainForm.ExportDXF2DPolylinesExecute}

procedure TMainForm.FreeShipUpdateGeometryInfo(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.FreeShipUpdateGeometryInfo(Sender: TObject) .\n');
    CloseFile(f);
   Panel4.Caption:=IntToStr(Freeship.Surface.NumberOfControlFaces)+#32+Userstring(286)+', '+
                   IntToStr(Freeship.Surface.NumberOfControlEdges)+#32+Userstring(287)+', '+
                   IntToStr(Freeship.Surface.NumberOfControlPoints)+#32+Userstring(288)+', '+
                   IntToStr(Freeship.Surface.NumberOfControlCurves)+#32+Userstring(289);
end;{TMainForm.FreeShipUpdateGeometryInfo}

procedure TMainForm.TransformLackenbyExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.TransformLackenbyExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Model_LackenbyTransformation;
   UpdateMenu;
end;{TMainForm.TransformLackenbyExecute}

procedure TMainForm.ExportIGESExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportIGESExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ExportIGES;
   UpdateMenu;
end;{TMainForm.ExportIGESExecute}

procedure TMainForm.ExportPartExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportPartExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ExportPart;
   UpdateMenu;
end;{TMainForm.ExportPartExecute}

procedure TMainForm.ImportPartExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportPartExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ImportPart;
   UpdateMenu;
end;{TMainForm.ImportPartExecute}

procedure TMainForm.LayerIntersectionExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.LayerIntersectionExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_IntersectLayer;
   UpdateMenu;
end;{TMainForm.LayerIntersectionExecute}

procedure TMainForm.KeelRudderWizardExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.KeelRudderWizardExecute(Sender: TObject) .\n');
    CloseFile(f);
   ShowTranslatedValues(FreeKeelWizardDialog);
   FreeKeelWizardDialog.Execute(freeship);
   UpdateMenu;
end;{TMainForm.KeelRudderWizardExecute}

procedure TMainForm.RedoExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.RedoExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.Redo;
   UpdateMenu;
   SetCaption;
end;{TMainForm.RedoExecute}

procedure TMainForm.ClearUndoExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ClearUndoExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Undo_Clear;
   UpdateMenu;
end;{TMainForm.ClearUndoExecute}

procedure TMainForm.ShowUndoHistoryExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowUndoHistoryExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Undo_ShowHistory;
   UpdateMenu;
end;{TMainForm.ShowUndoHistoryExecute}

procedure TMainForm.ImportPolyCadExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ImportPolyCadExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.File_ImportPolycad;
   FOpenHullWindows;
   UpdateMenu;
end;{TMainForm.ImportPolyCadExecute}

procedure TMainForm.RemoveUnusedPointsExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.RemoveUnusedPointsExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Point_RemoveUnused;
   Updatemenu;
end;{TMainForm.RemoveUnusedPointsExecute}

procedure TMainForm.ExportGHSExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportGHSExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ExportGHS;
   UpdateMenu;
end;{TMainForm.ExportGHSExecute}

procedure TMainForm.ShowFlowlinesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ShowFlowlinesExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Visibility.ShowFlowlines:=not Freeship.Visibility.ShowFlowlines;
   updatemenu;
end;{TMainForm.ShowFlowlinesExecute}

procedure TMainForm.AddCylinderExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.AddCylinderExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Geometry_AddCylinder;
   UpdateMenu;
end;{TMainForm.AddCylinderExecute}

procedure TMainForm.SelectAllExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.SelectAllExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Selection_SelectAll;
   UpdateMenu;
end;{TMainForm.SelectAllExecute}

procedure TMainForm.ExportSTLExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.ExportSTLExecute(Sender: TObject) .\n');
    CloseFile(f);
   FreeShip.Edit.File_ExportSTL;
   UpdateMenu;
end;{TMainForm.ExportSTLExecute}

procedure TMainForm.CrossCurvesExecute(Sender: TObject);
begin
   AssignFile(f, 'LogFile.txt');
	append(f);
	writeln(f, 'Pozvan metod TMainForm.CrossCurvesExecute(Sender: TObject) .\n');
    CloseFile(f);
   Freeship.Edit.Hydrostatics_Crosscurves;
   UpdateMenu;
end;{TMainForm.CrossCurvesExecute}

end.
