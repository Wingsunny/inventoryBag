MainPanel={}

MainPanel.panelObj=nil
MainPanel.btnBag=nil

function MainPanel:Init(  )
	self.panelObj=ABMgr:LoadRes("ui","ButtonPanel",typeof(GameObject))
	self.panelObj.transform:SetParent(Canvas,false)

	self.btnBag=self.panelObj.transform:Find("BagButton"):GetComponent(typeof(Button))
	self.btnBag.onClick:AddListener(function()
		self:btnBagClick()
	end)
end

function MainPanel:Show(  )
	self:Init()
	self.panelObj:SetActive(true)
end

function MainPanel:Hide(  )
	self.panelObj:SetActive(false)
end

function MainPanel:btnBagClick(  )
	BagPanel:Show()
end