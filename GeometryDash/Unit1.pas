unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    LevelImage: TImage;
    right_arrow: TImage;
    left_ar: TImage;
    options: TImage;
    LblAc: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure right_arrowClick(Sender: TObject);
    procedure left_arClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  masimg:array [1..5] of string;
  levelnum: Integer;
  playerid:Integer;
  playersname:  array [1..100] of string;
  playersprogr: array [1..100,1..10] of Integer;
  f:Text;
  cntplayers:Integer;
implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
Form1.Close;
end;
procedure hide_all ();
begin
Form1.BitBtn1.Hide;
Form1.Button1.Hide;
Form1.left_ar.Hide;
Form1.LevelImage.Hide;
Form1.right_arrow.Hide;
Form1.options.Hide;
end;
procedure go_to_menu();
begin
levelnum:=1;
hide_all();
Form1.BitBtn1.Show;
Form1.Button1.Show;
Form1.LevelImage.Show;
Form1.LevelImage.Picture.LoadFromFile(masimg[levelnum]);
Form1.right_arrow.Show;
Form1.options.Show;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
playerid:=1;
masimg[1]:='winter.jpg';
masimg[2]:='spring.jpg';
masimg[3]:='summer.jpg';
masimg[4]:='autumn.jpg';
go_to_menu();
end;

procedure TForm1.right_arrowClick(Sender: TObject);
begin
levelnum:=levelnum+1;
Form1.LevelImage.Picture.LoadFromFile(masimg[levelnum]);
Form1.left_ar.Show;
if (levelnum=4) then
   right_arrow.Hide;

end;
procedure read_from_file ();
var j:Integer;
begin
  AssignFile(f,'progress_of_players.txt');
  Reset(f);
  cntplayers:=0;
  while not Eof(f) do
  begin
    cntplayers:=cntplayers+1;
    Readln(f,playersname[cntplayers]);
    for j:=1 to 3 do
    read(f,playersprogr[cntplayers][j]);
    readln(f,playersprogr[cntplayers][4]);
  end;
  CloseFile(f);
end;
procedure TForm1.left_arClick(Sender: TObject);
begin
levelnum:=levelnum-1;
Form1.LevelImage.Picture.LoadFromFile(masimg[levelnum]);
Form1.left_ar.Show;
Form1.right_arrow.Show;
if (levelnum=1) then
   left_ar.Hide;
end;

end.
