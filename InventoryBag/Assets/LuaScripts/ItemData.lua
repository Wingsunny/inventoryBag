print("data")
--º”‘ÿjson

--local txt = ABMgr:LoadRes("json","ItemData",typeof(CS.UnityEngine.TextAsset))
local txt = Resources.Load("Data/ItemData")

local itemList = Json.decode(txt.text)
ItemData = {}
for _, value in pairs(itemList) do
    ItemData[value.id] = value
end