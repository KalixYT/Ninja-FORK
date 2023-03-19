#include "environment.iss"

#define MyAppName "Ninja"
#define MyAppVersion "1.11.1"
#define MyAppPublisher "Evan Martin"
#define MyAppURL "https://github.com/ninja-build/ninja"
#define MyAppExeName "ninja.exe"

[Setup]
ChangesEnvironment=true
AppId={{0AD2ED62-1A9E-4109-9CB6-EDECCB2295B2}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=C:\Users\heard\Desktop\Downloads\Ninja
OutputBaseFilename=nin-inst
SetupIconFile=C:\Users\heard\Desktop\ninja.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: envPath; Description: "Add to PATH variable (Recomended)"

[Files]
Source: "C:\Users\heard\Desktop\Downloads\Ninja\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
    if CurStep = ssPostInstall 
     then EnvAddPath(ExpandConstant('{app}'));
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
    if CurUninstallStep = usPostUninstall
    then EnvRemovePath(ExpandConstant('{app}'));
end;
