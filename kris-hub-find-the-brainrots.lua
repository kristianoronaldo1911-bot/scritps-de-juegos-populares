-- KrisHub - Brainrot Teleport Script para Find the Brainrot
-- GUI con Obsidian UI
-- Teleport instantáneo a todos los Brainrots en workspace.Brainrots
-- Botón Teleport All y Toggle Auto Collect
-- Sección Extras con Auto Obby (una vez) y Auto Cohete (loop infinito)

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

local Window = Library:CreateWindow({
    Title = "KRIS HUB",
    Footer = "by Kris | LEE ESTO ESTAMOS PENSANDO EN PONER KEY POR AHORA NADA ",
    ToggleKeybind = Enum.KeyCode.RightControl
})

local Tab = Window:AddTab("Main")

local BrainrotGroup = Tab:AddLeftGroupbox("Brainrot Farm", nil)
local ExtrasGroup = Tab:AddRightGroupbox("Extras", nil)  -- Sección Extras a la derecha

local player = game.Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")

local autoCollectConnection = nil

-- === FUNCIONES BRAINROT ===
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
        if brainrot:IsA("BasePart") or (brainrot:IsA("Model") and (brainrot:FindFirstChild("HumanoidRootPart") or brainrot.PrimaryPart)) then
            local targetPart = brainrot:IsA("BasePart") and brainrot or (brainrot:FindFirstChild("HumanoidRootPart") or brainrot.PrimaryPart)
            if targetPart then
                hrp.CFrame = targetPart.CFrame
                if firetouchinterest then
                    firetouchinterest(hrp, targetPart, 0)
                    task.wait(0.05)
                    firetouchinterest(hrp, targetPart, 1)
                end
                task.wait(0.1)
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
                task.wait(0.2)
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

-- === AUTO OBBY MEOWL (UNA VEZ) ===
local obbyWaypoints = {
    Vector3.new(-795.0807, 10.7795, -20407.2480),
    Vector3.new(-754.5815, 18.2434, -20377.7617),
    Vector3.new(-760.0510, 43.1830, -20377.5098),
    Vector3.new(-423.0398, 14.9664, -20403.4902),
    Vector3.new(-339.5672, 15.6698, -20370.6523),
    Vector3.new(-306.6526, 15.3326, -20400.1074)
}

local function runAutoObby()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    for _, pos in ipairs(obbyWaypoints) do
        if hrp and hrp.Parent then
            hrp.CFrame = CFrame.new(pos)
            task.wait(1)
        end
    end
    Library:Notify("¡Auto Obby Meowl completado!", 5)
end

-- === AUTO COHETE (LOOP INFINITO) ===
local coheteWaypoints = {
    Vector3.new(-810.6324, -6.9421, -102.9857),
    Vector3.new(-804.7480, 27.7068, 306.5343)
}

local coheteRunning = false

local function holdE(duration)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(duration)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

local function autoCoheteLoop()
    while coheteRunning do
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        
        for i, pos in ipairs(coheteWaypoints) do
            if not coheteRunning then break end
            if hrp and hrp.Parent then
                hrp.CFrame = CFrame.new(pos)
                task.wait(0.5)
                holdE(4)  -- Hold E por 4 segundos
                if i < #coheteWaypoints then task.wait(1) end
            end
        end
        task.wait(1)
    end
end

local function toggleAutoCohete(state)
    coheteRunning = state
    if state then
        task.spawn(autoCoheteLoop)
        Library:Notify("Auto Cohete activado (loop infinito)", 4)
    else
        Library:Notify("Auto Cohete desactivado", 4)
    end
end

-- === ELEMENTOS DE LA GUI ===
BrainrotGroup:AddButton({
    Text = "Teleport All Brainrots",
    Func = collectAll,
    Tooltip = "Teleport instantáneo y collect a todos los Brainrots actuales"
})

BrainrotGroup:AddToggle("Auto Collect Brainrot", false, function(state)
    toggleAuto(state)
end)

ExtrasGroup:AddButton({
    Text = "Auto Obby Meowl (Una vez)",
    Func = runAutoObby,
    Tooltip = "Completa el obby una sola vez con teleports"
})

ExtrasGroup:AddToggle("Auto Cohete (Loop Infinito)", false, function(state)
    toggleAutoCohete(state)
end)

Library:Notify("¡KrisHub cargado! Todo integrado: Brainrot + Extras (Obby y Cohete) en una sola GUI limpia.", 8)
