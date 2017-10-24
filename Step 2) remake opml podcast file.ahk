#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#singleinstance , force

;Version	Date			Author		Notes
;	0.1		24-OCT-2017		Staid03		Initial

;Script Purpose:
;Using the podcastfile for input created in part 1, recreate an OPML file to
;load into Podkicker podcast application.

formattime , atime , , yyyyMMdd_HHmmss

inf = podcastfileinput.txt


;pre-edit this file to remove all lines from start and end that are not podcast lines
msgbox ,,, opening file now to get you to remove the lines that are not podcasts... and unwanted podcasts
runwait , %inf%



outf = podkicker_input_%atime%.opml

starterline = <?xml version='1.0' encoding='UTF-8' standalone='yes' ?><opml version="2.0" xmlns:pk="http://www.podkicker.com/backup.dtd"><head></head><body>
appendline(starterline, outf)

loop , read , %inf%
{
	appendline(a_loopreadline, outf)
}

finisherline = </body></opml>
appendline(finisherline, outf)

run , %outf%
return

;--------------------------------------

appendline(outline, outf)
{
	fileappend , %outline% , %outf%
}
return 

;--------------------------------------