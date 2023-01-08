Object:subClass("ItemGrid")
ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.Text = nil
ItemGrid.itemData=nil
ItemGrid.index=nil

function ItemGrid:Init(father)
    --self.obj = ABMgr:LoadRes("ui","slot")
    local slot=Resources.Load("UI/slot")
	self.obj=Instantiate(slot)
    self.obj.transform:SetParent(father,false)
    self.imgIcon = self.obj.transform:Find("Item/Image"):GetComponent(typeof(Image))
    self.Text = self.obj.transform:Find("Item/Text"):GetComponent(typeof(Text))
    self.obj:GetComponent(typeof(Button)).onClick:AddListener(function()
		BagPanel:ShowDetail(self.itemData,self.index)
	end)
end

function ItemGrid:InitEmpty( father )
	--self.obj=ABMgr:LoadRes("ui","emptySlot")
    local slot=Resources.Load("UI/emptySlot")
	self.obj=Instantiate(slot)
    self.obj.transform:SetParent(father,false)
end

function ItemGrid:InitData(data,i)
    self.itemData = ItemData[data.id]
    local strs = string.split(self.itemData.icon,"_")
    --local spriteAtlas = ABMgr:LoadRes("ui",strs[1],typeof(SpriteAtlas))
    local spriteAtlas = Resources.Load("Sprite/Icon")
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
    self.Text.text = data.num
    self.index=i
end


function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end