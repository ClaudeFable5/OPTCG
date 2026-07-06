-- AUTO-GENERATED: OP07-080 / 카쿠
-- rules_id=OP07-080 script_id=880000935 fingerprint=ad4dfaceaf61e370c7a04ebd1496602edbe51b5e27e23a5de95397c79dee147e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
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
        source_text=[[【등장 시】자신의 트래시에서 『CP』를 포함한 특징을 가진 카드 2장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -3.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-080]],
    schema_version=1,
  })
end
