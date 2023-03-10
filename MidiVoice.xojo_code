#tag Class
Protected Class MidiVoice
Inherits DesktopControl
	#tag Event
		Sub Opening()
		  ' Initialize MidiNotePlayer Control
		  Self.MidiNotePlayer = New DesktopNotePlayer
		  
		  ' Initialize NoteTimer Control
		  Self.NoteTimer = New Timer
		  Self.NoteTimer.RunMode = Timer.RunModes.Off
		  Self.NoteTimer.Period = 0
		  AddHandler Self.NoteTimer.Action, AddressOf StopNote
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub PlayNote(pitch As Integer, velocity As Integer, length As Integer)
		  Self.StopNote(Self.NoteTimer)
		  
		  Self.Pitch = pitch
		  
		  Self.MidiNotePlayer.Instrument = Self.Instrument
		  Self.MidiNotePlayer.PlayNote(Self.Pitch, velocity)
		  
		  Self.NoteTimer.Period = length
		  Self.NoteTimer.RunMode = Timer.RunModes.Single
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StopNote(sender As Timer)
		  Self.MidiNotePlayer.PlayNote(Self.Pitch, 0)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Instrument As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MidiNotePlayer As DesktopNotePlayer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NoteTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Pitch As Integer
	#tag EndProperty


	#tag Enum, Name = MidiInstrument, Type = Integer, Flags = &h0
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


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Instrument"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"1 - Acoustic Grand Piano"
				"2 - Bright Acoustic Piano"
				"3 - Electric Grand Piano"
				"4 - Honky Tonk Piano"
				"5 - Rhodes Piano"
				"6 - Chorused Piano"
				"7 - Harpsichord"
				"8 - Clavinet"
				"9 - Celesta"
				"10 - Glockenspiel"
				"11 - Music Box"
				"12 - Vibraphone"
				"13 - Marimba"
				"14 - Xylophone"
				"15 - Tubular Bells"
				"16 - Dulcimer"
				"17 - Draw Organ"
				"18 - Percussive Organ"
				"19 - Rock Organ"
				"20 - Church Organ"
				"21 - Reed Organ"
				"22 - Accordion"
				"23 - Harmonica"
				"24 - Tango Accordion"
				"25 - Acoustic Nylon Guitar"
				"26 - Acoustic Steel Guitar"
				"27 - Electric Jazz Guitar"
				"28 - Clean Electric Guitar"
				"29 - Muted Electric Guitar"
				"30 - Overdriven Guitar"
				"31 - Distortion Guitar"
				"32 - Guitar Harmonics"
				"33 - Wood Bass"
				"34 - Fingered Electric Bass"
				"35 - Picked Electric Bass"
				"36 - Fretless Bass"
				"37 - Slap Bass 1"
				"38 - Slap Bass 2"
				"39 - Synth Bass 1"
				"40 - Synth Bass 2"
				"41 - Violin"
				"42 - Viola"
				"43 - Cello"
				"44 - Contrabass"
				"45 - Tremolo Strings"
				"46 - Pizzicato Strings"
				"47 - Orchestral Harp"
				"48 - Timpani"
				"49 - Acoustic String Ensemble 1"
				"50 - Acoustic String Ensemble 2"
				"51 - Synth Strings 1"
				"52 - Synth Strings 2"
				"53 - Aah Choir"
				"54 - Ooh Choir"
				"55 - Synvox"
				"56 - Orchestra Hit"
				"57 - Trumpet"
				"58 - Trombone"
				"59 - Tuba"
				"60 - Muted Trumpet"
				"61 - French Horn"
				"62 - Brass Section"
				"63 - Synth Brass 1"
				"64 - Synth Brass 2"
				"65 - Soprano Sax"
				"66 - Alto Sax"
				"67 - Tenor Sax"
				"68 - Baritone Sax"
				"69 - Oboe"
				"70 - English Horn"
				"71 - Bassoon"
				"72 - Clarinet"
				"73 - Piccolo"
				"74 - Flute"
				"75 - Recorder"
				"76 - Pan Flute"
				"77 - Bottle Blow"
				"78 - Shakuhachi"
				"79 - Whistle"
				"80 - Ocarina"
				"81 - Square Lead"
				"82 - Saw Lead"
				"83 - Calliope"
				"84 - Chiffer"
				"85 - Synth Lead 5"
				"86 - Synth Lead 6"
				"87 - Synth Lead 7"
				"88 - Synth Lead 8"
				"89 - Synth Pad 1"
				"90 - Synth Pad 2"
				"91 - Synth Pad 3"
				"92 - Synth Pad 4"
				"93 - Synth Pad 5"
				"94 - Synth Pad 6"
				"95 - Synth Pad 7"
				"96 - Synth Pad 8"
				"97 - Ice Rain"
				"98 - Soundtracks"
				"99 - Crystal"
				"100 - Atmosphere"
				"101 - Bright"
				"102 - Goblin"
				"103 - Echoes"
				"104 - Space"
				"105 - Sitar"
				"106 - Banjo"
				"107 - Shamisen"
				"108 - Koto"
				"109 - Kalimba"
				"110 - Bagpipe"
				"111 - Fiddle"
				"112 - Shanai"
				"113 - Tinkle Bell"
				"114 - Agogo"
				"115 - Steel Drums"
				"116 - Woodblock"
				"117 - Taiko Drum"
				"118 - Melodic Tom"
				"119 - Synth Tom"
				"120 - Reverse Cymbal"
				"121 - Guitar Fret Noise"
				"122 - Breath Noise"
				"123 - Seashore"
				"124 - Bird Tweet"
				"125 - Telephone Ring"
				"126 - Helicopter"
				"127 - Applause"
				"128 - Gunshot Table"
				"16385 - Drum Kit"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mInitialParent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
