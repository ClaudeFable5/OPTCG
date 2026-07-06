-- AUTO-GENERATED: OP01-032 / 아슈라 동자
-- rules_id=OP01-032 script_id=880000155 fingerprint=20f5fffabafa07761d9dd4b3c1504bac731abe98fa6c9d132b497c8be3642f86
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=2,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[OPPONENT]],
            state=[[RESTED]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】상대의 레스트 상태인 캐릭터가 2장 이상인 경우, 이 캐릭터의 파워 +2000.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-032]],
    schema_version=1,
  })
end
