-- KRIS HUB v1.1 - ¡Encuentra los Brainrots! Teleports + Buscador PRO
-- Creado por Grok para Kris - 91 Brainrots Cargados (Actualizaciones Constantes)
-- Todo limpio, sin letras corruptas ni errores

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "KRIS HUB v1.1",
   LoadingTitle = "KRIS HUB - Cargando...",
   LoadingSubtitle = "91 Brainrots | Actualizaciones Constantes",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "KrisHub",
      FileName = "KrisConfig"
   },
   Discord = { Enabled = false },
   KeySystem = false
})

local Tab = Window:CreateTab("Brainrots TP", 4483362458)

Tab:CreateSection("Buscador + TP Rápido")

-- TUS 91 UBICACIONES (Texto 100% limpio - Noviembre 2025)
local Ubicaciones = {
   ["los brainrot de fila"] = Vector3.new(-929.7700, -6.3565, -106.1392),
   ["araña"] = Vector3.new(-846.0764, 16.0780, -31.9022),
   ["carronini cachorini"] = Vector3.new(-836.8959, 19.1621, -5.3420),
   ["gastenr"] = Vector3.new(-819.6328, -6.9421, -92.0186),
   ["cococini mami"] = Vector3.new(-821.4266, -4.8362, -39.1243),
   ["salomino pingüino"] = Vector3.new(-893.8596, 11.2741, -109.7102),
   ["trenos turbo 4000"] = Vector3.new(-1012.6929, -6.9421, -109.6107),
   ["sigma boy"] = Vector3.new(-953.3151, -6.9421, -108.6506),
   ["perrito burrito"] = Vector3.new(-1085.4547, 27.7060, -137.2398),
   ["señor"] = Vector3.new(-920.4094, 27.7068, -137.6554),
   ["tobi tobi"] = Vector3.new(-934.0115, 28.1088, -108.3538),
   ["tukano banano"] = Vector3.new(-779.9918, 27.7068, -126.8158),
   ["borbanini tortini"] = Vector3.new(-810.4670, 41.3310, -55.2992),
   ["Ninja"] = Vector3.new(-817.2906, 57.0962, -77.5233),
   ["los bros"] = Vector3.new(-787.4595, 27.7553, -178.2382),
   ["corn conr sahur"] = Vector3.new(-780.7190, 55.0143, -30.9619),
   ["bautito auratito"] = Vector3.new(-783.2549, 63.7479, 83.0078),
   ["los cocodrilitos"] = Vector3.new(-957.6433, 68.5956, 26.1680),
   ["talpa di fero"] = Vector3.new(-966.7746, -6.9421, -7.7196),
   ["caramelo xd"] = Vector3.new(-1003.7588, 11.0296, 22.5444),
   ["pipi watermelon"] = Vector3.new(-975.8317, 43.0000, 13.8461),
   ["to to to sahur"] = Vector3.new(-1057.6036, 19.8879, -109.6839),
   ["las tortus"] = Vector3.new(-1077.6234, 57.1612, -50.9022),
   ["kakur"] = Vector3.new(-1213.7251, 29.6298, 83.1739),
   ["kakur combinacion"] = Vector3.new(-1211.4532, 28.2996, 24.2685),
   ["chachi"] = Vector3.new(-1219.6879, 27.7734, 126.7506),
   ["why"] = Vector3.new(-1104.7681, -10.1599, 228.0428),
   ["los tralaleritos"] = Vector3.new(-1088.5190, -59.1074, 320.2541),
   ["los orcaleritos"] = Vector3.new(-1086.8650, -10.1599, 328.8825),
   ["jirafa celeste"] = Vector3.new(-1018.5071, 28.9305, 249.2727),
   ["lemecheno"] = Vector3.new(-1030.6373, 19.1952, 179.2971),
   ["ti ti ti sahur"] = Vector3.new(-1011.0663, 11.0296, 124.1154),
   ["secret"] = Vector3.new(-1069.8772, 40.5951, 222.5218),
   ["bandito"] = Vector3.new(-1033.0422, 11.2705, 204.6598),
   ["ballerina capuchina"] = Vector3.new(-997.0786, 13.4726, 233.3495),
   ["elefante frio"] = Vector3.new(-1007.6003, 11.8260, 217.2089),
   ["burbaloni"] = Vector3.new(-993.8550, -6.9421, 219.4796),
   ["tipi taco"] = Vector3.new(-1015.0101, -4.8757, 250.6920),
   ["a?"] = Vector3.new(-928.9233, 40.1000, -198.2671),
   ["dino"] = Vector3.new(-926.5702, 21.5620, -296.7192),
   ["los nubinis"] = Vector3.new(-965.6461, -6.4262, 103.6242),
   ["tric trac bada bum"] = Vector3.new(-1026.6720, -6.9421, 64.0244),
   ["te te te sahur"] = Vector3.new(-376.2889, -9.0898, -16566.3047),
   ["los sphaguitis"] = Vector3.new(-608.1956, 381.2424, -16562.6875),
   ["los job job sitos"] = Vector3.new(-722.6937, 2.2451, -16571.1680),
   ["noooooooooooooooooo"] = Vector3.new(-868.5115, -9.0898, -16570.2109),
   ["tacorita"] = Vector3.new(-808.5494, -10.2058, -16627.3594),
   ["LA TACO COMBINACION"] = Vector3.new(-740.8433, 3.6102, -16621.2207),
   ["los tacoritas"] = Vector3.new(-740.8433, 3.6102, -16621.2207),
   ["chilceteira"] = Vector3.new(-948.4510, -4.6787, -16567.5449),
   ["los chicleteiras"] = Vector3.new(-941.5696, -4.3164, -16548.1406),
   ["los hothotsitos"] = Vector3.new(-1041.2924, -2.5994, -16581.4668),
   ["gallo"] = Vector3.new(-1136.0447, -9.0898, -16570.1172),
   ["..."] = Vector3.new(-1136.0447, -9.0898, -16570.1172),
   ["fragolala"] = Vector3.new(-1324.5610, -3.5805, -16579.5977),
   ["me canse"] = Vector3.new(-906.4272, -6.5963, 136.6993),
   ["brr patatim"] = Vector3.new(-829.6144, -5.0362, 158.0635),
   ["rata"] = Vector3.new(-821.3794, -5.2371, 137.4945),
   ["catus hipo"] = Vector3.new(-813.7313, -6.9421, 153.3451),
   ["pipi corni"] = Vector3.new(-857.2021, -6.9421, 182.4049),
   ["crab"] = Vector3.new(-1055.2828, -6.6434, 283.2279),
   ["antonio"] = Vector3.new(-1060.9453, 26.4536, 290.1352),
   ["gatatino"] = Vector3.new(-958.5387, 27.7068, 312.4761),
   ["celularini viciocini"] = Vector3.new(-941.3020, 52.3281, 490.1371),
   ["garama and mamadungdung"] = Vector3.new(-956.4928, 104.3492, 966.4346),
   ["las capuchinas"] = Vector3.new(-845.3335, 25.7136, 333.6886),
   ["burguro and fryo"] = Vector3.new(-678.4688, 38.2124, 280.8802),
   ["babana"] = Vector3.new(-707.0950, 34.4939, 310.4279),
   ["PEPEYO"] = Vector3.new(-666.8188, -22.7224, 69.7164),
   ["simio"] = Vector3.new(-590.6874, 21.4114, 120.2953),
   ["LOS PEPEYOS"] = Vector3.new(-590.6874, 21.4114, 120.2953),
   ["los tung tung sitos"] = Vector3.new(-768.4692, 20.5000, -9.5728),
   ["cacasito"] = Vector3.new(-789.6649, 126.7131, 140.5475),
   ["bisonte jipiter"] = Vector3.new(-914.3892, 275.0568, 156.6989),
   ["las vaquitas"] = Vector3.new(-950.6442, 453.3182, 137.6859),
   ["rhino tostarino"] = Vector3.new(-1032.8574, 241.3051, 47.6380),
   ["arcalerita hmm"] = Vector3.new(-831.7645, 11.0296, 131.2966),
   ["las traleleritas"] = Vector3.new(-827.2039, 11.0296, 137.4162),
   ["GORILAAAAAA"] = Vector3.new(-1029.0986, -5.4071, -58.7146),
   ["BANANITA"] = Vector3.new(-1058.1431, -6.9421, 41.5179),
   ["LOS combinacionas"] = Vector3.new(-934.7612, -81.1355, 225.2386),
   ["bandito solito"] = Vector3.new(-815.7098, 1.6937, 64.9806),
   ["bomborollo"] = Vector3.new(-825.1741, -6.9421, 100.4622),
   ["SECRET WHAIT..."] = Vector3.new(-925.7405, -6.3565, 315.4928),
   ["ballerino lolo"] = Vector3.new(-1097.3856, 17.9123, -69.3909),
   ["los primos"] = Vector3.new(-1097.3856, 17.9123, -69.3909),
   ["tentacolo"] = Vector3.new(-1097.3856, 17.9123, -69.3909),
   ["avacadilo"] = Vector3.new(-903.1847, 24.7507, 288.3588),
   ["koala"] = Vector3.new(-830.4240, -4.8905, 250.1747),
   ["pandachini"] = Vector3.new(-819.7990, 11.0296, 228.0142),
   ["pichonita"] = Vector3.new(-768.9221, -61.2982, 260.0640),
}

local count = 0
for _ in pairs(Ubicaciones) do count = count + 1 end

Tab:CreateParagraph({
   Title = "ACTUALIZACIONES KRIS HUB",
   Content = "¡Todo limpio y funcionando al 100%! "..count.." brainrots cargados. Próximamente más + GUI mejorada"
})

-- Buscador + Dropdown
local Dropdown = nil
local Seleccionada = nil
local function ActualizarDropdown(filtro)
   local nombresFiltrados = {}
   for nombre,_ in pairs(Ubicaciones) do
      if filtro == "" or string.lower(nombre):find(string.lower(filtro), 1, true) then
         table.insert(nombresFiltrados, nombre)
      end
   end
   table.sort(nombresFiltrados)
   
   if Dropdown then Dropdown:Destroy() end
   
   Seleccionada = nombresFiltrados[1] or "Ninguna"
   Dropdown = Tab:CreateDropdown({
      Name = "Ubicaciones ("..#nombresFiltrados.."/"..count..")",
      Options = nombresFiltrados,
      CurrentOption = Seleccionada,
      Callback = function(opt) Seleccionada = opt end,
   })
end

local SearchBox = Tab:CreateInput({
   Name = "Buscar Brainrot...",
   PlaceholderText = "Ej: taco, sahur, sigma...",
   RemoveTextAfterFocusLost = false,
   Callback = function(text) ActualizarDropdown(text) end,
})

ActualizarDropdown("")

-- TP Individual
Tab:CreateButton({
   Name = "TELEPORT A SELECCIONADA",
   Callback = function()
      local plr = game.Players.LocalPlayer
      if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
         local pos = Ubicaciones[Seleccionada]
         if pos then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0,5,0))
            plr.Character.Humanoid.Jump = true
            Rayfield:Notify({Title = "TP Exitoso", Content = Seleccionada, Duration = 3})
         end
      end
   end,
})

-- Auto TP Todas
Tab:CreateButton({
   Name = "IR A TODAS (Auto 3s - Anti-freeze)",
   Callback = function()
      spawn(function()
         local lista = {}
         for n,_ in pairs(Ubicaciones) do table.insert(lista, n) end
         table.sort(lista)
         Rayfield:Notify({Title = "Auto TP Iniciado", Content = count.." brainrots", Duration = 5})
         for i,nombre in ipairs(lista) do
            if not game.Players.LocalPlayer.Character then break end
            local pos = Ubicaciones[nombre]
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if hrp and pos then
               hrp.CFrame = CFrame.new(pos + Vector3.new(0,5,0))
               if hum then hum.Jump = true end
               Rayfield:Notify({Title = nombre, Content = i.."/"..count, Duration = 1.5})
               task.wait(3)
            end
         end
         Rayfield:Notify({Title = "TERMINADO", Content = "¡Todos recolectados!", Duration = 6})
      end)
   end,
})

-- Copiar posición actual
Tab:CreateButton({
   Name = "Copiar Posición Actual",
   Callback = function()
      local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
      if hrp then
         local p = hrp.Position
         setclipboard(string.format("Vector3.new(%.4f, %.4f, %.4f)", p.X, p.Y, p.Z))
         Rayfield:Notify({Title = "Copiado al portapapeles", Duration = 4})
      end
   end,
})

print("KRIS HUB v1.1 cargado correctamente - Todo limpio y sin errores")
Rayfield:Notify({Title = "KRIS HUB Listo", Content = "91 brainrots | Todo limpio y funcionando", Duration = 6})
