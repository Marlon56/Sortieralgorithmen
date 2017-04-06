unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type
   tFeld=array [1..100]of integer;
  { TForm1 }

  TForm1 = class(TForm)
    Bclose: TButton;
    Bselectsort: TButton;
    Binsert: TButton;
    Bquick: TButton;
    Bzufall: TButton;
    Bbubblesort: TButton;
    Bausgabe: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    Palgorithmen: TPanel;
    procedure BcloseClick(Sender: TObject);
    procedure BinsertClick(Sender: TObject);
    procedure BquickClick(Sender: TObject);
    procedure BselectsortClick(Sender: TObject);
    procedure BzufallClick(Sender: TObject);
    procedure BbubblesortClick(Sender: TObject);
    procedure BausgabeClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  x:integer;
  Feld:tFeld ;
implementation

{$R *.lfm}

{ TForm1 }
procedure Selectsort (var a:tFeld);
var i,k,minPos,t:integer;
begin
  for i:=1 to x-1 do
   begin
    minPos:=i;
    for k:=i+1 to x do
      if a[k] < a[minPos] then
       minPos:=k;
    t:=a[i];
    a[i]:=a[minPos];
    a[minPos]:=t;
   end;
end;

procedure Bubblesort (var a:tFeld);
var i,t,z:integer;
begin
  for t:=x downto 2 do
   for i:=0 to (t-1) do
     if a[i] > a[i+1] then
      begin
        z:=a[i];
        a[i]:=a[i+1];
        a[i+1]:=z;
      end;
end;

procedure Insertsort (var a:tFeld);
var i,c,j:integer;
begin
  for i:=2 to x do
   begin
     c:=a[i];
     j:=i;
     while (j > 1) and (a[j-1] > c) do
      begin
       a[j]:=a[j-1];
       j:=j-1;
      end;
     a[j]:=c;
   end;
end;

procedure Quicksort (anfang,ende:integer;var a:tFeld);
var RZ,LZ,VE,zv:integer;     //rechterzeiger, Linkerzeiger, Vergleichelement
begin                        //zufallsvariable
  LZ:=anfang;
  RZ:=ende;
  VE:= a[ (LZ+RZ) div 2];
  repeat
     while a[LZ] < VE do
      LZ:=LZ+1;
     while a[RZ] > VE do
      RZ:=RZ-1;
     if LZ <= RZ then
       begin
         zv:=a[LZ];
         a[LZ]:=a[RZ];
         a[RZ]:=zv;
         LZ:=LZ+1;
         RZ:=RZ-1;
        end;
   until  RZ < LZ;
   if anfang < RZ then
    begin
      quicksort(anfang,RZ,a);
    end;
   if LZ < ende then
    begin
      quicksort(LZ,ende,a);
    end;
end;

procedure TForm1.BzufallClick(Sender: TObject);
var i:integer;
begin
  memo1.clear;
  x:=strtoint(Edit1.text);
  for i:=1 to x do
   Feld[i]:=random(100)+1;
  for i:=0 to x-1 do
   Memo1.lines.add(inttostr(Feld[i+1]));
end;

procedure TForm1.BcloseClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.BinsertClick(Sender: TObject);
begin
  Insertsort(Feld);
end;

procedure TForm1.BquickClick(Sender: TObject);
begin
  Quicksort(1,x,Feld);
end;

procedure TForm1.BselectsortClick(Sender: TObject);
begin
  Selectsort(Feld);
end;

procedure TForm1.BbubblesortClick(Sender: TObject);
begin
  Bubblesort(Feld);
end;

procedure TForm1.BausgabeClick(Sender: TObject);
var i:integer;
begin
  Memo1.clear;
  for i:=0 to x-1 do
   Memo1.lines.add(inttostr(Feld[i+1]));
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
   If (key < '0') or (key > '9') then
     if key <> chr(8) then key:=Chr(27)
     else key:=chr(8);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  Memo1.clear;
end;

end.

