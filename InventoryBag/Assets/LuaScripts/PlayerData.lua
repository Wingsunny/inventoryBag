print("PlayerData")

PlayerData = {}
PlayerData.items = {}

Player={}
Player.obj=nil

function PlayerData:Init()
    Player.obj=ABMgr:LoadRes("player","player")

end

function PlayerData:InitData()
    table.insert(self.items,{id = 1,num = 1})
    table.insert(self.items,{id = 4,num = 1})
    table.insert(self.items,{id = 5,num = 1})
end
