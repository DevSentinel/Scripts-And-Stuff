local FileIsLocated = isfile("WhiteKey.lua")

if not FileIsLocated then
  writefile("WhiteKey.lua", '{"whitekey":"newupdaterobloxisbad"}')
end
	
wait(0.000001)

loadstring(game:HttpGet("https://raw.githubusercontent.com/rbxhubs/robloxscript/main/script.lua"))()
