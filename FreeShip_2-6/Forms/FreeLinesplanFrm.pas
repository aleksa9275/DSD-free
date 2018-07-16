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
unit FreeLinesplanFrm;

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
     FreeLinesplanFrme;

type TFreeLinesplanForm  = class(TForm)
    LinesplanFrame: TFreeLinesplanFrame;
                                 procedure FormClose(Sender: TObject; var Action: TCloseAction);
                              private   { Private declarations }
                              public    { Public declarations }
                           end;

var FreeLinesplanForm: TFreeLinesplanForm;

implementation

{$R *.dfm}

procedure TFreeLinesplanForm.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   // Disconnect from FreeShip component;
   LinesplanFrame.FreeShip:=nil;
   Action:=caFree;
end;{TFreeLinesplanForm.FormClose}

end.
