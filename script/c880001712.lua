-- AUTO-GENERATED: ST01-002 / 우솝
-- rules_id=ST01-002@e93a65569f3e script_id=880001712 fingerprint=e93a65569f3eff9bbb66b22c2a647e1dbd84806cf3d4462e0cfd23d2288da187
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST01-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            filter={
              power_gte=5000,
            },
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】이번 배틀 중, 상대는 파워 5000 이상인 캐릭터의 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST01-002@e93a65569f3e]],
    schema_version=1,
  })
end
