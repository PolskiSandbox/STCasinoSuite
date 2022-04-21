AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

util.AddNetworkString("OpenSTCasinoMenu5")
util.AddNetworkString("SendSTCasinoMoney")

local useCall = nil

function ENT:Initialize()
	
	self:SetModel( "models/props_trainstation/payphone001a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)
	self:SetNWEntity("claimer", nil)
end


function ENT:Use(activator, caller)
	if caller:getDarkRPVar( "money" ) >= (STC_CONFIG.WildCallPrice) then	
		useCall = caller
		self:EmitSound("ambient/office/coinslot1.wav")
		caller:CasinoPayout( -STC_CONFIG.WildCallPrice )

		net.Start("OpenSTCasinoMenu5")
		net.Send(caller)
	else DarkRP.notify( caller, 1, 5, "You don't have enough money!" )
	end
end

net.Receive( "SendSTCasinoMoney", function(len, ply)

	local result = net.ReadString()
	if ply == useCall then
		if result == "double" then
			ply:CasinoPayout( STC_CONFIG.WildCallDouble )
		elseif result == "single" then
			ply:CasinoPayout( STC_CONFIG.WildCallSingle )
		else
			ply:CasinoPayout( 0 )
		end
		useCall = nil
	end

end )