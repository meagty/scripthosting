-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local FlyButton = Instance.new("TextButton")
local InvisibilityButton = Instance.new("TextButton")
local InvincibilityButton = Instance.new("TextButton")
local ResetButton = Instance.new("TextButton")
local CloseXButton = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")
local Notes = Instance.new("Frame")
local NoteText = Instance.new("TextLabel")
local CloseNote = Instance.new("TextButton")
local VersionInfo = Instance.new("TextBox")
local CopyInfo = Instance.new("TextBox")
local DateInfo = Instance.new("TextBox")
local ThanksV3R = Instance.new("TextBox")

--Properties:

ScreenGui.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(204, 204, 204)
Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
Main.Position = UDim2.new(0.0247831475, 0, 0.599601626, 0)
Main.Size = UDim2.new(0, 225, 0, 180)

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Position = UDim2.new(0, 0, -0.0051281401, 0)
TextLabel.Size = UDim2.new(0, 192, 0, 31)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Test GUI"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 18.000

FlyButton.Name = "Fly Button"
FlyButton.Parent = Main
FlyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Position = UDim2.new(0.111111045, 0, 0.277777791, 0)
FlyButton.Size = UDim2.new(0, 76, 0, 40)
FlyButton.Font = Enum.Font.SourceSans
FlyButton.Text = "Fly"
FlyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyButton.TextSize = 14.000
FlyButton.MouseButton1Down:connect(function()
repeat wait()
   until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0

function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "e" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
 
end)

InvisibilityButton.Name = "Invisibility Button"
InvisibilityButton.Parent = Main
InvisibilityButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InvisibilityButton.Position = UDim2.new(0.551111102, 0, 0.277777791, 0)
InvisibilityButton.Size = UDim2.new(0, 76, 0, 40)
InvisibilityButton.Font = Enum.Font.SourceSans
InvisibilityButton.Text = "Invisibility"
InvisibilityButton.TextColor3 = Color3.fromRGB(0, 0, 0)
InvisibilityButton.TextSize = 14.000

InvincibilityButton.Name = "Invincibility Button"
InvincibilityButton.Parent = Main
InvincibilityButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InvincibilityButton.Position = UDim2.new(0.106666669, 0, 0.611111104, 0)
InvincibilityButton.Size = UDim2.new(0, 76, 0, 40)
InvincibilityButton.Font = Enum.Font.SourceSans
InvincibilityButton.Text = "Invincibility"
InvincibilityButton.TextColor3 = Color3.fromRGB(0, 0, 0)
InvincibilityButton.TextSize = 14.000

ResetButton.Name = "Reset Button"
ResetButton.Parent = Main
ResetButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ResetButton.Position = UDim2.new(0.551111102, 0, 0.611111104, 0)
ResetButton.Size = UDim2.new(0, 76, 0, 40)
ResetButton.Font = Enum.Font.SourceSans
ResetButton.Text = "Reset"
ResetButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ResetButton.TextSize = 14.000

CloseXButton.Name = "Close X Button"
CloseXButton.Parent = Main
CloseXButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseXButton.Position = UDim2.new(0.853333354, 0, -0.00555555569, 0)
CloseXButton.Size = UDim2.new(0, 33, 0, 31)
CloseXButton.Font = Enum.Font.Gotham
CloseXButton.Text = "X"
CloseXButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseXButton.TextSize = 20.000

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Position = UDim2.new(0, 0, -0.00555555569, 0)
TextButton.Size = UDim2.new(0, 192, 0, 31)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Test GUI"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 18.000
TextButton.MouseButton1Down:connect(function()
Main.Visible = true
Notes.Visible = false
end)

Notes.Name = "Notes"
Notes.Parent = ScreenGui
Notes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Notes.Position = UDim2.new(0.766109824, 0, 0.492031872, 0)
Notes.Size = UDim2.new(0, 175, 0, 235)
Notes.Visible = false

NoteText.Name = "NoteText"
NoteText.Parent = Notes
NoteText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoteText.Size = UDim2.new(0, 138, 0, 30)
NoteText.Font = Enum.Font.SourceSans
NoteText.Text = "Information"
NoteText.TextColor3 = Color3.fromRGB(0, 0, 0)
NoteText.TextSize = 14.000

CloseNote.Name = "CloseNote"
CloseNote.Parent = Notes
CloseNote.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseNote.Position = UDim2.new(0.788571417, 0, -0.00130024366, 0)
CloseNote.Size = UDim2.new(0, 37, 0, 30)
CloseNote.Font = Enum.Font.Gotham
CloseNote.Text = "X"
CloseNote.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseNote.TextSize = 20.000
CloseNote.MouseButton1Down:connect(function()
TextButton.Visible = true
Main.Visible = true
end)

VersionInfo.Name = "VersionInfo"
VersionInfo.Parent = Notes
VersionInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VersionInfo.BorderSizePixel = 0
VersionInfo.Position = UDim2.new(0, 0, 0.829787254, 0)
VersionInfo.Size = UDim2.new(0, 175, 0, 40)
VersionInfo.Font = Enum.Font.SourceSansSemibold
VersionInfo.Text = "You are on Version 1.0"
VersionInfo.TextColor3 = Color3.fromRGB(0, 0, 0)
VersionInfo.TextSize = 18.000

CopyInfo.Name = "CopyInfo"
CopyInfo.Parent = Notes
CopyInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyInfo.BorderSizePixel = 0
CopyInfo.Position = UDim2.new(0, 0, 0.600000024, 0)
CopyInfo.Size = UDim2.new(0, 175, 0, 54)
CopyInfo.Font = Enum.Font.SourceSans
CopyInfo.MultiLine = true
CopyInfo.Text = "The script does not belong\\nto the owner. They belong\\nto their rightful owners."
CopyInfo.TextColor3 = Color3.fromRGB(0, 0, 0)
CopyInfo.TextSize = 14.000

DateInfo.Name = "DateInfo"
DateInfo.Parent = Notes
DateInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DateInfo.BorderSizePixel = 0
DateInfo.Position = UDim2.new(0, 0, 0.40425545, 0)
DateInfo.Size = UDim2.new(0, 175, 0, 45)
DateInfo.Font = Enum.Font.SourceSans
DateInfo.Text = "Modified on August 5, 2020"
DateInfo.TextColor3 = Color3.fromRGB(0, 0, 0)
DateInfo.TextSize = 14.000

ThanksV3R.Name = "ThanksV3R"
ThanksV3R.Parent = Notes
ThanksV3R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ThanksV3R.BorderSizePixel = 0
ThanksV3R.Position = UDim2.new(0, 0, 0.178723529, 0)
ThanksV3R.Size = UDim2.new(0, 175, 0, 53)
ThanksV3R.Font = Enum.Font.SourceSansItalic
ThanksV3R.MultiLine = true
ThanksV3R.Text = "Big thanks to v3rmillion for\\nproviding a lot of scripts.\\n(i need to know how to script)"
ThanksV3R.TextColor3 = Color3.fromRGB(0, 0, 0)
ThanksV3R.TextSize = 14.000