-- [[-- [[ KING HASSAN ULTIMATE HUB - ADMIN EDITION ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local hassan1 = 10800492177 -- حسابك الأول
local hassan2 = 3794073564  -- حسابك الثاني
local lp = game.Players.LocalPlayer

local Window = Rayfield:CreateWindow({
   Name = "👑 لوحة تحكم الملك حسن",
   LoadingTitle = "جاري التحقق من الصلاحيات الملكية...",
   LoadingSubtitle = "Admin Access System",
   ConfigurationSaving = { Enabled = true, FolderName = "HassanAdmin" }
})

-- التبويبات العادية للكل
local ChatTab = Window:CreateTab("سكربت الشات 💬", 4483362458)
local DoorsTab = Window:CreateTab("سكربت دورس 🚪", 4483345998)

-- [ قسم الشات ]
ChatTab:CreateButton({
   Name = "🚀 تفعيل Zayn Chat",
   Callback = function()
       pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))() end)
   end,
})

-- [ قسم دورس ]
DoorsTab:CreateSlider({
   Name = "السرعة", Range = {16, 150}, Increment = 1, CurrentValue = 16,
   Callback = function(v) lp.Character.Humanoid.WalkSpeed = v end,
})

-- ==========================================
-- القائمة السرية (ADMIN ONLY)
-- ==========================================
if lp.UserId == hassan1 or lp.UserId == hassan2 then
    local AdminTab = Window:CreateTab("👑 إدارة الملك (خاص)", 4483362458)
    
    AdminTab:CreateSection("ميزات المسؤول")

    AdminTab:CreateButton({
        Name = "تدمير الجاذبية (Fly/No Grav)",
        Callback = function()
            game.Workspace.Gravity = 0
            Rayfield:Notify({Title = "Admin", Content = "تم إيقاف الجاذبية للملك!", Duration = 3})
        end,
    })

    AdminTab:CreateButton({
        Name = "إعادة الجاذبية",
        Callback = function()
            game.Workspace.Gravity = 196.2
        end,
    })

    AdminTab:CreateButton({
        Name = "كشف أماكن اللاعبين (ESP)",
        Callback = function()
            -- كود بسيط للكشف
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= lp and v.Character and v.Character:FindFirstChild("Head") then
                    local bgui = Instance.new("BillboardGui", v.Character.Head)
                    bgui.Size = UDim2.new(0, 200, 0, 50); bgui.AlwaysOnTop = true
                    local tl = Instance.new("TextLabel", bgui)
                    tl.Size = UDim2.new(1, 0, 1, 0); tl.Text = v.Name; tl.TextColor3 = Color3.fromRGB(255, 0, 0); tl.BackgroundTransparency = 1
                end
            end
        end,
    })
    
    Rayfield:Notify({Title = "مرحباً أيها الملك", Content = "تم تفعيل قائمة الأدمن الخاصة بك.", Duration = 5})
end
-- ==========================================

-- لقب الملك فوق الرأس
local function AddHeadTag()
    if (lp.UserId == hassan1 or lp.UserId == hassan2) and lp.Character and lp.Character:FindFirstChild("Head") then
        if not lp.Character.Head:FindFirstChild("HassanTag") then
            local b = Instance.new("BillboardGui", lp.Character.Head)
            b.Name = "HassanTag"; b.Size = UDim2.new(0, 200, 0, 50); b.StudsOffset = Vector3.new(0, 3, 0); b.AlwaysOnTop = true
            local l = Instance.new("TextLabel", b)
            l.Size = UDim2.new(1, 0, 1, 0); l.BackgroundTransparency = 1; l.Text = "👑 الملك حسن"; l.TextColor3 = Color3.fromRGB(255, 215, 0)
            l.Font = Enum.Font.GothamBold; l.TextSize = 25; l.TextStrokeTransparency = 0
        end
    end
end
task.spawn(function() while task.wait(1) do AddHeadTag() end end)
