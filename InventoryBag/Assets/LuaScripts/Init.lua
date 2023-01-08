print("Init")

require("Object")

require("SplitTools")

Json = require("JsonUtility")

GameObject = CS.UnityEngine.GameObject
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
TextAsset = CS.UnityEngine.TextAsset
Resources=CS.UnityEngine.Resources
Instantiate=CS.UnityEngine.Object.Instantiate

SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas

Vector2 = CS.UnityEngine.Vector2

UI = CS.UnityEngine.UI
Image = UI.Image
Text = UI.Text
Button = UI.Button

Canvas = GameObject.Find("Canvas").transform

--ABMgr=CS.ABMgr.GetInstance()