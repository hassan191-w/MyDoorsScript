-- [[ HASSAN & HUSSEIN - NO-LAG EDITION V5.0 ]]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Active = true
MainFrame.Draggable = true -- تقدر تحركها بإصبعك

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "👑 لوحة الملوك V5.0"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- [[ زر تفعيل اللقب والشات ]]
local ChatBtn = Instance.new("TextButton", MainFrame)
ChatBtn.Size = UDim2.new(0.9, 0, 0, 40)
ChatBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
ChatBtn.Text = "🚀 تفعيل اللقب والشات"
ChatBtn.Callback = function()
    local lp = game.Players.LocalPlayer
    if lp.UserId == 10800492177 or lp.UserId == 3794073564 then lp.DisplayName = "👑 الملك حسن"
    elseif lp.UserId == 10800572782 then lp.DisplayName = "💎 الملك حسين" end
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))()
end
ChatBtn.MouseButton1Click:Connect(ChatBtn.Callback)

-- [[ زر السرعة 100 ]]
local SpeedBtn = Instance.new("TextButton", MainFrame)
SpeedBtn.Size = UDim2.new(0.9, 0, 0, 40)
SpeedBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
SpeedBtn.Text = "⚡ سرعة خارقة (100)"
SpeedBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- [[ زر الطيران ]]
local FlyBtn = Instance.new("TextButton", MainFrame)
FlyBtn.Size = UDim2.new(0.9, 0, 0, 40)
FlyBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
FlyBtn.Text = "🕊️ طيران (Fly)"
FlyBtn.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.new(0, 50, 0)
    task.wait(2)
    bv:Destroy()
end)

-- [[ زر إغلاق القائمة ]]
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0.9, 0, 0, 30)
CloseBtn.Position = UDim2.new(0.05, 0, 0.85, 0)
CloseBtn.Text = "إغلاق X"
CloseBtn.BackgroundColor3 = Color3.new(0.6, 0, 0)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
