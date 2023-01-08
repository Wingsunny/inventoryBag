print("PlayerData")

PlayerData = {}
PlayerData.items = {}
PlayerData.equip=nil
PlayerData.wealth=nil
PlayerData.maxHealth=nil
PlayerData.curHealth=nil

function PlayerData:InitData()
    table.insert(self.items,{id = 1,num = 2})
    table.insert(self.items,{id = 4,num = 2})
    table.insert(self.items,{id = 5,num = 2})

    PlayerData.wealth=20

    PlayerData.maxHealth=10
    PlayerData.curHealth=8
end

function PlayerData:ChangeHealth(healthNum)
    PlayerData.curHealth=PlayerData.curHealth+healthNum
    HealthPanel:ChangeHealthText(PlayerData.curHealth,PlayerData.maxHealth)
end

function PlayerData:ChangeWealth(wealthNum)
    PlayerData.wealth=PlayerData.wealth+wealthNum
    BagPanel:ChangeWealthText(PlayerData.wealth)
end

function PlayerData:Equip(equipment)
    if equipment==nil then
        PlayerData.equip.num=1
        BagPanel:AddItem(PlayerData.equip)
        PlayerData.equip=nil
    else
        PlayerData.equip=equipment
        
        EquipPanel:Equip(PlayerData.equip.id)
        
    end
end