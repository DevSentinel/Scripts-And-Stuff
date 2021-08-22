local FileIsLocated = isfile("WhiteKey.lua")

if not FileIsLocated then
  writefile("WhiteKey.lua", '{"whitekey":"newupdaterobloxisbad"}')
end
	
wait(0.000001)
