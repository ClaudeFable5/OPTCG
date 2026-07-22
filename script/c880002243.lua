-- AUTO-GENERATED: OP14-078 / 탄사
-- rules_id=OP14-078 script_id=880002243 fingerprint=45b8527552558139febf7ca90ac315494d80a45d47e75253cfe24e1658e0a9ab
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[돈키호테 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】두웅!!-1: 자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000. 그 후, 이번 턴 동안, 그 카드의 파워 +2000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-078]],
    schema_version=1,
  })
end
