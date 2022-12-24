print("Player启动")

Player = {}
Player.items = {}

--提供一个初始化方法，方便修改
function Player:Init()
    table.insert(self.items,{id = 1,num = 1})
    table.insert(self.items,{id = 4,num = 1})
    table.insert(self.items,{id = 5,num = 1})
end

Player:Init()