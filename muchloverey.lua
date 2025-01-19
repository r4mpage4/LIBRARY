local library = {count = 0};

local FindLibrary = game:GetService("CoreGui"):FindFirstChild("UI Library")
if game:GetService("CoreGui"):FindFirstChild("UI Library") then
    game:GetService("CoreGui"):FindFirstChild("UI Library"):Destroy()
end
