{hint: Pascal files location: ...\TabBarApp\jni }
unit main_page;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, actionbartab, Laz_And_Controls;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    Button1: jButton;
    Button2: jButton;
    jActionBarTab1: jActionBarTab;
    jPanel1: jPanel;
    jPanel2: jPanel;
    procedure AndroidModule1Create(Sender: TObject);
    procedure AndroidModule1JNIPrompt(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure jPanel1FlingGesture(Sender: TObject; flingGesture: TFlingGesture);
    procedure jPanel2FlingGesture(Sender: TObject; flingGesture: TFlingGesture);
  private
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule1: TAndroidModule1;

implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

procedure TAndroidModule1.AndroidModule1JNIPrompt(Sender: TObject);
begin
    jActionBarTab1.Add('Tab 1', jPanel1.View{sheet view});
    jActionBarTab1.Add('Tab 2', jPanel2.View{sheet view});
    Self.SetTabNavigationModeActionBar;
end;

procedure TAndroidModule1.Button1Click(Sender: TObject);
begin
     ShowMessage('Button 1 Clicked in Panel 2');
end;

procedure TAndroidModule1.Button2Click(Sender: TObject);
begin
     ShowMessage('Button 2 Clicked in Panel 1');
end;

procedure TAndroidModule1.AndroidModule1Create(Sender: TObject);
begin
    jPanel1.Visible:= True;
    jPanel2.Visible:= False;
end;

procedure TAndroidModule1.jPanel1FlingGesture(Sender: TObject;
  flingGesture: TFlingGesture);
begin
    case flingGesture of
     fliLeftToRight: begin end;
     fliRightToLeft: begin
       jPanel1.Visible := False;
       jPanel2.Visible := True;
       jActionBarTab1.SelectTabByIndex(2);
     end;
  end;
end;

procedure TAndroidModule1.jPanel2FlingGesture(Sender: TObject;
  flingGesture: TFlingGesture);
begin   
    case flingGesture of
     fliLeftToRight: begin  
       jPanel1.Visible := True;
       jPanel2.Visible := False;
       jActionBarTab1.SelectTabByIndex(1);
     end;
     fliRightToLeft: begin end;
  end;

end;

end.
