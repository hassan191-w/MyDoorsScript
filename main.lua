-- [[ HASSAN & HUSSEIN - HHHHHHHHH MOD V15.0 ]]
local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local RunService = game:GetService("RunService")

-- الملوك
local hassan1, hassan2 = 10800492177, 3794073564
local brotherID = 10800572782

-- إعدادات المود الغريب
_G.Speed = 16
_G.Noclip = false
_G.DiscoMode = false

-- [ 1. الواجهة "الغريبة" ]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 420)
MainFrame.Position = UDim2.new(0.5, -190, 0.4, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 30) -- لون بنفسجي غريب
MainFrame.BorderColor3 = Color3.new(1, 0, 1) -- إطار وردي فاقع
MainFrame.Active = true; MainFrame.Draggable = true

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "🤡 مود ههههههههه الملكي 🤡"
Title.TextColor3 = Color3.new(0, 1, 0)
Title.BackgroundColor3 = Color3.fromRGB(40, 0, 60)
Title.Font = Enum.Font.ComicSansMS -- خط مضحك
Title.TextSize = 25

local Content = Instance.new("ScrollingFrame", MainFrame)
Content.Size = UDim2.new(1, -20, 1, -60); Content.Position = UDim2.new(0, 10, 0, 60)
Content.BackgroundTransparency = 1; Content.CanvasSize = UDim2.new(0, 0, 0, 1000)
Instance.new("UIListLayout", Content).Padding = UDim.new(0, 10)

local function AddOddBtn(name, color, cb)
    local b = Instance.new("TextButton", Content)
    b.Size = UDim2.new(0.95, 0, 0, 50); b.Text = name; b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.GothamBold; b.TextSize = 16
    b.MouseButton1Click:Connect(cb)
    return b
end

-- [[ قسم الأشياء الغريبة ]]

AddOddBtn("😂 ركب لقب الملك حسن + شات Z", Color3.fromRGB(0, 150, 0), function()
    if lp.UserId == hassan1 or lp.UserId == hassan2 then lp.DisplayName = "👑 الملك حسن"
    elseif lp.UserId == brotherID then lp.DisplayName = "💎 الملك حسين" end
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))()
end)

AddOddBtn("🤡 تكبير الرأس (رأس الملوك)", Color3.fromRGB(200, 0, 150), function()
    pcall(function()
        lp.Character.Head.Size = Vector3.new(5, 5, 5) -- رأس ضخم جداً
        lp.Character.Head.CanCollide = false
    end)
end)

AddOddBtn("🌈 مود الديسكو (ألوان غريبة)", Color3.fromRGB(0, 0, 200), function()
    _G.DiscoMode = not _G.DiscoMode
    task.spawn(function()
        while _G.DiscoMode do
            game:GetService("Lighting").Ambient = Color3.new(math.random(), math.random(), math.random())
            task.wait(0.1)
        end
    end)
end)

AddOddBtn("🦘 قفزة الكنغر (Jump Infinite)", Color3.fromRGB(150, 150, 0), function()
    lp.Character.Humanoid.JumpPower = 150
end)

AddOddBtn("👻 اختراق و كشف (ESP + Noclip)", Color3.fromRGB(50, 50, 50), function()
    _G.Noclip = not _G.Noclip
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name:find("Key") or v.Name == "GoldPile" then
            local b = Instance.new("BoxHandleAdornment", v); b.Adornee = v; b.Size = v.Size
            b.AlwaysOnTop = true; b.Color3 = Color3.new(math.random(), 0, 1); b.Transparency = 0.5
        end
    end
end)

AddOddBtn("⚡ سرعة غريبة (تغيير عشوائي)", Color3.fromRGB(255, 100, 0), function()
    _G.Speed = 50 -- سرعة صاروخية
end)

AddOddBtn("💀 طرد مزيف (PRANK)", Color3.fromRGB(255, 0, 0), function()
    lp.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech:Destroy() -- بحذف الوحوش كالعادة
    print("ههههههههه تم تفعيل مقلب الطرد")
end)

-- [ الأنظمة الخلفية ]
RunService.Stepped:Connect(function()
    if _G.Noclip and lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
    end
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = _G.Speed
    end
end)

-- زر H للاختفاء (بلون فاقع)
local H = Instance.new("TextButton", ScreenGui); H.Size = UDim2.new(0,50,0,50); H.Position = UDim2.new(0,10,0.5,0)
H.Text = "HA!"; H.BackgroundColor3 = Color3.new(1, 0, 1); H.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
