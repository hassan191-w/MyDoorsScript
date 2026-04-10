-- [[ KING HASSAN ULTIMATE HUB - النسخة المعتمدة ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 لوحة تحكم الملك حسن",
   LoadingTitle = "جاري التحقق من الهوية الملكية...",
   LoadingSubtitle = "Zayn Chat + Doors Rayfield",
   ConfigurationSaving = { Enabled = true, FolderName = "HassanZaynHub" }
})

-- معرفات الحسابات الخاصة بك (ID)
local hassan1 = 10800492177 -- حسابك الأول
local hassan2 = 3794073564  -- حسابك الثاني (الجديد)
local brotherID = 10800572782 -- حساب أخوك حسين

local lp = game.Players.LocalPlayer

-- إنشاء التبويبات
local ChatTab = Window:CreateTab("سكربت الشات 💬", 4483362458)
local DoorsTab = Window:CreateTab("سكربت دورس 🚪", 4483345998)

-- ==========================================
-- [ قسم الشات - Zayn Chat مع الألقاب ]
-- ==========================================
ChatTab:CreateButton({
   Name = "🚀 تفعيل Zayn Chat والألقاب الملكية",
   Callback = function()
       -- تعديل الـ DisplayName بناءً على الـ ID
       if lp.UserId == hassan1 or lp.UserId == hassan2 then
           lp.DisplayName = "👑 الملك حسن"
       elseif lp.UserId == brotherID then
           lp.DisplayName = "💎 أخو المالك"
       end

       -- تشغيل Zayn Chat
       pcall(function()
           loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))()
       end)
       Rayfield:Notify({Title = "تم التفعيل", Content = "الألقاب والدردشة جاهزة!", Duration = 3})
   end,
})

-- ==========================================
-- [ قسم دورس - الميزات ]
-- ==========================================
DoorsTab:CreateSlider({
   Name = "السرعة", Range = {16, 100}, Increment = 1, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

DoorsTab:CreateToggle({
   Name = "اختراق الجدران (Noclip)", CurrentValue = false,
   Callback = function(v)
       _G.Noclip = v
       game:GetService("RunService").Stepped:Connect(function()
           if _G.Noclip and game.Players.LocalPlayer.Character then
               for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                   if p:IsA("BasePart") then p.CanCollide = false end
               end
           end
       end)
   end,
})

-- ==========================================
-- نظام اللقب فوق الرأس (للحسابين)
-- ==========================================
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

task.spawn(function()
    while task.wait(1) do AddHeadTag() end
end)

Rayfield:Notify({Title = "أهلاً يا ملك!", Content = "تم التعرف على حسابك بنجاح.", Duration = 5})
