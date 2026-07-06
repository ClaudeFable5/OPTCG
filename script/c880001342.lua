-- AUTO-GENERATED: OP11-008 / 돌
-- rules_id=OP11-008 script_id=880001342 fingerprint=6c30e9c784249447e9c880267d5e7dc91324207d8085a3eda3399144a78ec08b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-6000,
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
            trait=[[해군]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 자신의 리더가 《해군》 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -6000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-008]],
    schema_version=1,
  })
end
