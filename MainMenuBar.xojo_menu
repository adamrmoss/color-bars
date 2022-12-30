#tag Menu
Begin Menu MainMenuBar
   Begin DesktopMenuItem FileMenu
      SpecialMenu = 0
      Index = -2147483648
      Text = "#App.FileTitle"
      AutoEnabled = True
      AutoEnable = True
      Visible = True
      Begin DesktopMenuItem FileAbout
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.FileAboutTitle"
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
      Begin DesktopQuitMenuItem FileQuit
         SpecialMenu = 0
         Index = -2147483648
         Text = "#App.FileQuitTitle"
         ShortcutKey = "#App.FileQuitShortcut"
         Shortcut = "Cmd+#App.FileQuitShortcut"
         MenuModifier = True
         AutoEnabled = True
         AutoEnable = True
         Visible = True
      End
   End
End
#tag EndMenu
