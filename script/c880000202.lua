-- AUTO-GENERATED: OP01-079 / 미스 올 선데이
-- rules_id=OP01-079 script_id=880000202 fingerprint=a5c5d8422e673d2d0929f33a4febce8dc26922a1f5757d25ceb5527b14019f1e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-079]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《바로크 워크스》 특징을 가진 경우, 자신의 트래시에서 이벤트를 1장까지 패에 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-079]],
    schema_version=1,
  })
end
