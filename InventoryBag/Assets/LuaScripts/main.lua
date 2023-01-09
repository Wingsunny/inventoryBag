print("main")

require("Init")
require("ItemData")

require("PlayerData")

require("MainPanel")
require("BagPanel")
require("HealthPanel")
require("EquipPanel")
require("ItemGrid")
require("Player")

PlayerData:InitData()

MainPanel:Show()
BagPanel:Init(  )
HealthPanel:Init()
EquipPanel:Init()
