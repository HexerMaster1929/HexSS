local Branch = "Stable"-- Latest,Stable

local function import(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/HexerMaster1929/HexSS/%s/modules/%s.lua",Branch,file)))()
end

TabsManager = import("TabsManager")
ExecutorManager = import("ExecutorManager")
BackdoorModule = import("BackdoorManager")
ListManager = import("ListManager")
TextTipManager = import("TextTipManager")
MessageBox = import("MessageBoxManager")
EditorFunctions = import("HexSSEditorFunctions")

--[[TabsManager = require(TestingModules.TabsManager)
ExecutorManager = require(TestingModules.ExecutorManager)
BackdoorModule = require(TestingModules.BackdoorManager)
ListManager = require(TestingModules.ListManager)
TextTipManager = require(TestingModules.TextTipManager)
MessageBox = require(TestingModules.MessageBoxManager)
EditorFunctions = require(TestingModules.HexSSEditorFunctions)]]--
