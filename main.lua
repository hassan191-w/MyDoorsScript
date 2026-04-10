-- [[ KING HASSAN & HUSSEIN HUB V10.0 - BOB HUB STYLE ]]
local lp = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- الملوك
local hassan1, hassan2 = 10800492177, 3794073564
local brotherID = 10800572782

-- إعدادات
_G.Speed = 16
_G.Noclip = false

-- [ 1. إنشاء الواجهة ]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 320)
MainFrame.Position = UDim2.new(0.5, -190, 0.4, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.Active = true; MainFrame.Draggable = true

-- [ 2. نظام التبويبات ]
local TabHolder = Instance.new("Frame", MainFrame)
TabHolder.Size = UDim2.new(0, 100, 1, -40); TabHolder.Position = UDim2.new(0, 5, 0, 35); TabHolder.BackgroundTransparency = 1

local Content = Instance.new("ScrollingFrame", MainFrame)
Content.Size = UDim2.new(1, -120, 1, -45); Content.Position = UDim2.new(0, 110, 0, 40); Content.BackgroundTransparency = 1; Content.CanvasSize = UDim2.new(0, 0, 0, 600)

local function CreateBtn(name, parent, cb)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.95, 0, 0, 35); btn.Text = name; btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); btn.TextColor3 = Color3.new(1, 1, 1); btn.Font = Enum.Font.Gotham
    btn.MouseButton1Click:Connect(cb)
    Instance.new("UIListLayout", parent).Padding = UDim.new(0, 5)
end

-- [[ قسم الرادار - ميزات Bob Hub ]]
local function ShowESP()
    Content:ClearAllChildren()
    CreateBtn("👹 كشف الوحوش والكمائن", Content, function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "RushMoving" or v.Name == "AmbushMoving" then
                local b = Instance.new("BoxHandleAdornment", v); b.Adornee = v; b.Size = Vector3.new(6,6,6); b.AlwaysOnTop = true; b.Color3 = Color3.new(1,0,0)
            end
        end
    end)
    
    CreateBtn("💎 كشف (فلوس + خزائن + أزرار)", Content, function()
        for _, v in pairs(workspace:GetDescendants()) do
            -- كشف الذهب
            if v.Name:lower():find("gold") or v.Name == "GoldPile" then
                local b = Instance.new("BoxHandleAdornment", v); b.Adornee = v; b.Size = v.Size; b.AlwaysOnTop = true; b.Color3 = Color3.new(1, 1, 0)
            -- كشف الأدوات والمفاتيح (Bob Hub Style)
            elseif v.Name:find("Key") or v:IsA("Tool") or v.Name == "LiveHintBook" then
                local b = Instance.new("BoxHandleAdornment", v); b.Adornee = v; b.Size = Vector3.new(2,3,2); b.AlwaysOnTop = true; b.Color3 = Color3.new(0, 1, 1)
            -- كشف الأزرار واللوحات الكهربائية
            elseif v.Name == "Lever" or v.Name == "BreakerBox" then
                local b = Instance.new("BoxHandleAdornment", v); b.Adornee = v; b.Size = Vector3.new(3,3,3); b.AlwaysOnTop = true; b.Color3 = Color3.new(1, 0, 1)
            end
        end
    end)
end

-- [[ قسم الحركة والتحكم ]]
local function ShowMove()
    Content:ClearAllChildren()
    local SpeedLabel = Instance.new("TextLabel", Content); SpeedLabel.Size = UDim2.new(0.95, 0, 0, 30); SpeedLabel.Text = "السرعة: " .. _G.Speed
    
    CreateBtn("زيادة السرعة (+5)", Content, function() _G.Speed = math.min(50, _G.Speed + 5); SpeedLabel.Text = "السرعة: " .. _G.Speed end)
    CreateBtn("تقليل السرعة (-5)", Content, function() _G.Speed = math.max(16, _G.Speed - 5); SpeedLabel.Text = "السرعة: " .. _G.Speed end)
    
    CreateBtn("🧱 اختراق الجدران (Noclip)", Content, function() _G.Noclip = not _G.Noclip end)
    CreateBtn("💡 إضاءة Bob Hub (FullBright)", Content, function()
        game:GetService("Lighting").Ambient = Color3.new(1, 1, 1)
        game:GetService("Lighting").OutdoorAmbient = Color3.new(1, 1, 1)
        game:GetService("Lighting").Brightness = 2
    end)
end

-- [[ قسم الملوك ]]
local function ShowKing()
    Content:ClearAllChildren()
    CreateBtn("🚀 لقب الملوك + شات Z", Content, function()
        if lp.UserId == hassan1 or lp.UserId == hassan2 then lp.DisplayName = "👑 الملك حسن"
        elseif lp.UserId == brotherID then lp.DisplayName = "💎 الملك حسين" end
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))()
    end)
    CreateBtn("🛠️ أدمن الملوك (Infinite Yield)", Content, function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
end

-- أزرار التبويبات
CreateBtn("👑 الملوك", TabHolder, ShowKing)
CreateBtn("👁️ رادار Bob", TabHolder, ShowESP)
CreateBtn("⚡ حركة", TabHolder, ShowMove)

-- الأنظمة الخلفية
RunService.Stepped:Connect(function()
    if _G.Noclip and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
    end
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then lp.Character.Humanoid.WalkSpeed = _G.Speed end
end)

-- زر الاختفاء H
local H = Instance.new("TextButton", ScreenGui); H.Size = UDim2.new(0,40,0,40); H.Position = UDim2.new(0,10,0.5,0); H.Text = "H"; H.BackgroundColor3 = Color3.new(1, 0.8, 0)
H.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

ShowKing()
