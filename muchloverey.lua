for i, v in pairs(game.CoreGui:GetChildren()) do
	if v.Name == "UiLib" then
		v:Destroy()
	end
end

local UiLib = Instance.new("ScreenGui")
UiLib.Name = "UiLib"
UiLib.Parent = game.CoreGui
UiLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local function getNextWindowPos()
	local biggest = 15
	for i, v in pairs(UiLib:GetChildren()) do
		biggest = math.max(biggest, v.Position.X.Offset + v.Size.X.Offset + 10)
	end
	return biggest
end

local Library = {}


function Library:Window(title)
	local Top = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Container = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Title = Instance.new("TextLabel")
	local Minimize = Instance.new("ImageButton")

	Top.Name = "Top"
	Top.Parent = UiLib
	Top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Top.Position = UDim2.new(0, getNextWindowPos(), 0.05, 0)
	Top.Size = UDim2.new(0, 250, 0, 30)
	Top.Draggable = true
	Top.Active = true

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Top

	Title.Name = "Title"
	Title.Parent = Top
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0.02, 0, 0, 0)
	Title.Size = UDim2.new(0, 200, 0, 30)
	Title.Font = Enum.Font.GothamBold
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Container.Name = "Container"
	Container.Parent = Top
	Container.BackgroundTransparency = 1
	Container.ClipsDescendants = true
	Container.Position = UDim2.new(0, 0, 1, 0)
	Container.Size = UDim2.new(0, 250, 0, 400)

	UIListLayout.Parent = Container
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	Minimize.Name = "Minimize"
	Minimize.Parent = Top
	Minimize.BackgroundTransparency = 1
	Minimize.Position = UDim2.new(0.9, 0, 0, 0)
	Minimize.Size = UDim2.new(0, 25, 0, 25)
	Minimize.Image = "rbxassetid://3926307971"
	Minimize.ImageRectOffset = Vector2.new(764, 244)
	Minimize.ImageRectSize = Vector2.new(36, 36)
	Minimize.ImageColor3 = Color3.fromRGB(0, 255, 100)
	Minimize.Rotation = 0

	Minimize.MouseButton1Click:Connect(function()
		local minimized = Container.Size == UDim2.new(0, 250, 0, 400)
		if minimized then
			Container:TweenSize(UDim2.new(0, 250, 0, 0), "Out", "Quad", 0.3, true)
			Minimize.Rotation = 90
		else
			Container:TweenSize(UDim2.new(0, 250, 0, 400), "Out", "Quad", 0.3, true)
			Minimize.Rotation = 0
		end
	end)

	local Lib = {}

	
	function Lib:Button(name, callback)
		local Button = Instance.new("TextButton")
		Button.Parent = Container
		Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		Button.Size = UDim2.new(0, 230, 0, 30)
		Button.Text = name
		Button.Font = Enum.Font.Gotham
		Button.TextSize = 14
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)

		Button.MouseButton1Click:Connect(function()
			callback()
		end)
	end

	
	function Lib:Toggle(name, callback)
		local ToggleFrame = Instance.new("Frame")
		local Label = Instance.new("TextLabel")
		local ToggleButton = Instance.new("TextButton")
		local toggled = false

		ToggleFrame.Parent = Container
		ToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		ToggleFrame.Size = UDim2.new(0, 230, 0, 30)

		Label.Parent = ToggleFrame
		Label.BackgroundTransparency = 1
		Label.Size = UDim2.new(0.8, 0, 1, 0)
		Label.Font = Enum.Font.Gotham
		Label.Text = name
		Label.TextSize = 14
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextXAlignment = Enum.TextXAlignment.Left

		ToggleButton.Parent = ToggleFrame
		ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		ToggleButton.Position = UDim2.new(0.85, 0, 0.15, 0)
		ToggleButton.Size = UDim2.new(0, 25, 0, 25)
		ToggleButton.Text = ""

		ToggleButton.MouseButton1Click:Connect(function()
			toggled = not toggled
			ToggleButton.BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
			callback(toggled)
		end)
	end

	return Lib
end
