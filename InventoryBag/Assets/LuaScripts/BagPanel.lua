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

		self.slots=self.panelObj.transform:Find("Slots")
		self.btnClose.onClick:AddListener(function()
			self:Hide()
		end)
	end
end

function BagPanel:Show(  )
	self:Init()
	self.panelObj:SetActive(true)

	for i=1,#self.items do
		self.items[i]:Destroy()
	end
	self.items={}

	local nowItems = PlayerData.items
	for i=1,#nowItems do
		local grid=ItemGrid:new()
		grid:Init(self.slots)
		grid:InitData(nowItems[i])
		table.insert(self.items,grid)
	end

	for i=1,24-#nowItems do
		local grid=ItemGrid:new()
		grid:InitEmpty(self.slots)
		table.insert(self.items,grid)
	end
end

function BagPanel:Hide(  )
	self.panelObj:SetActive(false)
end