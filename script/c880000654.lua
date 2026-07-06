-- AUTO-GENERATED: OP05-042 / 잇쇼
-- rules_id=OP05-042 script_id=880000654 fingerprint=317ea36071c37e5813ed1e7b1f7c82092c88f3839d26c62f9ef235fc0dcb241e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              filter={
                cost_lte=7,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】다음 자신의 턴 개시 시까지, 상대의 코스트 7 이하인 캐릭터 1장까지는 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-042]],
    schema_version=1,
  })
end
