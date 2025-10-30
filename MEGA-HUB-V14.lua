-- MEGA HUB PRO V14 - TODOS LOS SCRIPTS + FLOAT CON VUELO + CARTEL
-- Creado por Grok con amor infinito para ti <3

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- === ELIMINAR ANTIGUO ===
if playerGui:FindFirstChild("MegaHubExecutor") then
    playerGui:FindFirstChild("MegaHubExecutor"):Destroy()
end

-- === SCREEN GUI ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MegaHubExecutor"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- === CARTEL INFERIOR DERECHA (CON X + 3 SEGUNDOS) ===
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(0, 340, 0, 190)
infoFrame.Position = UDim2.new(1, -350, 1, -200)
infoFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
infoFrame.BorderSizePixel = 0
infoFrame.ZIndex = 20
infoFrame.Visible = false
infoFrame.Parent = screenGui

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 16)
infoCorner.Parent = infoFrame

-- Título "Bienvenido"
local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, -40, 0, 45)
welcome.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
welcome.Text = "BIENVENIDO A MEGA HUB"
welcome.TextColor3 = Color3.new(1, 1, 1)
welcome.Font = Enum.Font.GothamBold
welcome.TextSize = 16
welcome.ZIndex = 21
welcome.Parent = infoFrame

local welcomeCorner = Instance.new("UICorner")
welcomeCorner.CornerRadius = UDim.new(0, 16)
welcomeCorner.Parent = welcome

-- Botón X
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.ZIndex = 22
closeBtn.Parent = infoFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 16)
closeCorner.Parent = closeBtn

-- Actualizaciones
local updates = Instance.new("TextLabel")
updates.Size = UDim2.new(1, -20, 0, 65)
updates.Position = UDim2.new(0, 10, 0, 50)
updates.BackgroundTransparency = 1
updates.Text = "ACTUALIZACIONES:\n• TODOS LOS SCRIPTS\n• FLOAT = VUELO + CARTEL\n• Presiona F\n• Cartel ON/OFF"
updates.TextColor3 = Color3.fromRGB(0, 255, 170)
updates.Font = Enum.Font.Gotham
updates.TextSize = 13
updates.TextWrapped = true
updates.TextXAlignment = Enum.TextXAlignment.Left
updates.ZIndex = 21
updates.Parent = infoFrame

-- Errores corregidos
local fixes = Instance.new("TextLabel")
fixes.Size = UDim2.new(1, -20, 0, 65)
fixes.Position = UDim2.new(0, 10, 0, 120)
fixes.BackgroundTransparency = 1
fixes.Text = "ERRORES CORREGIDOS:\n• Scripts desaparecían\n• Float fallaba\n• Rejoin roto"
fixes.TextColor3 = Color3.fromRGB(255, 200, 100)
fixes.Font = Enum.Font.Gotham
fixes.TextSize = 13
fixes.TextWrapped = true
fixes.TextXAlignment = Enum.TextXAlignment.Left
fixes.ZIndex = 21
fixes.Parent = infoFrame

-- === FUNCIÓN PARA MOSTRAR CARTEL (3 SEGUNDOS) ===
local function showInfo()
    infoFrame.Visible = true
    infoFrame.Position = UDim2.new(1, -350, 1, -200)
    TweenService:Create(infoFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -350, 1, -210)
    }):Play()

    task.delay(3, function()
        if infoFrame and infoFrame.Parent then
            TweenService:Create(infoFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                Position = UDim2.new(1, -350, 1, -180)
            }):Play()
            task.wait(0.4)
            infoFrame.Visible = false
        end
    end)
end

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(infoFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Position = UDim2.new(1, -350, 1, -180)
    }):Play()
    task.wait(0.3)
    infoFrame.Visible = false
end)

task.spawn(showInfo)

-- === CARTEL DE ESTADO FLOAT (ON/OFF) ===
local floatStatus = Instance.new("Frame")
floatStatus.Size = UDim2.new(0, 200, 0, 50)
floatStatus.Position = UDim2.new(0.5, -100, 0, -60)
floatStatus.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
floatStatus.BorderSizePixel = 0
floatStatus.Visible = false
floatStatus.ZIndex = 40
floatStatus.Parent = screenGui

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 16)
statusCorner.Parent = floatStatus

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 1, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "FLOAT: OFF"
statusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 18
statusLabel.ZIndex = 41
statusLabel.Parent = floatStatus

-- === FUNCIÓN PARA MOSTRAR CARTEL DE ESTADO ===
local function showFloatStatus(text, color)
    statusLabel.Text = text
    statusLabel.TextColor3 = color
    floatStatus.Position = UDim2.new(0.5, -100, 0, -60)
    floatStatus.Visible = true

    TweenService:Create(floatStatus, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -100, 0, 20)
    }):Play()

    task.delay(2, function()
        if floatStatus and floatStatus.Parent then
            TweenService:Create(floatStatus, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Position = UDim2.new(0.5, -100, 0, -60)
            }):Play()
            task.wait(0.3)
            floatStatus.Visible = false
        end
    end)
end

-- === FLOAT + VUELO REAL ===
local flying = false
local flySpeed = 100
local bv, bg

local function startFly()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local root = character:WaitForChild("HumanoidRootPart")

    bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Parent = root

    bg = Instance.new("BodyGyro")
    bg.P = 9e9
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.CFrame = root.CFrame
    bg.Parent = root

    flying = true
    showFloatStatus("FLOAT: ON", Color3.fromRGB(0, 255, 100))

    spawn(function()
        while flying and root and root.Parent do
            local cam = workspace.CurrentCamera
            local move = Vector3.new()

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end

            if move.Magnitude > 0 then
                bv.Velocity = move.Unit * flySpeed
                bg.CFrame = cam.CFrame
            else
                bv.Velocity = Vector3.new(0, 0, 0)
            end
            task.wait()
        end
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end)
end

local function stopFly()
    flying = false
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
    showFloatStatus("FLOAT: OFF", Color3.fromRGB(255, 80, 80))
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        if flying then
            stopFly()
        else
            startFly()
        end
    end
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    if flying then
        startFly()
    end
end)

-- === BOTÓN PRINCIPAL ===
local mainButton = Instance.new("TextButton")
mainButton.Size = UDim2.new(0, 220, 0, 60)
mainButton.Position = UDim2.new(0.5, -110, 0.5, -30)
mainButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
mainButton.TextColor3 = Color3.new(1, 1, 1)
mainButton.Text = "MEGA HUB"
mainButton.Font = Enum.Font.GothamBold
mainButton.TextSize = 22
mainButton.AutoButtonColor = false
mainButton.ZIndex = 10
mainButton.Parent = screenGui

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 20)
btnCorner.Parent = mainButton

-- === MENÚ ===
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 400, 0, 700)  -- Más alto
menu.Position = UDim2.new(0.5, -200, 1.2, 0)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
menu.BorderSizePixel = 0
menu.Visible = true
menu.ZIndex = 15
menu.Parent = screenGui

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 22)
menuCorner.Parent = menu

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 65)
title.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
title.Text = "MEGA HUB PRO"
title.TextColor3 = Color3.new(0, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.ZIndex = 16
title.Parent = menu

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -20, 1, -85)
scrollingFrame.Position = UDim2.new(0, 10, 0, 75)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 170)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ZIndex = 16
scrollingFrame.Parent = menu

-- === TODOS LOS SCRIPTS ===
local scripts = {
    {name = "NAMELESS HUB",       url = "https://raw.githubusercontent.com/ily123950/Vulkan/refs/heads/main/Tr"},
    {name = "LENNON HUB",         url = "https://pastefy.app/MJw2J4T6/raw"},
    {name = "MIRANDA HUB",        url = "https://pastefy.app/JJVhs3rK/raw"},
    {name = "INFINITE YIELD",     url = "https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"},
    {name = "D4RK HUB",           url = "https://pastefy.app/OxUhLigg/raw"},
    {name = "INVISIBLE FE",       url = "https://rawscripts.net/raw/Universal-Script-Invisible-script-20557"},
    {name = "EMOTES",             url = "https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"},
    {name = "AIMBOT UNIVERSAL",   url = "https://rawscripts.net/raw/Universal-Script-Universal-Aimbot-23560"},
    {name = "COQUETTE HUB",       url = "https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-41921"},
    {name = "FLOAT (PRESIONA F)", code = function() end}, -- Se maneja con tecla F
    {name = "SALIR RÁPIDO",       code = function()
        local confirmLeave = Instance.new("Frame")
        confirmLeave.Size = UDim2.new(0, 340, 0, 170)
        confirmLeave.Position = UDim2.new(0.5, -170, 1.5, 0)
        confirmLeave.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        confirmLeave.ZIndex = 50
        confirmLeave.Parent = screenGui

        local cCorner = Instance.new("UICorner")
        cCorner.CornerRadius = UDim.new(0, 20)
        cCorner.Parent = confirmLeave

        TweenService:Create(confirmLeave, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, -170, 0.5, -85)
        }):Play()

        local cTitle = Instance.new("TextLabel")
        cTitle.Size = UDim2.new(1, 0, 0, 55)
        cTitle.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        cTitle.Text = "SALIR DEL JUEGO"
        cTitle.TextColor3 = Color3.new(1, 1, 1)
        cTitle.Font = Enum.Font.GothamBold
        cTitle.TextSize = 20
        cTitle.ZIndex = 51
        cTitle.Parent = confirmLeave

        local cText = Instance.new("TextLabel")
        cText.Size = UDim2.new(1, -20, 0, 60)
        cText.Position = UDim2.new(0, 10, 0, 60)
        cText.BackgroundTransparency = 1
        cText.Text = "¿Salir de esta experiencia?"
        cText.TextColor3 = Color3.new(1, 1, 1)
        cText.Font = Enum.Font.Gotham
        cText.TextSize = 17
        cText.TextWrapped = true
        cText.ZIndex = 51
        cText.Parent = confirmLeave

        local yesLeave = Instance.new("TextButton")
        yesLeave.Size = UDim2.new(0, 130, 0, 45)
        yesLeave.Position = UDim2.new(0, 55, 1, -65)
        yesLeave.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        yesLeave.Text = "SÍ"
        yesLeave.TextColor3 = Color3.new(1, 1, 1)
        yesLeave.Font = Enum.Font.GothamBold
        yesLeave.ZIndex = 51
        yesLeave.Parent = confirmLeave

        local noLeave = Instance.new("TextButton")
        noLeave.Size = UDim2.new(0, 130, 0, 45)
        noLeave.Position = UDim2.new(0, 175, 1, -65)
        noLeave.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        noLeave.Text = "NO"
        noLeave.TextColor3 = Color3.new(1, 1, 1)
        noLeave.Font = Enum.Font.GothamBold
        noLeave.ZIndex = 51
        noLeave.Parent = confirmLeave

        yesLeave.MouseButton1Click:Connect(function()
            TweenService:Create(confirmLeave, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -170, -0.5, 0)}):Play()
            task.wait(0.3)
            confirmLeave:Destroy()
            player:Kick("Has salido del juego.")
        end)

        noLeave.MouseButton1Click:Connect(function()
            TweenService:Create(confirmLeave, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -170, -0.5, 0)}):Play()
            task.wait(0.3)
            confirmLeave:Destroy()
        end)
    end}
}

-- === CREAR BOTONES ===
local yPos = 0
for i, scriptData in ipairs(scripts) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 50)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    btn.TextColor3 = Color3.fromRGB(0, 255, 170)
    btn.Text = scriptData.name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.AutoButtonColor = false
    btn.ZIndex = 17
    btn.Parent = scrollingFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 14)
    btnCorner.Parent = btn

    local pulse = TweenService:Create(btn, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Size = UDim2.new(1, -5, 0, 52)
    })
    pulse:Play()

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 255, 170)}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.new(0, 0, 0)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 55)}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 255, 170)}):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        if scriptData.url then
            spawn(function()
                pcall(function()
                    loadstring(game:HttpGet(scriptData.url))()
                end)
            end)
            menu.Visible = false
            mainButton.Text = "EJECUTADO"
            task.wait(2)
            mainButton.Text = "MEGA HUB"
        elseif scriptData.code then
            scriptData.code()
        end
    end)

    yPos = yPos + 60
end

scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)

-- === ANIMACIONES MENÚ ===
local function openMenu()
    menu.Visible = true
    TweenService:Create(menu, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -200, 0.5, -350)
    }):Play()
end

local function closeMenu()
    TweenService:Create(menu, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Position = UDim2.new(0.5, -200, 1.2, 0)
    }):Play()
    task.wait(0.4)
    menu.Visible = false
end

local isOpen = false
mainButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then openMenu() else closeMenu() end
end)

-- === ARRASTRAR SIN PEGARSE ===
local draggingMain = false
local dragStartMain, startPosMain

mainButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingMain = true
        dragStartMain = input.Position
        startPosMain = mainButton.Position
    end
end)

mainButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingMain = false
    end
end)

local draggingMenu = false
local dragStartMenu, startPosMenu

menu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingMenu = true
        dragStartMenu = input.Position
        startPosMenu = menu.Position
    end
end)

menu.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingMenu = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if draggingMain then
            local delta = input.Position - dragStartMain
            mainButton.Position = UDim2.new(startPosMain.X.Scale, startPosMain.X.Offset + delta.X, startPosMain.Y.Scale, startPosMain.Y.Offset + delta.Y)
        end
        if draggingMenu then
            local delta = input.Position - dragStartMenu
            menu.Position = UDim2.new(startPosMenu.X.Scale, startPosMenu.X.Offset + delta.X, startPosMenu.Y.Scale, startPosMenu.Y.Offset + delta.Y)
        end
    end
end)

print("MEGA HUB PRO V14 CARGADO! TODOS LOS SCRIPTS + FLOAT CON VUELO + CARTEL")
