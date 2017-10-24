#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance , force 

;Version	Date			Author		Notes
;	0.1		24-OCT-2017		Staid03		Initial

;Script Purpose:
;Creating an extract based on the OPML podcastfile backup extracted
;from Podkicker (or Podkicker Pro).

formattime , atime ,, yyyyMMdd_HHmmss
inf = podkicker_backup.opml
outf = podkicker_backup_%atime%.opml

splitbit = >

filereadline , podline , %inf% , 1

stringsplit , PCA , podline , %splitbit%

loop , %PCA0%
{
	outline := PCA%a_index%
	fileappend , %outline%>`n , %outf%
}

run , %outf%
return 