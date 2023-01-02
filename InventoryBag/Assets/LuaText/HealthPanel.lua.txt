HealthPanel={}

HealthPanel.panelObj=nil
HealthPanel.healthBar=nil
HealthPanel.healthText=nil

function HealthPanel:Init(  )
	if self.panelObj==nil then
		self.panelObj=ABMgr:LoadRes("ui","HealthPanel",typeof(GameObject))
		self.panelObj.transform:SetParent(Canvas,false)
		self.healthBar=self.panelObj.transform:Find("HealthImage"):GetComponent(typeof(Image))
		self.healthText=self.panelObj.transform:Find("HealthText"):GetComponent(typeof(Text))
	end
end

function HealthPanel:ChangeHealth()
	self.healthBar.FillAmount=0.9
	self.healthText:SetText("9/10")
end
