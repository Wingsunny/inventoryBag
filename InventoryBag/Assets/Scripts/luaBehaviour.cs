using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

[System.Serializable]
public class Item
{
    public int id;
    public int num;
}

[LuaCallCSharp]
public class luaBehaviour : MonoBehaviour
{
    public TextAsset luaScript;
    private LuaTable luaTable;

    public GameObject obj;

    internal static float lastGCTime = 0;
    internal const float GCInterval = 1;//1 second 

    public Item item;

    private Action luaStart;
    private Action luaUpdate;
    private Action luaOnDestroy;
    private Action luaTrigger;

    // Start is called before the first frame update
    void Awake()
    {
        string[] str=luaScript.name.Split('.');
        xLuaMgr.GetInstance().DoLuaFile(str[0]);
        luaTable = xLuaMgr.GetInstance().Global;
        luaTable.Get("start", out luaStart);
        luaTable.Get("update", out luaUpdate);
        luaTable.Get("trigger", out luaTrigger);
        luaTable.Get("ondestroy", out luaOnDestroy);
        luaTable.Set("item", item);
        luaTable.Set("obj", obj);
    }

    void Start()
    {
        if (luaStart != null)
        {
            luaStart();
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (luaUpdate != null)
        {
            luaUpdate();
        }
        if (Time.time - luaBehaviour.lastGCTime > GCInterval)
        {
            xLuaMgr.GetInstance().Tick();
            luaBehaviour.lastGCTime = Time.time;
        }
    }
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (luaTrigger != null)
        {
            luaTrigger();
        }
        
    }

    void OnDestroy()
    {
        if (luaOnDestroy != null)
        {
            luaOnDestroy();
        }
        luaOnDestroy = null;
        luaUpdate = null;
        luaStart = null;
        luaTable.Dispose();
    }

    
}
