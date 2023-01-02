EquipPanel={}

EquipPanel.panelObj=nil
EquipPanel.equip=nil

function EquipPanel:Init(  )
	if self.panelObj==nil then
		self.panelObj=ABMgr:LoadRes("ui","EquipPanel",typeof(GameObject))
		self.panelObj.transform:SetParent(Canvas,false)
		self.equip=self.panelObj.transform:Find("EquipmentImage"):GetComponent(typeof(Image))
	end
end

function EquipPanel:Equip(  )
	self.equip:SetActive(true)
end
function EquipPanel:UnEquip(  )
	self.equip:SetActive(false)
end