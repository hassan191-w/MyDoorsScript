-- [[ KING HASSAN & HUSSEIN CUSTOM UI V6.0 ]]
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

-- [ 1. إنشاء حاوية الواجهة ]
local HassanHubUI = Instance.new("ScreenGui", CoreGui)
HassanHubUI.Name = "HassanHusseinUI"

-- [ 2. القائمة الرئيسية الملكية ]
local MainFrame = Instance.new("Frame", HassanHubUI)
MainFrame.Size = UDim2.new(0, 230, 0, 320)
MainFrame.Position = UDim2.new(0.5, -115, 0.4, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- خلفية سوداء فخمة
MainFrame.BackgroundTransparency = 0.2 -- شفافية ملكية
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- إطار ذهبي
MainFrame.Active = true
MainFrame.Draggable = true -- تحريك بإصبعك

-- [ 3. شعار الملوك ]
local Crown = Instance.new("ImageLabel", MainFrame)
Crown.Size = UDim2.new(0, 50, 0, 50)
Crown.Position = UDim2.new(0.5, -25, 0, 5)
Crown.Image = "rbxassetid://123456789" -- رابط شعار تاج حقيقي (تعديل)
Crown.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 60)
Title.Text = "👑 ملوك دورس | V6.0"
Title.TextColor3 = Color3.fromRGB(255, 215, 0) -- ذهبي
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20; Title.TextStrokeTransparency = 0

-- [[ زر إغلاق متحرك ]]
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"; CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0); CloseBtn.BorderSizePixel = 0
CloseBtn.MouseButton1Click:Connect(function() HassanHubUI:Destroy() end)

-- [[ 4. قسم الأزرار المدمجة ]]
local ButtonFrame = Instance.new("ScrollingFrame", MainFrame)
ButtonFrame.Size = UDim2.new(0.9, 0, 0, 200)
ButtonFrame.Position = UDim2.new(0.05, 0, 0.35, 0)
ButtonFrame.BackgroundColor3 = Color3.new(0, 0, 0)
ButtonFrame.BackgroundTransparency = 0.5
ButtonFrame.BorderSizePixel = 0
ButtonFrame.CanvasSize = UDim2.new(0, 0, 0, 300) -- مساحة الأزرار

-- وظيفة لإنشاء الأزرار الملكية
local function CreateAdminBtn(name, callback)
    local Btn = Instance.new("TextButton", ButtonFrame)
    Btn.Size = UDim2.new(0.95, 0, 0, 45)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.Font = Enum.Font.Gotham; Btn.TextSize = 18
    Btn.Text = name; Btn.BorderSizePixel = 1; Btn.BorderColor3 = Color3.fromRGB(255, 215, 0)
    Btn.MouseButton1Click:Connect(callback)
    Instance.new("UIListLayout", ButtonFrame).Padding = UDim.new(0, 5) -- ترتيب الأزرار
end

-- [[ أدوات الملوك ]]
CreateAdminBtn("🚀 تفعيل الهوية", function()
    local ID = lp.UserId
    if ID == 10800492177 or ID == 3794073564 then lp.DisplayName = "👑 الملك حسن"
    elseif ID == 10800572782 then lp.DisplayName = "💎 الملك حسين" end
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zayn-Chat-195426"))()
end)

CreateAdminBtn("⚡ سرعة الملوك (150)", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 150
end)

CreateAdminBtn("🕊️ طيران حر", function()
    local bv = Instance.new("BodyVelocity", lp.Character.PrimaryPart)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
    task.wait(2)
    bv:Destroy()
end)

CreateAdminBtn("🚪 كشف الأبواب ESP", function()
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj.Name == "Door" then
            local b = Instance.new("BoxHandleAdornment", obj)
            b.AlwaysOnTop = true; b.Adornee = obj; b.Size = Vector3.new(2,4,2); b.Color3 = Color3.new(0, 1, 0); b.Transparency = 0.5
        end
    end
end)

CreateAdminBtn("⚠️ تجربة الطرد", function()
    lp:Kick("\n\n⚠️ تحديث تحديث يا ملك! ⚠️")
end)
