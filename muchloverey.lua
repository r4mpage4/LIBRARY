local Library = {}

function Library:CreateUI(title)
    -- Main Screen GUI
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 300, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true

    -- UI Corner
    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 8)

    -- Title Bar
    local TitleBar = Instance.new("TextLabel", MainFrame)
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TitleBar.Text = title or "UI Library"
    TitleBar.Font = Enum.Font.GothamBold
    TitleBar.TextSize = 16
    TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleBar.TextXAlignment = Enum.TextXAlignment.Center

    -- Close Button
    local CloseButton = Instance.new("TextButton", TitleBar)
    CloseButton.Text = "X"
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 14
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundTransparency = 1
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Buttons Container
    local ButtonContainer = Instance.new("Frame", MainFrame)
    ButtonContainer.Size = UDim2.new(1, 0, 1, -40)
    ButtonContainer.Position = UDim2.new(0, 0, 0, 40)
    ButtonContainer.BackgroundTransparency = 1

    -- UIListLayout for Buttons
    local Layout = Instance.new("UIListLayout", ButtonContainer)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 10)

    -- Create Button Function
    function Library:CreateButton(buttonText, callback)
        local Button = Instance.new("TextButton", ButtonContainer)
        Button.Size = UDim2.new(1, -20, 0, 40)
        Button.Position = UDim2.new(0, 10, 0, 0)
        Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Button.Text = buttonText
        Button.Font = Enum.Font.GothamBold
        Button.TextSize = 14
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)

        local ButtonCorner = Instance.new("UICorner", Button)
        ButtonCorner.CornerRadius = UDim.new(0, 8)

        Button.MouseButton1Click:Connect(function()
            if callback then
                callback()
            end
        end)
    end

    -- Create Toggle Function
    function Library:CreateToggle(toggleText, default, callback)
        local ToggleFrame = Instance.new("Frame", ButtonContainer)
        ToggleFrame.Size = UDim2.new(1, -20, 0, 40)
        ToggleFrame.Position = UDim2.new(0, 10, 0, 0)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

        local ToggleCorner = Instance.new("UICorner", ToggleFrame)
        ToggleCorner.CornerRadius = UDim.new(0, 8)

        local ToggleLabel = Instance.new("TextLabel", ToggleFrame)
        ToggleLabel.Text = toggleText
        ToggleLabel.Font = Enum.Font.Gotham
        ToggleLabel.TextSize = 14
        ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleLabel.Size = UDim2.new(1, -50, 1, 0)
        ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
        ToggleLabel.BackgroundTransparency = 1

        local ToggleButton = Instance.new("TextButton", ToggleFrame)
        ToggleButton.Size = UDim2.new(0, 30, 0, 30)
        ToggleButton.Position = UDim2.new(1, -40, 0.5, -15)
        ToggleButton.Text = ""
        ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)

        local ButtonCorner = Instance.new("UICorner", ToggleButton)
        ButtonCorner.CornerRadius = UDim.new(0, 8)

        local state = default or false
        ToggleButton.MouseButton1Click:Connect(function()
            state = not state
            ToggleButton.BackgroundColor3 = state and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
            if callback then
                callback(state)
            end
        end)
    end

    return Library
end

return Library
