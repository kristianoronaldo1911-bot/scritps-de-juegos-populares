-- Auto Cohete en LOOP Script para Xeno Executor

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoCoheteLoopGui"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Frame principal (draggable)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 150)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(100, 100, 255)
mainFrame.Parent = screenGui

-- Hacer draggable
local dragging = false
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        updateInput(input)
    end
end)

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "Auto Cohete (Loop)"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = mainFrame

-- Botón Toggle
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.8, 0, 0, 40)
toggleButton.Position = UDim2.new(0.1, 0, 0.3, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)  -- Rojo = apagado
toggleButton.Text = "Apagado"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.Parent = mainFrame

-- Indicador de estado
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.8, 0, 0, 30)
statusLabel.Position = UDim2.new(0.1, 0, 0.65, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Estado: Apagado"
statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 16
statusLabel.Parent = mainFrame

-- Notificación
local notifyFrame = Instance.new("Frame")
notifyFrame.Size = UDim2.new(0, 300, 0, 60)
notifyFrame.Position = UDim2.new(0.5, -150, 0.8, 0)
notifyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notifyFrame.BackgroundTransparency = 0.4
notifyFrame.BorderSizePixel = 0
notifyFrame.Visible = false
notifyFrame.Parent = screenGui

local notifyText = Instance.new("TextLabel")
notifyText.Size = UDim2.new(1, 0, 1, 0)
notifyText.BackgroundTransparency = 1
notifyText.Text = "solo cuando presiones el boten y la base este abierta"
notifyText.TextColor3 = Color3.new(1, 1, 1)
notifyText.Font = Enum.Font.GothamBold
notifyText.TextSize = 20
notifyText.Parent = notifyFrame

local function showNotification()
    notifyFrame.Visible = true
    notifyFrame.BackgroundTransparency = 0.4
    notifyText.TextTransparency = 0
    task.wait(3)
    TweenService:Create(notifyFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(notifyText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.wait(0.5)
    notifyFrame.Visible = false
end

-- Waypoints
local waypoints = {
    Vector3.new(-810.6324, -6.9421, -102.9857),
    Vector3.new(-804.7480, 27.7068, 306.5343)
}

-- Función hold E
local function holdE(duration)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(duration)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

-- Variable de control
local isRunning = false

-- Función principal del loop
local function autoCoheteLoop()
    while isRunning do
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        
        for i, pos in ipairs(waypoints) do
            if not isRunning then break end  -- Salir si se apaga
            
            if hrp and hrp.Parent then
                hrp.CFrame = CFrame.new(pos)
                task.wait(0.5)
                
                holdE(4)  -- Mantener E 4 segundos (cámbialo si quieres)
                
                if i < #waypoints then
                    task.wait(1)
                end
            end
        end
        
        task.wait(1)  -- Pequeña pausa antes de repetir el ciclo completo
    end
end

-- Toggle del botón
toggleButton.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    
    if isRunning then
        toggleButton.Text = "Encendido"
        toggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)  -- Verde
        statusLabel.Text = "Estado: Encendido (Loop activo)"
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        task.spawn(autoCoheteLoop)
        task.spawn(showNotification)
    else
        toggleButton.Text = "Apagado"
        toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)  -- Rojo
        statusLabel.Text = "Estado: Apagado"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

print("GUI Auto Cohete (Loop) cargada! Presiona el botón para activar/desactivar.")
