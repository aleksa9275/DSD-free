{#############################################################################################}
{    This code is distributed as part of the FREE!ship project. FREE!ship is an               }
{    open source surface-modelling program based on subdivision surfaces and intended for     }
{    designing ships.                                                                         }
{                                                                                             }
{    Copyright � 2005, by Martijn van Engeland                                                }
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

unit FreeHydrostaticsdlg;

interface

uses Windows,
     Messages,
     SysUtils,
     Variants,
     Classes,
     Graphics,
     Controls,
     Forms,
     Dialogs,
     StdCtrls,
     ComCtrls,
     Buttons,
     RichEdit,
     Printers,
     ExtCtrls;

type TFreeHydrostaticsDialog   = class(TForm)
                                       Panel1: TPanel;
    Edit: TMemo;
                                       Panel2: TPanel;
                                       Button1: TSpeedButton;
                                       SpeedButton1: TSpeedButton;
                                       PrintDialog: TPrintDialog;
                                       SpeedButton2: TSpeedButton;
                                       SaveDialog: TSaveDialog;
                                       procedure Button1Click(Sender: TObject);
                                       procedure SpeedButton1Click(Sender: TObject);
                                       procedure SpeedButton2Click(Sender: TObject);
                                       procedure FormShow(Sender: TObject);
                                    private   { Private declarations }
                                    public    { Public declarations }
                                 end;

var FreeHydrostaticsDialog: TFreeHydrostaticsDialog;
	LOG:	TextFile;
implementation

{$R *.dfm}

procedure TFreeHydrostaticsDialog.Button1Click(Sender: TObject);
begin
   AssignFile(LOG, 'LogFile.txt');
	Append (LOG);
	Writeln (LOG, 'Pozvan metod TFreeHydrostaticsDialog.Button1Click(Sender: TObject) .\n');
    CloseFile(LOG);
   Close;
end;{TFreeHydrostaticsDialog.Button1Click}

procedure TFreeHydrostaticsDialog.SpeedButton1Click(Sender: TObject);
var PrintText : TextFile;
    Str       : AnsiString;
    I         : Integer;
begin
   AssignFile(LOG, 'LogFile.txt');
	Append (LOG);
	Writeln (LOG, 'Pozvan metod TFreeHydrostaticsDialog.SpeedButton1Click(Sender: TObject) .\n');
    CloseFile(LOG);
   if PrintDialog.Execute then
   begin

      AssignPrn(PrintText);
      Rewrite(PrintText);
      Printer.Canvas.Font.Assign(Edit.Font);
      for I:=1 to Edit.Lines.Count do
      begin
         Str:=Edit.Lines[I-1];
         Writeln(PrintText,Str);
      end;
      CloseFile(PrintText);
   end;
end;{TFreeHydrostaticsDialog.SpeedButton1Click}

procedure TFreeHydrostaticsDialog.SpeedButton2Click(Sender: TObject);
begin
   AssignFile(LOG, 'LogFile.txt');
	Append (LOG);
	Writeln (LOG, 'Pozvan metod TFreeHydrostaticsDialog.SpeedButton2Click(Sender: TObject) .\n');
    CloseFile(LOG);
   // Skip translation
   if SaveDialog.Execute then
   begin
      Case SaveDialog.FilterIndex of
         1 : begin // save as plain text
                Edit.Lines.SaveToFile(ChangeFileExt(SaveDialog.FileName,'.txt'));
             end;
      end;
   end;
   // End Skip translation
end;{TFreeHydrostaticsDialog.SpeedButton2Click}

procedure TFreeHydrostaticsDialog.FormShow(Sender: TObject);
begin
   AssignFile(LOG, 'LogFile.txt');
	Append (LOG);
	Writeln (LOG, 'Pozvan metod TFreeHydrostaticsDialog.FormShow(Sender: TObject) .\n');
    CloseFile(LOG);
   // Place cursor at beginning
   Edit.CaretPos:=TPoint(Point(0,0));
end;{TFreeHydrostaticsDialog.FormShow}

end.