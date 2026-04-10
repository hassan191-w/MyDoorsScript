-- [[ KING HASSAN & HUSSEIN HUB - V3.8 FINAL FIXED ]]
local lp = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- معرفات الحسابات الملكية
local hassan1 = 10800492177
local hassan2 = 3794073564
local brotherID = 10800572782 

-- متغيرات التحكم العالمية
_G.SpeedEnabled = false
_G.TargetSpeed = 16
_G.Flying = false
_G.NoclipActive = false
local flySpeed = 50

-- تحميل المكتبة برابط يضمن التشغيل
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 لوحة ملوك دورس | V3.8",
   LoadingTitle = "جاري فحص الهوية الملكية...",
   LoadingSubtitle = "Hassan & Hussein Hub",
   ConfigurationSaving = { Enabled = false }
})

-- ==========================================
-- [ 1. الشات والألقاب ]
-- ==========================================
local ChatTab = Window:CreateTab("الشات واللقب 💬", 4483362458)

ChatTab:CreateButton({
   Name = "🚀 تفعيل اللقب الملكي + Zayn Chat",
   Callback = function()
       if lp.UserId == hassan1 or lp.UserId == hassan2 then 
           lp.DisplayName = "👑 الملك حسن"
       elseif lp.UserId == brotherID then 
           lp.DisplayName = "💎 الملك حسين" 
       end
       pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))() end)
       Rayfield:Notify({Title = "النظام الملكي", Content = "تم تفعيل الهوية بنجاح!", Duration = 3})
   end,
})

-- ==========================================
-- [ 2. الميزات الخارقة (سرعة + طيران) ]
-- ==========================================
local MainTab = Window:CreateTab("الميزات الخارقة ⚡", 4483345998)

MainTab:CreateToggle({
   Name = "السرعة الإجبارية (مضاد للرسيت)",
   CurrentValue = false,
   Callback = function(v) _G.SpeedEnabled = v end,
})

MainTab:CreateSlider({
   Name = "مقدار السرعة", Range = {16, 250}, Increment = 1, CurrentValue = 16,
   Callback = function(v) _G.TargetSpeed = v end,
})

MainTab:CreateToggle({
   Name = "طيران حر (Free Fly)",
   CurrentValue = false,
   Callback = function(v)
       _G.Flying = v
       if v then
           local bg = Instance.new("BodyGyro", lp.Character.PrimaryPart)
           bg.P = 9e4; bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
           local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
           bv.Velocity = Vector3.new(0, 0, 0); bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
           
           task.spawn(function()
               while _G.Flying do
                   bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * flySpeed * (lp.Character.Humanoid.MoveDirection.Magnitude > 0 and 1 or 0)
                   bg.CFrame = workspace.CurrentCamera.CFrame
                   task.wait()
               end
               bg:Destroy(); bv:Destroy()
           end)
       end
   end,
})

MainTab:CreateSlider({
   Name = "سرعة الطيران", Range = {10, 300}, Increment = 5, CurrentValue = 50,
   Callback = function(v) flySpeed = v end,
})

-- ==========================================
-- [ 3. كشف الأماكن - ESP ]
-- ==========================================
local ESPTab = Window:CreateTab("كشف الأماكن 👁️", 4483345998)

ESPTab:CreateButton({
   Name = "كشف اللاعبين + أبواب دورس",
   Callback = function()
       for _, obj in pairs(game.Workspace:GetDescendants()) do
           if obj.Name == "Door" or obj.Name == "Key" then
               local b = Instance.new("BoxHandleAdornment", obj)
               b.AlwaysOnTop = true; b.Adornee = obj; b.Size = Vector3.new(2,4,2); b.Color3 = Color3.fromRGB(0, 255, 0); b.Transparency = 0.5
           end
       end
       Rayfield:Notify({Title = "ESP", Content = "تم تفعيل الكشف الشامل", Duration = 3})
   end,
})

-- ==========================================
-- [ 4. قسم الإدارة (للملوك فقط) ]
-- ==========================================
if lp.UserId == hassan1 or lp.UserId == hassan2 or lp.UserId == brotherID then
    local AdminTab = Window:CreateTab("👑 إدارة الملوك", 4483362458)
    
    AdminTab:CreateToggle({
        Name = "اختراق الجدران (Noclip)",
        CurrentValue = false,
        Callback = function(v) _G.NoclipActive = v end,
    })

    AdminTab:CreateButton({
        Name = "⚠️ تجربة الطرد (تحديث تحديث)",
        Callback = function() lp:Kick("\n\nتحديث تحديث تحديث\n\n⚠️ يرجى استخدام النسخة الجديدة ⚠️") end,
    })
end

-- [[ الأنظمة الخلفية لضمان الثبات ]]
RunService.Heartbeat:Connect(function()
    if _G.SpeedEnabled and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = _G.TargetSpeed
    end
end)

RunService.Stepped:Connect(function()
    if _G.NoclipActive and lp.Character then
        for _, p in pairs(lp.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- لقب فوق الرأس دائم
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if lp.Character and lp.Character:FindFirstChild("Head") and not lp.Character.Head:FindFirstChild("HassanTag") then
                local title = (lp.UserId == hassan1 or lp.UserId == hassan2) and "👑 الملك حسن" or (lp.UserId == brotherID and "💎 الملك حسين" or "")
                if title ~= "" then
                    local b = Instance.new("BillboardGui", lp.Character.Head)
                    b.Name = "HassanTag"; b.Size = UDim2.new(0, 200, 0, 50); b.StudsOffset = Vector3.new(0, 3, 0); b.AlwaysOnTop = true
                    local l = Instance.new("TextLabel", b)
                    l.Size = UDim2.new(1, 0, 1, 0); l.BackgroundTransparency = 1; l.Text = title; l.TextColor3 = Color3.fromRGB(255, 215, 0)
                    l.Font = Enum.Font.GothamBold; l.TextSize = 25; l.TextStrokeTransparency = 0
                end
            end
        end)
    end
end)       elseif lp.UserId == brotherID then 
           lp.DisplayName = "💎 الملك حسين" 
       end
       -- تفعيل سكربت الشات
       pcall(function() 
           loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))() 
       end)
       Rayfield:Notify({Title = "النظام الملكي", Content = "تم تفعيل الشات واللقب بنجاح!", Duration = 3})
   end,
})

-- ==========================================
-- [ 2. الميزات الخارقة (سرعة + طيران) ]
-- ==========================================
local MainTab = Window:CreateTab("الميزات الخارقة ⚡", 4483345998)

MainTab:CreateToggle({
   Name = "تفعيل السرعة الإجبارية",
   CurrentValue = false,
   Callback = function(v) _G.SpeedEnabled = v end,
})

MainTab:CreateSlider({
   Name = "مقدار السرعة", Range = {16, 250}, Increment = 1, CurrentValue = 16,
   Callback = function(v) _G.TargetSpeed = v end,
})

-- نظام الطيران الحر (تحكم كامل)
MainTab:CreateToggle({
   Name = "طيران حر (Free Fly)",
   CurrentValue = false,
   Callback = function(v)
       _G.Flying = v
       if v then
           local bg = Instance.new("BodyGyro", lp.Character.PrimaryPart)
           bg.P = 9e4; bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9); bg.CFrame = lp.Character.PrimaryPart.CFrame
           local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
           bv.Velocity = Vector3.new(0, 0, 0); bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
           
           task.spawn(function()
               while _G.Flying do
                   bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * flySpeed * (lp.Character.Humanoid.MoveDirection.Magnitude > 0 and 1 or 0)
                   bg.CFrame = workspace.CurrentCamera.CFrame
                   task.wait()
               end
               bg:Destroy(); bv:Destroy()
           end)
       end
   end,
})

MainTab:CreateSlider({
   Name = "سرعة الطيران", Range = {10, 300}, Increment = 5, CurrentValue = 50,
   Callback = function(v) flySpeed = v end,
})

-- ==========================================
-- [ 3. قسم الإدارة (للملوك فقط) ]
-- ==========================================
if lp.UserId == hassan1 or lp.UserId == hassan2 or lp.UserId == brotherID then
    local AdminTab = Window:CreateTab("👑 إدارة الملوك", 4483362458)
    
    AdminTab:CreateToggle({
        Name = "اختراق الجدران (Noclip)",
        CurrentValue = false,
        Callback = function(v) _G.NoclipActive = v end,
    })

    AdminTab:CreateButton({
        Name = "⚠️ تجربة الطرد (تحديث تحديث)",
        Callback = function() lp:Kick("\n\nتحديث تحديث تحديث\n\n⚠️ يرجى استخدام النسخة الجديدة ⚠️") end,
    })
end

-- [[ الأنظمة الخلفية لضمان الثبات ]]
RunService.Heartbeat:Connect(function()
    if _G.SpeedEnabled and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = _G.TargetSpeed
    end
end)

RunService.Stepped:Connect(function()
    if _G.NoclipActive and lp.Character then
        for _, p in pairs(lp.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- لقب فوق الرأس دائم
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if lp.Character and lp.Character:FindFirstChild("Head") and not lp.Character.Head:FindFirstChild("HassanTag") then
                local title = (lp.UserId == hassan1 or lp.UserId == hassan2) and "👑 الملك حسن" or (lp.UserId == brotherID and "💎 الملك حسين" or "")
                if title ~= "" then
                    local b = Instance.new("BillboardGui", lp.Character.Head)
                    b.Name = "HassanTag"; b.Size = UDim2.new(0, 200, 0, 50); b.StudsOffset = Vector3.new(0, 3, 0); b.AlwaysOnTop = true
                    local l = Instance.new("TextLabel", b)
                    l.Size = UDim2.new(1, 0, 1, 0); l.BackgroundTransparency = 1; l.Text = title; l.TextColor3 = Color3.fromRGB(255, 215, 0)
                    l.Font = Enum.Font.GothamBold; l.TextSize = 25; l.TextStrokeTransparency = 0
                end
            end
        end)
    end
end)       if lp.UserId == hassan1 or lp.UserId == hassan2 then 
           lp.DisplayName = "👑 الملك حسن"
       elseif lp.UserId == brotherID then 
           lp.DisplayName = "💎 الملك حسين" 
       end
       pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))() end)
       Rayfield:Notify({Title = "تم التفعيل", Content = "الألقاب والدردشة جاهزة!", Duration = 3})
   end,
})

-- ==========================================
-- [ 2. السرعة الإجبارية (مضاد للرسيت) ]
-- ==========================================
MainTab:CreateToggle({
   Name = "تفعيل السرعة الإجبارية",
   CurrentValue = false,
   Callback = function(v) _G.SpeedEnabled = v end,
})

MainTab:CreateSlider({
   Name = "مقدار السرعة", Range = {16, 250}, Increment = 1, CurrentValue = 16,
   Callback = function(v) _G.TargetSpeed = v end,
})

-- قلب السكربت (Heartbeat) لمنع اللعبة من تنزيل السرعة
RunService.Heartbeat:Connect(function()
    if _G.SpeedEnabled and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid.WalkSpeed = _G.TargetSpeed
    end
end)

-- ==========================================
-- [ 3. قسم الإدارة السري (حسن وحسين فقط) ]
-- ==========================================
if lp.UserId == hassan1 or lp.UserId == hassan2 or lp.UserId == brotherID then
    AdminTab = Window:CreateTab("👑 إدارة الملوك", 4483362458)
    
    AdminTab:CreateSection("أدوات الطيران والاختراق")

    AdminTab:CreateToggle({
        Name = "طيران حر (تحكم بالكاميرا)",
        CurrentValue = false,
        Callback = function(v)
            _G.Flying = v
            if v then
                local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                local bg = Instance.new("BodyGyro", lp.Character.PrimaryPart)
                bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                task.spawn(function()
                    while _G.Flying do
                        bg.CFrame = workspace.CurrentCamera.CFrame
                        bv.Velocity = lp.Character.Humanoid.MoveDirection * flySpeed
                        if lp.Character.Humanoid.MoveDirection.Magnitude == 0 then bv.Velocity = Vector3.new(0, 0.1, 0) end
                        task.wait()
                    end
                    bv:Destroy(); bg:Destroy()
                end)
            end
        end,
    })

    AdminTab:CreateToggle({
        Name = "اختراق الجدران (Noclip)",
        CurrentValue = false,
        Callback = function(v) _G.NoclipActive = v end,
    })

    AdminTab:CreateSection("اختبارات النظام")

    AdminTab:CreateButton({
        Name = "⚠️ تجربة الطرد (تحديث تحديث)",
        Callback = function() lp:Kick("\n\nتحديث تحديث تحديث\n\n⚠️ يرجى استخدام النسخة الجديدة يا ملك ⚠️") end,
    })
end

-- نكليب مستمر
RunService.Stepped:Connect(function()
    if _G.NoclipActive and lp.Character then
        for _, p in pairs(lp.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- لقب فوق الرأس (حسن وحسين)
task.spawn(function()
    while task.wait(1) do
        if lp.Character and lp.Character:FindFirstChild("Head") then
            if not lp.Character.Head:FindFirstChild("HassanTag") then
                local title = ""
                if lp.UserId == hassan1 or lp.UserId == hassan2 then title = "👑 الملك حسن"
                elseif lp.UserId == brotherID then title = "💎 الملك حسين" end
                
                if title ~= "" then
                    local b = Instance.new("BillboardGui", lp.Character.Head)
                    b.Name = "HassanTag"; b.Size = UDim2.new(0, 200, 0, 50); b.StudsOffset = Vector3.new(0, 3, 0); b.AlwaysOnTop = true
                    local l = Instance.new("TextLabel", b)
                    l.Size = UDim2.new(1, 0, 1, 0); l.BackgroundTransparency = 1; l.Text = title; l.TextColor3 = Color3.fromRGB(255, 215, 0)
                    l.Font = Enum.Font.GothamBold; l.TextSize = 25; l.TextStrokeTransparency = 0
                end
            end
        end
    end
end)   Callback = function(v)
       if v then 
           game:GetService("Lighting").Brightness = 2
           game:GetService("Lighting").ClockTime = 14
           game:GetService("Lighting").FogEnd = 100000
       else 
           game:GetService("Lighting").Brightness = 1
           game:GetService("Lighting").ClockTime = 0
       end
   end,
})

-- ==========================================
-- [ 2. كشف الأماكن - ESP ]
-- ==========================================
ESPTab:CreateButton({
   Name = "كشف اللاعبين (ESP Players)",
   Callback = function()
       for _, v in pairs(game.Players:GetPlayers()) do
           if v ~= lp and v.Character and v.Character:FindFirstChild("Head") then
               local b = Instance.new("BillboardGui", v.Character.Head)
               b.Size = UDim2.new(0, 150, 0, 50); b.AlwaysOnTop = true; b.StudsOffset = Vector3.new(0, 2, 0)
               local l = Instance.new("TextLabel", b)
               l.Size = UDim2.new(1, 0, 1, 0); l.Text = v.Name; l.TextColor3 = Color3.fromRGB(255, 0, 0); l.BackgroundTransparency = 1; l.TextSize = 18
           end
       end
       Rayfield:Notify({Title = "ESP", Content = "تم كشف جميع اللاعبين", Duration = 3})
   end,
})

ESPTab:CreateButton({
   Name = "كشف أبواب ومفاتيح دورس 🚪",
   Callback = function()
       for _, obj in pairs(game.Workspace:GetDescendants()) do
           if obj.Name == "Door" or obj.Name == "Key" then
               local b = Instance.new("BoxHandleAdornment", obj)
               b.AlwaysOnTop = true; b.Adornee = obj; b.Size = Vector3.new(2,4,2); b.Color3 = Color3.fromRGB(0, 255, 0); b.Transparency = 0.5
           end
       end
       Rayfield:Notify({Title = "Doors ESP", Content = "تم تحديد الأبواب والمفاتيح", Duration = 3})
   end,
})

-- ==========================================
-- [ 3. قسم الإدارة السري - خاص بالملك حسن ]
-- ==========================================
if lp.UserId == hassan1 or lp.UserId == hassan2 then
    AdminTab = Window:CreateTab("👑 إدارة الملك السرية", 4483362458)
    
    AdminTab:CreateSection("أدوات الهكر")

    AdminTab:CreateToggle({
        Name = "اختراق الجدران (Noclip)", CurrentValue = false,
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

    AdminTab:CreateButton({
        Name = "تفعيل الطيران (Fly)",
        Callback = function()
            local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 60, 0)
            wait(0.5)
            bv:Destroy()
        end,
    })

    AdminTab:CreateSection("نظام التحديث")

    AdminTab:CreateButton({
        Name = "⚠️ تجربة الطرد (تحديث تحديث)",
        Callback = function()
            lp:Kick("\n\nتحديث تحديث تحديث\nتحديث تحديث تحديث\n\n⚠️ يرجى استخدام النسخة الجديدة يا ملك ⚠️")
        end,
    })
end

-- [[ لقب الملك فوق الرأس ]]
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

Rayfield:Notify({Title = "أهلاً يا ملك", Content = "أقوى سكربت متاح الآن بين يديك!", Duration = 5})
