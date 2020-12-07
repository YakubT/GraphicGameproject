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
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    ButtonYes: TButton;
    ButtonNO: TButton;
    Edit1: TEdit;
    BTNConfirm: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure right_arrowClick(Sender: TObject);
    procedure left_arClick(Sender: TObject);
    procedure optionsClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonNOClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BTNConfirmClick(Sender: TObject);
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
Form1.Button2.Hide;
Form1.Button3.Hide;
Form1.Button4.Hide;
Form1.Button5.Hide;
Form1.Label1.Hide;
Form1.ButtonYes.Hide;
Form1.ButtonNO.Hide;
Form1.Edit1.Hide;
Form1.BTNConfirm.Hide;
end;
procedure go_to_menu();
begin
Form1.Color:=clMenuHighlight;
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
var i:integer;
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
Form1.LblAc.Font.Size:=Trunc(18/1080*Screen.Height);
// set Nameoflevels
Form1.NameofLevels.Left:=Trunc((920/1920)*Screen.Width);
Form1.NameofLevels.Top:=Trunc((608/1080)*Screen.Height);
Form1.NameofLevels.Height:=Trunc((48/1080)*Screen.Height);
Form1.NameofLevels.Width:=Trunc((247/1920)*Screen.Width);
Form1.NameofLevels.Font.Size:=Trunc(30/1080*Screen.Height);
// set ScrollBox1
Form1.ScrollBox1.Left:=Trunc((500/1920)*Screen.Width);
Form1.ScrollBox1.Top:=Trunc((48/1080)*Screen.Height);
Form1.ScrollBox1.Height:=Trunc((665/1080)*Screen.Height);
Form1.ScrollBox1.Width:=Trunc((969/1920)*Screen.Width);
// set Button2
Form1.Button2.Left:=Trunc((1128/1366)*Screen.Width);
Form1.Button2.Top:=Trunc((32/768)*Screen.Height);
Form1.Button2.Height:=Trunc((113/768)*Screen.Height);
Form1.Button2.Width:=Trunc((233/1366)*Screen.Width);
// set Button3
Form1.Button3.Left:=Trunc((288/1366)*Screen.Width);
Form1.Button3.Top:=Trunc((536/768)*Screen.Height);
Form1.Button3.Height:=Trunc((105/768)*Screen.Height);
Form1.Button3.Width:=Trunc((249/1366)*Screen.Width);
//set button4
Form1.Button4.Left:=Trunc((568/1366)*Screen.Width);
Form1.Button4.Top:=Trunc((536/768)*Screen.Height);
Form1.Button4.Height:=Trunc((105/768)*Screen.Height);
Form1.Button4.Width:=Trunc((249/1366)*Screen.Width);
// set button5
Form1.Button5.Left:=Trunc((848/1366)*Screen.Width);
Form1.Button5.Top:=Trunc((536/768)*Screen.Height);
Form1.Button5.Height:=Trunc((105/768)*Screen.Height);
Form1.Button5.Width:=Trunc((249/1366)*Screen.Width);
// set RadiouGroup1
Form1.RadioGroup1.Items.Clear;
for i:=1 to cntplayers do
Form1.RadioGroup1.Items.Add(playersname[i]);
Form1.RadioGroup1.Height:=Trunc((100/768*Screen.Height)*cntplayers);
Form1.RadioGroup1.Left:=Trunc((10/1920)*Screen.Width);
Form1.RadioGroup1.Width:=Trunc((900/1920)*Screen.Width);
Form1.RadioGroup1.Top:=-cntplayers;
// set Label1
Form1.Label1.Left:=Trunc((144/1366)*Screen.Width);
Form1.Label1.Top:=Trunc((248/768)*Screen.Height);
Form1.Label1.Height:=Trunc((48/768)*Screen.Height);
Form1.Label1.Width:=Trunc((868/1366)*Screen.Width);
Form1.Label1.Font.Size:=Trunc((30/768)*Screen.Height);
// set ButtonYES
Form1.ButtonYes.Left:=Trunc((320/1920)*Screen.Width);
Form1.ButtonYes.Top:=Trunc((584/1080)*Screen.Height);
Form1.ButtonYes.Height:=Trunc((225/768)*Screen.Height);
Form1.ButtonYes.Width:=Trunc((449/1366)*Screen.Width);
// set ButtonNO
Form1.ButtonNO.Left:=Trunc((728/1366)*Screen.Width);
Form1.ButtonNO.Top:=Trunc((584/1080)*Screen.Height);
Form1.ButtonNO.Height:=Trunc((225/768)*Screen.Height);
Form1.ButtonNO.Width:=Trunc((449/1366)*Screen.Width);
// set Edit1
Form1.Edit1.Left:=Trunc((312/1920)*Screen.Width);
Form1.Edit1.Top:=Trunc((352/1080)*Screen.Height);
Form1.Edit1.Height:=Trunc((137/1080)*Screen.Height);
Form1.Edit1.Width:=Trunc((1265/1920)*Screen.Width);
//set BtnConfirm
Form1.BTNConfirm.Left:=Trunc((320/1920)*Screen.Width);
Form1.BTNConfirm.Top:=Trunc((584/1080)*Screen.Height);
Form1.BTNConfirm.Height:=Trunc((225/768)*Screen.Height);
Form1.BTNConfirm.Width:=Trunc((449/1366)*Screen.Width);
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
read_from_file();
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
procedure go_to_options();
begin
Form1.Color:=clSkyBlue;
hide_all();
Form1.RadioGroup1.ItemIndex:=playerid-1;
Form1.ScrollBox1.Show;
Form1.Button2.Show;
Form1.Button3.Show;
Form1.Button4.show;
Form1.Button5.Show;
Form1.LblAc.Show;
end;
procedure TForm1.optionsClick(Sender: TObject);
var i:integer;
begin
go_to_options;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
go_to_menu();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
playerid:=Form1.RadioGroup1.ItemIndex+1;
Form1.LblAc.Caption:='Account:'+playersname[playerid];
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
hide_all();
Form1.Label1.Show;
Form1.Label1.Height:=Trunc((48/768)*Screen.Height);
Form1.Label1.Left:=Trunc((144/1366)*Screen.Width);
Form1.Label1.Caption:='Are you sure? Do you want to delete the account '+playersname[Form1.RadioGroup1.ItemIndex+1]+'?';
Form1.ButtonYes.Show;
Form1.ButtonNO.Show;
end;

procedure TForm1.ButtonNOClick(Sender: TObject);
begin
go_to_options();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
hide_all();
Form1.Edit1.Font.Size:=Trunc((40/1080)*Screen.Height);
Form1.Edit1.Text:='';
Form1.Edit1.Show;
Form1.ButtonNO.Show;
Form1.BTNConfirm.Show;
Form1.Label1.Show;
Form1.Label1.Top:=Trunc((216/1080)*Screen.Height);
Form1.Label1.Left:=Trunc((312/1920)*Screen.Width);
Form1.Label1.Caption:='Give the name of new account:';
end;
function checking (s:string):Boolean;
var i:Integer;flag:Boolean;
begin
  flag:=False;
for i:=1 to cntplayers do
  begin
  if (playersname[i]=s) then
          flag:=True;
  end;
  checking:=flag;
end;
procedure TForm1.BTNConfirmClick(Sender: TObject);
var s:string;
begin
s:=Form1.Edit1.Text;
if (checking(s)=True) then
  begin
  with Application do
      MessageBox('This name is already exists.Please give another name','Warning',MB_OK);
  end
else
  begin
    cntplayers:=cntplayers+1;
    playersname[cntplayers]:=s;
    playersprogr[cntplayers][1]:=0;
    playersprogr[cntplayers][2]:=0;
    playersprogr[cntplayers][3]:=0;
    playersprogr[cntplayers][4]:=0;
    AssignFile(f,'progress_of_players.txt');
    Append(f);
    Writeln(f,s);
    Writeln(f,'0 0 0 0');
    CloseFile(f);
    Form1.RadioGroup1.Items.Add(s);;
    Form1.RadioGroup1.Height:=Trunc((100/768*Screen.Height)*cntplayers);
    Form1.RadioGroup1.Top:=-5;


    with Application do
      MessageBox('New account was created','',MB_OK);
      go_to_options;
  end;
end;
end.
