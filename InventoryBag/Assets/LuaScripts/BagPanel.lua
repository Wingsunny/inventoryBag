BagPanel={}

BagPanel.panelObj=nil
BagPanel.btnClose=nil
BagPanel.slots=nil

moneyText=nil

local detail={}
detail.obj=nil
detail.name=nil
detail.desc=nil
detail.index=nil

BagPanel.items={}

--初始化
function BagPanel:Init(  )
	if self.panelObj==nil then
		--self.panelObj=ABMgr:LoadRes("ui","BagPanel",typeof(GameObject))
		local panel=Resources.Load("UI/BagPanel")
		self.panelObj=Instantiate(panel)
		self.panelObj.transform:SetParent(Canvas,false)

		self.slots=self.panelObj.transform:Find("Slots")

		self.btnClose=self.panelObj.transform:Find("ButtonBack/CloseButton"):GetComponent(typeof(Button))
		self.btnClose.onClick:AddListener(function()
			self:Hide()
		end)

		moneyText=self.panelObj.transform:Find("coin/moneyText"):GetComponent(typeof(Text))
		moneyText.text=PlayerData.wealth

		detail.obj=self.panelObj.transform:Find("DescriptionPanel"):GetComponent(typeof(Transform))
		detail.name=self.panelObj.transform:Find("DescriptionPanel/ItemName"):GetComponent(typeof(Text))
		detail.desc=self.panelObj.transform:Find("DescriptionPanel/ItemDescription"):GetComponent(typeof(Text))
		self.panelObj.transform:Find("DescriptionPanel/SellButton"):GetComponent(typeof(Button)).onClick:AddListener(function()
			self:SellItem()
		end)

		self.panelObj.transform:Find("DescriptionPanel/UseButton"):GetComponent(typeof(Button)).onClick:AddListener(function()
			self:SubItem()
		end)
	end
end

--显示
function BagPanel:Show(  )
	self:Init()
	self.panelObj:SetActive(true)

	BagPanel:RefreshBag( )
end

--点击显示详情
function BagPanel:ShowDetail( itemData,i )
	detail.name.text=itemData.name
	detail.desc.text=itemData.desc
	detail.index=i
end

--修改钱数
function BagPanel:ChangeWealthText( wealth )
	moneyText.text=wealth
end

--更新背包
function BagPanel:RefreshBag( )
	for i=1,#self.items do
		self.items[i]:Destroy()
	end
	self.items={}

	local nowItems = PlayerData.items

	if #nowItems==0 then
		detail.obj.gameObject:SetActive(false)
	else
		detail.obj.gameObject:SetActive(true)
	end

	for i=1,#nowItems do
		local grid=ItemGrid:new()
		grid:Init(self.slots)
		grid:InitData(nowItems[i],i)
		table.insert(self.items,grid)
		if i==1 then
			self.items[i].obj:GetComponent(typeof(Button)).onClick:Invoke()
		end
	end

	for i=1,24-#nowItems do
		local grid=ItemGrid:new()
		grid:InitEmpty(self.slots)
		table.insert(self.items,grid)
	end
end

--增加物品
function BagPanel:AddItem( item )
	local isNotContain=true
	for i=1,#PlayerData.items do
		if PlayerData.items[i].id== item.id then
			PlayerData.items[i].num=PlayerData.items[i].num+1
			isNotContain=false
		end
	end
	if isNotContain then
		table.insert(PlayerData.items,item)	
	end
	self:RefreshBag( )
end

--使用物品
function BagPanel:SubItem(  )
	if ItemData[PlayerData.items[detail.index].id].type == 2 then
		PlayerData:ChangeHealth(1)
		PlayerData.items[detail.index].num=PlayerData.items[detail.index].num-1
		
		if PlayerData.items[detail.index].num==0 then
			table.remove(PlayerData.items,detail.index)
			self:RefreshBag( )
		else
			self.items[detail.index]:InitData(PlayerData.items[detail.index],detail.index)
		end
		
	elseif ItemData[PlayerData.items[detail.index].id].type == 1 then
		PlayerData:Equip(PlayerData.items[detail.index])
		PlayerData.items[detail.index].num=PlayerData.items[detail.index].num-1
		if PlayerData.items[detail.index].num==0 then
			table.remove(PlayerData.items,detail.index)
			self:RefreshBag( )
		else
			self.items[detail.index]:InitData(PlayerData.items[detail.index],detail.index)
		end
	else
		print("can't use!'")
	end
end

--出售物品
function BagPanel:SellItem(  )
	PlayerData:ChangeWealth(ItemData[PlayerData.items[detail.index].id].price)	
	PlayerData.items[detail.index].num=PlayerData.items[detail.index].num-1
	if PlayerData.items[detail.index].num==0 then
		table.remove(PlayerData.items,detail.index)
	end
	self:RefreshBag( )
end

--隐藏面板
function BagPanel:Hide(  )
	self.panelObj:SetActive(false)
end
