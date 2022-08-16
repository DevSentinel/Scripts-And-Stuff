local ServerHopTime = 900 -- IN SECONDS

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
	syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/DevSentinel/Scripts-And-Stuff/main/Other-Scripts/PlsDonate.lua'))()")
else
	game.StarterGui:SetCore("SendNotification", {
		Title = "Not using Synapse X",
		Text = "Make sure this script is in the autoexec folder or it won't work properly",
		Duration = 15
	})
end

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
	while true do
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

	--30 second wait so the booth doesn't update instantly
	wait(2.5)
end
