-- AUTO-GENERATED: OP05-112 / 맥킨리 대장
-- rules_id=OP05-112 script_id=880000725 fingerprint=042ea2f603f4b23fd47e51a111aeafb24efb7a2919499be23e59c252f10004be
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=1,
              trait=[[하늘섬]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 코스트 1인 《하늘섬》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-112]],
    schema_version=1,
  })
end
