local TextTip = {}

function TextTip.Add(Label)
	print("Added Label Entry: ",Label)
	local TextTipFunctions = {}
	function TextTipFunctions:Show()
		Label.Visible = true
	end
	function TextTipFunctions:Hide()
		Label.Visible = false
	end
	function TextTipFunctions:Set(SetText)
		Label.Text = tostring(SetText)
	end
	return TextTipFunctions
end

return TextTip
