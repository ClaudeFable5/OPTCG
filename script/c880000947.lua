-- AUTO-GENERATED: OP07-092 / 요셉
-- rules_id=OP07-092 script_id=880000947 fingerprint=d0c451b02789e248c4dda5b138da94ee650406224bfaa57ef361d09fbcbea304
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-092]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=1,
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
            count=2,
            filter={
              trait_contains=[[CP]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 『CP』를 포함한 특징을 가진 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 상대의 코스트 1 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-092]],
    schema_version=1,
  })
end
