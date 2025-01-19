for i,v in pairs(game.CoreGui:GetChildren()) do
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
    for i, v in pairs(UiLib:GetChildren()) do
        if v.Position.X.Offset > biggest then
            biggest = v.Position.X.Offset
            ok = v
        end
    end
    return biggest == 0 and biggest + 15 or biggest + ok.Size.X.Offset + 10
end

local Library = {}

function Library:Window(title)
    local Top = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Container = Instance.new("Frame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local Line = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Minimize = Instance.new("ImageButton")

    Top.Name = "Top"
    Top.Parent = UiLib
    Top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0, getNextWindowPos(), 0.01, 0)
    Top.Size = UDim2.new(0, 204, 0, 28)
    Top.Active = true
    Top.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Top

    Container.Name = "Container"
    Container.Parent = Top
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Container.BackgroundTransparency = 1
    Container.ClipsDescendants = true
    Container.Position = UDim2.new(0, 0, 1, 0)
    Container.Size = UDim2.new(0, 204, 0, 762)

    UIListLayout_2.Parent = Container
    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

    Line.Name = "Line"
    Line.Parent = Top
    Line.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 0.892857134, 0)
    Line.Size = UDim2.new(0, 204, 0, 3)

    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
    Minimize.ZIndex = 2
    Minimize.Image = "rbxassetid://3926307971"
    Minimize.ImageColor3 = Color3.fromRGB(0, 255, 102)
    Minimize.ImageRectOffset = Vector2.new(764, 244)
    Minimize.ImageRectSize = Vector2.new(36, 36)

    Minimize.MouseButton1Click:Connect(function()
        if Container.Size == UDim2.new(0, 204, 0, 762) then
            game:GetService("TweenService"):Create(Minimize, TweenInfo.new(0.25), {Rotation = 180}):Play()
            game:GetService("TweenService"):Create(Minimize, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(255, 0, 68)}):Play()
            Container:TweenSize(UDim2.new(0, 204, 0, 0), "InOut", "Sine", 0.25, true)
            wait(0.25)
            Line.Visible = false
        else
            game:GetService("TweenService"):Create(Minimize, TweenInfo.new(0.25), {Rotation = 90}):Play()
            game:GetService("TweenService"):Create(Minimize, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(0, 255, 102)}):Play()
            Container:TweenSize(UDim2.new(0, 204, 0, 762), "InOut", "Sine", 0.2, true)
            Line.Visible = true
        end
    end)

    local Lib = {}

    function Lib:Button(name, callback)
        local ButtonContainer = Instance.new("Frame")
        local Button = Instance.new("TextButton")
        local ButtonAni = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local UIListLayout = Instance.new("UIListLayout")
        local ButtonName = Instance.new("TextLabel")

        ButtonContainer.Name = "ButtonContainer"
        ButtonContainer.Parent = Container
        ButtonContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ButtonContainer.BorderSizePixel = 0
        ButtonContainer.Size = UDim2.new(0, 204, 0, 28)

        Button.Name = "Button"
        Button.Parent = ButtonContainer
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1
        Button.Size = UDim2.new(0, 204, 0, 28)
        Button.Font = Enum.Font.SourceSans
        Button.Text = ""
        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
        Button.TextSize = 14
        Button.MouseButton1Click:Connect(function()
            callback()
        end)

        ButtonAni.Name = "ButtonAni"
        ButtonAni.Parent = Button
        ButtonAni.BackgroundColor3 = Color3.fromRGB(0, 255, 102)
        ButtonAni.Position = UDim2.new(0.0245098043, 0, 0.0714285746, 0)

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = ButtonAni

        UIListLayout.Parent = Button
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

        ButtonName.Name = "ButtonName"
        ButtonName.Parent = ButtonContainer
        ButtonName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ButtonName.BackgroundTransparency = 1
        ButtonName.Position = UDim2.new(0.0245098043, 0, 0.142857149, 0)
        ButtonName.Size = UDim2.new(0, 194, 0, 20)
        ButtonName.ZIndex = 3
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

        ToggleContainer.Name = "ToggleContainer"
        ToggleContainer.Parent = Container
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ToggleContainer.BorderSizePixel = 0
        ToggleContainer.Size = UDim2.new(0, 204, 0, 30)

        ToggleName.Name = "ToggleName"
        ToggleName.Parent = ToggleContainer
        ToggleName.BackgroundColor
ToggleName.BackgroundTransparency = 1
        ToggleName.Position = UDim2.new(0.0245098043, 0, 0.2, 0)
        ToggleName.Size = UDim2.new(0, 174, 0, 20)
        ToggleName.Font = Enum.Font.GothamSemibold
        ToggleName.Text = name
        ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleName.TextScaled = true
        ToggleName.TextSize = 14
        ToggleName.TextWrapped = true

        Toggle.Name = "Toggle"
        Toggle.Parent = ToggleContainer
        Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggle.BackgroundTransparency = 1
        Toggle.Position = UDim2.new(0.798, 0, 0.100000001, 0)
        Toggle.Size = UDim2.new(0, 30, 0, 15)

        UICorner_3.CornerRadius = UDim.new(0, 4)
        UICorner_3.Parent = Toggle

        Off.Name = "Off"
        Off.Parent = Toggle
        Off.BackgroundTransparency = 1
        Off.Size = UDim2.new(0, 15, 0, 15)
        Off.Position = UDim2.new(0, 0, 0, 0)
        Off.Image = "rbxassetid://3926307971"
        Off.ImageRectOffset = Vector2.new(788, 324)
        Off.ImageRectSize = Vector2.new(36, 36)

        On.Name = "On"
        On.Parent = Toggle
        On.BackgroundTransparency = 1
        On.Size = UDim2.new(0, 15, 0, 15)
        On.Position = UDim2.new(1, -15, 0, 0)
        On.Image = "rbxassetid://3926307971"
        On.ImageRectOffset = Vector2.new(764, 324)
        On.ImageRectSize = Vector2.new(36, 36)
        On.Visible = false

        local toggled = false
        Toggle.MouseButton1Click:Connect(function()
            toggled = not toggled
            if toggled then
                On.Visible = true
                Off.Visible = false
            else
                On.Visible = false
                Off.Visible = true
            end
            callback(toggled)
        end)
    end

    return Lib
end

return Library
