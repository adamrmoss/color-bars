#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  App.MouseCursor = System.Cursors.FingerPointer
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kHelpAbout, Type = String, Dynamic = False, Default = \"&About...", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
