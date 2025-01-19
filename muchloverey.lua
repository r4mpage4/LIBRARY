local r4mpageLibrary = {}

function r4mpageLibrary:Window(title)
    local UI = {}

    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 300, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local TitleBar = Instance.new("TextLabel")
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TitleBar.Text = title
    TitleBar.Font = Enum.Font.GothamBold
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextSize = 18
    TitleBar.Parent = MainFrame

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, 0, 1, -40)
    ContentFrame.Position = UDim2.new(0, 0, 0, 40)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Parent = MainFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = ContentFrame

    
    function UI:Button(text, callback)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 280, 0, 40)
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Button.Text = text
        Button.Font = Enum.Font.Gotham
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14
        Button.Parent = ContentFrame

        Button.MouseButton1Click:Connect(callback)
    end

    
    function UI:Toggle(text, callback)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(0, 280, 0, 40)
        ToggleFrame.BackgroundTransparency = 1
        ToggleFrame.Parent = ContentFrame

        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0.8, 0, 1, 0)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.TextSize = 14
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Parent = ToggleFrame

        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0.2, 0, 1, 0)
        ToggleButton.Position = UDim2.new(0.8, 0, 0, 0)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ToggleButton.Text = "Off"
        ToggleButton.Font = Enum.Font.Gotham
        ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleButton.TextSize = 14
        ToggleButton.Parent = ToggleFrame

        local state = false
        ToggleButton.MouseButton1Click:Connect(function()
            state = not state
            ToggleButton.Text = state and "On" or "Off"
            ToggleButton.BackgroundColor3 = state and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
            callback(state)
        end)
    end

    
    function UI:Label(text)
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(0, 280, 0, 30)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.Font = Enum.Font.Gotham
        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
        Label.TextSize = 14
        Label.Parent = ContentFrame
    end

    return UI
end

return r4mpageLibrary
