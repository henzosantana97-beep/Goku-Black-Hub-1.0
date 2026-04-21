-- Goku Black Hub - Layout Corrigido e Organizado
-- Dev: ADM_GOKUBLACK

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ==================== CONFIGURAÇÕES ====================
local DISCORD_INVITE = "https://discord.gg/seu_link"
local KEY_PERMANENTE = "GOKUBLACK_ADMIN"

local KEYS_TEMPORARIAS = {
    ["GBH-FREE-24H"] = 24,
    ["GBH-PREMIUM-7D"] = 168,
    ["GBH-VIP-30D"] = 720,
    ["GBH-TESTE-1H"] = 1,
}

local isPermanente = false

local function validarKey(key)
    if key == KEY_PERMANENTE then
        isPermanente = true
        return true, "PERMANENTE", 0
    end
    local duracao = KEYS_TEMPORARIAS[key]
    if duracao then
        isPermanente = false
        return true, "TEMPORARIA", duracao
    end
    return false, "INVALIDA", 0
end

-- ==================== TELA DE KEY ====================
local function iniciarKeySystem()
    local keyScreen = Instance.new("ScreenGui")
    keyScreen.Name = "KeySystem"
    keyScreen.ResetOnSpawn = false
    keyScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    keyScreen.Parent = game:GetService("CoreGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 420)
    frame.Position = UDim2.new(0.5, -175, 0.35, -210)
    frame.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
    frame.BorderSizePixel = 0
    frame.Parent = keyScreen
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(150, 80, 255)
    stroke.Thickness = 2
    stroke.Transparency = 0.2
    
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 55)
    header.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
    header.BorderSizePixel = 0
    header.Parent = frame
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 16)
    
    local logo = Instance.new("TextLabel")
    logo.Size = UDim2.new(1, 0, 1, 0)
    logo.BackgroundTransparency = 1
    logo.Text = "🗿 GOKU BLACK"
    logo.TextColor3 = Color3.fromRGB(255, 215, 100)
    logo.Font = Enum.Font.GothamBlack
    logo.TextSize = 20
    logo.Parent = header
    
    local subLogo = Instance.new("TextLabel")
    subLogo.Size = UDim2.new(1, 0, 0, 18)
    subLogo.Position = UDim2.new(0, 0, 0.65, 0)
    subLogo.BackgroundTransparency = 1
    subLogo.Text = "KEY SYSTEM"
    subLogo.TextColor3 = Color3.fromRGB(180, 140, 255)
    subLogo.Font = Enum.Font.GothamBold
    subLogo.TextSize = 12
    subLogo.Parent = header
    
    local infoPanel = Instance.new("Frame")
    infoPanel.Size = UDim2.new(0.9, 0, 0, 100)
    infoPanel.Position = UDim2.new(0.05, 0, 0.16, 0)
    infoPanel.BackgroundColor3 = Color3.fromRGB(25, 20, 40)
    infoPanel.BorderSizePixel = 0
    infoPanel.Parent = frame
    Instance.new("UICorner", infoPanel).CornerRadius = UDim.new(0, 10)
    
    local infoTitle = Instance.new("TextLabel")
    infoTitle.Size = UDim2.new(1, 0, 0, 25)
    infoTitle.BackgroundTransparency = 1
    infoTitle.Text = "📋 COMO OBTER SUA KEY"
    infoTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
    infoTitle.Font = Enum.Font.GothamBold
    infoTitle.TextSize = 13
    infoTitle.Parent = infoPanel
    
    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(0.95, 0, 0, 65)
    infoText.Position = UDim2.new(0.025, 0, 0.25, 0)
    infoText.BackgroundTransparency = 1
    infoText.Text = "1️⃣ Entre no Discord\n2️⃣ Vá ao canal #🔑-keys\n3️⃣ Copie uma Key disponível\n4️⃣ Cole abaixo e valide"
    infoText.TextColor3 = Color3.fromRGB(200, 190, 240)
    infoText.Font = Enum.Font.GothamMedium
    infoText.TextSize = 12
    infoText.TextWrapped = true
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.Parent = infoPanel
    
    local keysPanel = Instance.new("Frame")
    keysPanel.Size = UDim2.new(0.9, 0, 0, 60)
    keysPanel.Position = UDim2.new(0.05, 0, 0.43, 0)
    keysPanel.BackgroundColor3 = Color3.fromRGB(30, 25, 50)
    keysPanel.BorderSizePixel = 0
    keysPanel.Parent = frame
    Instance.new("UICorner", keysPanel).CornerRadius = UDim.new(0, 10)
    
    local keysTitle = Instance.new("TextLabel")
    keysTitle.Size = UDim2.new(1, 0, 0, 20)
    keysTitle.BackgroundTransparency = 1
    keysTitle.Text = "🔑 KEYS DISPONÍVEIS"
    keysTitle.TextColor3 = Color3.fromRGB(100, 255, 150)
    keysTitle.Font = Enum.Font.GothamBold
    keysTitle.TextSize = 11
    keysTitle.Parent = keysPanel
    
    local keysList = Instance.new("TextLabel")
    keysList.Size = UDim2.new(1, 0, 0, 35)
    keysList.Position = UDim2.new(0, 0, 0.35, 0)
    keysList.BackgroundTransparency = 1
    keysList.Text = "FREE-24H  |  PREMIUM-7D  |  VIP-30D  |  TESTE-1H"
    keysList.TextColor3 = Color3.fromRGB(180, 255, 180)
    keysList.Font = Enum.Font.GothamMedium
    keysList.TextSize = 11
    keysList.Parent = keysPanel
    
    local keyLabel = Instance.new("TextLabel")
    keyLabel.Size = UDim2.new(0.9, 0, 0, 20)
    keyLabel.Position = UDim2.new(0.05, 0, 0.60, 0)
    keyLabel.BackgroundTransparency = 1
    keyLabel.Text = "DIGITE SUA KEY:"
    keyLabel.TextColor3 = Color3.fromRGB(200, 180, 255)
    keyLabel.Font = Enum.Font.GothamBold
    keyLabel.TextSize = 12
    keyLabel.TextXAlignment = Enum.TextXAlignment.Left
    keyLabel.Parent = frame
    
    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(0.9, 0, 0, 45)
    keyBox.Position = UDim2.new(0.05, 0, 0.65, 0)
    keyBox.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
    keyBox.BorderSizePixel = 0
    keyBox.PlaceholderText = "Ex: GBH-FREE-24H"
    keyBox.PlaceholderColor3 = Color3.fromRGB(120, 100, 180)
    keyBox.Text = ""
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.Font = Enum.Font.GothamBold
    keyBox.TextSize = 14
    keyBox.ClearTextOnFocus = false
    keyBox.Parent = frame
    Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", keyBox).Color = Color3.fromRGB(150, 80, 255)
    Instance.new("UIStroke", keyBox).Thickness = 1.5
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(0.9, 0, 0, 20)
    statusLabel.Position = UDim2.new(0.05, 0, 0.78, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = ""
    statusLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
    statusLabel.Font = Enum.Font.GothamMedium
    statusLabel.TextSize = 11
    statusLabel.TextXAlignment = Enum.TextXAlignment.Center
    statusLabel.Parent = frame
    
    local confirmBtn = Instance.new("TextButton")
    confirmBtn.Size = UDim2.new(0.43, 0, 0, 45)
    confirmBtn.Position = UDim2.new(0.05, 0, 0.85, 0)
    confirmBtn.BackgroundColor3 = Color3.fromRGB(30, 140, 60)
    confirmBtn.BorderSizePixel = 0
    confirmBtn.Text = "✓ VALIDAR"
    confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    confirmBtn.Font = Enum.Font.GothamBlack
    confirmBtn.TextSize = 14
    confirmBtn.Parent = frame
    Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 10)
    
    local discordBtn = Instance.new("TextButton")
    discordBtn.Size = UDim2.new(0.43, 0, 0, 45)
    discordBtn.Position = UDim2.new(0.52, 0, 0.85, 0)
    discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    discordBtn.BorderSizePixel = 0
    discordBtn.Text = "💬 DISCORD"
    discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    discordBtn.Font = Enum.Font.GothamBlack
    discordBtn.TextSize = 14
    discordBtn.Parent = frame
    Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0, 10)
    
    local credit = Instance.new("TextLabel")
    credit.Size = UDim2.new(1, 0, 0, 20)
    credit.Position = UDim2.new(0, 0, 0.95, 0)
    credit.BackgroundTransparency = 1
    credit.Text = "💲 ADM_GOKUBLACK 💲"
    credit.TextColor3 = Color3.fromRGB(180, 130, 255)
    credit.Font = Enum.Font.GothamBold
    credit.TextSize = 11
    credit.Parent = frame
    
    confirmBtn.MouseButton1Click:Connect(function()
        local key = keyBox.Text:gsub("%s+", ""):upper()
        if key == "" then
            statusLabel.Text = "❌ DIGITE UMA KEY!"
            return
        end
        
        statusLabel.Text = "⏳ VALIDANDO..."
        statusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
        
        local valido, tipo, duracao = validarKey(key)
        
        if valido then
            if tipo == "PERMANENTE" then
                statusLabel.Text = "👑 KEY ADMIN PERMANENTE!"
                statusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
            else
                statusLabel.Text = "✅ KEY VÁLIDA! (" .. duracao .. " HORAS)"
                statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            end
            task.wait(1)
            keyScreen:Destroy()
            iniciarHub()
        else
            statusLabel.Text = "❌ KEY INVÁLIDA! VERIFIQUE NO DISCORD"
            statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)
    
    discordBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(DISCORD_INVITE)
            statusLabel.Text = "📋 CONVITE COPIADO!"
            statusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
        else
            statusLabel.Text = "💬 DISCORD: " .. DISCORD_INVITE
        end
    end)
    
    local dragging = false
    local dragStart, startPos
    local dragConnection = nil
    
    local function startDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            if dragConnection then dragConnection:Disconnect() end
            dragConnection = UIS.InputChanged:Connect(function(moveInput)
                if dragging and (moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch) then
                    local delta = moveInput.Position - dragStart
                    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
        end
    end
    
    local function stopDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            if dragConnection then
                dragConnection:Disconnect()
                dragConnection = nil
            end
        end
    end
    
    frame.InputBegan:Connect(startDrag)
    UIS.InputEnded:Connect(stopDrag)
end

-- ==================== HUB PRINCIPAL ORGANIZADO ====================
function iniciarHub()
    local gui = Instance.new("ScreenGui")
    gui.Name = "Hub"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = game:GetService("CoreGui")
    
    -- Frame Principal (MAIOR para organizar)
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 260, 0, 600)
    main.Position = UDim2.new(0.5, -130, 0.3, -300)
    main.BackgroundColor3 = Color3.fromRGB(8, 6, 14)
    main.BorderSizePixel = 0
    main.Parent = gui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)
    
    local stroke = Instance.new("UIStroke", main)
    stroke.Color = Color3.fromRGB(140, 80, 220)
    stroke.Thickness = 2
    stroke.Transparency = 0.2
    
    -- Header
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundTransparency = 0.5
    header.BackgroundColor3 = Color3.fromRGB(18, 12, 28)
    header.BorderSizePixel = 0
    header.Parent = main
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 14)
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.6, 0, 1, 0)
    title.Position = UDim2.new(0.05, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "🗿 GOKU BLACK"
    title.TextColor3 = Color3.fromRGB(255, 200, 80)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header
    
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(0.5, 0, 0, 14)
    subtitle.Position = UDim2.new(0.05, 0, 0.55, 0)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "HUB • 黒悟空"
    subtitle.TextColor3 = Color3.fromRGB(180, 120, 255)
    subtitle.Font = Enum.Font.GothamBold
    subtitle.TextSize = 10
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.Parent = header
    
    -- Estados
    local noclip = false
    local antifling = false
    local god = false
    local speedOn = false
    local speedVal = 50
    local autoDisable = true
    local minimizedIcon = nil
    local godConnection = nil
    local speedConnection = nil
    
    -- Botões do Header
    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0, 34, 0, 34)
    minBtn.Position = UDim2.new(1, -78, 0.5, -17)
    minBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 140)
    minBtn.BorderSizePixel = 0
    minBtn.Text = "─"
    minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 24
    minBtn.Parent = header
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 8)
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 34, 0, 34)
    closeBtn.Position = UDim2.new(1, -40, 0.5, -17)
    closeBtn.BackgroundColor3 = Color3.fromRGB(160, 30, 50)
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.Parent = header
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
    
    -- Container principal
    local cont = Instance.new("Frame")
    cont.Size = UDim2.new(0.88, 0, 0.88, 0)
    cont.Position = UDim2.new(0.06, 0, 0.10, 0)
    cont.BackgroundTransparency = 1
    cont.Parent = main
    
    -- ==================== BOTÕES PRINCIPAIS ====================
    local function criarBtn(nome, posY, icone, corPadrao)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 42)
        btn.Position = UDim2.new(0, 0, posY, 0)
        btn.BackgroundColor3 = corPadrao or Color3.fromRGB(140, 30, 50)
        btn.BorderSizePixel = 0
        btn.Text = icone .. " " .. nome .. " OFF"
        btn.TextColor3 = Color3.fromRGB(240, 230, 255)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 12
        btn.Parent = cont
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
        return btn
    end
    
    local noclipBtn = criarBtn("NOCLIP", 0, "👁️")
    local flingBtn = criarBtn("ANTI-FLING", 0.13, "🛡️")
    local godBtn = criarBtn("GOD MODE", 0.26, "⚡")
    local speedBtn = criarBtn("SPEED", 0.39, "🏃")
    local autoBtn = criarBtn("AUTO-DESAB.", 0.52, "💀", Color3.fromRGB(60, 100, 200))
    autoBtn.Text = "💀 AUTO-DESAB. ON"
    
    -- ==================== SEPARADOR ====================
    local separator = Instance.new("Frame")
    separator.Size = UDim2.new(1, 0, 0, 2)
    separator.Position = UDim2.new(0, 0, 0.64, 0)
    separator.BackgroundColor3 = Color3.fromRGB(130, 60, 220)
    separator.BorderSizePixel = 0
    separator.BackgroundTransparency = 0.5
    separator.Parent = cont
    
    -- ==================== SEÇÃO SPEED (SEPARADA) ====================
    local speedSection = Instance.new("Frame")
    speedSection.Size = UDim2.new(1, 0, 0, 70)
    speedSection.Position = UDim2.new(0, 0, 0.67, 0)
    speedSection.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
    speedSection.BorderSizePixel = 0
    speedSection.Parent = cont
    Instance.new("UICorner", speedSection).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", speedSection).Color = Color3.fromRGB(140, 80, 220)
    Instance.new("UIStroke", speedSection).Thickness = 1
    Instance.new("UIStroke", speedSection).Transparency = 0.5
    
    local speedHeader = Instance.new("TextLabel")
    speedHeader.Size = UDim2.new(1, 0, 0, 22)
    speedHeader.BackgroundTransparency = 1
    speedHeader.Text = "⚡ CONTROLE DE VELOCIDADE"
    speedHeader.TextColor3 = Color3.fromRGB(255, 180, 100)
    speedHeader.Font = Enum.Font.GothamBold
    speedHeader.TextSize = 11
    speedHeader.Parent = speedSection
    
    local speedValueLabel = Instance.new("TextLabel")
    speedValueLabel.Size = UDim2.new(0, 45, 0, 22)
    speedValueLabel.Position = UDim2.new(1, -50, 0, 0)
    speedValueLabel.BackgroundTransparency = 1
    speedValueLabel.Text = "50"
    speedValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedValueLabel.Font = Enum.Font.GothamBold
    speedValueLabel.TextSize = 13
    speedValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    speedValueLabel.Parent = speedSection
    
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0.9, 0, 0, 6)
    slider.Position = UDim2.new(0.05, 0, 0.40, 0)
    slider.BackgroundColor3 = Color3.fromRGB(40, 20, 50)
    slider.BorderSizePixel = 0
    slider.Parent = speedSection
    Instance.new("UICorner", slider).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0.22, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(200, 120, 30)
    fill.BorderSizePixel = 0
    fill.Parent = slider
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    
    local sliderBtn = Instance.new("TextButton")
    sliderBtn.Size = UDim2.new(0, 14, 0, 14)
    sliderBtn.Position = UDim2.new(0.22, -7, 0.5, -7)
    sliderBtn.BackgroundColor3 = Color3.fromRGB(200, 120, 30)
    sliderBtn.BorderSizePixel = 0
    sliderBtn.Text = ""
    sliderBtn.ZIndex = 2
    sliderBtn.Parent = slider
    Instance.new("UICorner", sliderBtn).CornerRadius = UDim.new(1, 0)
    
    local speedStatus = Instance.new("TextLabel")
    speedStatus.Size = UDim2.new(1, 0, 0, 18)
    speedStatus.Position = UDim2.new(0, 0, 0.70, 0)
    speedStatus.BackgroundTransparency = 1
    speedStatus.Text = "🔴 SPEED DESATIVADO"
    speedStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
    speedStatus.Font = Enum.Font.GothamMedium
    speedStatus.TextSize = 10
    speedStatus.TextXAlignment = Enum.TextXAlignment.Center
    speedStatus.Parent = speedSection
    
    -- ==================== SEPARADOR 2 ====================
    local separator2 = Instance.new("Frame")
    separator2.Size = UDim2.new(1, 0, 0, 2)
    separator2.Position = UDim2.new(0, 0, 0.80, 0)
    separator2.BackgroundColor3 = Color3.fromRGB(130, 60, 220)
    separator2.BorderSizePixel = 0
    separator2.BackgroundTransparency = 0.5
    separator2.Parent = cont
    
    -- ==================== CRÉDITOS ====================
    local credit = Instance.new("TextLabel")
    credit.Size = UDim2.new(1, 0, 0, 25)
    credit.Position = UDim2.new(0, 0, 0.94, 0)
    credit.BackgroundTransparency = 1
    credit.Text = "💲 ADM_GOKUBLACK 💲"
    credit.TextColor3 = Color3.fromRGB(180, 130, 255)
    credit.Font = Enum.Font.GothamBlack
    credit.TextSize = 12
    credit.Parent = cont
    
    -- ==================== FUNÇÕES ====================
    local function aplicarGod(char)
        if not char then return end
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
            hum.BreakJointsOnDeath = false
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end
        if not char:FindFirstChild("GodModeFF") then
            local ff = Instance.new("ForceField")
            ff.Name = "GodModeFF"
            ff.Visible = false
            ff.Parent = char
        end
    end
    
    local function aplicarSpeed(valor)
        local char = player.Character
        if char then
            local hum = cha
