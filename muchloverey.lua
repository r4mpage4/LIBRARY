local library = {count = 0};

local FindLibrary = game:GetService("CoreGui"):FindFirstChild("UI Library")
if game:GetService("CoreGui"):FindFirstChild("UI Library") then
    game:GetService("CoreGui"):FindFirstChild("UI Library"):Destroy()
end

local UILibrary = Instance.new("ScreenGui")
UILibrary.Name = "UI Library"
UILibrary.Parent = game:GetService("CoreGui")

game:GetService("UserInputService").InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.RightShift then
        UILibrary.Enabled = not UILibrary.Enabled
    end
end)

function library:CreateWindow(WName)
    library.count = library.count + 1
    local ui = {}
    local Holder = Instance.new("ImageLabel")
    local WindowText = Instance.new("TextLabel")
    local Container = Instance.new("ImageLabel")
    local ToggleGUI = Instance.new("TextButton")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")

    
    Holder.Name = WName
    Holder.Parent = UILibrary
    Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Holder.BackgroundTransparency = 1.000
    Holder.BorderSizePixel = 0
    Holder.Position = UDim2.new(0, (15 + (202 * library.count) - 200), 0.002, 0)
    Holder.Size = UDim2.new(0, 200, 0, 39)
    Holder.ZIndex = 5
    Holder.Image = "rbxassetid://3570695787"
    Holder.ImageColor3 = Color3.fromRGB(26, 26, 26)
    Holder.ScaleType = Enum.ScaleType.Slice
    Holder.SliceCenter = Rect.new(100, 100, 100, 100)
    Holder.SliceScale = 0.040

    
    ToggleGUI.Name = "ToggleGUI"
    ToggleGUI.Parent = Holder
    ToggleGUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleGUI.BackgroundTransparency = 1.000
    ToggleGUI.BorderSizePixel = 0
    ToggleGUI.Position = UDim2.new(0.852380931, 0, 0, 0)
    ToggleGUI.Size = UDim2.new(0, 31, 0, 38)
    ToggleGUI.ZIndex = 6
    ToggleGUI.Font = Enum.Font.GothamBold
    ToggleGUI.Text = "▼"
    ToggleGUI.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleGUI.TextSize = 17.000

    
    Container.Name = "Container"
    Container.Parent = Holder
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Container.BackgroundTransparency = 1.000
    Container.ClipsDescendants = true
    Container.Size = UDim2.new(0, 200, 0, 37)
    Container.ZIndex = 2
    Container.Image = "rbxassetid://3570695787"
    Container.ImageColor3 = Color3.fromRGB(35, 35, 35)
    Container.ScaleType = Enum.ScaleType.Slice
    Container.SliceCenter = Rect.new(100, 100, 100, 100)
    Container.SliceScale = 0.040

    
    WindowText.Name = WName
    WindowText.Parent = Holder
    WindowText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowText.BackgroundTransparency = 1.000
    WindowText.BorderSizePixel = 0
    WindowText.Position = UDim2.new(0.0399999991, 0, 0.15384616, 0)
    WindowText.Size = UDim2.new(0, 186, 0, 27)
    WindowText.ZIndex = 5
    WindowText.Font = Enum.Font.SourceSans
    WindowText.Text = WName
    WindowText.TextColor3 = Color3.fromRGB(255, 255, 255)
    WindowText.TextSize = 22.000
    WindowText.TextXAlignment = Enum.TextXAlignment.Left

    
    UIListLayout.Parent = Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 1)

    UIPadding.Parent = Container
    UIPadding.PaddingTop = UDim.new(0, 40)

    -- Draggable Window
    local players = game:service('Players')
    local player = players.LocalPlayer
    local mouse = player:GetMouse()
    local run = game:service('RunService')
    local stepped = run.Stepped

    local function draggable(obj)
        spawn(function()
            obj.Active = true
            local minitial
            local initial
            local isdragging
            obj.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    isdragging = true
                    minitial = input.Position
                    initial = obj.Position
                    local con
                    con = stepped:Connect(function()
                        if isdragging then
                            local delta = Vector3.new(mouse.X, mouse.Y, 0) - minitial
                            obj.Position = UDim2.new(initial.X.Scale, initial.X.Offset + delta.X, initial.Y.Scale, initial.Y.Offset + delta.Y)
                        else
                            con:Disconnect()
                        end
                    end)
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            isdragging = false
                        end
                    end)
                end
            end)
        end)
    end

    draggable(Holder)
    local TweenService = game:GetService("TweenService")
    local function Rotation(Object, RotateAMT, Delay)
        local ToTween = Object
        local tweenInfo = TweenInfo.new(Delay, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
        local Tweener = TweenService:Create(ToTween, tweenInfo, {Rotation = RotateAMT})
        Tweener:Play()
    end

    local Enabled = false
    NewWindow:FindFirstChild("ToggleGUI").MouseButton1Click:Connect(function()
        Enabled = not Enabled
        if Enabled then
            Rotation(NewWindow:FindFirstChild("ToggleGUI"), 90, .2)
        else
            Rotation(NewWindow:FindFirstChild("ToggleGUI"), 0, .2)
        end
        wait()
        local y = 37
        for i, v in pairs(Container:GetChildren()) do
            if (not v:IsA("UIPadding") and not v:IsA("UIListLayout")) then
                y = y + (v.AbsoluteSize.Y) + 2
            end
        end

        local targetSize = Enabled and UDim2.new(0, 200, 0, 37) or UDim2.new(0, 200, 0, y + 2)
        local targetDirection = Enabled and "Out" or "In"

        Container:TweenSize(targetSize, targetDirection, "Linear", 0.15, true)
    end)

    -- Label for Window (Improvement)
    local label = Instance.new("TextLabel")
    label.Name = "WindowLabel"
    label.Parent = Holder
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 0, 1, 0)
    label.Size = UDim2.new(0, 200, 0, 30)
    label.Text = "This is a label for your window"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 18
    label.Font = Enum.Font.SourceSans

    
    function ui:Resize()
        local y = 37
        for i, v in pairs(Container:GetChildren()) do
            if not v:IsA("UIPadding") and not v:IsA("UIListLayout") then
                y = y + (v.AbsoluteSize.Y) + 2
            end
        end
        Container.Size = UDim2.new(0, 200, 0, y + 2)
    end
    function ui:Button(Name, callback)
        local ButtonHolder = Instance.new("Frame")
        local Button = Instance.new("TextButton")
        local Button_Roundify_5px = Instance.new("ImageLabel")

        ButtonHolder.Name = "ButtonHolder"
        ButtonHolder.Parent = Container
        ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonHolder.BackgroundTransparency = 1.000
        ButtonHolder.BorderSizePixel = 0
        ButtonHolder.Position = UDim2.new(0, 0, 0.519480586, 0)
        ButtonHolder.Size = UDim2.new(0, 200, 0, 37)
        ButtonHolder.ZIndex = 2

        Button.Name = "Button"
        Button.Parent = ButtonHolder
        Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Button.BackgroundTransparency = 1.000
        Button.BorderSize = 1.000
        SliderTitle.Font = Enum.Font.SourceSans
		SliderTitle.Text = name
		SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		SliderTitle.TextSize = 16.000
		SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

		SliderFrame.Name = "SliderFrame"
		SliderFrame.Parent = SliderHolder
		SliderFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		SliderFrame.BorderSizePixel = 0
		SliderFrame.Position = UDim2.new(0, 0, 0.464000046, 0)
		SliderFrame.Size = UDim2.new(0, 200, 0, 30)
		SliderFrame.ZIndex = 4
		SliderFrame.Font = Enum.Font.SourceSans
		SliderFrame.Text = ""
		SliderFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
		SliderFrame.TextSize = 16.000

		Slider.Name = "Slider"
		Slider.Parent = SliderFrame
		Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Slider.BorderSizePixel = 0
		Slider.Size = UDim2.new(0, 0, 1, 0)
		Slider.ZIndex = 5

		UIGradient.Parent = Slider
		UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 85, 85)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 26, 26))
		}
		UIGradient.Offset = Vector2.new(0, 0)

		ValueText.Name = "ValueText"
		ValueText.Parent = SliderFrame
		ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueText.BackgroundTransparency = 1.000
		ValueText.BorderSizePixel = 0
		ValueText.Position = UDim2.new(0.900000036, 0, 0, 0)
		ValueText.Size = UDim2.new(0, 25, 0, 30)
		ValueText.ZIndex = 6
		ValueText.Font = Enum.Font.SourceSans
		ValueText.Text = tostring(min)
		ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueText.TextSize = 22.000
		ValueText.TextXAlignment = Enum.TextXAlignment.Center

		local dragging = false

		SliderFrame.MouseButton1Down:Connect(function()
			dragging = true
			while dragging do
				local xPos = math.clamp(Mouse.X - SliderFrame.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X)
				Slider.Size = UDim2.new(0, xPos, 1, 0)
				local value = math.floor((xPos / SliderFrame.AbsoluteSize.X) * (max - min) + min)
				ValueText.Text = tostring(value)
				callback(value)
				wait()
			end
		end)

		SliderFrame.MouseButton1Up:Connect(function()
			dragging = false
		end)

		function SetSliderValue(val)
			local xPos = math.clamp((val - min) / (max - min) * SliderFrame.AbsoluteSize.X, 0, SliderFrame.AbsoluteSize.X)
			Slider.Size = UDim2.new(0, xPos, 1, 0)
			ValueText.Text = tostring(val)
		end

		SetSliderValue(min)
	end

	
	function ui:Label(name)
		local Label = Instance.new("TextLabel")
		Label.Name = name
		Label.Parent = Container
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.BorderSizePixel = 0
		Label.Position = UDim2.new(0, 0, 0.519480586, 0)
		Label.Size = UDim2.new(0, 200, 0, 37)
		Label.Font = Enum.Font.SourceSans
		Label.Text = name
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 22.000
		Label.TextWrapped = true
	end

	return ui;
end;

return library;
