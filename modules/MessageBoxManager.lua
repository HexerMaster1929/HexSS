local Popup = {}

IsPopupRunning = false

function Popup.show(Info)
	if IsPopupRunning then 
		warn("Popup Running")
		return
	end
	
	
	local Popup = Info.PopupFrame
	Popup.Title.Text = Info.Title
	Popup.Inner.Message.Text = Info.Message
	Popup.Visible = true
	Popup.Parent.MessageBoxShadow.Visible = true


	Popup.Inner.Buttons.OK.OK.MouseButton1Down:Connect(function()
		IsPopupRunning = false
		Popup.Visible = false
		Popup.Parent.MessageBoxShadow.Visible = false
	end)

	Popup.Parent.MessageBoxShadow.MouseButton1Down:Connect(function()
		IsPopupRunning = false
		Popup.Visible = false
		Popup.Parent.MessageBoxShadow.Visible = false
	end)
	IsPopupRunning = true
end


return Popup
