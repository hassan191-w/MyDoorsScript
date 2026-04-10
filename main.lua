-- [[ KING HASSAN & HUSSEIN ULTIMATE V9.0 ]]
local lp = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- الملوك
local hassan1, hassan2 = 10800492177, 3794073564
local brotherID = 10800572782

-- متغيرات
_G.Speed = 16
_G.Noclip = false
_G.FlyEnabled = false

-- [ 1. إنشاء الواجهة ]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 300)
MainFrame.Position = UDim2.new(0.5, -190, 0.4, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.Active = true
MainFrame.Draggable = true

-- [ 2. نظام التبويبات ]
local TabHolder = Instance.new("Frame", MainFrame)
TabHolder.Size = UDim2.new(0, 100, 1, -40)
TabHolder.Position = UDim2.new(0, 5, 0, 35)
TabHolder.BackgroundTransparency = 1

local Content = Instance.new("ScrollingFrame", MainFrame)
Content.Size = UDim2.new(1, -120, 1, -45)
Content.Position = UDim2.new(0, 110, 0, 40)
Content.BackgroundTransparency = 1
Content.CanvasSize = UDim2.new(0, 0, 0, 500)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "👑 HASSAN & HUSSEIN HUB V9.0"
Title.TextColor3 = Color3.new(1, 0.8, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local function CreateBtn(name, parent, cb)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.95, 0, 0, 35)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.MouseButton1Click:Connect(cb)
    Instance.new("UIListLayout", parent).Padding = UDim.new(0, 5)
end

-- [[ قسم الملوك ]]
local function ShowKing()
    Content:ClearAllChildren()
    CreateBtn("🚀 تفعيل اللقب والشات Z", Content, function()
        if lp.UserId == hassan1 or lp.UserId == hassan2 then lp.DisplayName = "👑 الملك حسن"
        elseif lp.UserId == brotherID then lp.DisplayName = "💎 الملك حسين" end
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))()
    end)
    CreateBtn("🛡️ تفعيل أدمن الملوك (IY)", Content, function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
end

-- [[ قسم الرادار (ESP) ]]
local function ShowESP()
    Content:ClearAllChildren()
    CreateBtn("👹 كشف الوحوش (Rush/Ambush)", Content, function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "RushMoving" or v.Name == "AmbushMoving" then
                local b = Instance.new("BoxHandleAdornment", v)
                b.Adornee = v; b.Size = Vector3.new(5,5,5); b.AlwaysOnTop = true; b.Color3 = Color3.new(1,0,0)
            end
        end
    end)
    CreateBtn("💰 كشف المصاري والآيتمات", Content, function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "GoldPile" or v.Name == "Key" or v:IsA("Tool") then
                local b = Instance.new("BoxHandleAdornment", v)
                b.Adornee = v; b.Size = Vector3.new(2,2,2); b.AlwaysOnTop = true; b.Color3 = Color3.new(1,1,0)
            end
        end
    end)
end

-- [[ قسم الحركة والسرعة ]]
local function ShowMove()
    Content:ClearAllChildren()
    -- سلايدر السرعة
    local SpeedLabel = Instance.new("TextLabel", Content)
    SpeedLabel.Size = UDim2.new(0.95, 0, 0, 30)
    SpeedLabel.Text = "السرعة: " .. _G.Speed
    
    local SpeedDown = Instance.new("TextButton", Content)
    SpeedDown.Size = UDim2.new(0.45, 0, 0, 30)
    SpeedDown.Text = "سرعة -"; SpeedDown.MouseButton1Click:Connect(function() 
        _G.Speed = math.max(16, _G.Speed - 5)
        SpeedLabel.Text = "السرعة: " .. _G.Speed
    end)

    local SpeedUp = Instance.new("TextButton", Content)
    SpeedUp.Size = UDim2.new(0.45, 0, 0, 30)
    SpeedUp.Text = "سرعة +"; SpeedUp.MouseButton1Click:Connect(function() 
        _G.Speed = math.min(50, _G.Speed + 5)
        SpeedLabel.Text = "السرعة: " .. _G.Speed
    end)

    CreateBtn("🧱 اختراق الجدران (Noclip)", Content, function()
        _G.Noclip = not _G.Noclip
    end)
end

-- [ أزرار التبويبات ]
CreateBtn("👑 الملوك", TabHolder, ShowKing)
CreateBtn("👁️ رادار", TabHolder, ShowESP)
CreateBtn("⚡ حركة", TabHolder, ShowMove)

-- [ الأنظمة الخلفية ]
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
local H = Instance.new("TextButton", ScreenGui); H.Size = UDim2.new(0,40,0,40); H.Position = UDim2.new(0,10,0.5,0); H.Text = "H"
H.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

ShowKing()
