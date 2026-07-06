-- AUTO-GENERATED: OP09-015 / 럭키 루
-- rules_id=OP09-015 script_id=880001110 fingerprint=a3d9ec8dc2cfc297f48753eaab08ce788aafee9798dbcc631dfbcb253476ce65
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=6000,
              },
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
            trait=[[빨간 머리 해적단]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《빨간 머리 해적단》 특징을 가진 경우, 상대의 원래 파워 6000 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP09-015]],
    schema_version=1,
  })
end
