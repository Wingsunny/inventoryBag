using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameStart : Singleton<GameStart>
{
    protected override void Awake()
    {
        base.Awake();
        //≥ı ºªØ
        this.gameObject.AddComponent<xLuaMgr>();
    }

    private void Start()
    {
        StartCoroutine(StartGame());
    }

    IEnumerator checkHotUpdate()
    {
        yield return null;
    }

    IEnumerator StartGame()
    {
        yield return this.StartCoroutine(this.checkHotUpdate());
        xLuaMgr.Instance.EnterGame();
    }
}
