-- AUTO-GENERATED: OP05-006 / 코알라
-- rules_id=OP05-006 script_id=880000618 fingerprint=21ae7591c389813b80f76df0b741672bbc591a61695ded72a8c7f6bcf6296dde
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[혁명군]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《혁명군》 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-006]],
    schema_version=1,
  })
end
