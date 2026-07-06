-- AUTO-GENERATED: OP05-071 / 베포
-- rules_id=OP05-071 script_id=880000684 fingerprint=a1321ead2522d8935c3f4213504822ee8be7da9ae81c76676e13e0368a788dd7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-071]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LT_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】상대 필드의 두웅!! 수가 자신 필드의 두웅!! 수보다 많을 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-071]],
    schema_version=1,
  })
end
