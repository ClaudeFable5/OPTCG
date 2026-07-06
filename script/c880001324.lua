-- AUTO-GENERATED: OP10-109 / 바질 호킨스
-- rules_id=OP10-109 script_id=880001324 fingerprint=06c4ed2b309f3bfd3b7f098a79f8d8dcfe6b110d475750f7a7c7f15c281cb422
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-109]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 라이프 위에서 1장까지를 트래시로 보낸다.]],
        timings={
          [[ON_KO]],
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
    rules_id=[[OP10-109]],
    schema_version=1,
  })
end
