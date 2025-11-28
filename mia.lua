-- ESTRUCTURAS VISUALES EN PERSONAJE | Rayfield UI (Delta Executor Móvil)
-- Crea bloques/partes en tu personaje con offset, color, material, forma!
-- ¡Visual y fácil! Funciona en TODOS juegos Roblox

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🎨 Estructuras en Personaje",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "por Grok",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "EstructurasPersonaje",
      FileName = "Config"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

local Tab = Window:CreateTab("🏗️ Constructor", 4483362458) -- Icono Roblox

local Section = Tab:CreateSection("Configuración de Estructura")

-- Variables globales para valores
_G.SizeX, _G.SizeY, _G.SizeZ = 2, 2, 2
_G.OffsetX, _G.OffsetY, _G.OffsetZ = 0, 0, 0
_G.Transparency = 0
_G.Color = Color3.fromRGB(255, 0, 0)
_G.Material = "Neon"
_G.Shape = "Block"
_G.PartAttach = "Head"

-- Partes del cuerpo R15/R6 compatibles
local BodyParts = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot", "Torso"}

-- SLIDERS TAMAÑO
Tab:CreateSlider({
   Name = "Tamaño X",
   Range = {0.1, 10},
   Increment = 0.1,
   Suffix = "Unidades",
   CurrentValue = 2,
   Flag = "SizeXSlider",
   Callback = function(Value)
      _G.SizeX = Value
   end,
})

Tab:CreateSlider({
   Name = "Tamaño Y",
   Range = {0.1, 10},
   Increment = 0.1,
   Suffix = "Unidades",
   CurrentValue = 2,
   Flag = "SizeYSlider",
   Callback = function(Value)
      _G.SizeY = Value
   end,
})

Tab:CreateSlider({
   Name = "Tamaño Z",
   Range = {0.1, 10},
   Increment = 0.1,
   Suffix = "Unidades",
   CurrentValue = 2,
   Flag = "SizeZSlider",
   Callback = function(Value)
      _G.SizeZ = Value
   end,
})

-- OFFSETS
Tab:CreateSlider({
   Name = "Offset X",
   Range = {-10, 10},
   Increment = 0.1,
   Suffix = "Unidades",
   CurrentValue = 0,
   Flag = "OffsetXSlider",
   Callback = function(Value)
      _G.OffsetX = Value
   end,
})

Tab:CreateSlider({
   Name = "Offset Y",
   Range = {-10, 10},
   Increment = 0.1,
   Suffix = "Unidades",
   CurrentValue = 0,
   Flag = "OffsetYSlider",
   Callback = function(Value)
      _G.OffsetY = Value
   end,
})

Tab:CreateSlider({
   Name = "Offset Z",
   Range = {-10, 10},
   Increment = 0.1,
   Suffix = "Unidades",
   CurrentValue = 0,
   Flag = "OffsetZSlider",
   Callback = function(Value)
      _G.OffsetZ = Value
   end,
})

-- TRANSPARENCIA
Tab:CreateSlider({
   Name = "Transparencia",
   Range = {0, 100},
   Increment = 5,
   Suffix = "%",
   CurrentValue = 0,
   Flag = "TransSlider",
   Callback = function(Value)
      _G.Transparency = Value / 100
   end,
})

-- COLOR PICKER
local ColorPicker = Tab:CreateColorPicker({
   Name = "Color de Estructura",
   Color = Color3.fromRGB(255, 0, 0),
   Callback = function(Value)
      _G.Color = Value
   end,
})

-- DROPDOWN MATERIAL
Tab:CreateDropdown({
   Name = "Material",
   Options = {"Plastic", "Neon", "ForceField", "Glass", "Ice", "SmoothPlastic", "Wood", "Concrete", "CorrodedMetal", "Fabric"},
   CurrentOption = "Neon",
   MultipleOptions = false,
   Flag = "MaterialDrop",
   Callback = function(Option)
      _G.Material = Option
   end,
})

-- DROPDOWN FORMA
Tab:CreateDropdown({
   Name = "Forma",
   Options = {"Block", "Ball", "Cylinder"},
   CurrentOption = "Block",
   MultipleOptions = false,
   Flag = "ShapeDrop",
   Callback = function(Option)
      _G.Shape = Option
   end,
})

-- DROPDOWN PARTE CUERPO
Tab:CreateDropdown({
   Name = "Adjuntar a Parte",
   Options = BodyParts,
   CurrentOption = "Head",
   MultipleOptions = false,
   Flag = "BodyPartDrop",
   Callback = function(Option)
      _G.PartAttach = Option
   end,
})

-- BOTÓN CREAR
Tab:CreateButton({
   Name = "🧱 CREAR ESTRUCTURA",
   Callback = function()
      local char = game.Players.LocalPlayer.Character
      if not char then
         Rayfield:Notify({
            Title = "Error",
            Content = "¡Personaje no encontrado!",
            Duration = 3,
            Image = 4483362458,
         })
         return
      end

      local targetPart = char:FindFirstChild(_G.PartAttach)
      if not targetPart then
         Rayfield:Notify({
            Title = "Error",
            Content = "¡Parte '" .. _G.PartAttach .. "' no encontrada!",
            Duration = 3,
            Image = 4483362458,
         })
         return
      end

      local folder = char:FindFirstChild("Structures")
      if not folder then
         folder = Instance.new("Folder")
         folder.Name = "Structures"
         folder.Parent = char
      end

      local newPart = Instance.new("Part")
      newPart.Name = "Structure_" .. tick()
      newPart.Size = Vector3.new(_G.SizeX, _G.SizeY, _G.SizeZ)
      newPart.Material = Enum.Material[_G.Material]
      newPart.Transparency = _G.Transparency
      newPart.Color = _G.Color
      newPart.Shape = Enum.PartType[_G.Shape]
      newPart.CanCollide = false
      newPart.TopSurface = Enum.SurfaceType.Smooth
      newPart.BottomSurface = Enum.SurfaceType.Smooth

      -- Posición con offset
      newPart.CFrame = targetPart.CFrame * CFrame.new(_G.OffsetX, _G.OffsetY, _G.OffsetZ)

      newPart.Parent = folder

      -- Weld para adjuntar
      local weld = Instance.new("WeldConstraint")
      weld.Part0 = targetPart
      weld.Part1 = newPart
      weld.Parent = newPart

      Rayfield:Notify({
         Title = "¡Creado!",
         Content = "Estructura adjunta a " .. _G.PartAttach,
         Duration = 2,
         Image = 4483362458,
      })
   end,
})

-- BOTÓN LIMPIAR TODO
Tab:CreateButton({
   Name = "🗑️ LIMPIAR TODAS ESTRUCTURAS",
   Callback = function()
      local char = game.Players.LocalPlayer.Character
      if char then
         local folder = char:FindFirstChild("Structures")
         if folder then
            for _, child in pairs(folder:GetChildren()) do
               child:Destroy()
            end
            Rayfield:Notify({
               Title = "¡Limpio!",
               Content = "Todas las estructuras eliminadas",
               Duration = 2,
               Image = 4483362458,
            })
         else
            Rayfield:Notify({
               Title = "Info",
               Content = "No hay estructuras",
               Duration = 2,
               Image = 4483362458,
            })
         end
      end
   end,
})

-- Tab 2: Utilidades
local UtilTab = Window:CreateTab("🔧 Utilidades")

UtilTab:CreateButton({
   Name = "🔄 Refrescar Personaje",
   Callback = function()
      game.Players.LocalPlayer.Character:FindFirstChild("Structures"):Destroy()
      Rayfield:Notify({
         Title = "Refrescado",
         Content = "Carpeta Structures limpiada",
         Duration = 2,
      })
   end,
})

UtilTab:CreateParagraph({
   Name = "📱 Optimizado Móvil",
   Content = "Funciona perfecto en Delta Android/iOS\nAjusta sliders y crea estructuras locas en tu personaje!"
})

Rayfield:Notify({
   Title = "¡Cargado!",
   Content = "Usa sliders para configurar → CREAR para añadir a tu personaje",
   Duration = 4,
   Image = 4483362458,
})

print("🧱 Estructuras en Personaje por Grok - ¡Diviértete construyendo!")
