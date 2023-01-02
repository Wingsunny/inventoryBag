Object:subClass("ItemGrid")
ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.Text = nil
ItemGrid.itemData=nil

function ItemGrid:Init(father)
    self.obj = ABMgr:LoadRes("ui","slot")
    self.obj.transform:SetParent(father,false)
    local item=self.obj.transform:Find("Item")
    self.imgIcon = item:Find("Image"):GetComponent(typeof(Image))
    self.Text = item:Find("Text"):GetComponent(typeof(Text))
end

function ItemGrid:InitEmpty( father )
	self.obj=ABMgr:LoadRes("ui","emptySlot")
    self.obj.transform:SetParent(father,false)
end


function ItemGrid:InitData(data)
    itemData = ItemData[data.id]
    local strs = string.split(itemData.icon,"_")
    local spriteAtlas = ABMgr:LoadRes("ui",strs[1],typeof(SpriteAtlas))
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
    self.Text.text = data.num
end


function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end