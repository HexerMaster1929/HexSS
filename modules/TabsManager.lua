local Tabs = {}

CurrentTab = nil
ExistingTabs = {}
TabCount = 0

local Branch = "Stable"-- Latest,Stable

local function import(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/HexerMaster1929/HexSS/%s/modules/%s.lua",Branch,file)))()
end

local ExecutorManager = import("ExecutorManager")
local Assets =  game:GetObjects("rbxassetid://12773482381")[1]

function Tabs.Add(ButtonParentFrame,ExecutorParentFrame)
	
TabCount = TabCount +1 	
	local ScriptNumber = tostring(TabCount)
	local ScriptName = "Script"..ScriptNumber
	
	local TabButton = Assets.TabButton:Clone()
	TabButton.Name = ScriptName
	TabButton.Parent = ButtonParentFrame
	
	TabButton.ScriptName.Text = ScriptName
	
	-- Creating Executor Frame
	
	local editor = Assets.Editor:Clone()
	editor.Name = ScriptName
	editor.Parent = ExecutorParentFrame
	
	--[[local editor_template = Instance.new("ScrollingFrame")
	editor_template.BottomImage = "rbxassetid://148970562"
	editor_template.CanvasSize = UDim2.new(0, 0, 0, 0)
	editor_template.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	editor_template.MidImage = "rbxassetid://148970562"
	editor_template.ScrollBarThickness = 5
	editor_template.TopImage = "rbxassetid://148970562"
	editor_template.AnchorPoint = Vector2.new(0.5, 0.5)
	editor_template.BackgroundColor3 = Color3.new(0.145098, 0.145098, 0.145098)
	editor_template.BackgroundTransparency = 1
	editor_template.BorderColor3 = Color3.new(0.243137, 0.243137, 0.243137)
	editor_template.BorderSizePixel = 0
	editor_template.Position = UDim2.new(0.5, 0, 0.535714269, 0)
	editor_template.Size = UDim2.new(0.990934551, 0, 0.966270268, 0)
	editor_template.Visible = true
	editor_template.ZIndex = 700000
	editor_template.Name = "Script1"
	editor_template.Parent = workspace

	local source = Instance.new("TextBox")
	source.CursorPosition = -1
	source.Font = Enum.Font.Code
	source.MultiLine = true
	source.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
	source.Text = ""
	source.TextColor3 = Color3.new(0.8, 0.8, 0.8)
	source.TextSize = 15
	source.TextXAlignment = Enum.TextXAlignment.Left
	source.TextYAlignment = Enum.TextYAlignment.Top
	source.BackgroundColor3 = Color3.new(1, 1, 1)
	source.BackgroundTransparency = 1
	source.BorderSizePixel = 0
	source.Position = UDim2.new(0, 30, 0, 0)
	source.Size = UDim2.new(0.932213366, 0, 1.00000012, 0)
	source.Visible = true
	source.ZIndex = 70
	source.Name = "Source"
	source.Parent = editor_template

	local comments = Instance.new("TextLabel")
	comments.Font = Enum.Font.Code
	comments.Text = ""
	comments.TextColor3 = Color3.new(0.231373, 0.784314, 0.231373)
	comments.TextSize = 15
	comments.TextXAlignment = Enum.TextXAlignment.Left
	comments.TextYAlignment = Enum.TextYAlignment.Top
	comments.BackgroundColor3 = Color3.new(1, 1, 1)
	comments.BackgroundTransparency = 1
	comments.BorderSizePixel = 0
	comments.Size = UDim2.new(1, 0, 1, 0)
	comments.Visible = true
	comments.ZIndex = 1000
	comments.Name = "Comments_"
	comments.Parent = source

	local globals = Instance.new("TextLabel")
	globals.Font = Enum.Font.Code
	globals.Text = ""
	globals.TextColor3 = Color3.new(0.517647, 0.839216, 0.968628)
	globals.TextSize = 15
	globals.TextXAlignment = Enum.TextXAlignment.Left
	globals.TextYAlignment = Enum.TextYAlignment.Top
	globals.BackgroundColor3 = Color3.new(1, 1, 1)
	globals.BackgroundTransparency = 1
	globals.BorderSizePixel = 0
	globals.Size = UDim2.new(1, 0, 1, 0)
	globals.Visible = true
	globals.ZIndex = 1000
	globals.Name = "Globals_"
	globals.Parent = source

	local keywords = Instance.new("TextLabel")
	keywords.Font = Enum.Font.Code
	keywords.Text = ""
	keywords.TextColor3 = Color3.new(0.972549, 0.427451, 0.486275)
	keywords.TextSize = 15
	keywords.TextXAlignment = Enum.TextXAlignment.Left
	keywords.TextYAlignment = Enum.TextYAlignment.Top
	keywords.BackgroundColor3 = Color3.new(1, 1, 1)
	keywords.BackgroundTransparency = 1
	keywords.BorderSizePixel = 0
	keywords.Size = UDim2.new(1, 0, 1, 0)
	keywords.Visible = true
	keywords.ZIndex = 1000
	keywords.Name = "Keywords_"
	keywords.Parent = source

	local remote_highlight = Instance.new("TextLabel")
	remote_highlight.Font = Enum.Font.Code
	remote_highlight.Text = ""
	remote_highlight.TextColor3 = Color3.new(0, 0.568627, 1)
	remote_highlight.TextSize = 15
	remote_highlight.TextXAlignment = Enum.TextXAlignment.Left
	remote_highlight.TextYAlignment = Enum.TextYAlignment.Top
	remote_highlight.BackgroundColor3 = Color3.new(1, 1, 1)
	remote_highlight.BackgroundTransparency = 1
	remote_highlight.BorderSizePixel = 0
	remote_highlight.Size = UDim2.new(1, 0, 1, 0)
	remote_highlight.Visible = true
	remote_highlight.ZIndex = 1000
	remote_highlight.Name = "RemoteHighlight_"
	remote_highlight.Parent = source

	local strings = Instance.new("TextLabel")
	strings.Font = Enum.Font.Code
	strings.Text = ""
	strings.TextColor3 = Color3.new(0.678431, 0.945098, 0.584314)
	strings.TextSize = 15
	strings.TextXAlignment = Enum.TextXAlignment.Left
	strings.TextYAlignment = Enum.TextYAlignment.Top
	strings.BackgroundColor3 = Color3.new(1, 1, 1)
	strings.BackgroundTransparency = 1
	strings.BorderSizePixel = 0
	strings.Size = UDim2.new(1, 0, 1, 0)
	strings.Visible = true
	strings.ZIndex = 1000
	strings.Name = "Strings_"
	strings.Parent = source

	local tokens = Instance.new("TextLabel")
	tokens.Font = Enum.Font.Code
	tokens.Text = ""
	tokens.TextColor3 = Color3.new(1, 1, 1)
	tokens.TextSize = 15
	tokens.TextXAlignment = Enum.TextXAlignment.Left
	tokens.TextYAlignment = Enum.TextYAlignment.Top
	tokens.BackgroundColor3 = Color3.new(1, 1, 1)
	tokens.BackgroundTransparency = 1
	tokens.BorderSizePixel = 0
	tokens.Size = UDim2.new(1, 0, 1, 0)
	tokens.Visible = true
	tokens.ZIndex = 1000
	tokens.Name = "Tokens_"
	tokens.Parent = source

	local numbers = Instance.new("TextLabel")
	numbers.Font = Enum.Font.Code
	numbers.Text = ""
	numbers.TextColor3 = Color3.new(1, 0.776471, 0)
	numbers.TextSize = 15
	numbers.TextXAlignment = Enum.TextXAlignment.Left
	numbers.TextYAlignment = Enum.TextYAlignment.Top
	numbers.BackgroundColor3 = Color3.new(1, 1, 1)
	numbers.BackgroundTransparency = 1
	numbers.BorderSizePixel = 0
	numbers.Size = UDim2.new(1, 0, 1, 0)
	numbers.Visible = true
	numbers.ZIndex = 1000
	numbers.Name = "Numbers_"
	numbers.Parent = source

	local lines = Instance.new("TextLabel")
	lines.Font = Enum.Font.Code
	lines.Text = "1"
	lines.TextColor3 = Color3.new(1, 1, 1)
	lines.TextSize = 15
	lines.TextYAlignment = Enum.TextYAlignment.Top
	lines.BackgroundColor3 = Color3.new(1, 1, 1)
	lines.BackgroundTransparency = 1
	lines.BorderSizePixel = 0
	lines.Size = UDim2.new(0.0327510908, 0, 1, 0)
	lines.Visible = true
	lines.ZIndex = 70
	lines.Name = "Lines"
	lines.Parent = editor_template

	local uistroke = Instance.new("UIStroke")
	uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uistroke.Color = Color3.new(1, 1, 1)
	uistroke.Parent = lines]]
	
	
	ExecutorManager.Init(editor)
	
--	table.insert(CurrentTabs,ScriptName)
	
	if ScriptNumber == 0 or 1 then
		Tabs:OpenTab(ScriptName,ExecutorParentFrame)
	end
	
	TabButton.Interact.MouseButton1Down:Connect(function()
		Tabs:OpenTab(ScriptName,ExecutorParentFrame)
	end)
	
	TabButton.Close.MouseButton1Down:Connect(function()
		Tabs:CloseTab(ScriptName,ExecutorParentFrame,ButtonParentFrame)
	end)
	
	
	local TabFunctions = {}
	function TabFunctions:Rename(NewName)
		--local CurrentTabTablePos = table.find(CurrentTabs,ScriptName)
		--table.remove(CurrentTabs,ScriptName)
		ScriptName = NewName
		TabButton.ScriptName.Text = NewName
		--table.insert(CurrentTabs,NewName)
		
	end
	function TabFunctions:Close()
		TabButton:Destroy()
		editor:Destroy()
		--table.remove(CurrentTabs,ScriptName)
		TabCount = TabCount - 1
		Tabs:OpenTab("Script"..ScriptNumber or "1")
	end
	return TabFunctions

end

function Tabs:OpenTab(TabName,ExecutorFrame)
		--[[for i,v in pairs(ExecutorParentFrame:GetChildren()) do
			if v:IsA("ScrollingFrame") or v:IsA("Frame")then
		
			end
		end]]--
	
	print(ExecutorFrame)
	
	CurrentTab = tostring(TabName)
	ExecutorFrame:WaitForChild("UIPageLayout"):JumpTo(ExecutorFrame:FindFirstChild(TabName))
	
	--OpenTab = TabName
end

function Tabs:CloseTab(TabName,ExecutorFrame,TabButtonFrame)
	ExecutorFrame:FindFirstChild(TabName):Destroy()
	TabButtonFrame:FindFirstChild(TabName):Destroy()
	TabCount = TabCount - 1
	local ThisTabNum = string.sub(TabName,7,8)
	local TabNumber = tonumber(ThisTabNum - 1)--made this longer because roblox is retarded asfffff
	--	table.remove(CurrentTabs,tonumber(string.sub(TabName,5,7)))
	--print(TabNumber)
	--print(tostring(TabNumber))
	Tabs:OpenTab("Script"..tostring(TabNumber),ExecutorFrame)
end

function Tabs.GetOpenTab()
	if CurrentTab == nil then
		warn("No Open Tabs.")
		return
	end
	return CurrentTab
end

return Tabs
