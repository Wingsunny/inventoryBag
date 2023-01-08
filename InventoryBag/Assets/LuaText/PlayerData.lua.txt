print("PlayerData")

PlayerData = {}
PlayerData.items = {}

function PlayerData:InitData()
    table.insert(self.items,{id = 1,num = 1})
    table.insert(self.items,{id = 4,num = 1})
    table.insert(self.items,{id = 5,num = 1})
end
