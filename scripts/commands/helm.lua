-----------------------------------------------------------------------
-- func: Tells a player their HELM skill levels
-- !helm
-----------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function onTrigger(player)
    local miningSkill = player:getCharVar("MiningSkill")
    local loggingSkill = player:getCharVar("LoggingSkill")
    local harvestingSkill = player:getCharVar("HarvestingSkill")
    player:PrintToPlayer("Mining Skill: " .. miningSkill, 6, 0)
    player:PrintToPlayer("Logging Skill: " .. loggingSkill, 6, 0)
    player:PrintToPlayer("Harvesting Skill: " .. harvestingSkill, 6, 0)
end
