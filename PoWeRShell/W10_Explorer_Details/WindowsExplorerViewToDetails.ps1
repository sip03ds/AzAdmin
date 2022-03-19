#
# *** Change the value of $Backup to the path of an existing folder
# *** where you want to registry backups saved to.
#
$Backup   = 'C:\Users\keith\Documents\Sandbox\Folder View Defaults'
# ----------------------------------------------------------------
# Paths for Powershell commands use the registry drives, hence the ':'
# 
$source = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes'
$dest   = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderTypes'
$TVs    = "$dest\*\TopViews\*"
# ----------------------------------------------------------------
# Paths for reg.exe commands don't use a ':'
$bagMRU   = 'HKCR\Local Settings\Software\Microsoft\Windows\Shell\BagMRU'
$bags     = 'HKCR\Local Settings\Software\Microsoft\Windows\Shell\Bags'
$defaults = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults'
# ----------------------------------------------------------------
# Backup & then delete saved views and 'Apply to folders' defaults
reg export $BagMru "$Backup\bagMRU.reg"
reg export $Bags "$Backup\bags.reg"
reg export $Defaults "$Backup\defaults.reg"
reg delete $bagMRU /f
reg delete $bags /f
reg delete $defaults /f
reg delete ($dest.Replace(':','')) /f
#-----------------------------------------------------------------
#------------------* The Magic is here *--------------------------
#
# Copy HKLM\...\FolderTypes to HKCU\...\FolderTypes
copy-item $source "$(split-path $dest)" -Recurse
#
# Set all 'LogicalViewMode' values to the desired style
# 1 = Details   2 = Tiles   3 = Icons
# 4 = List      5 = Content
# Edit "$key2edit.SetValue('LogicalViewMode', 4)" as desired

get-childitem $TVs |
     %{$key2edit = (get-item $_.PSParentPath).OpenSubKey($_.PSChildName, $True);
       $key2edit.SetValue('LogicalViewMode', 3)
       $key2edit.Close()    
     }
Get-process explorer | Stop-Process




