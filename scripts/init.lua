--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")
print("Starting up scipts")

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/hosted_items.json")
Tracker:AddItems("items/flags.json")
if Tracker.ActiveVariantUID == "shardHunt" or Tracker.ActiveVariantUID == "shardHuntNoMap" then
  Tracker:AddItems("shardHunt/shards.json")
end

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/logic.lua")
Tracker:AddLocations("locations/locations.json")
Tracker:AddLocations("locations/incentives.json")

Tracker:AddLayouts("layouts/shared.json")
if Tracker.ActiveVariantUID == "shardHunt" then
  Tracker.AllowResize = true
  Tracker:AddLayouts("shardHunt/tracker.json")
  Tracker:AddLayouts("shardHunt/broadcast.json")
elseif Tracker.ActiveVariantUID == "shardHuntNoMap" then
  Tracker.AllowResize = false
  Tracker:AddLayouts("shardHuntNoMap/tracker.json")
  Tracker:AddLayouts("shardHunt/broadcast.json")
elseif Tracker.ActiveVariantUID == "standardNoMap" then
  Tracker.AllowResize = false
  Tracker:AddLayouts("standardNoMap/tracker.json")
  Tracker:AddLayouts("layouts/standard_broadcast.json")
else
  Tracker.AllowResize = true
  Tracker:AddLayouts("layouts/tracker.json")
  Tracker:AddLayouts("layouts/standard_broadcast.json")
end

Tracker.DisplayAllLocations = PREFERENCE_DISPLAY_ALL_LOCATIONS

if _VERSION == "Lua 5.3" then
  print("Your tracker version supports autotracking!")
  ScriptHost:LoadScript("scripts/autotracking.lua")
else
  print("Your tracker version does not support autotracking")
end
