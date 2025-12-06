!include "MUI2.nsh"

Name "Secretr"
OutFile "/home/sujit/Projects/secretr/dist/Secretr_1.0.4_amd64_setup.exe"
InstallDir "$PROGRAMFILES\Secretr"
RequestExecutionLevel admin

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Section "Install"
  SetOutPath $INSTDIR
  File "/home/sujit/Projects/secretr/dist/cli_windows_amd64/secretr.exe"
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  CreateDirectory "$SMPROGRAMS\Secretr"
  CreateShortcut "$SMPROGRAMS\Secretr\Secretr.lnk" "$INSTDIR\secretr.exe"
  CreateShortcut "$SMPROGRAMS\Secretr\Uninstall.lnk" "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\secretr.exe"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir "$INSTDIR"
  Delete "$SMPROGRAMS\Secretr\Secretr.lnk"
  Delete "$SMPROGRAMS\Secretr\Uninstall.lnk"
  RMDir "$SMPROGRAMS\Secretr"
SectionEnd
