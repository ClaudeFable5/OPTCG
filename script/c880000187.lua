-- AUTO-GENERATED: OP01-064 / 알비다
-- rules_id=OP01-064 script_id=880000187 fingerprint=03ef1fedf7d7aed708c402672b555091297c35a3cea69015b03ba702f5331e33
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-064]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패 1장을 버릴 수 있다: 상대의 코스트 3 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-064]],
    schema_version=1,
  })
end
