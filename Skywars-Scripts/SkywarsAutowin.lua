print("Modified by DevSentinel")

if game.PlaceId == 8542275097 or game.PlaceId == 8592115909 then
    repeat
        wait()
    until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
else
    return
end
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
local a = queue_on_teleport or syn.queue_on_teleport
local b = game.Players.LocalPlayer
local c = game:GetService("TweenService")
local d = "0.7b - 16/2"
local e = {
    FULLREMOTENAMES = {},
    Remotes = {},
    Events = require(game.Players.LocalPlayer.PlayerScripts.TS.events).Events
}
local f = Instance.new("ScreenGui")
f.Name = "?"
f.ResetOnSpawn = false
f.Parent = game:GetService("CoreGui")
local function g(h, i)
    local j = i or 3
    coroutine.wrap(
        function()
            local k = Instance.new("TextLabel")
            k.Parent = f
            k.AnchorPoint = Vector2.new(0.5, 0.5)
            k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            k.BorderSizePixel = 0
            k.Position = UDim2.new(0.5, 0, 0.800000012, 0)
            k.Size = UDim2.new(0, 0, 0, 30)
            k.Font = Enum.Font.SourceSansLight
            k.TextColor3 = Color3.fromRGB(0, 0, 0)
            k.TextSize = 20.000
            for l = 1, #h + 1 do
                local m =
                    game:GetService("TextService"):GetTextSize(
                    h:sub(1, l),
                    20,
                    Enum.Font.SourceSansLight,
                    Vector2.new(9e9, 9e9)
                )
                k.Text = h:sub(1, l)
                c:Create(k, TweenInfo.new(0.01), {Size = UDim2.new(0, m.x + 30, 0, m.y + 10)}):Play()
                wait(0.03)
            end
            wait(j)
            k.Text = ""
            c:Create(k, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            wait(0.2)
            k:Destroy()
        end
    )()
end
local function n(o, h, i)
    coroutine.wrap(
        function()
            local p = Instance.new("TextLabel")
            p.Parent = f
            p.AnchorPoint = Vector2.new(0.5, 0.5)
            p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            p.BorderSizePixel = 0
            p.Position = UDim2.new(0.5, 0, 0.5, 0)
            p.Size = UDim2.new(0, 0, 0, 30)
            p.Font = Enum.Font.SourceSansLight
            p.TextColor3 = Color3.fromRGB(0, 0, 0)
            p.TextSize = 20.000
            for l = 1, #o + 1 do
                local m =
                    game:GetService("TextService"):GetTextSize(
                    o:sub(1, l),
                    20,
                    Enum.Font.SourceSansLight,
                    Vector2.new(9e9, 9e9)
                )
                p.Text = o:sub(1, l)
                c:Create(p, TweenInfo.new(0.01), {Size = UDim2.new(0, m.x + 30, 0, m.y + 10)}):Play()
                wait(.03)
            end
            wait(0.1)
            local q = Instance.new("Frame")
            q.Name = "Line"
            q.Parent = f
            q.AnchorPoint = Vector2.new(0.5, 0.5)
            q.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            q.BorderSizePixel = 0
            q.Position = UDim2.new(0.5, 0, 0.5, 0)
            q.Size = UDim2.new(0, 3, 0, 10)
            local k = Instance.new("TextLabel")
            k.Parent = f
            k.AnchorPoint = Vector2.new(0.5, 0.5)
            k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            k.BorderSizePixel = 0
            k.Position = UDim2.new(0.5, 0, 0.5, 0)
            k.Size = UDim2.new(0, 0, 0, 30)
            k.Font = Enum.Font.SourceSansLight
            k.TextColor3 = Color3.fromRGB(0, 0, 0)
            k.TextSize = 20.000
            c:Create(p, TweenInfo.new(0.4), {Position = p.Position - UDim2.new(0, 0, 0, 50)}):Play()
            wait(0.04)
            c:Create(q, TweenInfo.new(0.4), {Size = UDim2.new(0, 3, 0, 20)}):Play()
            q.Position = q.Position - UDim2.new(0, 0, 0, 25)
            q.Visible = true
            wait(0.1)
            for l = 1, #h + 1 do
                local m =
                    game:GetService("TextService"):GetTextSize(
                    h:sub(1, l),
                    20,
                    Enum.Font.SourceSansLight,
                    Vector2.new(9e9, 9e9)
                )
                k.Text = h:sub(1, l)
                c:Create(k, TweenInfo.new(0.01), {Size = UDim2.new(0, m.x + 30, 0, m.y + 10)}):Play()
                wait(.05)
            end
            i = i or 3
            wait(i)
            p.Text = ""
            k.Text = ""
            c:Create(p, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            c:Create(k, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            c:Create(q, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            wait(0.2)
            p:Destroy()
            k:Destroy()
            q:Destroy()
        end
    )()
end
function getRemoteName(r)
    local s = {}
    pcall(
        function()
            local t = debug.getconstants(r)
            for l = 1, #t do
                local m = t[l]
                if typeof(m) == "string" and table.find(e.FULLREMOTENAMES, m) then
                    table.insert(s, e.Events[m])
                end
            end
        end
    )
    return #s > 1 and s or #s == 1 and s[1] or nil
end
function hasItem(u)
    return e.inventoryController.hasItem(nil, u)
end
function getHoldItem()
    local v = e.HotbarController:getHeldItemInfo()
    return v and v.Name or nil
end
function IsAlive(w)
    if
        w.Character and w.Character:FindFirstChild("HumanoidRootPart") and w.Character:FindFirstChild("Humanoid") and
            w.Character.Humanoid.Health > 0
     then
        return true
    end
    return false
end
function magnitude(x, y, z)
    if typeof(x) == "Instance" and z then
        x = x.Character.HumanoidRootPart.Position
    end
    if typeof(y) == "Instance" and z then
        y = y.Character.HumanoidRootPart.Position
    end
    if typeof(x) == "Instance" and not z then
        x = x.Position
    end
    if typeof(y) == "Instance" and not z then
        y = y.Position
    end
    if typeof(x) == "CFrame" then
        x = x.p
    end
    if typeof(y) == "CFrame" then
        y = y.p
    end
    return (x - y).magnitude
end
function looptp(w)
    repeat
        if IsAlive(w) and IsAlive(b) then
            game:GetService("RunService").Heartbeat:Wait()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            if w and w.Character and w.Character:FindFirstChild("HumanoidRootPart") then
                b.Character.HumanoidRootPart.CFrame =
                    w.Character.HumanoidRootPart.CFrame + w.Character.HumanoidRootPart.CFrame.LookVector * -3 -
                    Vector3.new(0, 6, 0)
            end
        end
    until IsAlive(w) == false or IsAlive(b) == false or w.Character.HumanoidRootPart.Position.Y < -5
    g("Killed " .. w.Name)
end
for l, m in next, getgc(true) do
    if typeof(m) == "table" then
        for A, B in next, m do
            if typeof(A) == "string" and (string.find(A, "Controller") or string.find(A, "Util")) then
                e[A] = m[A]
            end
        end
    end
end
for l, m in next, e.Events do
    table.insert(e.FULLREMOTENAMES, l)
end
for l, m in next, e do
    if typeof(m) == "table" then
        for A, B in next, m do
            local C = getRemoteName(B)
            if C then
                if not e.Remotes[l] then
                    e.Remotes[l] = {}
                end
                e.Remotes[l][A] = C
            end
        end
    end
end
e.Remotes["ChestController"]["onStart"]:connect(
    function(D, s)
        for E, m in next, s do
            e.Remotes["ChestController"]["updateChest"]:fire(D, m.Type, -m.Quantity)
        end
    end
)
repeat
    wait()
until IsAlive(b)
local F = tick()
n("Autowin Started", "Made by Fern#5747 v" .. d)
a([[loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSentinel/Scripts-And-Stuff/main/Skywars-Scripts/SkywarsAutowin.lua", true))()]])
local C = 0
repeat
    for E, m in next, workspace.BlockContainer.Map.Chests:GetChildren() do
        if IsAlive(b) and m:FindFirstChild("PrimaryPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = m.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
            wait(0.1)
            e.Remotes["ChestController"]["openChest"]:fire(m)
            C = C + 1
        end
    end
    wait()
until C >= 2
b.Character.Hitbox:Destroy()
local G = {"Bronze", "Iron", "Gold", "Diamond", "Emerald", "Onyx"}
game:GetService("RunService").Heartbeat:Connect(
    function()
        for E, m in next, game.Players:GetPlayers() do
            if m ~= b and IsAlive(m) and IsAlive(b) and magnitude(m, b, 1) < 10 then
                local H = 1
                for l, B in next, G do
                    if hasItem(B .. "Sword") and l > H then
                        H = l
                    end
                end
                e.Remotes["HotbarController"]["updateActiveItem"]:fire(G[H] .. "Sword")
                e.Remotes["MeleeController"]["strikeMobile"]:fire(m)
            end
        end
    end
)
local I = 0
repeat
    I = 0
    for E, m in next, game.Players:GetPlayers() do
        if m ~= b and IsAlive(m) then
            I = I + 1
            looptp(m)
        end
    end
    wait()
until I == 0
n("Game Ended", "Took - " .. math.floor(tick() - F) .. "s")
e.Remotes["MatchmakingController"]["joinQueue"]:fire(true)
