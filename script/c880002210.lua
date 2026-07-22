-- AUTO-GENERATED: OP14-045 / 쿠로오비
-- rules_id=OP14-045 script_id=880002210 fingerprint=4f38262564f4ff747b9dce461d4b2d1b5fc390755b9a208fd5766e76c4849c5c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[효과로 자신의 패가 버려졌을 때, 이 캐릭터는, 이번 턴 동안, 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_HAND_DISCARDED_BY_TRAIT_EFFECT]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-045]],
    schema_version=1,
  })
end
