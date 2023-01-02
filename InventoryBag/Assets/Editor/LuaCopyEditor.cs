using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

public class LuaCopyEditor : Editor
{
   [MenuItem("XLua/生成txt后缀的lua")]
   public static void CopyLuaToTxt()
    {
        string path = Application.dataPath + "/LuaScripts/";
        if (!Directory.Exists(path))
            return;
        string[] strs = Directory.GetFiles(path,"*.lua");

        string newPath = Application.dataPath + "/LuaText/";
        if (!Directory.Exists(newPath))
            Directory.CreateDirectory(newPath);
        else
        {
            string[] oldFileStrs = Directory.GetFiles(newPath, "*.txt");
            for (int i = 0; i < oldFileStrs.Length; ++i)
            {
                File.Delete(oldFileStrs[i]);
            }
        }
        List<string> newFileNames = new List<string>();
        string fileName;
        for (int i = 0; i < strs.Length; ++i)
        {
            fileName = newPath + strs[i].Substring(strs[i].LastIndexOf("/") + 1) + ".txt";
            newFileNames.Add(fileName);
            File.Copy(strs[i], fileName);
        }

        AssetDatabase.Refresh();

        for (int i = 0; i < newFileNames.Count; ++i)
        {
            AssetImporter importer = AssetImporter.GetAtPath(newFileNames[i].Substring(newFileNames[i].IndexOf("Assets")));
            if (importer != null)
                importer.assetBundleName = "lua";
        }
    }
}
