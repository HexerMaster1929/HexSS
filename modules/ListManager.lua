local List = {}

function List.FilterList(List,String)
	for i,v in pairs(List:GetChildren()) do
		if not v:IsA("ImageButton") then return end
		if string.match(v.Name,String) then
			v.Visible = true
		else
			v.Visible = false
		end
	end
end

function List.Add(List,Item)
	Item.Parent = List
end

function List.Remove(List,ItemName)
	List:FindFirstChild(ItemName):Destroy()
end

return List
