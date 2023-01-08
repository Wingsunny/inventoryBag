HealthPanel={}

HealthPanel.panelObj=nil
HealthPanel.healthBar=nil
HealthPanel.healthText=nil

function HealthPanel:Init(  )
	if self.panelObj==nil then
		--self.panelObj=ABMgr:LoadRes("ui","HealthPanel",typeof(GameObject))
		local panel=Resources.Load("UI/HealthPanel")
		self.panelObj=Instantiate(panel)
		self.panelObj.transform:SetParent(Canvas,false)
		self.healthBar=self.panelObj.transform:Find("HealthImage"):GetComponent(typeof(Image))
		self.healthText=self.panelObj.transform:Find("HealthText"):GetComponent(typeof(Text))
		
		HealthPanel.healthBar.fillAmount=PlayerData.curHealth/PlayerData.maxHealth
		HealthPanel.healthText.text=PlayerData.curHealth .."/"..PlayerData.maxHealth
	end
end

function HealthPanel:ChangeHealthText(curHealth,maxHealth)
	HealthPanel.healthBar.fillAmount=curHealth/maxHealth
	HealthPanel.healthText.text=curHealth .."/"..maxHealth
end
