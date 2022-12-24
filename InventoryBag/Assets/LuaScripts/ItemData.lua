print("data")
--º”‘ÿjson
local txt = ABMgr:LoadRes("json","ItemData",typeof(CS.UnityEngine.TextAsset))
print(txt.text)
local itemList = Json.decode(txt.text)
ItemData = {}
for _, value in pairs(itemList) do
    ItemData[value.id] = value
end