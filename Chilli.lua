--[[ 
💜 Delta GUI - by delta-krnl
Fondo negro, bordes morados, botones visibles y ejecución automática tras 7 s.
]]

-- Esperar jugador y PlayerGui
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local playerGui
repeat
	task.wait(0.2)
	playerGui = player:FindFirstChildOfClass("PlayerGui")
until playerGui

-- Crear GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DeltaHubGUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

-- Marco principal
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 320, 0, 260)
main.Position = UDim2.new(0.35, 0, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- Bordes morados y esquinas redondeadas
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(155, 0, 255)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 12)

-- Título
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "✨ Delta-Krnl Loader ✨"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(200, 120, 255)
title.TextSize = 16

-- Firma
local credit = Instance.new("TextLabel", main)
credit.Size = UDim2.new(1, 0, 0, 20)
credit.Position = UDim2.new(0, 0, 1, -22)
credit.BackgroundTransparency = 1
credit.Text = "Made by delta-krnl | github.com/delta-krnl"
credit.Font = Enum.Font.Gotham
credit.TextColor3 = Color3.fromRGB(120, 120, 120)
credit.TextSize = 12

-- Crear botones de hubs
local function makeButton(text, yPos)
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(0.8, 0, 0, 40)
	btn.Position = UDim2.new(0.1, 0, 0, yPos)
	btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	btn.TextColor3 = Color3.fromRGB(220, 220, 220)
	local corner = Instance.new("UICorner", btn)
	corner.CornerRadius = UDim.new(0, 8)

	btn.MouseEnter:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
	end)
	btn.MouseLeave:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	end)

	return btn
end

local miranda = makeButton("Miranda Hub", 50)
local lemon = makeButton("Lemon Hub", 100)
local chillin = makeButton("Chillin Hub", 150)

-- Estado
local statusLabel = Instance.new("TextLabel", main)
statusLabel.Size = UDim2.new(1, 0, 0, 40)
statusLabel.Position = UDim2.new(0, 0, 0.8, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextColor3 = Color3.fromRGB(200, 120, 255)
statusLabel.TextSize = 16
statusLabel.Text = "Cargando script en 7 s..."

-- Fade-in
main.BackgroundTransparency = 1
title.TextTransparency = 1
credit.TextTransparency = 1
statusLabel.TextTransparency = 1
for i = 1, 0, -0.05 do
	main.BackgroundTransparency = i
	title.TextTransparency = i
	credit.TextTransparency = i
	statusLabel.TextTransparency = i
	task.wait(0.05)
end

-- Contador y ejecución automática
task.spawn(function()
	for i = 7, 1, -1 do
		statusLabel.Text = "Cargando script en " .. i .. " s..."
		task.wait(1)
	end
	statusLabel.Text = "Ejecutando script..."
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/elpro503aa200-collab/Spicy/refs/heads/main/Chilli.lua"))()
	end)
	statusLabel.Text = "✅ Script ejecutado correctamente"
end)
