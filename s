-- ╔═══════════════════════════════════════════════════════════╗
-- ║        ESTABESSIII HUB - Evade (Funciones Separadas)       ║
-- ║             Kavo UI + Auto Jump + Auto Revive             ║
-- ╚═══════════════════════════════════════════════════════════╝

-- ===[ MÓDULO PRINCIPAL ]===
getgenv().ESTABESSIII = {}

local Player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local JumpConn, ReviveConn = nil, nil
local SubGui = nil

-- ===[ FUNCIÓN: AUTO JUMP ]===
ESTABESSIII.AutoJump = {}
ESTABESSIII.AutoJump.Enabled = false

ESTABESSIII.AutoJump.Toggle = function(state)
    ESTABESSIII.AutoJump.Enabled = state or not ESTABESSIII.AutoJump.Enabled
    if JumpConn then JumpConn:Disconnect() end

    if ESTABESSIII.AutoJump.Enabled then
        local char = Player.Character or Player.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")

        JumpConn = RunService.Heartbeat:Connect(function()
            if hum and hum.Parent then
                local s = hum:GetState()
                if s ~= Enum.HumanoidStateType.Jumping and s ~= Enum.HumanoidStateType.Freefall then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)

        Player.CharacterAdded:Connect(function(newChar)
            hum = newChar:WaitForChild("Humanoid")
        end)
    end
end

-- ===[ FUNCIÓN: AUTO REVIVE ]===
ESTABESSIII.AutoRevive = {}
ESTABESSIII.AutoRevive.Enabled = false

ESTABESSIII.AutoRevive.Toggle = function(state)
    ESTABESSIII.AutoRevive.Enabled = state or not ESTABESSIII.AutoRevive.Enabled
    if ReviveConn then ReviveConn:Disconnect() end

    if ESTABESSIII.AutoRevive.Enabled then
        ReviveConn = Player.CharacterAdded:Connect(function(char)
            task.wait(1)
            local hum = char:WaitForChild("Humanoid")
            if hum.Health == 0 then
                for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                    if v:IsA("RemoteEvent") and (v.Name:find("Revive") or v.Name:find("Respawn")) then
                        v:FireServer()
                        break
                    end
                end
            end
        end)
    end
end

-- ===[ FUNCIÓN: PANEL DRAGGABLE ]===
ESTABESSIII.OpenPanel = function()
    if SubGui then SubGui:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    SubGui = Instance.new("Frame")
    SubGui.Size = UDim2.new(0, 300, 0, 280)
    SubGui.Position = UDim2.new(0.5, -150, 0.5, -140)
    SubGui.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    SubGui.BorderSizePixel = 0
    SubGui.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 14)
    corner.Parent = SubGui

    -- Título
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    Title.Text = "  ESTABESSIII CONTROL"
    Title.TextColor3 = Color3.fromRGB(0, 255, 120)
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = SubGui

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 14)
    tCorner.Parent = Title

    -- Draggable
    local dragging = false
    local dragStart, startPos
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = SubGui.Position
        end
    end)
    Title.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            SubGui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Botón Auto Jump
    local JumpBtn = Instance.new("TextButton")
    JumpBtn.Size = UDim2.new(0.85, 0, 0.18, 0)
    JumpBtn.Position = UDim2.new(0.075, 0, 0.2, 0)
    JumpBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    JumpBtn.Text = "Auto Jump: OFF"
    JumpBtn.TextColor3 = Color3.new(1,1,1)
    JumpBtn.Font = Enum.Font.Gotham
    JumpBtn.TextScaled = true
    JumpBtn.Parent = SubGui
    local jCorner = Instance.new("UICorner", JumpBtn); jCorner.CornerRadius = UDim.new(0, 8)

    JumpBtn.MouseButton1Click:Connect(function()
        ESTABESSIII.AutoJump.Toggle()
        JumpBtn.BackgroundColor3 = ESTABESSIII.AutoJump.Enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        JumpBtn.Text = "Auto Jump: " .. (ESTABESSIII.AutoJump.Enabled and "ON" or "OFF")
    end)

    -- Botón Auto Revive
    local ReviveBtn = Instance.new("TextButton")
    ReviveBtn.Size = UDim2.new(0.85, 0, 0.18, 0)
    ReviveBtn.Position = UDim2.new(0.075, 0, 0.45, 0)
    ReviveBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    ReviveBtn.Text = "Auto Revive: OFF"
    ReviveBtn.TextColor3 = Color3.new(1,1,1)
    ReviveBtn.Font = Enum.Font.Gotham
    ReviveBtn.TextScaled = true
    ReviveBtn.Parent = SubGui
    local rCorner = Instance.new("UICorner", ReviveBtn); rCorner.CornerRadius = UDim.new(0, 8)

    ReviveBtn.MouseButton1Click:Connect(function()
        ESTABESSIII.AutoRevive.Toggle()
        ReviveBtn.BackgroundColor3 = ESTABESSIII.AutoRevive.Enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        ReviveBtn.Text = "Auto Revive: " .. (ESTABESSIII.AutoRevive.Enabled and "ON" or "OFF")
    end)

    -- Cerrar
    local Close = Instance.new("TextButton")
    Close.Size = UDim2.new(0, 35, 0, 35)
    Close.Position = UDim2.new(1, -45, 0, 5)
    Close.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
    Close.Text = "X"
    Close.TextColor3 = Color3.new(1,1,1)
    Close.Font = Enum.Font.GothamBold
    Close.Parent = SubGui
    local cCorner = Instance.new("UICorner", Close); cCorner.CornerRadius = UDim.new(0, 8)

    Close.MouseButton1Click:Connect(function()
        SubGui:Destroy()
        SubGui = nil
    end)
end

-- ===[ KAVO UI ]===
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ESTABESSIII HUB - Evade", "DarkTheme")

local PlayerTab = Window:NewTab("Player")
local PlayerSec = PlayerTab:NewSection("ESTABESSIII - Funciones")

PlayerSec:NewButton("Abrir Panel Principal", "Control de Auto Jump y Revive", function()
    ESTABESSIII.OpenPanel()
end)

local MovementTab = Window:NewTab("Movement")
local MoveSec = MovementTab:NewSection("Teclas Rápidas")
MoveSec:NewLabel("Presiona B → Toggle Auto Jump")

-- ===[ TECLA B: Toggle Auto Jump ]===
UserInputService.InputBegan:Connect(function(input, gp)
    if gp or input.KeyCode ~= Enum.KeyCode.B then return end

    ESTABESSIII.AutoJump.Toggle()

    if SubGui then
        for _, btn in pairs(SubGui:GetChildren()) do
            if btn:IsA("TextButton") and btn.Text:find("Auto Jump") then
                btn.BackgroundColor3 = ESTABESSIII.AutoJump.Enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
                btn.Text = "Auto Jump: " .. (ESTABESSIII.AutoJump.Enabled and "ON" or "OFF")
            end
        end
    end

    game.StarterGui:SetCore("SendNotification", {
        Title = "ESTABESSIII";
        Text = "Auto Jump: " .. (ESTABESSIII.AutoJump.Enabled and "ACTIVADO" or "DESACTIVADO");
        Duration = 1.5
    })
end)

-- ===[ MENSAJE DE CARGA ]===
print("ESTABESSIII HUB cargado! Usa B para toggle rápido.")
