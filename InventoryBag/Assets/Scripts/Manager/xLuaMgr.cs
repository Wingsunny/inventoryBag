using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;

public class xLuaMgr :Singleton<xLuaMgr>
{
    LuaEnv env = null;
    private static string luaScriptsFolder = "LuaScripts";
    protected override void Awake()
    {
        base.Awake();
        InitLuaEnv();
    }

    private void InitLuaEnv()
    {
        env = new LuaEnv();
        env.AddLoader(LuaLoader);
    }

    public void EnterGame()
    {
        DoLuaFile("main");
    }

    public byte[] LuaLoader(ref string filepath)
    {
        string scriptPath = string.Empty;
        filepath = filepath.Replace(".", "/") + ".lua";
        scriptPath = Application.dataPath + "/" + luaScriptsFolder + "/" + filepath;

        if (File.Exists(scriptPath))
        {
            //Debug.Log(scriptPath);
            return SafeReadAllBytes(scriptPath);
        }

        return null;

    }
   

    public byte[] LuaLoaderFromAB(ref string filepath)
    {
        AssetBundle abPage = AssetBundle.LoadFromFile(Application.streamingAssetsPath + "/lua");
        TextAsset luaText = abPage.LoadAsset<TextAsset>(filepath + ".lua");
        if (luaText != null)
            return luaText.bytes;
        return null;
    }

    /// <summary>
    /// 读取文件
    /// </summary>
    /// <param name="fileName"></param>
    /// <returns></returns>
    public static byte[] SafeReadAllBytes(string fileName)
    {
        try
        {
            if (string.IsNullOrEmpty(fileName))
            {
                return null;
            }

            File.SetAttributes(fileName, FileAttributes.Normal);
            return File.ReadAllBytes(fileName);
        }
        catch (System.Exception ex)
        {
            Debug.LogError(string.Format("SafeReadAllBytes failed! path = {0} with err = {1}", fileName, ex.Message));
            return null;
        }
    }

    public void DoLuaFile(string fileName,string fromWhere = null)
    {
        string str = string.Format("require('{0}')", fileName);
        env.DoString(str);
    }

    //释放垃圾
    public void Tick()
    {
        env.Tick();
    }

    //销毁
    public void Dispose()
    {
        env.Tick();
        env.Dispose();
    }

}
