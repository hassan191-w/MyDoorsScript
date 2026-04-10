-- [[ KING HASSAN ULTIMATE HUB - V2.5 ]]
local currentVersion = "2.5" 
local lp = game.Players.LocalPlayer
local hassan1 = 10800492177
local hassan2 = 3794073564

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 لوحة تحكم الملك حسن",
   LoadingTitle = "جاري تحميل النظام الملكي...",
   LoadingSubtitle = "Admin & Pro Features",
   ConfigurationSaving = { Enabled = true, FolderName = "HassanV25" }
})

-- التبويبات الأساسية
local MainTab = Window:CreateTab("الميزات العامة ⚡", 4483345998)
local DoorsTab = Window:CreateTab("دورس PRO 🚪", 4483345998)

-- [ ميزات الحركة ]
MainTab:CreateSlider({
   Name = "السرعة", Range = {16, 150}, Increment = 1, CurrentValue = 16,
   Callback = function(v) lp.Character.Humanoid.WalkSpeed = v end,
})

MainTab:CreateToggle({
   Name = "اختراق الجدران (Noclip)",
   CurrentValue = false,
   Callback = function(v)
       _G.Noclip = v
       game:GetService("RunService").Stepped:Connect(function()
           if _G.Noclip and lp.Character then
               for _, p in pairs(lp.Character:GetDescendants()) do
                   if p:IsA("BasePart") then p.CanCollide = false end
               end
           end
       end)
   end,
})

-- [ ميزات دورس ]
DoorsTab:CreateButton({
   Name = "إضاءة كاملة (FullBright)",
   Callback = function()
       game:GetService("Lighting").Brightness = 2
       game:GetService("Lighting").ClockTime = 14
       game:GetService("Lighting").FogEnd = 100000
   end,
})

-- ==========================================
-- [ قسم الأدمن السري - للملك حسن فقط ]
-- ==========================================
if lp.UserId == hassan1 or lp.UserId == hassan2 then
    local AdminTab = Window:CreateTab("👑 إدارة الملك", 4483362458)
    
    AdminTab:CreateSection("تجربة النظام")

    AdminTab:CreateButton({
        Name = "🚀 تفعيل الطيران (Fly)",
        Callback = function()
            local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 50, 0)
            wait(0.5)
            bv:Destroy()
        end,
    })

    AdminTab:CreateSection("اختبارات التحديث")

    AdminTab:CreateButton({
        Name = "⚠️ تجربة الطرد (Fake Update)",
        Callback = function()
            -- هاد الزر رح يطرد اللي بضغط عليه (عشان تجرب الرسالة)
            lp:Kick("\n\n👑 نظام الملك حسن 👑\n\nعذراً، أنت تستخدم نسخة قديمة!\nيرجى الدخول للديسكورد أو يوتيوب لتحميل V3.0\n\n")
        end,
    })
    
    AdminTab:CreateLabel("ملاحظة: زر الطرد للاختبار فقط")
end

-- [ لقب الملك فوق الرأس ]
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

Rayfield:Notify({Title = "أهلاً يا ملك", Content = "تم تفعيل ميزات الأدمن بنجاح!", Duration = 5})
