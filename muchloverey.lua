for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "UiLib" then
        v:Destroy()
    end
end

local UiLib = Instance.new("ScreenGui")
UiLib.Name = "UiLib"
UiLib.Parent = game.CoreGui
UiLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function getNextWindowPos()
    local biggest = 0
    local ok = nil
    for _, v in pairs(UiLib:GetChildren()) do
        if v.Position.X.Offset > biggest then
            biggest = v.Position.X.Offset
            ok = v
        end
    end
    return (biggest == 0 and 15 or biggest + ok.Size.X.Offset + 10)
end

local Library = {}

function Library:Window(title)
    local Top = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Container = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Line = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Minimize = Instance.new("ImageButton")

    Top.Name = "Top"
    Top.Parent = UiLib
    Top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Top.Position = UDim2.new(0, getNextWindowPos(), 0.01, 0)
    Top.Size = UDim2.new(0, 204, 0, 28)
    Top.Active = true
    Top.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Top

    Container.Name = "Container"
    Container.Parent = Top
    Container.BackgroundTransparency = 1
    Container.Position = UDim2.new(0, 0, 1, 0)
    Container.Size = UDim2.new(0, 204, 0, 762)

    UIListLayout.Parent = Container
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Line.Name = "Line"
    Line.Parent = Top
    Line.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Line.Position = UDim2.new(0, 0, 0.892857134, 0)
    Line.Size = UDim2.new(0, 204, 0, 3)

    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.0245098043, 0, 0.142857149, 0)
    Title.Size = UDim2.new(0, 174, 0, 20)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextSize = 14
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Minimize.Name = "Minimize"
    Minimize.Parent = Top
    Minimize.BackgroundTransparency = 1
    Minimize.Position = UDim2.new(0.877451003, 0, 0, 0)
    Minimize.Rotation = 90
    Minimize.Size = UDim2.new(0, 25, 0, 25)
    Minimize.Image = "rbxassetid://3926307971"
    Minimize.ImageColor3 = Color3.fromRGB(0, 255, 102)
    Minimize.ImageRectOffset = Vector2.new(764, 244)
    Minimize.ImageRectSize = Vector2.new(36, 36)

    Minimize.MouseButton1Click:Connect(function()
        local isMinimized = Container.Size.Y.Offset == 0
        local targetSize = isMinimized and UDim2.new(0, 204, 0, 762) or UDim2.new(0, 204, 0, 0)
        local targetRotation = isMinimized and 90 or 180
        local targetColor = isMinimized and Color3.fromRGB(0, 255, 102) or Color3.fromRGB(255, 0, 68)

        game:GetService("TweenService"):Create(Minimize, TweenInfo.new(0.25), {Rotation = targetRotation, ImageColor3 = targetColor}):Play()
        Container:TweenSize(targetSize, "InOut", "Sine", 0.25, true)
        Line.Visible = not isMinimized
    end)

    local Lib = {}

    function Lib:Button(name, callback)
        local ButtonContainer = Instance.new("Frame")
        local Button = Instance.new("TextButton")
        local ButtonAni = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local ButtonName = Instance.new("TextLabel")

        ButtonContainer.Name = "ButtonContainer"
        ButtonContainer.Parent = Container
        ButtonContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ButtonContainer.BorderSizePixel = 0
        ButtonContainer.Size = UDim2.new(0, 204, 0, 28)

        Button.Name = "Button"
        Button.Parent = ButtonContainer
        Button.BackgroundTransparency = 1
        Button.Size = UDim2.new(0, 204, 0, 28)
        Button.Font = Enum.Font.SourceSans
        Button.Text = ""
        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
        Button.TextSize = 14
        Button.MouseButton1Click:Connect(callback)

        ButtonAni.Name = "ButtonAni"
        ButtonAni.Parent = Button
        ButtonAni.BackgroundColor3 = Color3.fromRGB(0, 255, 102)
        ButtonAni.Position = UDim2.new(0.0245098043, 0, 0.0714285746, 0)

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = ButtonAni

        ButtonName.Name = "ButtonName"
        ButtonName.Parent = ButtonContainer
        ButtonName.BackgroundTransparency = 1
        ButtonName.Position = UDim2.new(0.0245098043, 0, 0.142857149, 0)
        ButtonName.Size = UDim2.new(0, 194, 0, 20)
        ButtonName.Font = Enum.Font.GothamSemibold
        ButtonName.Text = name
        ButtonName.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonName.TextScaled = true
        ButtonName.TextSize = 14
        ButtonName.TextWrapped = true

        Button.MouseButton1Click:Connect(function()
            ButtonAni:TweenSize(UDim2.new(0, 194, 0, 24), 'InOut', "Sine", 0.3, true)
            wait(0.45)
            ButtonAni:TweenSize(UDim2.new(0, 0, 0, 0), "InOut", "Sine", 0.3, true)
        end)
    end

    function Lib:Toggle(name, callback)
        local ToggleContainer = Instance.new("Frame")
        local ToggleName = Instance.new("TextLabel")
        local Toggle = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local Off = Instance.new("ImageLabel")
        local On = Instance.new("ImageLabel")
        local Toggled = false

        ToggleContainer.Name = "ToggleContainer"
        ToggleContainer.Parent = Container
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ToggleContainer.BorderSizePixel = 0
        ToggleContainer.Size = UDim2.new(0, 204, 0, 30)

        ToggleName.Name = "ToggleName"
        ToggleName.Parent = ToggleContainer
        ToggleName.BackgroundTransparency = 1
        ToggleName.Position = UDim2.new(0.0245098043, 0, 0.142857105, 0)
        ToggleName.Size = UDim2.new(0, 169, 0, 20)
        ToggleName.Font = Enum.Font.GothamSemibold
        ToggleName.Text = name
        ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleName.TextScaled = true
        ToggleName.TextSize = 14
        ToggleName.TextWrapped = true

        Toggle.Name = "Toggle"
        Toggle.Parent = ToggleContainer
        Toggle.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
        Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Toggle.Position = UDim2.new(0.852941215, 0, 0.0666666627, 0)
        Toggle.Size = UDim2.new(0, 25, 0, 23)
        Toggle.AutoButtonColor = false
        Toggle.Text = ""
        Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        Toggle.TextSize = 14
        Toggle.MouseButton1Click:Connect(function()
            Toggled = not Toggled
            callback(Toggled)
        end
