print("Player")

PlayerData = {}
PlayerData.items = {}

--�ṩһ����ʼ�������������޸�
function PlayerData:Init()
    table.insert(self.items,{id = 1,num = 1})
    table.insert(self.items,{id = 4,num = 1})
    table.insert(self.items,{id = 5,num = 1})
end

PlayerData:Init()