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
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Sprite1: TImage;
    Sprite2: TImage;
    Sprite3: TImage;
    Timer1: TTimer;
    fon: TImage;
    pause: TImage;
    Continue: TImage;
    Tomenu: TImage;
    LInstr: TLabel;
    Start: TButton;
    Timer2: TTimer;
    shyp1: TImage;
    Timer3: TTimer;
    Ruxshiptime: TTimer;
    attempt: TLabel;
    shyp2: TImage;
    Ruxshyp2: TTimer;
    shyp3: TImage;
    Ruxshyp3: TTimer;
    Hsc: TLabel;
    sc: TLabel;
    Finish: TLabel;
    Znovu: TImage;
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
    procedure ButtonYesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pauseClick(Sender: TObject);
    procedure TomenuClick(Sender: TObject);
    procedure ContinueClick(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure RuxshiptimeTimer(Sender: TObject);
    procedure Ruxshyp2Timer(Sender: TObject);
    procedure Ruxshyp3Timer(Sender: TObject);
    procedure ZnovuClick(Sender: TObject);
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
  posofspr:Integer;
  playersname:  array [1..100] of string;
  playersprogr: array [1..100,1..10] of Integer;
  f:Text;
  cntplayers:Integer;
  pausestan:integer;
  low,high,score:integer;
  flag,flagruh1,flagruh2,flagruh3:boolean;
  leveltime:Int64;
  sproba:Integer;
implementation

{$R *.dfm}
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
Form1.Label2.Hide;
Form1.Shape1.Hide;
Form1.Shape2.Hide;
Form1.Sprite1.Hide;
Form1.Sprite2.Hide;
Form1.Sprite3.Hide;
Form1.fon.Hide;
Form1.pause.Hide;
Form1.Continue.Hide;
Form1.Tomenu.Hide;
Form1.LInstr.Hide;
Form1.Start.Hide;
Form1.shyp1.Hide;
Form1.attempt.Hide;
Form1.shyp2.Hide;
Form1.shyp3.Hide;
Form1.Hsc.Hide;
Form1.sc.Hide;
Form1.Finish.Hide;
Form1.Znovu.Hide;
end;
procedure go_to_menu();
begin
pausestan:=-1;
Form1.Color:=clHighlight;
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
Form1.Shape1.Show;
Form1.Shape2.Width:=Trunc((playersprogr[playerid][1]/100)*Form1.Shape1.Width);
Form1.Shape2.Show;
Form1.Label2.Caption:=InttoStr(playersprogr[playerid][1])+'%';
Form1.Label2.Show;
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
Form1.Button1.Top:=Trunc((552/768)*Screen.Height);
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
//set Shape1
Form1.Shape1.Left:=Trunc((408/1366)*Screen.Width);
Form1.Shape1.Top:=Trunc((480/768)*Screen.Height);
Form1.Shape1.Height:=Trunc((57/768)*Screen.Height);
Form1.Shape1.Width:=Trunc((585/1366)*Screen.Width);
// set shape2
Form1.Shape2.Left:=Trunc((408/1366)*Screen.Width);
Form1.Shape2.Top:=Trunc((480/768)*Screen.Height);
Form1.Shape2.Height:=Trunc((57/768)*Screen.Height);
Form1.Shape2.Width:=Trunc((500/1366)*Screen.Width);
//set label2
Form1.Label2.Left:=Trunc((672/1366)*Screen.Width);
Form1.Label2.Top:=Trunc((490/768)*Screen.Height);
Form1.Label2.Height:=Trunc((33/768)*Screen.Height);
Form1.Label2.Width:=Trunc((77/1366)*Screen.Width);
Form1.Label2.Font.Size:=Trunc((20/768)*Screen.Height);
// set fon
Form1.fon.Left:=0;
Form1.fon.Top:=0;
Form1.fon.Height:=Trunc((250/768)*Screen.Height);
Form1.fon.Width:=Screen.Width;
// set pause
Form1.pause.Left:=Trunc((1256/1366)*Screen.Width);
Form1.pause.Top:=Trunc((8/768)*Screen.Height);
Form1.pause.Height:=Trunc((89/768)*Screen.Height);
Form1.pause.Width:=Trunc((89/1366)*Screen.Width);
// set continue
Form1.Continue.Left:=Trunc((296/1366)*Screen.Width);
Form1.Continue.Top:=Trunc((240/768)*Screen.Height);
Form1.Continue.Height:=Trunc((297/768)*Screen.Height);
Form1.Continue.Width:=Trunc((297/1366)*Screen.Width);

//set Linstr
Form1.LInstr.Left:=Trunc((408/1366)*Screen.Width);
Form1.LInstr.Top:=Trunc((296/768)*Screen.Height);
Form1.LInstr.Height:=Trunc((81/768)*Screen.Height);
Form1.LInstr.Width:=Trunc((641/1366)*Screen.Width);
Form1.LInstr.Font.Size:=Trunc((50/768)*Screen.Height);
//set start
Form1.Start.Left:=Trunc((552/1366)*Screen.Width);
Form1.Start.Top:=Trunc((464/768)*Screen.Height);
Form1.Start.Height:=Trunc((161/768)*Screen.Height);
Form1.Start.Width:=Trunc((337/1366)*Screen.Width);
//set shyp1
Form1.shyp1.Left:=Trunc((272/1920)*Screen.Width);
Form1.shyp1.Top:=Trunc((525/1080)*Screen.Height);
Form1.shyp1.Height:=Trunc((60/1080)*Screen.Height);
Form1.shyp1.Width:=Trunc((60/1920)*Screen.Width);
//set shyp2
Form1.shyp2.Left:=Trunc(248/1366*Screen.Width);
Form1.shyp2.Top:=Trunc(592/768*Screen.Height);
Form1.shyp2.Height:=Trunc(55/768*Screen.Height);
Form1.shyp2.Width:=Trunc(41/1366*Screen.Width);
//set attempt
Form1.attempt.Left:=Trunc((8/1366)*Screen.Width);
Form1.attempt.Top:=Trunc((16/768)*Screen.Height);
Form1.attempt.Width:=Trunc((101/1366)*Screen.Width);
Form1.attempt.Height:=Trunc((24/768)*Screen.Height);
Form1.attempt.Font.Size:=trunc(15/768*Screen.Height);
// set Hsc
Form1.Hsc.Left:=Trunc((8/1366)*Screen.Width);
Form1.Hsc.Top:=Trunc((40/768)*Screen.Height);
Form1.Hsc.Width:=Trunc((101/1366)*Screen.Width);
Form1.Hsc.Height:=Trunc((24/768)*Screen.Height);
Form1.Hsc.Font.Size:=trunc(15/768*Screen.Height);
//set Sc
Form1.sc.Left:=Trunc((8/1366)*Screen.Width);
Form1.sc.Top:=Trunc((64/768)*Screen.Height);
Form1.sc.Width:=Trunc((101/1366)*Screen.Width);
Form1.sc.Height:=Trunc((24/768)*Screen.Height);
Form1.sc.Font.Size:=trunc(15/768*Screen.Height);
//set shyp3
Form1.shyp3.Left:=Trunc(248/1366*Screen.Width);
Form1.shyp3.Top:=Trunc(597/768*Screen.Height);
Form1.shyp3.Height:=Trunc(50/768*Screen.Height);
Form1.shyp3.Width:=Trunc(51/1366*Screen.Width);
//set Finish
Form1.Finish.Left:=Trunc((368/1366)*Screen.Width);
Form1.Finish.Top:=Trunc((176/768)*Screen.Height);
Form1.Finish.Width:=Trunc((649/1366)*Screen.Width);
Form1.Finish.Height:=Trunc((97/768)*Screen.Height);
Form1.Finish.Font.Size:=trunc(60/768*Screen.Height);
//set znovu
Form1.Znovu.Left:=Trunc((245/1366)*Screen.Width);
Form1.Znovu.Top:=Trunc((300/768)*Screen.Height);
Form1.Znovu.Height:=Trunc((297/768)*Screen.Height);
Form1.Znovu.Width:=Trunc((297/1366)*Screen.Width);
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
Form1.Shape2.Width:=Trunc((playersprogr[playerid][levelnum]/100)*Form1.Shape1.Width);
Form1.Label2.Caption:=InttoStr(playersprogr[playerid][levelnum])+'%';
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
Form1.Shape2.Width:=Trunc((playersprogr[playerid][levelnum]/100)*Form1.Shape1.Width);
Form1.Label2.Caption:=InttoStr(playersprogr[playerid][levelnum])+'%';
if (levelnum=1) then
   left_ar.Hide;
end;
procedure go_to_options();
begin
Form1.Color:=clSkyBlue;
hide_all();
Form1.RadioGroup1.ItemIndex:=playerid-1;
Form1.ScrollBox1.VertScrollBar.Position:=0;
Form1.ScrollBox1.Show;
Form1.RadioGroup1.Top:=0;
Form1.Button2.Show;
Form1.Button3.Show;
Form1.Button4.show;
Form1.Button5.Show;
Form1.LblAc.Show;
Form1.LblAc.Caption:='Account:'+playersname[playerid];
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
if (cntplayers=1) then
    with Application do
      MessageBox('You can''t delete the last account','',MB_OK)
else
begin
hide_all();
Form1.Label1.Show;
Form1.Label1.Height:=Trunc((48/768)*Screen.Height);
Form1.Label1.Left:=Trunc((144/1366)*Screen.Width);
Form1.Label1.Caption:='Are you sure? Do you want to delete the account '+playersname[Form1.RadioGroup1.ItemIndex+1]+'?';
Form1.ButtonYes.Show;
Form1.ButtonNO.Show;
end;
end;

procedure TForm1.ButtonNOClick(Sender: TObject);
begin
go_to_options();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if (cntplayers=99) then
begin
with Application do
      MessageBox('Count of account is too large','',MB_OK);
end
else
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

    with Application do
      MessageBox('New account was created','',MB_OK);
      go_to_options;
  end;
end;
procedure overwrite();
var i,j:integer;
begin
Assignfile(f,'progress_of_players.txt');
Rewrite(f);
for i:=1 to cntplayers do
  begin
  Writeln(f,playersname[i]);
  for j:=1 to 3 do
  Write(f,playersprogr[i][j],' ');
  writeln(f,playersprogr[i][4]);
  end;
CloseFile(f);
end;
procedure TForm1.ButtonYesClick(Sender: TObject);
var i,j:integer;
begin
  if (cntplayers=1) then
    with Application do
      MessageBox('You can''t delete the last account','',MB_OK)
  else
  begin
  for i:=(Form1.RadioGroup1.ItemIndex+2) to cntplayers do
    begin
      playersname[i-1]:=playersname[i];
      for j:= 1 to 4 do
      playersprogr[i-1][j]:=playersprogr[i][j];
    end;
  cntplayers:=cntplayers-1;
  //
  Form1.RadioGroup1.Items.Clear;
  for i:=1 to cntplayers do
  Form1.RadioGroup1.Items.Add(playersname[i]);
  Form1.RadioGroup1.Height:=Trunc((100/768*Screen.Height)*cntplayers);
  Form1.RadioGroup1.Left:=Trunc((10/1920)*Screen.Width);
  Form1.RadioGroup1.Width:=Trunc((900/1920)*Screen.Width);
  //
  overwrite();
  if (playerid>cntplayers) then
    playerid:=cntplayers;
  go_to_options;
  end;

end;
procedure the_end_of_level();
begin
Form1.Timer1.Enabled:=False;
Form1.Timer2.Enabled:=False;
Form1.Timer3.Enabled:=False;
Form1.Ruxshiptime.Enabled:=False;
Form1.Ruxshyp2.Enabled:=False;
Form1.Ruxshyp3.Enabled:=False;
hide_all();
Form1.Color:=clWhite;
//set tomenu
Form1.Tomenu.Left:=Trunc((824/1366)*Screen.Width);
Form1.Tomenu.Top:=Trunc((300/768)*Screen.Height);
Form1.Tomenu.Height:=Trunc((297/768)*Screen.Height);
Form1.Tomenu.Width:=Trunc((297/1366)*Screen.Width);
Form1.Tomenu.Show;
Form1.Finish.Show;
Form1.Znovu.Show;
end;
procedure set_level1();
begin
//
Form1.Sprite1.Left:=Trunc((96/1366)*Screen.Width);
Form1.Sprite1.Top:=Trunc((440/768)*Screen.Height);
Form1.Sprite1.Height:=Trunc((193/768)*Screen.Height);
Form1.Sprite1.Width:=Trunc((137/1366)*Screen.Width);

Form1.Sprite2.Left:=Trunc((96/1366)*Screen.Width);
Form1.Sprite2.Top:=Trunc((440/768)*Screen.Height);
Form1.Sprite2.Height:=Trunc((193/768)*Screen.Height);
Form1.Sprite2.Width:=Trunc((137/1366)*Screen.Width);

Form1.Sprite3.Left:=Trunc((96/1366)*Screen.Width);
Form1.Sprite3.Top:=Trunc((440/768)*Screen.Height);
Form1.Sprite3.Height:=Trunc((193/768)*Screen.Height);
Form1.Sprite3.Width:=Trunc((137/1366)*Screen.Width);
Form1.attempt.Caption:='Attempt:'+Inttostr(sproba);

low:=Trunc((440/768)*Screen.Height);
high:=Trunc((315/768)*Screen.Height);

leveltime:=0;
pausestan:=0;
hide_all();
Form1.Color:=clWhite;
Form1.Timer1.Enabled:=true;
Form1.Timer3.Enabled:=True;
Form1.Timer2.Enabled:=False;
Form1.Ruxshiptime.Enabled:=False;
Form1.Ruxshyp2.Enabled:=False;
Form1.Ruxshyp3.Enabled:=False;
Form1.Ruxshiptime.Interval:=25;
Form1.Ruxshyp2.Interval:=25;
Form1.Ruxshyp3.Interval:=25;
Form1.Ruxshyp3.Interval:=25;
Form1.Sprite1.Show;
Form1.Sprite2.Show;
Form1.Sprite3.Show;
Form1.fon.Show;
Form1.attempt.Show;
Form1.pause.Show;
flagruh1:=false;
Flagruh2:=false;
Flagruh3:=false;
posofspr:=1;
Form1.sc.Caption:='Score:0%';
Form1.Hsc.Caption:='High score:'+Inttostr(playersprogr[playerid][1])+'%';
Form1.sc.Show;
Form1.Hsc.Show;
score:=0;
overwrite();
end;
procedure instruction();
begin
hide_all();
Form1.LInstr.Show;
Form1.Start.Show;

end;
procedure TForm1.Button1Click(Sender: TObject);
begin
if (levelnum=1) then
instruction();
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Form1.Sprite1.Hide;
Form1.Sprite2.Hide;
Form1.Sprite3.Hide;
if (posofspr=1) then
Form1.Sprite1.Show;
if (posofspr=2) then
Form1.Sprite2.Show;
if (posofspr=3) then
Form1.Sprite3.Show;

posofspr:=posofspr+1;
if (posofspr=4) then
posofspr:=1;
end;

procedure TForm1.pauseClick(Sender: TObject);
begin
Form1.Timer1.Enabled:=False;
Form1.Timer2.Enabled:=False;
Form1.Timer3.Enabled:=False;
Form1.Ruxshiptime.Enabled:=False;
Form1.Ruxshyp2.Enabled:=False;
Form1.Ruxshyp3.Enabled:=False;
hide_all();
Form1.Continue.Show;
//set tomenu
Form1.Tomenu.Left:=Trunc((824/1366)*Screen.Width);
Form1.Tomenu.Top:=Trunc((240/768)*Screen.Height);
Form1.Tomenu.Height:=Trunc((297/768)*Screen.Height);
Form1.Tomenu.Width:=Trunc((297/1366)*Screen.Width);
Form1.Tomenu.Show;
end;

procedure TForm1.TomenuClick(Sender: TObject);
begin
Form1.Timer1.Enabled:=false;
Form1.Timer2.Enabled:=false;
Form1.Timer3.Enabled:=False;
Form1.Ruxshiptime.Enabled:=False;
Form1.Ruxshyp2.Enabled:=False;
Form1.Ruxshyp3.Enabled:=False;
overwrite();
go_to_menu();
end;

procedure TForm1.ContinueClick(Sender: TObject);
begin
hide_all();
Form1.Color:=clWhite;
if (Form1.Sprite1.Top<low) then
Form1.Timer2.Enabled:=True
else
Form1.Timer1.Enabled:=true;
Form1.Timer3.Enabled:=true;
Form1.Sprite1.Show;
Form1.Sprite2.Show;
Form1.Sprite3.Show;
Form1.fon.Show;
Form1.pause.Show;
Form1.attempt.Show;
Form1.sc.Show;
Form1.Hsc.Show;
If (flagruh1=true) then
  begin
  Form1.Ruxshiptime.Enabled:=True;
  Form1.shyp1.Show;
  end;
If (Flagruh2=true) then
  begin
  Form1.Ruxshyp2.Enabled:=True;
  Form1.shyp2.Show;
  end;
If (Flagruh3=true) then
  begin
  Form1.Ruxshyp3.Enabled:=True;
  Form1.shyp3.Show;
  end;
end;

procedure TForm1.StartClick(Sender: TObject);
begin
sproba:=1;
if (levelnum=1) then
set_level1();
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ((key=' ') and (pausestan=0) and (Form1.Sprite1.Top>=low)) then
  begin
  flag:=false;
  Timer1.Enabled:=false;
  Timer2.Enabled:=true;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
If ((form1.Sprite1.Top>high) and (flag=false)) then
begin
Form1.Sprite1.Top:=Form1.Sprite1.Top-Trunc((6/768)*Screen.Height);
Form1.Sprite2.Top:=Form1.Sprite2.Top-Trunc((6/768)*Screen.Height);
Form1.Sprite3.Top:=Form1.Sprite3.Top-Trunc((6/768)*Screen.Height);
if (form1.Sprite1.Top<=high) then
flag:=true;
end;
If ((flag=true) and not (form1.Sprite1.Top>low))  then
begin
Form1.Sprite1.Top:=Form1.Sprite1.Top+Trunc((6/768)*Screen.Height);
Form1.Sprite2.Top:=Form1.Sprite2.Top+Trunc((6/768)*Screen.Height);
Form1.Sprite3.Top:=Form1.Sprite3.Top+Trunc((6/768)*Screen.Height);
end;
If (form1.Sprite1.Top>=low) then
begin
Timer2.Enabled:=False;
Timer1.Enabled:=true;
end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
leveltime:=leveltime+50;
if ((leveltime mod 350) = 0) then
begin
score:=score+1;
Form1.sc.Caption:='Score:'+Inttostr(score)+'%';
if (score>playersprogr[playerid][1]) then
  begin
  playersprogr[playerid][1]:=score;
  Form1.Hsc.Caption:='High score:'+Inttostr(score)+'%';
  end;
end;
if (leveltime=35000) then
the_end_of_level();
if ((leveltime=1250) or (leveltime=11000) or (leveltime=22500) or (leveltime=30000)) then
begin
flagruh1:=true;
Ruxshiptime.Enabled:=True;
Form1.shyp1.Left:=Screen.Width+Form1.shyp1.Width;
Form1.shyp1.Top:=Trunc(840/1920*Screen.Width);
Form1.shyp1.Show;
end;
if ((leveltime=6000) or (leveltime=13000) or (leveltime=30250)) then
begin
flagruh2:=true;
Ruxshyp2.Enabled:=true;
Form1.shyp2.Left:=Screen.Width+Form1.shyp2.Width;
Form1.shyp2.Show;
end;
if ((leveltime=16000) or (leveltime=24500)) then
begin
flagruh3:=true;
Ruxshyp3.Enabled:=true;
Form1.shyp3.Left:=Screen.Width+Form1.shyp3.Width;
Form1.shyp3.Show;
end;
if (leveltime=22000) then
begin
Form1.Ruxshiptime.Interval:=16;
Form1.Ruxshyp2.Interval:=16;
Form1.Ruxshyp3.Interval:=16;
end;
end;
function prinalezhinst(Left,Width,Top,Height,X,Y:Integer):Boolean;
begin
if ((Left<X) and (X<Left+Width) and (Top<Y) and (Y<Top+Height)) then
 prinalezhinst:=True
else
prinalezhinst:=false;
end;
function peretyn (top1,left1,height1,width1,top2,left2,height2,width2:integer):Boolean;
begin
if (prinalezhinst(left1,width1,top1,height1,left2,top2)) then
peretyn:=True
else
if (prinalezhinst(left1,width1,top1,height1,left2+width2,top2)) then
peretyn:=True
else
if (prinalezhinst(left1,width1,top1,height1,left2+width2,top2+height2)) then
peretyn:=True
else
if (prinalezhinst(left1,width1,top1,height1,left2,top2+height2)) then
peretyn:=True
else
peretyn:=False;
end;
procedure TForm1.RuxshiptimeTimer(Sender: TObject);
begin
Form1.shyp1.Left:=Form1.shyp1.Left-Trunc((10/1920)*Screen.Width);
if (peretyn(Form1.Sprite1.Top,Form1.Sprite1.Left,Form1.Sprite1.Height,Form1.Sprite1.Width,Form1.shyp1.Top,Form1.shyp1.Left,Form1.shyp1.Height,Form1.shyp1.Width)=True) then
begin
sproba:=sproba+1;
hide_all();
Form1.Timer1.Enabled:=False;
Form1.Timer2.Enabled:=False;
Form1.Timer3.Enabled:=False;
Form1.Ruxshiptime.Enabled:=False;
Form1.Ruxshyp2.Enabled:=False;
Form1.Ruxshyp3.Enabled:=False;
Delay(1000);
set_level1();
end;
if (Form1.shyp1.Left<-(Form1.shyp1.Width)) then
begin
Form1.shyp1.Hide;
Form1.Ruxshiptime.Enabled:=False;
flagruh1:=false;
end;
end;
procedure TForm1.Ruxshyp2Timer(Sender: TObject);
begin
Form1.shyp2.Left:=Form1.shyp2.Left-Trunc((10/1920)*Screen.Width);
if (peretyn(Form1.Sprite1.Top,Form1.Sprite1.Left,Form1.Sprite1.Height,Form1.Sprite1.Width,Form1.shyp2.Top,Form1.shyp2.Left,Form1.shyp2.Height,Form1.shyp2.Width)=True) then
begin
sproba:=sproba+1;
hide_all();
Form1.Timer1.Enabled:=False;
Form1.Timer2.Enabled:=False;
Form1.Timer3.Enabled:=False;
Form1.Ruxshiptime.Enabled:=False;
Form1.Ruxshyp2.Enabled:=False;
Form1.Ruxshyp3.Enabled:=False;
Delay(1000);
set_level1();
end;
if (Form1.shyp2.Left<-(Form1.shyp2.Width)) then
begin
Form1.shyp2.Hide;
Form1.Ruxshyp2.Enabled:=False;
flagruh2:=false;
end;
end;

procedure TForm1.Ruxshyp3Timer(Sender: TObject);
begin
Form1.shyp3.Left:=Form1.shyp3.Left-Trunc((10/1920)*Screen.Width);
if (peretyn(Form1.Sprite1.Top,Form1.Sprite1.Left,Form1.Sprite1.Height,Form1.Sprite1.Width,Form1.shyp3.Top,Form1.shyp3.Left,Form1.shyp3.Height,Form1.shyp3.Width)=True) then
begin
sproba:=sproba+1;
hide_all();
Form1.Timer1.Enabled:=False;
Form1.Timer2.Enabled:=False;
Form1.Timer3.Enabled:=False;
Form1.Ruxshiptime.Enabled:=False;
Form1.Ruxshyp2.Enabled:=False;
Form1.Ruxshyp3.Enabled:=False;
Delay(1000);
set_level1();
end;
if (Form1.shyp3.Left<-(Form1.shyp3.Width)) then
begin
Form1.shyp3.Hide;
Form1.Ruxshyp3.Enabled:=False;
flagruh3:=false;
end;
end;

procedure TForm1.ZnovuClick(Sender: TObject);
begin
set_level1();
sproba:=1;
end;

end.
