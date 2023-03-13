local EditorFunctions = {}

local Exploit = "Unknown Executor.";
if identifyexecutor then
	Exploit,Ver = identifyexecutor()
	if Ver then
		Exploit = Exploit..' '..tostring(Ver)
	end
else
	Exploit = secure_load and "Sentinel" or pebc_execute and "ProtoSmasher" or is_sirhurt_closure and "Sirhurt" or (syn and not is_sirhurt_closure and not isexecutorclosure) and "Synapse X" or KRNL_LOADED and "Krnl" or "Unknown Executor"
end

Functions = {
	{Function = "%username%",ReplaceWith = game.Players.LocalPlayer.Name},
	{Function = "%executor%",ReplaceWith = Exploit}
	
}

--[[function EditorFunctions.ParseStringWithFunctions(String)
	local NewString = String
	for i,v in pairs(Functions) do
		if string.match(tostring(NewString),v.Function) ~= nil then
			NewString = string.gsub(NewString,v.Function,v.ReplaceWith)
		end
	end
	return NewString
end]]

function EditorFunctions.ParseStringWithFunctions(code)
	return 
		code:gsub(
			"%%username%%", game.Players.LocalPlayer.Name
		):gsub(
		"%%userid%%", game.Players.LocalPlayer.UserId
	):gsub(
		"%%userping%%", game.Players.LocalPlayer:GetNetworkPing()
	):gsub(
		"%%executorname%%", Exploit
	):gsub(
		"%%ssname%%", "HexSS"
	)
end;

return EditorFunctions
