hook.Add("Initialize", "SetUpSTJackPot", function()
	STC_LOTTERYPLY = {}

    if !file.Exists("stcasino", "DATA") then
        file.CreateDir("stcasino")
        file.Write("stcasino/jacks_jackpot.txt", "0")
		file.Write("stcasino/lotterytab.txt", "[\"none\"]")
    end
	
	if cookie.GetNumber( "STLottery" ) == nil then
		cookie.Set( "STLottery", "0" )
	end
	
	local lottoTab = util.JSONToTable( file.Read( "stcasino/lotterytab.txt" ) )
	STC_LOTTERYPLY = lottoTab
	PrintTable( STC_LOTTERYPLY )
end)

--convienience function
local meta = FindMetaTable( "Player" )

function meta:CasinoPayout( m )

	if m < 0 then
		DarkRP.notify( self, 0, 5, "Spent $" .. -1 * m .. "." )
	elseif m > 0 then
		DarkRP.notify( self, 0, 5, "Gained $" .. m .. "." )
	else
		DarkRP.notify( self, 1, 5, "Gained no money." )
	end
	self:addMoney( m )

end

hook.Add( "PlayerSay", "STRunTheLotto", function(ply, txt)

	if (txt == ".lottery" or txt == ".lotto") and (ply:IsAdmin() or ply:IsSuperAdmin()) then
		STC_LOTTERYPLY = util.JSONToTable( file.Read( "stcasino/lotterytab.txt" ) )
		local randNum = math.random( 1, #STC_LOTTERYPLY )

		local ingame = false
		for k,v in pairs(player.GetAll()) do
			if v:SteamID() == STC_LOTTERYPLY[randNum] then
				PrintMessage( HUD_PRINTCENTER, v:Name() .. " just won the lottery with ticket #" .. randNum .. ", a total of $" .. cookie.GetNumber( "STLottery" ) .. "!" )
				v:addMoney( cookie.GetNumber( "STLottery" ) )
				DarkRP.notify( v, 0, 5, "You have won the lottery and gained $" .. cookie.GetNumber( "STLottery" ) )
				ingame = true
			end
		end
		if ingame == false then
			PrintMessage( HUD_PRINTCENTER, "An offline player just won the lottery with ticket #" .. randNum .. ", a total of $" .. cookie.GetNumber( "STLottery" ) .. "!" )
			util.SetPData( STC_LOTTERYPLY[randNum], "LotteryWinnings", cookie.GetNumber( "STLottery" ) )
		end
		
		STC_LOTTERYPLY = {}
		file.Write("stcasino/lotterytab.txt", "[\"none\"]")
		cookie.Set( "STLottery", "0" )
	end

end )

hook.Add( "KeyPress", "STPayOutOfflinePlayers", function( ply, key )
	if ( key == IN_FORWARD or key == IN_BACK or key == IN_RIGHT or key == IN_LEFT ) then
		if ply:GetPData( "LotteryWinnings" ) != "0" and ply:GetPData( "LotteryWinnings" ) != nil then
			ply:addMoney( tonumber(ply:GetPData( "LotteryWinnings" ) ) )
			DarkRP.notify( ply, 0, 5, "You won the lottery while offline. You won $" .. ply:GetPData( "LotteryWinnings" ) )
			ply:SetPData( "LotteryWinnings", 0 )
		end
	end
end )

--set up config file
if SERVER then
    AddCSLuaFile('stcasino_config.lua')
    include('stcasino_config.lua')
else	
	include('stcasino_config.lua')
end

MsgC( Color(0,255,0), "STCasino set up successfully!\n" )
MsgC( Color(0,255,0), "Jack's Pot currently has $" .. file.Read( "stcasino/jacks_jackpot.txt", "DATA" ) .. " in it.\n" )