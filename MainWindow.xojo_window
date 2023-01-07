#tag DesktopWindow
Begin DesktopWindow MainWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   True
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   782
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   784400383
   MenuBarVisible  =   False
   MinimumHeight   =   320
   MinimumWidth    =   240
   Resizeable      =   True
   Title           =   "Color Bars"
   Type            =   0
   Visible         =   True
   Width           =   720
   Begin DesktopCanvas MainCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   720
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   62
      Transparent     =   True
      Visible         =   True
      Width           =   720
   End
   Begin DesktopLabel VelocityLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Velocity:"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   17
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   55
   End
   Begin DesktopSlider VelocitySlider
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   30
      Index           =   -2147483648
      Left            =   76
      LineStep        =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   0
      MinimumValue    =   0
      PageStep        =   1
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   2
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   573
   End
   Begin DesktopLabel VelocityValueLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      Italic          =   False
      Left            =   661
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "?"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   17
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   39
   End
   Begin Timer AnimationTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   0
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin MidiVoice MidiTicker
      Index           =   -2147483648
      Instrument      =   116
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin MidiVoice MidiDinger
      Index           =   -2147483648
      Instrument      =   46
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' Initialize data
		  Self.BarColors = Array(Red, Orange, Yellow, Green, Blue, Magenta)
		  Self.Velocities = Array(0, 1, 2, 3, 4, 5, 6, 8, 10, 12, 16, 20, 24, 30)
		  Self.TickerPitches = Array(52, 57, 64)
		  Self.DingerPitches = Array(52, 53, 57, 59, 60, 64, 65, 69, 71, 72, 76, 77)
		  
		  ' Initialize VelocitySlider
		  Self.VelocitySlider.MinimumValue = 0
		  Self.VelocitySlider.MaximumValue = Self.Velocities.Count - 1
		  Self.VelocitySlider.Value = 0
		  
		  ' For MacOS, we need to disable to File menu
		  #If targetCocoa
		    
		    Self.MenuBar.Child("FileMenu").Visible = False
		    
		  #EndIf
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub IncrementColor()
		  ' Rotate to next color
		  Self.FirstColorIndex = (Self.FirstColorIndex + Self.BarColors.Count - 1) Mod Self.BarColors.Count
		  
		  ' Redraw the canvas
		  Self.MainCanvas.Refresh
		  
		  ' Play a tick
		  Var pitch As Integer = Self.TickerPitches(System.Random.LessThan(Self.TickerPitches.Count))
		  Var noteVelocity As Integer = System.Random.InRange(30, 45)
		  Self.MidiTicker.PlayNote(pitch, noteVelocity, 80)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IncrementDirection()
		  ' Rotate to next direction
		  Self.Direction = AnimationDirection((Integer(Self.Direction) + 1) Mod 4)
		  
		  ' Redraw the canvas
		  Self.MainCanvas.Refresh
		  
		  ' Play a ding
		  Var pitch As Integer = Self.DingerPitches(System.Random.LessThan(Self.DingerPitches.Count))
		  Var noteVelocity As Integer = System.Random.InRange(50, 75)
		  Self.MidiDinger.PlayNote(pitch, noteVelocity, 1000)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PaintCanvas(g As Graphics, areas() As Rect)
		  Var colorCount As Integer = Self.BarColors.Count
		  
		  ' Get window dimensions based on direction
		  Var windowBreadth, windowDepth As Integer
		  Select Case Self.Direction
		  Case AnimationDirection.LeftToRight, AnimationDirection.RightToLeft
		    windowBreadth = g.Width
		    windowDepth = g.Height
		  Case AnimationDirection.TopToBottom, AnimationDirection.BottomToTop
		    windowBreadth = g.Height
		    windowDepth = g.Width
		  End Select
		  
		  ' Get Breadth and count of bars
		  Var defaultBarBreadth As Integer = Ceiling(windowBreadth / colorCount)
		  Var barBreadth As Integer = Math.Clamp(defaultBarBreadth, Self.MinBarBreadth, Self.MaxBarBreadth)
		  Var barCount As Integer = Ceiling(windowBreadth / BarBreadth)
		  
		  ' Draw all the bars
		  For i As Integer = 0 To barCount - 1
		    
		    ' Increment colorIndex (with wraparound) and lookup color
		    Var colorIndex As Integer = (Self.FirstColorIndex + i) Mod colorCount
		    g.DrawingColor = Self.BarColors(colorIndex)
		    
		    ' Draw bar, taking direction into account
		    Select Case Self.Direction
		      
		    Case AnimationDirection.LeftToRight
		      g.FillRectangle(i * BarBreadth, 0, barBreadth, windowDepth)
		      
		    Case AnimationDirection.RightToLeft
		      g.FillRectangle(windowBreadth - (i + 1) * BarBreadth, 0, barBreadth, windowDepth)
		      
		    Case AnimationDirection.TopToBottom
		      g.FillRectangle(0, i * BarBreadth, windowDepth, barBreadth)
		      
		    Case AnimationDirection.BottomToTop
		      g.FillRectangle(0, windowBreadth - (i + 1) * BarBreadth, windowDepth, barBreadth)
		      
		    End Select
		    
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetVelocity(index As Integer)
		  ' Lookup the FPS at index
		  Self.Fps = Self.Velocities(index)
		  
		  ' Update the VelocityValueLabel text
		  Self.VelocityValueLabel.Text = Str(Self.Fps) + " fps"
		  
		  ' Update AnimationTimer
		  Select Case Self.Fps
		  Case 0
		    Self.AnimationTimer.RunMode = Timer.RunModes.Off
		    Self.AnimationTimer.Period = 0
		  Else
		    Self.AnimationTimer.RunMode = Timer.RunModes.Multiple
		    Self.AnimationTimer.Period = 1000 \ Self.Fps
		    
		    ' Tick to next color if non-zero framerate
		    IncrementColor
		  End Select
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private BarColors() As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DingerPitches() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Direction As MainWindow.AnimationDirection = MainWindow.AnimationDirection.LeftToRight
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FirstColorIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Fps As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TickerPitches() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Velocities() As Integer
	#tag EndProperty


	#tag Constant, Name = Blue, Type = Color, Dynamic = False, Default = \"&c0d00ff", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Green, Type = Color, Dynamic = False, Default = \"&c2bff00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Magenta, Type = Color, Dynamic = False, Default = \"&cff00d9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MaxBarBreadth, Type = Double, Dynamic = False, Default = \"120", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MinBarBreadth, Type = Double, Dynamic = False, Default = \"60", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Orange, Type = Color, Dynamic = False, Default = \"&cff6f00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Red, Type = Color, Dynamic = False, Default = \"&cde0d0d", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Yellow, Type = Color, Dynamic = False, Default = \"&cffd400", Scope = Public
	#tag EndConstant


	#tag Enum, Name = AnimationDirection, Type = Integer, Flags = &h0
		LeftToRight=0
		  TopToBottom=1
		  RightToLeft=2
		BottomToTop=3
	#tag EndEnum


#tag EndWindowCode

#tag Events MainCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  Self.PaintCanvas(g, areas)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  Self.IncrementDirection
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.MouseCursor = System.Cursors.FingerPointer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VelocitySlider
	#tag Event
		Sub ValueChanged()
		  Self.SetVelocity(Me.Value)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  ' For MacOS, we need to enable discrete tick mark values only for sliders
		  #If targetCocoa
		    
		    Declare Sub setAllowsTickMarkValuesOnly Lib "Cocoa" Selector "setAllowsTickMarkValuesOnly:"  (id As Ptr, value As Boolean)
		    
		    Call setAllowsTickMarkValuesOnly(Me.Handle, True)
		    
		  #EndIf
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AnimationTimer
	#tag Event
		Sub Action()
		  Self.IncrementColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
