function OnThink( keys )
local caster = keys.caster

local target_teams = ability:GetAbilityTargetTeam()
local target_types = ability:GetAbilityTargetType()
local target_flags = ability:GetAbilityTargetFlags()
local target_location = caster.smoke_screen_point
local area_of_effect = ability:GetLevelSpecialValueFor("radius", ability:GetLevel() - 1)


local found_targets = FindUnitsInRadius(caster:GetTeamNumber(), target_location, nil, area_of_effect, target_teams, target_types, target_flags, FIND_CLOSEST, false)
	

end

function OnSpellStart(keys)
keys.caster.smoke_screen_point = keys.ability:GetCursorPosition()


end