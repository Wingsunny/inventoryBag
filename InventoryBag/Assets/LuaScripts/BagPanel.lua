BagPanel={}

BagPanel.panelObj=nil
BagPanel.btnClose=nil
BagPanel.slots=nil

BagPanel.items={}

function BagPanel:Init(  )
	if self.panelObj==nil then
		self.panelObj=ABMgr:LoadRes("ui","BagPanel",typeof(GameObject))
		self.panelObj.transform:SetParent(Canvas,false)

		local btn=self.panelObj.transform:Find("ButtonBack")
		self.btnClose=btn:Find("CloseButton"):GetComponent(typeof(Button))

		self.slots=self.panelObj.transform:Find("Slots"):GetComponent(typeof(Image))

		self.btnClose.onClick:AddListener(function()
			self:Hide()
		end)
	end
end

function BagPanel:Show(  )
	self:Init()
	self.panelObj:SetActive(true)
end

function BagPanel:Hide(  )
	self.panelObj:SetActive(false)
end