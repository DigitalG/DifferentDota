function OnAttackLanded(keys)
local caster = keys.caster
local ability = keys.ability
local target = keys.target

local target_teams = ability:GetAbilityTargetTeam()
local target_types = ability:GetAbilityTargetType()
local target_flags = ability:GetAbilityTargetFlags()

local radius = ability:GetLevelSpecialValueFor("radius", ability:GetLevel() - 1)
local damage_mod = ability;GetLevelSpecialValueFor("damage_mod", ability:GetLevel() -1)
local target_location = target:GetAbsOrigin()

local found_targets = FindUnitsInRadius(caster:GetTeamNumber(), target_location, nil, radius, target_teams, target_types, target_flags, FIND_CLOSEST, false)
local damage_dealt = keys.dmage_dealt

	local damage_table = {}
	damage_table.attacker = caster
	damage_table.ability = ability
	damage_table.damage_type = ability:GetAbilityDamageType() 
	damage_table.damage = damage_dealt*damage_mod/100

	for _,hero in pairs(found_targets) do
		if hero ~= target then
			damage_table.victim = hero
			ApplyDamage(damage_table)
		end
	end

end

