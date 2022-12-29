print("main")

require("Init")
require("ItemData")

require("PlayerData")
PlayerData:Init()

require("MainPanel")
require("BagPanel")
require("HealthPanel")
require("EquipPanel")
require("ItemGrid")
MainPanel:Show()
HealthPanel:Init()
EquipPanel:Init()
