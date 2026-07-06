-- AUTO-GENERATED: OP01-044 / 샤치
-- rules_id=OP01-044 script_id=880000167 fingerprint=56a710f39ef5f7077c4ae49e530bab8dc7f6fa5ff213580b2faee1df95852558
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[펭귄]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[펭귄]],
            op=[[CHARACTER_NAME_ABSENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 「펭귄」이 없을 경우, 자신의 패에서 「펭귄」을 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-044]],
    schema_version=1,
  })
end
