using UnityEditor;
using UnityEngine;
using System.IO;

public class ExportAssetBundls
{
    [MenuItem("Export/Build AssetBundles")]
    static void CreateAssetBundlesMain()
    {
        if (!Directory.Exists(Application.dataPath + "/StreamingAssets"))
            Directory.CreateDirectory(Application.dataPath + "/StreamingAssets");
        BuildPipeline.BuildAssetBundles("Assets/StreamingAssets", BuildAssetBundleOptions.DeterministicAssetBundle, BuildTarget.StandaloneWindows);

    }
}
