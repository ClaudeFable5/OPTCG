-- AUTO-GENERATED: OP12-048 / 돈키호테 로시난테
-- rules_id=OP12-048 script_id=880001501 fingerprint=7b77113161325b7ff8cc524e832371c909e6327c8bc10a6a96b9eb6546744938
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                op=[[REST_SELF]],
              },
              {
                count=1,
                op=[[TRASH_HAND]],
              },
            },
            selector={
              count=0,
              filter={
                color=[[BLUE]],
                trait=[[해군]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 청색인 《해군》 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 이 캐릭터를 레스트로 하고, 자신의 패 1장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-048]],
    schema_version=1,
  })
end
