-- AUTO-GENERATED: OP05-007 / 사보
-- rules_id=OP05-007 script_id=880000619 fingerprint=c8f9c0836e4d604b7c1142c26ecfce09419222ee2f4ece02c71106132e57e9db
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
              filter={
                power_sum_lte=4000,
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
        source_text=[[【등장 시】상대의 캐릭터 2장까지를 파워의 합계가 4000 이하가 되도록 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-007]],
    schema_version=1,
  })
end
