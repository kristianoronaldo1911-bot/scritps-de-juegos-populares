-- KrisHub - Brainrot Teleport Script para Find the Brainrot
-- GUI con Obsidian UI
-- Teleport instantáneo a todos los Brainrots en workspace.Brainrots
-- Botón Teleport All y Toggle Auto Collect

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

local Window = Library:CreateWindow({
    Title = "KRIS HUB",
    Footer = "by Kris | LEE ESTO ESTAMOS PENSANDO EN PONER KEY POR AHORA NADA ",
    ToggleKeybind = Enum.KeyCode.RightControl
})

local Tab = Window:AddTab("Main")

local LeftGroup = Tab:AddLeftGroupbox("Teleports", nil)

local player = game.Players.LocalPlayer

local autoCollectConnection = nil

local function collectAll()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local brainrots = workspace:FindFirstChild("Brainrots")
    if not brainrots then 
        Library:Notify("No se encontró workspace.Brainrots!", 3)
        return 
    end
    
    for _, brainrot in pairs(brainrots:GetChildren()) do
        if brainrot:IsA("BasePart") or brainrot:IsA("Model") and brainrot:FindFirstChild("HumanoidRootPart") or brainrot.PrimaryPart then
            local targetPart = brainrot:IsA("BasePart") and brainrot or (brainrot:FindFirstChild("HumanoidRootPart") or brainrot.PrimaryPart)
            if targetPart then
                hrp.CFrame = targetPart.CFrame
                if firetouchinterest then
                    firetouchinterest(hrp, targetPart, 0)
                    task.wait(0.05)
                    firetouchinterest(hrp, targetPart, 1)
                end
                task.wait(0.1) -- Pequeña pausa para evitar lag o detección
            end
        end
    end
    Library:Notify("¡Teleport a todos los Brainrots completado!", 5)
end

local function toggleAuto(state)
    local brainrots = workspace:FindFirstChild("Brainrots")
    if not brainrots then 
        Library:Notify("No se encontró workspace.Brainrots!", 3)
        return 
    end
    
    if state then
        if autoCollectConnection then autoCollectConnection:Disconnect() end
        autoCollectConnection = brainrots.ChildAdded:Connect(function(child)
            task.spawn(function()
                task.wait(0.2) -- Espera a que spawnee completamente
                local char = player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local targetPart = child:IsA("BasePart") and child or (child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart)
                        if targetPart then
                            hrp.CFrame = targetPart.CFrame
                            if firetouchinterest then
                                firetouchinterest(hrp, targetPart, 0)
                                task.wait(0.05)
                                firetouchinterest(hrp, targetPart, 1)
                            end
                        end
                    end
                end
            end)
        end)
        Library:Notify("Auto Collect activado", 3)
    else
        if autoCollectConnection then
            autoCollectConnection:Disconnect()
            autoCollectConnection = nil
        end
        Library:Notify("Auto Collect desactivado", 3)
    end
end

LeftGroup:AddButton({
    Text = "Teleport All Brainrots",
    Func = collectAll,
    Tooltip = "Teleport instantáneo y collect a todos los Brainrots actuales"
})

local autoToggle = LeftGroup:AddToggle("Auto Collect", false, function(state)
    toggleAuto(state)
end)

autoToggle:Set(false)

Library:Notify("¡KrisHub cargado! Usa Teleport All o activa Auto Collect para farmear Brainrots fácil.", 6)
