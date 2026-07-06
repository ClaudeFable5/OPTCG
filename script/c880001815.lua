-- AUTO-GENERATED: ST06-016 / 화이트 아웃
-- rules_id=ST06-016 script_id=880001815 fingerprint=a1282efb692a87743d9ffef37fc76891c21a60751f3d2a61dd8820d1ab12a665
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST06-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            op=[[CANNOT_BE_KO]],
            reason=[[ANY]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑고, 이번 턴 동안, 자신의 캐릭터는 KO당하지 않는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST06-016]],
    schema_version=1,
  })
end
