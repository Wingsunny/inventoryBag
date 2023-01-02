local imgIcon = nil
local text = nil

function start(  )
	imgIcon = Image:GetComponent(typeof(CS.UnityEngine.UI.Image))
    text = Text:GetComponent(typeof(CS.UnityEngine.UI.Text))
end



function click(  )
	print(imgIcon.sprite.name,":",text.text)
end
