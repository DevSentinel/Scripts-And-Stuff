local ServerHopTime = 900 -- IN SECONDS
getgenv().Webhook = "https://discord.com/api/webhooks/1008921790497706054/EY1b5a5bsAX2yd91h6DhaJLOLFvd_LKUIawTAWLOw0N_bfI63b2z18_989_f3_BI00R4"

repeat
	wait()
until game:IsLoaded()

if game.PlaceId ~= 8737602449 then
	return
end

-- Anti AFK
for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
	v:Disable()
end
wait(5)

-- Check Executor
if string.find(identifyexecutor(), "Synapse X") then
	syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/tzechco/roblox-scripts/main/PLS%20DONATE/autofarm.lua'))()")
else
	game.StarterGui:SetCore("SendNotification", {
		Title = "Not using Synapse X",
		Text = "Make sure this script is in the autoexec folder or it won't work properly",
		Duration = 15
	})
end

-- Discord Webhook TEXTBOX

-- Instances:

local Webhook = Instance.new("ScreenGui")
local WebhookFrame = Instance.new("Frame")
local FrameCorner = Instance.new("UICorner")
local FrameStroke = Instance.new("UIStroke")
local TextBox = Instance.new("TextBox")
local TextStroke = Instance.new("UIStroke")

--Properties:

Webhook.Name = "Webhook"
Webhook.Parent = game.CoreGui
Webhook.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

WebhookFrame.Name = "WebhookFrame"
WebhookFrame.Parent = Webhook
WebhookFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WebhookFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WebhookFrame.Position = UDim2.new(0.49962461, 0, 0.87832123, 0)
WebhookFrame.Size = UDim2.new(0, 217, 0, 35)

FrameCorner.Name = "FrameCorner"
FrameCorner.Parent = WebhookFrame
FrameCorner.CornerRadius = UDim.new(0, 8)

FrameStroke.Name = "FrameStroke"
FrameStroke.Parent = WebhookFrame
FrameStroke.Thickness = 3

TextBox.Parent = WebhookFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.ClipsDescendants = true
TextBox.Size = UDim2.new(0, 217, 0, 35)
TextBox.Font = Enum.Font.Roboto
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

FrameStroke.Name = "TextStroke"
FrameStroke.Parent = TextBox
FrameStroke.Thickness = 0.6

local Unclaimed = {}
local Counter
local Donaion
local ErrorCount = 0
local Booths = {
	["1"] = "72, 4, 36",
	["2"] = "83, 4, 161",
	["3"] = "11, 4, 36",
	["4"] = "100, 4, 59",
	["5"] = "72, 4, 166",
	["6"] = "2, 4, 42",
	["7"] = "-9, 4, 52",
	["8"] = "10, 4, 166",
	["9"] = "-17, 4, 60",
	["10"] = "35, 4, 173",
	["11"] = "24, 4, 170",
	["12"] = "48, 4, 29",
	["13"] = "24, 4, 33",
	["14"] = "101, 4, 142",
	["15"] = "-18, 4, 142",
	["16"] = "60, 4, 33",
	["17"] = "35, 4, 29",
	["18"] = "0, 4, 160",
	["19"] = "48, 4, 173",
	["20"] = "61, 3, 170",
	["21"] = "91, 4, 151",
	["22"] = "-24, 4, 72",
	["23"] = "-28, 4, 88",
	["24"] = "92, 4, 51",
	["25"] = "-28, 4, 112",
	["26"] = "-24, 3, 129",
	["27"] = "83, 4, 42",
	["28"] = "-8, 4, 151"
}

-- Find Unclaimed Booths
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI:GetChildren()) do
	if (v.Details.Owner.Text == "unclaimed") then
		table.insert(Unclaimed, tonumber(string.match(tostring(v), "%d+")))
	end
end
local ClaimCount = #Unclaimed

-- Claim Booth Function
function BoothClaim()
	local claimevent = require(game.ReplicatedStorage.Remotes).Event("ClaimBooth")
	claimevent:InvokeServer(Unclaimed[1])
end

-- Check if Booth Claim FAILS
while not pcall(BoothClaim) do
	if ErrorCount >= ClaimCount then
		local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/8737602449/servers/Public?sortOrder=Desc&limit=100"))
		for i, v in pairs(Servers.data) do
			if v.playing > 19 and v.playing < 27 then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
			end
		end
	end
	ErrorCount = ErrorCount + 1
end

-- WALK TO BOOTH
game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(Booths[tostring(Unclaimed[1])]:match("(.+), (.+), (.+)")))
local CurrentlyAtBooth = false
game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Connect(function(reached)
	CurrentlyAtBooth = true
end)

-- JUST IN CASE YOU RUN INTO A BENCH (CHECK)
while not CurrentlyAtBooth do
	wait(.25)
	if game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end
end

-- Turns Character to face away from booth
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(40, 14, 101)))

-- Booth Text
while true do
	Counter = 0
	local Players = game:GetService("Players")
	local BoothText
	
	--Waits for a donation
	local RaisedC = Players.LocalPlayer.leaderstats.Raised.value
	while (Players.LocalPlayer.leaderstats.Raised.value == RaisedC) do
		wait(1)
		Counter = Counter + 1
		--Server hops after 1800 seconds (30 minutes)
		if Counter >= ServerHopTime then
			--Random wait time in case of interference from alts
			wait(math.random(1, 60))
			local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/8737602449/servers/Public?sortOrder=Desc&limit=100"))
			for i, v in pairs(Servers.data) do
				if v.playing > 19 and v.playing < 27 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
				end
			end
		end
	end
	
	--Checks for Discord Webhook
	if getgenv().webhook then
		local LogService = game:GetService("LogService")
		local logs = LogService:GetLogHistory()
		local donation
		--Tries to grabs donation message from logs
		if string.find(logs[#logs].message, game:GetService("Players").LocalPlayer.Name) then
			donation = tostring(logs[#logs].message.. " (Total: ".. Players.LocalPlayer.leaderstats.Raised.value.. ")")
		else
			donation = tostring("💰 Somebody tipped ".. Players.LocalPlayer.leaderstats.Raised.value - RaisedC.. " Robux to ".. game:GetService("Players").LocalPlayer.Name.. " (Total: " .. Players.LocalPlayer.leaderstats.Raised.value.. ")")
		end

		--Sends to webhook
		local request = http_request or request or HttpPost or syn.request
		request({
			Url = getgenv().Webhook,
			Body = game:GetService("HttpService"):JSONEncode({["content"] = donation}),
			Method = "POST",
			Headers = {["content-type"] = "application/json"}
		})
	end

	--30 second wait so the booth doesn't update instantly
	wait(30)
end
