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
    NameofLevels: TLabel;
    ScrollBox1: TScrollBox;
    RadioGroup1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure right_arrowClick(Sender: TObject);
    procedure left_arClick(Sender: TObject);
    procedure optionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  masimg:array [1..5] of string;
  maslvnm:array [1..5] of string;
  levelnum: Integer;
  playerid:Integer;
  playersname:  array [1..100] of string;
  playersprogr: array [1..100,1..10] of Integer;
  f:Text;
  cntplayers:Integer;
implementation

{$R *.dfm}
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
Form1.LblAc.Hide;
Form1.NameofLevels.Hide;
Form1.ScrollBox1.Hide;
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
Form1.LblAc.Show;
Form1.LblAc.Caption:='Account:'+playersname[playerid];
Form1.NameofLevels.Caption:=maslvnm[1];
Form1.NameofLevels.Show;
end;
procedure set_properties();
begin
// set left arr
Form1.left_ar.Left:=Trunc((248/1920)*Screen.Width);
Form1.left_ar.Top:=Trunc((352/1080)*Screen.Height);
Form1.left_ar.Height:=Trunc((161/1080)*Screen.Height);
Form1.left_ar.Width:=Trunc((257/1920)*Screen.Width);
// set right arr
Form1.right_arrow.Left:=Trunc((1472/1920)*Screen.Width);
Form1.right_arrow.Top:=Trunc((336/1080)*Screen.Height);
Form1.right_arrow.Height:=Trunc((161/1080)*Screen.Height);
Form1.right_arrow.Width:=Trunc((257/1920)*Screen.Width);
// set Bitbtn1
Form1.BitBtn1.Left:=Trunc((1592/1920)*Screen.Width);
Form1.BitBtn1.Top:=Trunc((840/1080)*Screen.Height);
Form1.BitBtn1.Height:=Trunc((153/1080)*Screen.Height);
Form1.BitBtn1.Width:=Trunc((299/1920)*Screen.Width);
// set Button1
Form1.Button1.Left:=Trunc((680/1920)*Screen.Width);
Form1.Button1.Top:=Trunc((664/1080)*Screen.Height);
Form1.Button1.Height:=Trunc((193/1080)*Screen.Height);
Form1.Button1.Width:=Trunc((601/1920)*Screen.Width);
// set Level image
Form1.LevelImage.Left:=Trunc((512/1920)*Screen.Width);
Form1.LevelImage.Top:=Trunc((72/1080)*Screen.Height);
Form1.LevelImage.Height:=Trunc((513/1080)*Screen.Height);
Form1.LevelImage.Width:=Trunc((953/1920)*Screen.Width);
// set options
Form1.options.Left:=Trunc((1800/1920)*Screen.Width);
Form1.options.Top:=Trunc((16/1080)*Screen.Height);
Form1.options.Height:=Trunc((97/1080)*Screen.Height);
Form1.options.Width:=Trunc((105/1920)*Screen.Width);
// set lblac
Form1.LblAc.Left:=Trunc((32/1920)*Screen.Width);
Form1.LblAc.Top:=Trunc((32/1080)*Screen.Height);
Form1.LblAc.Height:=Trunc((33/1080)*Screen.Height);
Form1.LblAc.Width:=Trunc((273/1920)*Screen.Width);
// set Nameoflevels
Form1.NameofLevels.Left:=Trunc((920/1920)*Screen.Width);
Form1.NameofLevels.Top:=Trunc((608/1080)*Screen.Height);
Form1.NameofLevels.Height:=Trunc((48/1080)*Screen.Height);
Form1.NameofLevels.Width:=Trunc((247/1920)*Screen.Width);
Form1.NameofLevels.Font.Size:=Trunc(30/1080*Screen.Height);
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
set_properties();
playerid:=1;
masimg[1]:='winter.jpg';
masimg[2]:='spring.jpg';
masimg[3]:='summer.jpg';
masimg[4]:='autumn.jpg';
maslvnm[1]:='Winter';
maslvnm[2]:='Spring';
maslvnm[3]:='Summer';
maslvnm[4]:='Autumn';
read_from_file();
go_to_menu();
end;

procedure TForm1.right_arrowClick(Sender: TObject);
begin
levelnum:=levelnum+1;
Form1.LevelImage.Picture.LoadFromFile(masimg[levelnum]);
Form1.NameofLevels.Caption:=maslvnm[levelnum];
Form1.left_ar.Show;
if (levelnum=4) then
   right_arrow.Hide;

end;

procedure TForm1.left_arClick(Sender: TObject);
begin
levelnum:=levelnum-1;
Form1.LevelImage.Picture.LoadFromFile(masimg[levelnum]);
Form1.NameofLevels.Caption:=maslvnm[levelnum];
Form1.left_ar.Show;
Form1.right_arrow.Show;
if (levelnum=1) then
   left_ar.Hide;
end;

procedure TForm1.optionsClick(Sender: TObject);
var i:integer;
begin
hide_all();
Form1.ScrollBox1.Show;
Form1.RadioGroup1.Items.Clear;
for i:=1 to cntplayers do
Form1.RadioGroup1.Items.Add(playersname[i]);
end;

end.
