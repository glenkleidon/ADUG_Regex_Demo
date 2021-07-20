unit regexDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.CheckLst,
  System.Generics.Collections,
  System.RegularExpressions;

type
  TRegexDemoFlags = (rCaseInsensitve=0, rGlobal, rMultiline, rDotall, rExtended,
    rUngreedy);

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
    procedure DisplayResults(AMatch: TMatch; AMatches: TMatchCollection);
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
  result := string(memExpression.text).replace(#13#10, '');
end;

function TForm1.GetFlags: TRegExOptions;
var
  I :integer;
  Flag: TRegexDemoFlags;
begin
  result := [];
  for I := 0 to clbFlags.count - 1 do
  begin
    if not clbFlags.Checked[I] then
      continue;
    Flag := TRegexDemoFlags(I);
    case Flag of
      rCaseInsensitve:
        result := result + [TRegexOption.roIgnoreCase];
      rGlobal:
        ;
      rMultiline:
        result := result + [TRegexOption.roMultiLine];
      rDotall:
        result := result + [TRegexOption.roSingleLine];
      rExtended:
        result := result + [TRegexOption.roIgnorePatternSpace];
      rUngreedy:
        result := result + [TRegexOption.roExplicitCapture];
    end;
  end;
end;

procedure TForm1.DisplayResults(AMatch: TMatch;
  AMatches: TMatchCollection);

  procedure Display(ACurrentMatch: TMatch);
  begin
    if ACurrentMatch.Success then
      memResults.lines.Add(format('%d - %s', [ACurrentMatch.Index , ACurrentMatch.Value]));
  end;

begin
  memResults.Clear;
  Display(AMatch);
  for var lMatch in AMatches do
    display(lMatch);
end;

procedure TForm1.SearchClick(Sender: TObject);
var
  lMatches: TMatchCollection;
  lMatch: TMatch;
begin
  if clbFlags.Checked[ord(rGlobal)] then
    lMatches := TRegex.Matches(memDocument.text, Expression, GetFlags)
  else
    lMatch := TRegex.match(memDocument.text, Expression, GetFlags);

  DisplayResults(lMatch, lMatches);

end;

end.
