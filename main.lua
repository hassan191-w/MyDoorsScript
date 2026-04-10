-- [[ KING HASSAN & HUSSEIN - GOD MODE V12.0 ]]
local lp = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- ملوك السيرفر
local hassan1, hassan2 = 10800492177, 3794073564
local brotherID = 10800572782

-- الإعدادات
_G.Speed = 16
_G.Noclip = false
_G.AutoCollect = false
_G.AntiScreech = false

-- [ 1. الواجهة المتطورة ]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 350)
MainFrame.Position = UDim2.new(0.5, -190, 0.4, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true; MainFrame.Draggable = true

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "👑 HASSAN & HUSSEIN SUPREME V12.0"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local Container = Instance.new("ScrollingFrame", MainFrame)
Container.Size = UDim2.new(1, -20, 1, -50)
Container.Position = UDim2.new(0, 10, 0, 45)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 800)
Instance.new("UIListLayout", Container).Padding = UDim.new(0, 5)

local function AddToggle(text, color, cb)
    local b = Instance.new("TextButton", Container)
    b.Size = UDim2.new(0.95, 0, 0, 40)
    b.Text = text; b.BackgroundColor3 = color; b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    local active = false
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = text .. (active and " [ON]" or " [OFF]")
        b.BackgroundColor3 = active and Color3.fromRGB(0, 150, 0) or color
        cb(active)
    end)
end

-- [[ 2. الأوامر الملكية ]]
AddToggle("🚀 لقب الملوك + شات Z", Color3.fromRGB(50,50,50), function(v)
    if v then
        if lp.UserId == hassan1 or lp.UserId == hassan2 then lp.DisplayName = "👑 الملك حسن"
        elseif lp.UserId == brotherID then lp.DisplayName = "💎 الملك حسين" end
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))()
    end
end)

AddToggle("💰 تجميع تلقائي (Auto-Collect)", Color3.fromRGB(70,0,100), function(v)
    _G.AutoCollect = v
    task.spawn(function()
        while _G.AutoCollect do
            for _, item in pairs(workspace:GetDescendants()) do
                if item.Name == "GoldPile" or item.Name == "Key" then
                    if lp:DistanceFromCharacter(item.Position) < 15 then
                        fireclickdetector(item:FindFirstChildOfClass("ClickDetector"))
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end)

AddToggle("🧱 اختراق الجدران (Noclip)", Color3.fromRGB(150,0,0), function(v) _G.Noclip = v end)

AddToggle("👁️ كشف الوحوش + رادار شامل", Color3.fromRGB(0,100,100), function(v)
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name == "RushMoving" or v.Name == "AmbushMoving" or v.Name:find("Key") or v.Name:find("Gold") then
            local b = Instance.new("BoxHandleAdornment", v)
            b.Adornee = v; b.Size = Vector3.new(2,4,2); b.AlwaysOnTop = true; b.Color3 = Color3.new(1,1,0); b.Transparency = 0.5
        end
    end
end)

AddToggle("🛑 منع Screech (Anti-Bite)", Color3.fromRGB(50,50,50), function(v)
    _G.AntiScreech = v
    if v then
        lp.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech:Destroy() -- حذف ملف الوحش برمجياً
    end
end)

AddToggle("💡 إضاءة كاملة (FullBright)", Color3.fromRGB(150,150,0), function(v)
    Lighting.Brightness = v and 2 or 1
    Lighting.Ambient = v and Color3.new(1,1,1) or Color3.new(0,0,0)
end)

-- [[ 3. الأنظمة الخلفية ]]
RunService.Stepped:Connect(function()
    if _G.Noclip and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = _G.Speed
    end
end)

-- زر الاختفاء H
local H = Instance.new("TextButton", ScreenGui); H.Size = UDim2.new(0,40,0,40); H.Position = UDim2.new(0,5,0.5,0)
H.Text = "H"; H.BackgroundColor3 = Color3.fromRGB(255, 215, 0); H.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
