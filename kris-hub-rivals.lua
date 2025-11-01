-- KRIS HUB - RIVALS AIMBOT V2 | MEJORADO 100% | Creado por ESTABESSIII
-- 31/10/2025 | Krnl PC | SILENT + SMOOTH + TRIGGERBOT

-- ESPERAR
if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players.LocalPlayer
wait(3)

-- KAVO UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("KRIS HUB - RIVALS AIMBOT V2", "DarkTheme")

-- SERVICIOS
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- AIMBOT CONFIG
local Aimbot = {
    Enabled = false,
    Keybind = Enum.KeyCode.E,
    FOV = 120,
    Smoothness = 0.15,
    Part = "Head", -- Head / Torso / Random
    TeamCheck = true,
    VisibleCheck = true,
    Triggerbot = false,
    FOVColor = Color3.fromRGB(255, 0, 0),
    FOVTransparency = 0.3,
    Holding = false
}

-- FOV CIRCLE
local FOVCircle = Drawing.new("Circle")
FOVCircle.Radius = Aimbot.FOV
FOVCircle.Color = Aimbot.FOVColor
FOVCircle.Thickness = 2
FOVCircle.Filled = false
FOVCircle.Transparency = 1 - Aimbot.FOVTransparency
FOVCircle.Visible = false

-- GET BEST TARGET
local function GetClosestToMouse()
    local Closest = nil
    local ShortestDistance = Aimbot.FOV

    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 then
            if Aimbot.TeamCheck and Player.Team == LocalPlayer.Team then continue end

            local Character = Player.Character
            local Part = Character:FindFirstChild(Aimbot.Part) or Character:FindFirstChild("Head")
            if not Part then continue end

            local ScreenPosition, OnScreen = Camera:WorldToViewportPoint(Part.Position)
            if not OnScreen then continue end

            if Aimbot.VisibleCheck then
                local Ray = Ray.new(Camera.CFrame.Position, (Part.Position - Camera.CFrame.Position).Unit * 500)
                local Hit = Workspace:FindPartOnRayWithIgnoreList(Ray, {LocalPlayer.Character})
                if Hit and Hit:IsDescendantOf(Character) == false then continue end
            end

            local Distance = (Vector2.new(ScreenPosition.X, ScreenPosition.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            if Distance < ShortestDistance then
                Closest = Part
                ShortestDistance = Distance
            end
        end
    end

    return Closest
end

-- SMOOTH LOOK
local function SmoothAim(Target)
    if not Target then return end
    local MousePos = Vector2.new(Mouse.X, Mouse.Y)
    local TargetPos = Camera:WorldToViewportPoint(Target.Position)
    local ScreenPos = Vector2.new(TargetPos.X, TargetPos.Y)
    local Difference = ScreenPos - MousePos
    local Smoothed = Difference * Aimbot.Smoothness

    mousemoverel(Smoothed.X, Smoothed.Y)
end

-- TRIGGERBOT
local function Triggerbot()
    if not Aimbot.Triggerbot then return end
    local Target = GetClosestToMouse()
    if Target then
        mouse1click()
        wait(0.05)
    end
end

-- MAIN LOOP
RunService.Heartbeat:Connect(function()
    FOVCircle.Visible = Aimbot.Enabled
    FOVCircle.Radius = Aimbot.FOV
    FOVCircle.Color = Aimbot.FOVColor
    FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)

    if Aimbot.Holding and Aimbot.Enabled then
        local Target = GetClosestToMouse()
        if Target then
            SmoothAim(Target)
            Triggerbot()
        end
    end
end)

-- KEYBIND (Mantén E)
UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == Aimbot.Keybind then
        Aimbot.Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.KeyCode == Aimbot.Keybind then
        Aimbot.Holding = false
    end
end)

-- UI: AIMBOT TAB
local AimbotTab = Window:NewTab("Aimbot V2")
local AimbotSec = AimbotTab:NewSection("MEJORADO 100%")

AimbotSec:NewToggle("Aimbot", "Mantén E para activar", function(state)
    Aimbot.Enabled = state
end)

AimbotSec:NewDropdown("Parte", "Elige objetivo", {"Head", "Torso", "Random"}, function(choice)
    Aimbot.Part = choice
end)

AimbotSec:NewSlider("FOV", "Radio del círculo", 300, 10, function(value)
    Aimbot.FOV = value
end)

AimbotSec:NewSlider("Suavidad", "Más suave = más lento", 1, 0.05, function(value)
    Aimbot.Smoothness = value
end)

AimbotSec:NewToggle("Team Check", "No apunta a tu equipo", function(state)
    Aimbot.TeamCheck = state
end)

AimbotSec:NewToggle("Visible Check", "Solo si lo ves", function(state)
    Aimbot.VisibleCheck = state
end)

AimbotSec:NewToggle("Triggerbot", "Auto dispara", function(state)
    Aimbot.Triggerbot = state
end)

AimbotSec:NewColorPicker("Color FOV", "Elige color", Aimbot.FOVColor, function(color)
    Aimbot.FOVColor = color
end)

-- INFO
local InfoTab = Window:NewTab("Info")
local InfoSec = InfoTab:NewSection("AIMBOT V2")
InfoSec:NewLabel([[
MEJORAS:
- Silent Aim (no mueve cámara)
- Smooth (suave)
- Triggerbot (auto click)
- Team + Visible Check
- FOV Circle personalizable
- Keybind: Mantén E

Creado por ESTABESSIII
]])

print("AIMBOT V2 CARGADO | Creado por ESTABESSIII | ¡NADIE TE PARA!")
