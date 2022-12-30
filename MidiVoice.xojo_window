#tag DesktopWindow
Begin DesktopContainer MidiVoice
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   False
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   0
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   False
   Visible         =   False
   Width           =   0
   Begin DesktopNotePlayer MidiNotePlayer
      Index           =   -2147483648
      Instrument      =   1
      LockedInPosition=   False
      Scope           =   2
      TabPanelIndex   =   0
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin Timer NoteTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   0
      RunMode         =   0
      Scope           =   2
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub PlayNote(pitch As Integer, velocity As Integer, length As Integer)
		  Self.Pitch = pitch
		  
		  Self.MidiNotePlayer.PlayNote(Self.Pitch, velocity)
		  
		  Self.NoteTimer.Period = length
		  Self.NoteTimer.RunMode = Timer.RunModes.Single
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetInstrument(instrument As MidiVoice.Instrument)
		  Self.MidiNotePlayer.Instrument = Integer(instrument)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Pitch As Integer
	#tag EndProperty


	#tag Enum, Name = Instrument, Type = Integer, Flags = &h0
		AcousticGrandPiano=1
		  BrightAcousticPiano=2
		  ElectricGrandPiano=3
		  HonkyTonkPiano=4
		  RhodesPiano=5
		  ChorusedPiano=6
		  Harpsichord=7
		  Clavinet=8
		  Celesta=9
		  Glockenspiel=10
		  MusicBox=11
		  Vibraphone=12
		  Marimba=13
		  Xylophone=14
		  TubularBells=15
		  Dulcimer=16
		  DrawOrgan=17
		  PercussiveOrgan=18
		  RockOrgan=19
		  ChurchOrgan=20
		  ReedOrgan=21
		  Accordion=22
		  Harmonica=23
		  TangoAccordion=24
		  AcousticNylonGuitar=25
		  AcousticSteelGuitar=26
		  ElectricJazzGuitar=27
		  CleanElectricGuitar=28
		  MutedElectricGuitar=29
		  OverdrivenGuitar=30
		  DistortionGuitar=31
		  GuitarHarmonics=32
		  WoodBass=33
		  FingeredElectricBass=34
		  PickedElectricBass=35
		  FretlessBass=36
		  SlapBass1=37
		  SlapBass2=38
		  SynthBass1=39
		  SynthBass2=40
		  Violin=41
		  Viola=42
		  Cello=43
		  Contrabass=44
		  TremoloStrings=45
		  PizzicatoStrings=46
		  OrchestralHarp=47
		  Timpani=48
		  AcousticStringEnsemble1=49
		  AcousticStringEnsemble2=50
		  SynthStrings1=51
		  SynthStrings2=52
		  AahChoir=53
		  OohChoir=54
		  Synvox=55
		  OrchestraHit=56
		  Trumpet=57
		  Trombone=58
		  Tuba=59
		  MutedTrumpet=60
		  FrenchHorn=61
		  BrassSection=62
		  SynthBrass1=63
		  SynthBrass2=64
		  SopranoSax=65
		  AltoSax=66
		  TenorSax=67
		  BaritoneSax=68
		  Oboe=69
		  EnglishHorn=70
		  Bassoon=71
		  Clarinet=72
		  Piccolo=73
		  Flute=74
		  Recorder=75
		  PanFlute=76
		  BottleBlow=77
		  Shakuhachi=78
		  Whistle=79
		  Ocarina=80
		  SquareLead=81
		  SawLead=82
		  Calliope=83
		  Chiffer=84
		  SynthLead5=85
		  SynthLead6=86
		  SynthLead7=87
		  SynthLead8=88
		  SynthPad1=89
		  SynthPad2=90
		  SynthPad3=91
		  SynthPad4=92
		  SynthPad5=93
		  SynthPad6=94
		  SynthPad7=95
		  SynthPad8=96
		  IceRain=97
		  Soundtracks=98
		  Crystal=99
		  Atmosphere=100
		  Bright=101
		  Goblin=102
		  Echoes=103
		  Space=104
		  Sitar=105
		  Banjo=106
		  Shamisen=107
		  Koto=108
		  Kalimba=109
		  Bagpipe=110
		  Fiddle=111
		  Shanai=112
		  TinkleBell=113
		  Agogo=114
		  SteelDrums=115
		  Woodblock=116
		  TaikoDrum=117
		  MelodicTom=118
		  SynthTom=119
		  ReverseCymbal=120
		  GuitarFretNoise=121
		  BreathNoise=122
		  Seashore=123
		  BirdTweet=124
		  TelephoneRing=125
		  Helicopter=126
		  Applause=127
		  GunshotTable=128
		DrumKit=16385
	#tag EndEnum


#tag EndWindowCode

#tag Events NoteTimer
	#tag Event
		Sub Action()
		  Self.MidiNotePlayer.PlayNote(Self.Pitch, 0)
		  
		  Self.NoteTimer.Period = 0
		  Self.NoteTimer.RunMode = Timer.RunModes.Off
		  
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
