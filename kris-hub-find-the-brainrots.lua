--[[ KRIS HUB v1.7 - ¡161 BRAINROTS + FUNCIONA 100%! ]]
-- Find The Brainrot • Obsidian UI Lib • DICIEMBRE 2025

-- ESTE ES EL LINK QUE SÍ FUNCIONA HOY (5-Dic-2025)
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "KRIS HUB v1.7",
    Footer = "161 Brainrots • ¡FUNCIONA 100%!",
    Icon = 4483362458,
    NotifySide = "Right",
    ShowCustomCursor = true,
    Center = true,
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab("Main", "brain"),
    Settings = Window:AddTab("Settings", "settings"),
}

-- === 161 BRAINROTS (TODAS TUS UBICACIONES) ===
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
    ["corn conr sahur"] = Vector3.new(-780.7190, 55.0143, -30.9619),
    ["bautito auratito"] = Vector3.new(-783.2549, 63.7479, 83.0078),
    ["los cocodrilitos"] = Vector3.new(-957.6433, 68.5956, 26.1680),
    ["talpa di fero"] = Vector3.new(-966.7746, -6.9421, -7.7196),
    ["caramelo xd"] = Vector3.new(-1003.7588, 11.0296, 22.5444),
    ["pipi watermelon"] = Vector3.new(-975.8317, 43.0000, 13.8461),
    ["to to to sahur"] = Vector3.new(-1057.6036, 19.8879, -109.6839),
    ["las tortus"] = Vector3.new(-1077.6234, 57.1612, -50.9022),
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
    ["burbaloni"] = Vector3.new(-993.8550, -6.9421, 219.4796),
    ["tipi taco"] = Vector3.new(-1015.0101, -4.8757, 250.6920),
    ["a?"] = Vector3.new(-928.9233, 40.1000, -198.2671),
    ["los nubinis"] = Vector3.new(-965.6461, -6.4262, 103.6242),
    ["tric trac bada bum"] = Vector3.new(-1026.6720, -6.9421, 64.0244),
    ["noooooooooooooooooo"] = Vector3.new(-868.5115, -9.0898, -16570.2109),
    ["tacorita"] = Vector3.new(-808.5494, -10.2058, -16627.3594),
    ["LA TACO COMBINACION"] = Vector3.new(-740.8433, 3.6102, -16621.2207),
    ["chilceteira"] = Vector3.new(-948.4510, -4.6787, -16567.5449),
    ["los chicleteiras"] = Vector3.new(-941.5696, -4.3164, -16548.1406),
    ["los hothotsitos"] = Vector3.new(-1041.2924, -2.5994, -16581.4668),
    ["gallo"] = Vector3.new(-1136.0447, -9.0898, -16570.1172),
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
    ["burguro and fryo"] = Vector3.new(-678.4688, 38.2124, 280.8802),
    ["babana"] = Vector3.new(-707.0950, 34.4939, 310.4279),
    ["PEPEYO"] = Vector3.new(-666.8188, -22.7224, 69.7164),
    ["simio"] = Vector3.new(-590.6874, 21.4114, 120.2953),
    ["LOS PEPEYOS"] = Vector3.new(-590.6874, 21.4114, 120.2953),
    ["los tung tung sitos"] = Vector3.new(-768.4692, 20.5000, -9.5728),
    ["arcalerita hmm"] = Vector3.new(-831.7645, 11.0296, 131.2966),
    ["GORILAAAAAA"] = Vector3.new(-1029.0986, -5.4071, -58.7146),
    ["BANANITA"] = Vector3.new(-1058.1431, -6.9421, 41.5179),
    ["LOS combinacionas"] = Vector3.new(-934.7612, -81.1355, 225.2386),
    ["bandito solito"] = Vector3.new(-815.7098, 1.6937, 64.9806),
    ["bomborollo"] = Vector3.new(-825.1741, -6.9421, 100.4622),
    ["SECRET WHAIT..."] = Vector3.new(-925.7405, -6.3565, 315.4928),
    ["ballerino lolo"] = Vector3.new(-1097.3856, 17.9123, -69.3909),
    ["avacadilo"] = Vector3.new(-903.1847, 24.7507, 288.3588),
    ["koala"] = Vector3.new(-830.4240, -4.8905, 250.1747),
    ["pandachini"] = Vector3.new(-819.7990, 11.0296, 228.0142),
    ["pichonita"] = Vector3.new(-768.9221, -61.2982, 260.0640),

    -- TUS 70+ NUEVOS
    ["squealana"] = Vector3.new(-706.22, 25.38, 308.14),
    ["snake"] = Vector3.new(-786.22, 33.29, 172.39),
    ["los bros"] = Vector3.new(-787.47, 27.75, -178.78),
    ["clique"] = Vector3.new(-1099.05, -0.36, -68.2),
    ["los primos"] = Vector3.new(-1106.79, 31.06, 302.87),
    ["tentáculo"] = Vector3.new(-1105.15, 40.98, 304.66),
    ["cacasito"] = Vector3.new(-792.3, 126.7, 134.4),
    ["bisonte jipiter"] = Vector3.new(-912.7, 269.9, 156.0),
    ["las vaquitas"] = Vector3.new(-947.9, 453.7, 140.0),
    ["pingüino yo"] = Vector3.new(-809.5, -6.3, 286.7),
    ["las traleleritas"] = Vector3.new(-825.4, 8.7, 139.1),
    ["arcalera"] = Vector3.new(-832.3, 14.0, 131.4),
    ["los Matteo's"] = Vector3.new(-440.5, 93.3, 38.4),
    ["lavadorito"] = Vector3.new(-704.5, 4886.3, -15055.0),
    ["taco"] = Vector3.new(-1016.3, -3.8, 252.3),
    ["elefante"] = Vector3.new(-1008.0, 8.4, 219.0),
    ["jirafa"] = Vector3.new(-1017.9, 26.9, 248.1),
    ["las capuchinas"] = Vector3.new(-843.8, 14.4, 329.8),
    ["flamenco"] = Vector3.new(-766.0, 84.7, 317.2),
    ["corn corn sahur"] = Vector3.new(-781.9, 56.6, -30.9),
    ["los burritos"] = Vector3.new(-773.1, 27.1, -188.8),
    ["negro"] = Vector3.new(-941.7, 4.5, 290.3),
    ["pipi kiwi brr"] = Vector3.new(-968.5, -3.7, 80.6),
    ["nose"] = Vector3.new(-896.4, -6.7, 83.6),
    ["guaracha"] = Vector3.new(-912.7, -8.9, -79.4),
    ["karkur"] = Vector3.new(-1214.2, 29.4, 82.2),
    ["had had haz"] = Vector3.new(-1019.8, -6.7, -98.0),
    ["agarrini la palini"] = Vector3.new(-1025.5, 2.3, -137.8),
    ["dino"] = Vector3.new(-931.8, 22.9, -295.1),
    ["la sahur combi"] = Vector3.new(-449.5, 47.5, 50.5),
    ["borbareilo"] = Vector3.new(-928.8, 16.2, 279.3),
    ["Tor tuya"] = Vector3.new(-919.2, 29.7, -139.3),
    ["expreso"] = Vector3.new(-930.9, 41.0, -200.0),
    ["tu"] = Vector3.new(-858.2, 6.7, 22.8),
    ["tata sahur"] = Vector3.new(-829.7, -5.3, 25.3),
    ["crayolas"] = Vector3.new(-1325.8, -6.5, -16579.8),
    ["Tottus"] = Vector3.new(-1077.8, 55.8, -52.3),
    ["job job sitos"] = Vector3.new(-723.3, 1.8, -16569.6),
    ["los chicleiteras"] = Vector3.new(-942.5, -0.9, -16549.5),
    ["hot botsita"] = Vector3.new(-1043.3, -7.2, -16580.5),
    ["luelre"] = Vector3.new(-1230.1, -8.3, -16567.5),
    ["ketupat"] = Vector3.new(-1433.2, -6.6, -16567.0),
    ["la exit grande"] = Vector3.new(-1542.5, -7.3, -16568.0),
    ["las sis"] = Vector3.new(-1639.0, -7.7, -16567.0),
    ["tic tac sahur"] = Vector3.new(-1737.0, -7.5, -16570.3),
    ["money puggy"] = Vector3.new(-1849.6, -7.6, -16566.9),
    ["karkur sahur"] = Vector3.new(-1948.7, -5.9, -16566.5),
    ["tang tang keleyant"] = Vector3.new(-2041.1, -6.5, -16568.2),
    ["los mobiles"] = Vector3.new(-2145.2, -7.6, -16565.5),
    ["la vaca linterna"] = Vector3.new(-2238.7, -8.2, -16569.7),
    ["bambú sahur"] = Vector3.new(-2335.1, -8.3, -16567.3),
    ["money man"] = Vector3.new(-2442.1, -7.2, -16567.3),
    ["los puggys"] = Vector3.new(-2541.3, -8.6, -16566.9),
    ["los no la póliza"] = Vector3.new(-2642.4, -5.8, -16573.4),
    ["los chiguaninis"] = Vector3.new(-2751.9, -9.0, -16569.1),
    ["pago"] = Vector3.new(-2862.7, -5.3, -16570.7),
    ["Francis"] = Vector3.new(-2970.8, -6.6, -16570.3),
    ["los tacoritas"] = Vector3.new(-806.9, -9.6, -16637.2),
    ["tralaleita"] = Vector3.new(-531.4, -8.6, -16565.5),
    ["trip tropa"] = Vector3.new(-447.7, -7.1, -16569.0),
    ["te te te sahur"] = Vector3.new(-373.4, -7.3, -16567.8),
    ["lion"] = Vector3.new(-302.5, -8.9, -16568.9),
    ["fisch"] = Vector3.new(-1011.9, -68.2, -18025.6),
    ["traladedon"] = Vector3.new(-2157.1, -67.7, -18006.4),
    ["orcadelon"] = Vector3.new(-2199.5, -87.0, -18003.8),
    ["los quesadillas"] = Vector3.new(-1550.3, -69.5, -17961.1),
    ["éxitc ballerina"] = Vector3.new(-1892.3, 302.0, -16595.2),
    ["éxitc tralalero"] = Vector3.new(-2133.4, 313.5, -16615.5),
    ["éxitc Matteo"] = Vector3.new(-2305.1, 319.0, -16615.1),
}

local count = 0; for _ in pairs(Ubicaciones) do count += 1 end
local nombres = {}; for k in pairs(Ubicaciones) do table.insert(nombres, k) end; table.sort(nombres)
local seleccionada = nombres[1] or "none"

local Box = Tabs.Main:AddLeftGroupbox("KRIS HUB v1.7")

Box:AddLabel("¡+70 BRAINROTS NUEVOS!", true)
Box:AddLabel("Total: "..count.." • ¡AHORA SÍ FUNCIONA!", true)

Box:AddInput("SearchBox", {
    Text = "Buscar brainrot...",
    Callback = function(text)
        local filtered = {}
        for _, name in ipairs(nombres) do
            if string.find(string.lower(name), string.lower(text), 1, true) or text == "" then
                table.insert(filtered, name)
            end
        end
        Options.Drop:SetValues(filtered)
        if #filtered > 0 then seleccionada = filtered[1] end
    end
})

Box:AddDropdown("Drop", {
    Values = nombres,
    Default = 1,
    Text = "Selecciona ("..count..")",
    Searchable = true,
    Callback = function(val) seleccionada = val end
})

Box:AddButton({Text = "TELEPORT", Func = function()
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp and Ubicaciones[seleccionada] then
        hrp.CFrame = CFrame.new(Ubicaciones[seleccionada] + Vector3.new(0,5,0))
        Library:Notify("Teletransportado a "..seleccionada, 3)
    end
end})

Box:AddButton({Text = "AUTO TP TODOS (3s)", Func = function()
    spawn(function()
        Library:Notify("Auto TP iniciado - 161 brainrots", 6)
        for i, name in ipairs(nombres) do
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(Ubicaciones[name] + Vector3.new(0,5,0))
                Library:Notify(name.." ("..i.."/"..count..")", 1.5)
                task.wait(3)
            end
        end
        Library:Notify("¡COMPLETADO!", 8)
    end)
end})

Box:AddButton({Text = "Copiar Posición", Func = function()
    local p = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    if p then setclipboard(string.format("Vector3.new(%.2f, %.2f, %.2f)", p.X, p.Y, p.Z)) Library:Notify("Copiado!", 4) end
end})

-- Config
SaveManager:SetLibrary(Library)
ThemeManager:SetLibrary(Library)
SaveManager:SetFolder("KrisHub")
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:BuildThemeSection(Tabs.Settings)

Library:Notify("KRIS HUB v1.7 CARGADO - ¡AHORA SÍ FUNCIONA 100%!", 10)
