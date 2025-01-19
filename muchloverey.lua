local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local heartbeat = game:GetService("RunService").Heartbeat

local libraryv3 = {
    windowcount = 0
}

local dragger = {}
local resizer = {}

local function draggerNew(frame)
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    frame.Active = true
    local inputConnection
    local leaveConnection

    inputConnection = frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local offset = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y)
            while heartbeat:Wait() and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                frame:TweenPosition(UDim2.new(0, mouse.X - offset.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 
                0, mouse.Y - offset.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Quad', 0.1, true)
            end
        end
    end)

    leaveConnection = frame.MouseLeave:Connect(function()
        inputConnection:Disconnect()
        leaveConnection:Disconnect()
    end)
end

local function createRippleEffect(button)
    spawn(function()
        local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local RippleHolder = Instance.new("Frame")
        local RippleEffect = Instance.new("ImageLabel")
        RippleHolder.Name = "RippleHolder"
        RippleHolder.Parent = button
        RippleHolder.BackgroundTransparency = 1
        RippleHolder.ClipsDescendants = true
        RippleHolder.Size = UDim2.new(1, 0, 1, 0)

        RippleEffect.Name = "RippleEffect"
        RippleEffect.Parent = RippleHolder
        RippleEffect.BackgroundTransparency = 1
        RippleEffect.BorderSizePixel = 0
        RippleEffect.Image = "rbxassetid://2708891598"
        RippleEffect.ImageColor3 = Color3.fromRGB(0, 0, 0)
        RippleEffect.ImageTransparency = 0.8
        RippleEffect.ScaleType = Enum.ScaleType.Fit

        RippleEffect.Position = UDim2.new((Mouse.X - RippleEffect.AbsolutePosition.X) / button.AbsoluteSize.X, 
                                          0, (Mouse.Y - RippleEffect.AbsolutePosition.Y) / button.AbsoluteSize.Y, 0)
        TweenService:Create(RippleEffect, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 
                            {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()

        wait(0.5)
        TweenService:Create(RippleEffect, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), 
                            {ImageTransparency = 1}):Play()

        wait(1)
        RippleHolder:Destroy()
    end)
end

function libraryv3:CreateWindow(name)
    self.windowcount = self.windowcount + 1
    local ScreenGui = Instance.new("ScreenGui")
    local main = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Frame = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    ScreenGui.Parent = game.CoreGui
    main.Name = "main"
    main.Parent = ScreenGui
    main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    main.BorderColor3 = Color3.fromRGB(255, 230, 3)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0, (15 + ((200 * self.windowcount) - 200)), 0, 15)
    main.Size = UDim2.new(0, 190, 0, 34)

    TextLabel.Parent = main
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(0, 190, 0, 34)
    TextLabel.Font = Enum.Font.Code
    TextLabel.Text = name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 18

    Frame.Parent = main
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderColor3 = Color3.fromRGB(255, 230, 3)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0, 0, 1, 0)
    Frame.Size = UDim2.new(0, 190, 0, 0)

    draggerNew(main)

    local function resize()
        local y = 0
        for _, v in next, Frame:GetChildren() do
            if not v:IsA('UIListLayout') then
                y = y + v.AbsoluteSize.Y
            end
        end
        Frame.Size = UDim2.new(1, 0, 0, y + 20)
    end

    UIListLayout.Parent = Frame
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local wowlib = {}
    function wowlib:Section(name)
        local sectionLabel = Instance.new("TextLabel")
        sectionLabel.Parent = Frame
        sectionLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        sectionLabel.BorderSizePixel = 0
        sectionLabel.Size = UDim2.new(0, 190, 0, 35)
        sectionLabel.Font = Enum.Font.GothamBold
        sectionLabel.Text = name
        sectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        sectionLabel.TextSize = 18

        resize()
    end

    function wowlib:Button(name, action)
        local button = Instance.new("TextButton")
        button.Parent = Frame
        button.BackgroundColor3 = Color3.fromRGB(49, 181, 84)
        button.BorderSizePixel = 0
        button.Size = UDim2.new(0, 179, 0, 26)
        button.Font = Enum.Font.GothamSemibold
        button.Text = name
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
        button.TextSize = 18

        button.MouseButton1Down:Connect(function()
            createRippleEffect(button)
            action()
        end)
    end
end
