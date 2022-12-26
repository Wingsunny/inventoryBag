print("Player")

PlayerData = {}
PlayerData.items = {}

--提供一个初始化方法，方便修改
function PlayerData:Init()
    table.insert(self.items,{id = 1,num = 1})
    table.insert(self.items,{id = 4,num = 1})
    table.insert(self.items,{id = 5,num = 1})
end

PlayerData:Init()