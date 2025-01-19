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
    local biggest = 0
    local lastWindow
    for _, v in pairs(UiLib:GetChildren()) do
        if v.Position.X.Offset > biggest then
            biggest = v.Position.X.Offset
            lastWindow = v
        end
    end
    return lastWindow and (biggest + lastWindow.Size.X.Offset + 10) or 15
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
    local ResizeGrip = Instance.new("Frame")

    Top.Name = "Top"
    Top.Parent = UiLib
    Top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0, getNextWindowPos(), 0.01, 0)
    Top.Size = UDim2.new(0, 220, 0, 30)
    Top.Active = true
    Top.Draggable = true

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Top

    Container.Name = "Container"
    Container.Parent = Top
    Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Container.ClipsDescendants = true
    Container.Position = UDim2.new(0, 0, 1, 0)
    Container.Size = UDim2.new(0, 220, 0, 300)

    UIListLayout.Parent = Container
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    Line.Name = "Line"
    Line.Parent = Top
    Line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Line.Size = UDim2.new(1, 0, 0, 2)

    Title.Name = "Title"
    Title.Parent = Top
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.05, 0, 0.1, 0)
    Title.Size = UDim2.new(0.7, 0, 0.8, 0)
    Title.Font = Enum.Font.Gotham
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Minimize.Name = "Minimize"
    Minimize.Parent = Top
    Minimize.BackgroundTransparency = 1
    Minimize.Position = UDim2.new(0.9, 0, 0.1, 0)
    Minimize.Size = UDim2.new(0.1, 0, 0.8, 0)
    Minimize.Image = "rbxassetid://3926305904"
    Minimize.ImageColor3 = Color3.fromRGB(0, 255, 102)
    Minimize.Rotation = 90

    ResizeGrip.Name = "ResizeGrip"
    ResizeGrip.Parent = Top
    ResizeGrip.Size = UDim2.new(0, 15, 0, 15)
    ResizeGrip.Position = UDim2.new(1, -15, 1, -15)
    ResizeGrip.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local function toggleMinimize()
        if Container.Visible then
            Container.Visible = false
            Minimize.Rotation = 180
        else
            Container.Visible = true
            Minimize.Rotation = 90
        end
    end

    Minimize.MouseButton1Click:Connect(toggleMinimize)

    local Lib = {}

    function Lib:Label(text)
        local Label = Instance.new("TextLabel")
        Label.Parent = Container
        Label.BackgroundTransparency = 1
        Label.Size = UDim2.new(1, -10, 0, 30)
        Label.Font = Enum.Font.Gotham
        Label.Text = text
        Label.TextColor3 = Color3.fromRGB(200, 200, 200)
        Label.TextScaled = true
    end

    function Lib:Button(name, callback)
        local Button = Instance.new("TextButton")
        Button.Parent = Container
        Button.Size = UDim2.new(1, -10, 0, 30)
        Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Button.Font = Enum.Font.Gotham
        Button.Text = name
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.MouseButton1Click:Connect(callback)
    end

    function Lib:Toggle(name, callback)
        local Toggle = Instance.new("TextButton")
        Toggle.Parent = Container
        Toggle.Size = UDim2.new(1, -10, 0, 30)
        Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Toggle.Font = Enum.Font.Gotham
        Toggle.Text = name
        Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        local toggled = false

        Toggle.MouseButton1Click:Connect(function()
            toggled = not toggled
            Toggle.TextColor3 = toggled and Color3.fromRGB(0, 255, 102) or Color3.fromRGB(255, 255, 255)
            callback(toggled)
        end)
    end

    return Lib
end

return Library
