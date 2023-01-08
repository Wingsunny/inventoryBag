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
        Object player = Resources.Load("Player/player");
        Instantiate(player);
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
