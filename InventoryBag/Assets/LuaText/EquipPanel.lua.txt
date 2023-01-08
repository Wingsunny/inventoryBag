EquipPanel={}

EquipPanel.panelObj=nil
EquipPanel.equipImage=nil
EquipPanel.equip=nil

function EquipPanel:Init(  )
	if self.panelObj==nil then
		--self.panelObj=ABMgr:LoadRes("ui","EquipPanel",typeof(GameObject))
		local panel=Resources.Load("UI/EquipPanel")
		self.panelObj=Instantiate(panel)
		self.panelObj.transform:SetParent(Canvas,false)

		self.equipImage=self.panelObj.transform:Find("EquipmentImage"):GetComponent(typeof(Image))
		self.equip=self.panelObj.transform:Find("EquipmentImage"):GetComponent(typeof(Transform))
		self.equip.gameObject:SetActive(false)

		self.panelObj:GetComponent(typeof(Button)).onClick:AddListener(function()
			self:UnEquip(  )
		end)
	end
end

--装备
function EquipPanel:Equip( id )
	self.equip.gameObject:SetActive(true)

	local itemData = ItemData[id]
    local strs = string.split(itemData.icon,"_")
    local spriteAtlas = Resources.Load("Sprite/Icon")
    self.equipImage.sprite = spriteAtlas:GetSprite(strs[2])
end

--卸载装备
function EquipPanel:UnEquip(  )
	self.equip.gameObject:SetActive(false)
	PlayerData:Equip(nil)
end

