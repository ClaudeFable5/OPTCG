-- AUTO-GENERATED: EB01-060 / 내가 신이다
-- rules_id=EB01-060 script_id=880000060 fingerprint=a81ee5c45b570e8b95aa119e16edf17e9b0a385eae1aed0ad8d46ecdfb2b2d68
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=7,
              name=[[에넬]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND_OR_TRASH]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            from=[[TOP]],
            op=[[TRASH_LIFE_UNTIL]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 패 또는 트래시에서 코스트 7 이하인 「에넬」을 1장까지 등장시킨다. 그 후, 자신의 라이프가 1장이 되도록 라이프 위에서부터 트래시로 보낸다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-060]],
    schema_version=1,
  })
end
