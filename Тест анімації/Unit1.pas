unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x:integer;
  flag:boolean;
implementation

{$R *.dfm}
{
procedure Delay (dwMilliseconds: Longint);
var
 iStart, iStop: DWORD;
begin
iStart := GetTickCount;
repeat
iStop := GetTickCount;
Sleep(1);
Application.ProcessMessages;
 until (iStop - iStart) >= dwMilliseconds;
end;
}
procedure Delay (dwMilliseconds: Longint);
var
 iStart, iStop: DWORD;
begin
iStart := GetTickCount;
repeat
iStop := GetTickCount;
Sleep(1);
Application.ProcessMessages;
 until (iStop - iStart) >= dwMilliseconds;
end;

procedure anim();
var k:integer;
begin
k:=1;
Form1.Image1.Hide;
Form1.Image2.Hide;
Form1.Image3.Hide;

if (x=1) then
begin
Form1.Image1.Show;
end
else
if (x=2) then
begin
Form1.Image2.Show;
end
else
if (x=3) then
Form1.Image3.Show;

end;
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if ((key=ord(' ')) and (Form1.Image1.Top>=128)) then
begin
flag:=false;
Timer1.Enabled:=false;
Timer2.Enabled:=true;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
anim();
x:=x+1;
if (x=4) then
x:=1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
x:=1;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
If ((form1.Image1.Top>10) and (flag=false)) then
begin
Form1.Image1.Top:=Form1.Image1.Top-5;
Form1.Image2.Top:=Form1.Image3.Top-5;
Form1.Image3.Top:=Form1.Image3.Top-5;
if (form1.Image1.Top<=10) then
flag:=true;
end;
If ((flag=true) and not (form1.Image1.Top>=128))  then
begin
Form1.Image1.Top:=Form1.Image1.Top+5;
Form1.Image2.Top:=Form1.Image3.Top+5;
Form1.Image3.Top:=Form1.Image3.Top+5;
end;
If (form1.Image1.Top>=128) then
begin
Timer2.Enabled:=False;
Timer1.Enabled:=true;
end;
end;

end.

