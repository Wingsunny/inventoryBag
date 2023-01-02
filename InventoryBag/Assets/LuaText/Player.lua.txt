local speed = 10

function start()
	print("lua start...")
end

function update()	
	local Input = CS.UnityEngine.Input;
	local horizontal = Input.GetAxis("Horizontal");
	local verticla = Input.GetAxis("Vertical");
	
	local x = horizontal*speed*CS.UnityEngine.Time.deltaTime
	local y = verticla*speed*CS.UnityEngine.Time.deltaTime
	
	self.transform:Translate(x,y,0)
end

function ondestroy(  )
	print("lua destroy")
end