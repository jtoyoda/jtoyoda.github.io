function hasEnoughShards() 
    local shardCountItem = Tracker:FindObjectForCode("shards")
    local shardCountMax = Tracker:FindObjectForCode("shardsRequired")
    local goalShardCount = shardCountMax.CurrentStage + 16
    print(shardCountItem.CurrentStage, goalShardCount)
    if shardCountItem.CurrentStage >= goalShardCount then
      return 1
    else 
      return 0
    end
end

function canBreakOrb()
  if Tracker.ActiveVariantUID == "shardHunt" then
    return hasEnoughShards()
  else
    return Tracker:FindObjectForCode("earthorb").Active and Tracker:FindObjectForCode("fireorb").Active and Tracker:FindObjectForCode("waterorb").Active and Tracker:FindObjectForCode("airorb").Active
  end
end