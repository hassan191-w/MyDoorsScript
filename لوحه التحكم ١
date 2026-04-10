-- [[ KING HASSAN ULTIMATE HUB - النسخة المعتمدة ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 لوحة تحكم الملك حسن",
   LoadingTitle = "جاري تجهيز العرش الملكي...",
   LoadingSubtitle = "Zayn Chat + Doors Rayfield",
   ConfigurationSaving = { Enabled = true, FolderName = "HassanZaynHub" }
})

local ChatTab = Window:CreateTab("سكربت الشات 💬", 4483362458)
local DoorsTab = Window:CreateTab("سكربت دورس 🚪", 4483345998)

-- [ قسم الشات ]
ChatTab:CreateButton({
   Name = "🚀 تفعيل Zayn Chat والألقاب الملكية",
   Callback = function()
       local lp = game.Players.LocalPlayer
       if lp.UserId == 10800492177 then lp.DisplayName = "👑 الملك حسن"
       elseif lp.UserId == 10800572782 then lp.DisplayName = "💎 أخو المالك" end
       pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))() end)
   end,
})

-- [ قسم دورس ]
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

-- [ لقب الملك حسن فوق الرأس ]
local function AddHeadTag()
    local lp = game.Players.LocalPlayer
    if lp.UserId == 10800492177 and lp.Character and lp.Character:FindFirstChild("Head") then
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
