-- [[ HASSAN & HUSSEIN HUB V7.5 - THE ROYAL EDITION ]]
local lp = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- الملوك
local hassan1, hassan2 = 10800492177, 3794073564
local brotherID = 10800572782

-- متغيرات
_G.FlyEnabled = false
_G.SpeedEnabled = false
local flySpeed = 60

-- [ 1. إنشاء الواجهة ]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "KingHassanFinal"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 230, 0, 320)
MainFrame.Position = UDim2.new(0.5, -115, 0.4, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "👑 ملوك دورس V7.5"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

-- [ 2. زر الاختفاء H ]
local function ToggleUI()
    MainFrame.Visible = not MainFrame.Visible
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.H then ToggleUI() end
end)

local H_Btn = Instance.new("TextButton", ScreenGui)
H_Btn.Size = UDim2.new(0, 45, 0, 45)
H_Btn.Position = UDim2.new(0, 5, 0.4, 0)
H_Btn.Text = "H"; H_Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
H_Btn.TextColor3 = Color3.new(0,0,0)
H_Btn.Font = Enum.Font.GothamBold
H_Btn.MouseButton1Click:Connect(ToggleUI)

-- [ 3. وظيفة الأزرار ]
local function CreateBtn(name, pos, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.Text = name .. " [OFF]"
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    
    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.Text = name .. (active and " [ON]" or " [OFF]")
        btn.BackgroundColor3 = active and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(45, 45, 45)
        callback(active)
    end)
end

-- زر الهوية + شات Z
CreateBtn("اللقب + شات Z", 60, function(v)
    if v then
        if lp.UserId == hassan1 or lp.UserId == hassan2 then lp.DisplayName = "👑 الملك حسن"
        elseif lp.UserId == brotherID then lp.DisplayName = "💎 الملك حسين" end
        pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))() end)
    else
        lp.DisplayName = lp.Name
    end
end)

-- زر الطيران الحر
CreateBtn("الطيران الحر", 115, function(v)
    _G.FlyEnabled = v
    if v then
        local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
        bv.Name = "KingFlyV"; bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        local bg = Instance.new("BodyGyro", lp.Character.PrimaryPart)
        bg.Name = "KingFlyG"; bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        
        task.spawn(function()
            while _G.FlyEnabled do
                bg.CFrame = workspace.CurrentCamera.CFrame
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * flySpeed * (lp.Character.Humanoid.MoveDirection.Magnitude > 0 and 1 or 0)
                if lp.Character.Humanoid.MoveDirection.Magnitude == 0 then bv.Velocity = Vector3.new(0,0.1,0) end
                task.wait()
            end
            if lp.Character.PrimaryPart:FindFirstChild("KingFlyV") then lp.Character.PrimaryPart.KingFlyV:Destroy() end
            if lp.Character.PrimaryPart:FindFirstChild("KingFlyG") then lp.Character.PrimaryPart.KingFlyG:Destroy() end
        end)
    end
end)

-- زر السرعة 150
CreateBtn("السرعة 150", 170, function(v)
    _G.SpeedEnabled = v
    task.spawn(function()
        while _G.SpeedEnabled do
            if lp.Character and lp.Character:FindFirstChild("Humanoid") then
                lp.Character.Humanoid.WalkSpeed = 150
            end
            task.wait(0.1)
        end
        lp.Character.Humanoid.WalkSpeed = 16
    end)
end)

-- زر الإغلاق
local X_Btn = Instance.new("TextButton", MainFrame)
X_Btn.Size = UDim2.new(0.9, 0, 0, 40)
X_Btn.Position = UDim2.new(0.05, 0, 0.85, 0)
X_Btn.Text = "إغلاق نهائي X"
X_Btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
X_Btn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
