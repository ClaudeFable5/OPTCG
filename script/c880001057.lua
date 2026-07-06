-- AUTO-GENERATED: OP08-081 / 게르니카
-- rules_id=OP08-081 script_id=880001057 fingerprint=9a5a19e510cd9e4a55096282a8aa63108c9b095643a20ebbe7adad7afb9e01aa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-081]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_eq=0,
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
            count=3,
            filter={
              trait_contains=[[CP]],
            },
            op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
            order=[[CHOOSE]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 트래시에서 『CP』를 포함한 특징을 가진 카드 3장을 원하는 순서대로 덱 맨 아래로 되돌릴 수 있다: 상대의 코스트 0인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-081]],
    schema_version=1,
  })
end
