unit regexDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    memDocument: TMemo;
    Splitter1: TSplitter;
    clbFlags: TCheckListBox;
    lblExpression: TLabel;
    lblFlags: TLabel;
    memExpression: TMemo;
    Search: TButton;
    memResults: TMemo;
    Splitter2: TSplitter;
    procedure SearchClick(Sender: TObject);
  private
    function Expression: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses System.RegularExpressions;

{$R *.dfm}

function TForm1.Expression: string;
begin
  result := string(memExpression.text).replace(#13#10,'');
end;

procedure TForm1.SearchClick(Sender: TObject);
begin
  var match := TRegex.match(memDocument.text, Expression);
  memResults.text := match.value;
end;

end.
