-- MEGA HUB PRO V11 - + FLOAT + SALIR RÁPIDO (LEAVE)
-- Creado por Grok con amor infinito para ti <3

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
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
updates.Text = "ACTUALIZACIONES:\n• + FLOAT (volar)\n• + SALIR RÁPIDO (leave)\n• Cartel con SÍ/NO\n• Arrastrar sin volver"
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
fixes.Text = "ERRORES CORREGIDOS:\n• Botón volvía al centro\n• Menú se pegaba\n• ZIndex roto"
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

-- === BOTÓN PRINCIPAL (ARRASTRABLE + SE QUEDA DONDE LO DEJES) ===
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

-- Sombra
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://6014261993"
shadow.ImageColor3 = Color3.new(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ZIndex = 9
shadow.Parent = mainButton

-- === MENÚ ===
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 400, 0, 580)  -- Más alto para nuevos botones
menu.Position = UDim2.new(0.5, -200, 1.2, 0)
menu.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
menu.BorderSizePixel = 0
menu.Visible = true
menu.ZIndex = 15
menu.Parent = screenGui

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 22)
menuCorner.Parent = menu

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 65)
title.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
title.Text = "MEGA HUB PRO"
title.TextColor3 = Color3.new(0, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.ZIndex = 16
title.Parent = menu

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 22)
titleCorner.Parent = title

-- Scrolling Frame
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -20, 1, -85)
scrollingFrame.Position = UDim2.new(0, 10, 0, 75)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 170)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ZIndex = 16
scrollingFrame.Parent = menu

-- === SCRIPTS (ANTIGUOS + NUEVOS) ===
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
    {name = "FLOAT",              code = function() -- FLOAT (noclip + fly)
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local root = character:WaitForChild("HumanoidRootPart")

        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        root.Anchored = false

        local flySpeed = 50
        local flying = true

        local function fly()
            local bv = Instance.new("BodyVelocity")
            bv.Velocity = Vector3.new(0, 0, 0)
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bv.Parent = root

            while flying and root and root.Parent do
                local cam = workspace.CurrentCamera
                local move = Vector3.new()
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
                if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end
                bv.Velocity = move.Unit * flySpeed
                task.wait()
            end
            if bv then bv:Destroy() end
        end

        spawn(fly)
        player.CharacterAdded:Connect(function(newChar)
            task.wait(1)
            if flying then
                character = newChar
                humanoid = character:WaitForChild("Humanoid")
                root = character:WaitForChild("HumanoidRootPart")
                spawn(fly)
            end
        end)

        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.F then
                flying = not flying
                if flying then spawn(fly) end
            end
        end)
    end},
    {name = "SALIR RÁPIDO",       code = function() -- SALIR DEL JUEGO
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

        local cTitleCorner = Instance.new("UICorner")
        cTitleCorner.CornerRadius = UDim.new(0, 20)
        cTitleCorner.Parent = cTitle

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

        local yesLCorner = Instance.new("UICorner")
        yesLCorner.CornerRadius = UDim.new(0, 14)
        yesLCorner.Parent = yesLeave

        local noLeave = Instance.new("TextButton")
        noLeave.Size = UDim2.new(0, 130, 0, 45)
        noLeave.Position = UDim2.new(0, 175, 1, -65)
        noLeave.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        noLeave.Text = "NO"
        noLeave.TextColor3 = Color3.new(1, 1, 1)
        noLeave.Font = Enum.Font.GothamBold
        noLeave.ZIndex = 51
        noLeave.Parent = confirmLeave

        local noLCorner = Instance.new("UICorner")
        noLCorner.CornerRadius = UDim.new(0, 14)
        noLCorner.Parent = noLeave

        yesLeave.MouseButton1Click:Connect(function()
            TweenService:Create(confirmLeave, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -170, -0.5, 0)}):Play()
            task.wait(0.3)
            confirmLeave:Destroy()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player) -- Sale y vuelve al menú
            -- Alternativa: player:Kick("Has salido del juego.") -- Si quieres desconectar
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

    -- Pulse
    local pulse = TweenService:Create(btn, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Size = UDim2.new(1, -5, 0, 52)
    })
    pulse:Play()

    -- Hover
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 255, 170)}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.new(0, 0, 0)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 55)}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(0, 255, 170)}):Play()
    end)

    -- === EJECUTAR SCRIPT ===
    btn.MouseButton1Click:Connect(function()
        if scriptData.url then
            -- Scripts externos
            local confirm = Instance.new("Frame")
            confirm.Size = UDim2.new(0, 340, 0, 170)
            confirm.Position = UDim2.new(0.5, -170, 1.5, 0)
            confirm.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            confirm.ZIndex = 30
            confirm.Parent = screenGui

            local cCorner = Instance.new("UICorner")
            cCorner.CornerRadius = UDim.new(0, 20)
            cCorner.Parent = confirm

            TweenService:Create(confirm, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, -170, 0.5, -85)
            }):Play()

            local cTitle = Instance.new("TextLabel")
            cTitle.Size = UDim2.new(1, 0, 0, 55)
            cTitle.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            cTitle.Text = "CONFIRMAR"
            cTitle.TextColor3 = Color3.new(1, 1, 1)
            cTitle.Font = Enum.Font.GothamBold
            cTitle.TextSize = 20
            cTitle.ZIndex = 31
            cTitle.Parent = confirm

            local cText = Instance.new("TextLabel")
            cText.Size = UDim2.new(1, -20, 0, 60)
            cText.Position = UDim2.new(0, 10, 0, 60)
            cText.BackgroundTransparency = 1
            cText.Text = "¿Ejecutar\n" .. scriptData.name .. "?"
            cText.TextColor3 = Color3.new(1, 1, 1)
            cText.Font = Enum.Font.Gotham
            cText.TextSize = 17
            cText.TextWrapped = true
            cText.ZIndex = 31
            cText.Parent = confirm

            local yesBtn = Instance.new("TextButton")
            yesBtn.Size = UDim2.new(0, 130, 0, 45)
            yesBtn.Position = UDim2.new(0, 55, 1, -65)
            yesBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            yesBtn.Text = "SÍ"
            yesBtn.TextColor3 = Color3.new(1, 1, 1)
            yesBtn.Font = Enum.Font.GothamBold
            yesBtn.ZIndex = 31
            yesBtn.Parent = confirm

            local noBtn = Instance.new("TextButton")
            noBtn.Size = UDim2.new(0, 130, 0, 45)
            noBtn.Position = UDim2.new(0, 175, 1, -65)
            noBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
            noBtn.Text = "NO"
            noBtn.TextColor3 = Color3.new(1, 1, 1)
            noBtn.Font = Enum.Font.GothamBold
            noBtn.ZIndex = 31
            noBtn.Parent = confirm

            yesBtn.MouseButton1Click:Connect(function()
                spawn(function()
                    pcall(function()
                        loadstring(game:HttpGet(scriptData.url))()
                    end)
                end)
                TweenService:Create(confirm, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -170, -0.5, 0)}):Play()
                task.wait(0.3)
                confirm:Destroy()
                menu.Visible = false
                mainButton.Text = "EJECUTADO"
                task.wait(2)
                mainButton.Text = "MEGA HUB"
            end)

            noBtn.MouseButton1Click:Connect(function()
                TweenService:Create(confirm, TweenInfo.new(0.3), {Position = UDim2.new(0.5, -170, -0.5, 0)}):Play()
                task.wait(0.3)
                confirm:Destroy()
            end)
        elseif scriptData.code then
            -- Scripts locales (FLOAT, SALIR)
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
        Position = UDim2.new(0.5, -200, 0.5, -290)
    }):Play()
end

local function closeMenu()
    TweenService:Create(menu, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Position = UDim2.new(0.5, -200, 1.2, 0)
    }):Play()
    task.wait(0.4)
    menu.Visible = false
end

-- === MOSTRAR / OCULTAR ===
local isOpen = false
mainButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then
        openMenu()
    else
        closeMenu()
    end
end)

-- === ARRASTRAR SIN PEGARSE (BOTÓN) ===
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

-- === ARRASTRAR SIN PEGARSE (MENÚ) ===
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

-- === INPUT GLOBAL ===
game:GetService("UserInputService").InputChanged:Connect(function(input)
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

-- === AUTO-REJOIN ===
player.CharacterAdded:Connect(function()
    task.wait(2)
    if screenGui.Parent then
        mainButton.Text = "MEGA HUB"
        showInfo()
    end
end)

print("MEGA HUB PRO V11 CARGADO! + FLOAT + SALIR RÁPIDO")
