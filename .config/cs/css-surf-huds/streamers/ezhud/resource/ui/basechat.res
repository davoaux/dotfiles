"Resource/UI/BaseChat.res"
{
	"HudChat"
	{
		"ControlName"		"EditablePanel"
		"fieldName" 		"HudChat"
		"visible" 		"1"
		"enabled" 		"1"
		"xpos"			"0"	[$WIN32]
		"xpos"			"5"	[$X360]
		"ypos"			"335"
		"wide"	 		"300"
		"tall"	 		"150"
		"PaintBackgroundType"	"0"
		"bgcolor_override" "0 0 0 0"
	}

  ChatInputLine
  {
    "ControlName"   "EditablePanel"
    "fieldName"     "ChatInputLine"
    "visible"     "1"
    "enabled"     "1"
    "xpos"      "0"
    "ypos"      "0"
    "wide"      "300"
    "tall"      "2"
    "font"      "Cerbetica10"
    "PaintBackgroundType" "0"
  }

  "ChatFiltersButton"
  {
    "ControlName"   "Button"
    "fieldName"   "ChatFiltersButton"
    "xpos"      "0"
    "ypos"      "0"
    "wide"      "0"
    "tall"      "0"
    "autoResize"    "1"
    "pinCorner"   "0"
    "visible"   "1"
    "enabled"   "1"
    "tabPosition"   "0"
    "labelText"   "#chat_filterbutton"
    "textAlignment"   "center"
    "dulltext"    "0"
    "brighttext"    "0"
    "Default"   "0"
  }

  "HudChatHistory"
  {
    "ControlName"   "RichText"
    "fieldName"   "HudChatHistory"
    "xpos"      "0"
    "ypos"      "0"
    "wide"      "300"
    "tall"      "f0"
    "wrap"      "1"
    "autoResize"  "1"
    "pinCorner"   "1"
    "visible"   "1"
    "enabled"   "1"
    "labelText"   ""
    "textAlignment" "north-west"
    "font"      "Cerbetica10"
    "maxchars"    "-1"
  }
}
