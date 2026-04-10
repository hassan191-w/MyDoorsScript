-- [[ KING HASSAN & HUSSEIN ULTIMATE V8.0 ]]
local lp = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- الملوك
local hassan1, hassan2 = 10800492177, 3794073564
local brotherID = 10800572782

-- حالات التشغيل
_G.FlyEnabled = false
_G.SpeedEnabled = false
_G.Noclip = false
_G.FullBright = false
local flySpeed = 60

-- [ 1. إنشاء الواجهة المتطورة ]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 350, 0, 250)
MainFrame.Position = UDim2.new(0.5, -175, 0.4, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.Active = true
MainFrame.Draggable = true

-- [ 2. نظام التبويبات (Tabs) ]
local TabHolder = Instance.new("Frame", MainFrame)
TabHolder.Size = UDim2.new(0, 100, 1, -40)
TabHolder.Position = UDim2.new(0, 5, 0, 35)
TabHolder.BackgroundTransparency = 1

local ContentHolder = Instance.new("Frame", MainFrame)
ContentHolder.Size = UDim2.new(1, -120, 1, -45)
ContentHolder.Position = UDim2.new(0, 110, 0, 40)
ContentHolder.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "👑 HASSAN & HUSSEIN HUB V8.0"
Title.TextColor3 = Color3.new(1, 0.8, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

-- وظيفة تغيير الأقسام
local function ClearContent()
    for _, child in pairs(ContentHolder:GetChildren()) do child:Destroy() end
end

local function CreateButton(name, pos, parent, cb)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Position = UDim2.new(0, 0, 0, pos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.MouseButton1Click:Connect(cb)
    return btn
end

-- [[ القسم 1: الملوك ]]
local function ShowKingTab()
    ClearContent()
    CreateButton("تفعيل اللقب + شات Z", 0, ContentHolder, function()
        if lp.UserId == hassan1 or lp.UserId == hassan2 then lp.DisplayName = "👑 الملك حسن"
        elseif lp.UserId == brotherID then lp.DisplayName = "💎 الملك حسين" end
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))() end)
    end)
    CreateButton("إضاءة كاملة (No Dark)", 45, ContentHolder, function()
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").ClockTime = 14
        game:GetService("Lighting").FogEnd = 100000
    end)
end

-- [[ القسم 2: الحركة ]]
local function ShowMoveTab()
    ClearContent()
    CreateButton("سرعة خارقة (150)", 0, ContentHolder, function()
        _G.SpeedEnabled = not _G.SpeedEnabled
        task.spawn(function()
            while _G.SpeedEnabled do 
                if lp.Character:FindFirstChild("Humanoid") then lp.Character.Humanoid.WalkSpeed = 150 end
                task.wait(0.1)
            end
            lp.Character.Humanoid.WalkSpeed = 16
        end)
    end)
    CreateButton("طيران حر (Camera)", 45, ContentHolder, function()
        _G.FlyEnabled = not _G.FlyEnabled
        if _G.FlyEnabled then
            local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            local bg = Instance.new("BodyGyro", lp.Character.PrimaryPart)
            bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            task.spawn(function()
                while _G.FlyEnabled do
                    bg.CFrame = workspace.CurrentCamera.CFrame
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * flySpeed * (lp.Character.Humanoid.MoveDirection.Magnitude > 0 and 1 or 0)
                    task.wait()
                end
                bv:Destroy(); bg:Destroy()
            end)
        end
    end)
end

-- [[ القسم 3: ESP ]]
local function ShowESP()
    ClearContent()
    CreateButton("كشف الأبواب والمفاتيح", 0, ContentHolder, function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Door" or v.Name == "Key" then
                local b = Instance.new("BoxHandleAdornment", v)
                b.Adornee = v; b.Size = Vector3.new(2,4,2); b.AlwaysOnTop = true; b.Color3 = Color3.new(0,1,0); b.Transparency = 0.5
            end
        end
    end)
end

-- أزرار التبويبات الجانبية
CreateButton("👑 الملوك", 0, TabHolder, ShowKingTab)
CreateButton("⚡ الحركة", 40, TabHolder, ShowMoveTab)
CreateButton("👁️ كشف", 80, TabHolder, ShowESP)

-- [ زر الاختفاء H ]
local HBtn = Instance.new("TextButton", ScreenGui)
HBtn.Size = UDim2.new(0, 40, 0, 40)
HBtn.Position = UDim2.new(0, 10, 0.4, 0)
HBtn.Text = "H"; HBtn.BackgroundColor3 = Color3.new(1, 0.8, 0)
HBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- [ نظام اللقب فوق الراس الدائم ]
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if lp.Character and lp.Character:FindFirstChild("Head") and not lp.Character.Head:FindFirstChild("KingTag") then
                local tag = (lp.UserId == hassan1 or lp.UserId == hassan2) and "👑 الملك حسن" or (lp.UserId == brotherID and "💎 الملك حسين" or "")
                if tag ~= "" then
                    local bgui = Instance.new("BillboardGui", lp.Character.Head)
                    bgui.Name = "KingTag"; bgui.Size = UDim2.new(0, 200, 0, 50); bgui.StudsOffset = Vector3.new(0, 3, 0); bgui.AlwaysOnTop = true
                    local tl = Instance.new("TextLabel", bgui)
                    tl.Size = UDim2.new(1, 0, 1, 0); tl.BackgroundTransparency = 1; tl.Text = tag; tl.TextColor3 = Color3.new(1, 0.8, 0); tl.Font = Enum.Font.GothamBold; tl.TextSize = 25
                end
            end
        end)
    end
end)

ShowKingTab() -- إظهار أول قسم تلقائياً
