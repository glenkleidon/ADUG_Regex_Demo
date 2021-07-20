unit regexDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  System.RegularExpressions;

type
  TRegexDemoFlags = (rCaseInsensitve, rGlobal, rMultiline, rDotall, rExtended, rUngreedy);

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
    function GetFlags: TRegExOptions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




function TForm1.Expression: string;
begin
  result := string(memExpression.text).replace(#13#10,'');
end;

function TForm1.GetFlags: TRegExOptions;
begin
  for var I := 0 to clbFlags.count-1 do
  begin
    if not clbFlags.Checked[i] then continue;
    var Flag : TRegexDemoFlags := TRegexDemoFlags(i);
    case Flag of
      rCaseInsensitve: result := result + [TRegexOption.roIgnoreCase];
      rGlobal: ;
      rMultiline: result := result + [TRegexOption.roMultiLine];
      rDotall: result := result + [TRegexOption.roSingleLine];
      rExtended: result := Result + [TRegexOption.roIgnorePatternSpace];
      rUngreedy: result := result + [TRegExOption.roExplicitCapture];
    end;

  end;
end;

procedure TForm1.SearchClick(Sender: TObject);
begin
  var match := TRegex.match(memDocument.text, Expression, GetFlags);
  memResults.text := match.value;
end;

end.
