-- [[ KING HASSAN ULTIMATE HUB - DOORS PRO EDITION ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local hassan1 = 10800492177
local hassan2 = 3794073564 
local lp = game.Players.LocalPlayer

local Window = Rayfield:CreateWindow({
   Name = "👑 لوحة تحكم الملك حسن",
   LoadingTitle = "جاري تحميل ميزات دورس الخارقة...",
   LoadingSubtitle = "Hassan Custom Edition",
   ConfigurationSaving = { Enabled = true, FolderName = "HassanPro" }
})

local DoorsTab = Window:CreateTab("سكربت دورس PRO 🚪", 4483345998)
local AdminTab; -- تعريف متغير للأدمن

-- [ قسم ميزات دورس ]
DoorsTab:CreateSection("التحركات")

DoorsTab:CreateSlider({
   Name = "السرعة", Range = {16, 100}, Increment = 1, CurrentValue = 16,
   Callback = function(v) lp.Character.Humanoid.WalkSpeed = v end,
})

DoorsTab:CreateToggle({
   Name = "إضاءة كاملة (FullBright)", CurrentValue = false,
   Callback = function(v)
       if v then game:GetService("Lighting").Brightness = 2; game:GetService("Lighting").ClockTime = 14
       else game:GetService("Lighting").Brightness = 1; game:GetService("Lighting").ClockTime = 0 end
   end,
})

DoorsTab:CreateSection("الكشف (ESP)")

DoorsTab:CreateButton({
   Name = "كشف الأبواب والمفاتيح",
   Callback = function()
       -- كود كشف الأغراض في دورس
       for _, obj in pairs(game.Workspace.CurrentRooms:GetDescendants()) do
           if obj.Name == "Door" or obj.Name == "Key" then
               local b = Instance.new("BoxHandleAdornment", obj)
               b.AlwaysOnTop = true; b.Adornee = obj; b.Size = Vector3.new(2,2,2); b.Color3 = Color3.fromRGB(0, 255, 0); b.Transparency = 0.5
           end
       end
       Rayfield:Notify({Title = "ESP", Content = "تم تحديد أماكن الأبواب والمفاتيح", Duration = 3})
   end,
})

DoorsTab:CreateToggle({
   Name = "إزالة الضباب", CurrentValue = false,
   Callback = function(v)
       if v then game:GetService("Lighting").FogEnd = 100000
       else game:GetService("Lighting").FogEnd = 1000 end
   end,
})

-- [ قسم الإدارة - خاص بحسن فقط ]
if lp.UserId == hassan1 or lp.UserId == hassan2 then
    AdminTab = Window:CreateTab("👑 إدارة الملك", 4483362458)
    AdminTab:CreateButton({
        Name = "تخطي الغرفة (قريباً)",
        Callback = function() Rayfield:Notify({Title="Admin", Content="جاري العمل على ميزة التخطي التلقائي", Duration=3}) end
    })
end

-- لقب الملك فوق الرأس (دائم)
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
