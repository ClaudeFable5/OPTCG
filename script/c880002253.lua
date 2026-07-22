-- AUTO-GENERATED: OP14-088 / 미스 메리크리스마스(드로피)
-- rules_id=OP14-088 script_id=880002253 fingerprint=698d77acc09ae2762139be9b197c4e71ba67a0b559b9438001eb661aaf524ac7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-088]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_eq=1,
              },
              kind=[[STAGE]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 『바로크 워크스』를 포함한 특징을 가진 경우, 카드를 1장 뽑고, 상대의 코스트 1인 스테이지 1장까지를 KO 시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-088]],
    schema_version=1,
  })
end
