#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

$dir=InputBox('Buscar dir','Ingrese texto del directorio.'&@CRLF&'Si no ingresa nada se cierra')
if $dir='' then Exit


if StringInStr(@AppDataCommonDir,$dir) then MsgBox(0,'',@AppDataCommonDir &' --> @AppDataCommonDir')
if StringInStr(@AppDataDir,$dir) then MsgBox(0,'',@AppDataDir&' --> @AppDataDir')
if StringInStr(@CommonFilesDir,$dir) then MsgBox(0,'',@CommonFilesDir&' --> @CommonFilesDir')
if StringInStr(@DesktopCommonDir,$dir) then MsgBox(0,'',@DesktopCommonDir&' --> @DesktopCommonDir')
if StringInStr(@DesktopDepth,$dir) then MsgBox(0,'',@DesktopDepth&' --> @DesktopDepth')
if StringInStr(@DesktopDir,$dir) then MsgBox(0,'',@DesktopDir&' --> @DesktopDir')
if StringInStr(@DesktopRefresh,$dir) then MsgBox(0,'',@DesktopRefresh&' --> @DesktopRefresh')
if StringInStr(@DocumentsCommonDir,$dir) then MsgBox(0,'',@DocumentsCommonDir&' --> @DocumentsCommonDir')
if StringInStr(@FavoritesCommonDir,$dir) then MsgBox(0,'',@FavoritesCommonDir&' --> @FavoritesCommonDir')
if StringInStr(@FavoritesDir,$dir) then MsgBox(0,'',@FavoritesDir&' --> @FavoritesDir')
if StringInStr(@HomeDrive,$dir) then MsgBox(0,'',@HomeDrive&' --> @HomeDrive')
if StringInStr(@HomePath,$dir) then MsgBox(0,'',@HomePath&' --> @HomePath')
if StringInStr(@LocalAppDataDir,$dir) then MsgBox(0,'',@LocalAppDataDir&' --> @LocalAppDataDir')
if StringInStr(@MyDocumentsDir,$dir) then MsgBox(0,'',@MyDocumentsDir&' --> @MyDocumentsDir')
if StringInStr(@ProgramFilesDir,$dir) then MsgBox(0,'',@ProgramFilesDir&' --> @ProgramFilesDir')
if StringInStr(@ProgramsCommonDir,$dir) then MsgBox(0,'',@ProgramsCommonDir&' --> @ProgramsCommonDir')
if StringInStr(@ProgramsDir,$dir) then MsgBox(0,'',@ProgramsDir&' --> @ProgramsDir')
if StringInStr(@ScriptDir,$dir) then MsgBox(0,'',@ScriptDir&' --> @ScriptDir')
if StringInStr(@ScriptFullPath,$dir) then MsgBox(0,'',@ScriptFullPath&' --> @ScriptFullPath')
if StringInStr(@StartMenuCommonDir,$dir) then MsgBox(0,'',@StartMenuCommonDir&' --> @StartMenuCommonDir')
if StringInStr(@StartupDir,$dir) then MsgBox(0,'',@StartupDir&' --> @StartupDir')
if StringInStr(@SystemDir,$dir) then MsgBox(0,'',@SystemDir&' --> @SystemDir')
if StringInStr(@TempDir,$dir) then MsgBox(0,'',@TempDir&' --> @TempDir')
if StringInStr(@UserProfileDir,$dir) then MsgBox(0,'',@UserProfileDir&' --> @UserProfileDir')
if StringInStr(@WindowsDir,$dir) then MsgBox(0,'',@WindowsDir&' --> @WindowsDir')
if StringInStr(@WorkingDir,$dir) then MsgBox(0,'',@WorkingDir&' --> @WorkingDir')



