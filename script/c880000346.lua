-- AUTO-GENERATED: OP02-101 / 스트로베리
-- rules_id=OP02-101 script_id=880000346 fingerprint=ab426a3a8762720a653dafb1c0d24026f5a42ab4291f41c5193b89c033dc777b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-101]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            filter={
              cost_lte=5,
            },
            op=[[PREVENT_BLOCKER_ACTIVATION]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            filter={
              cost_eq=0,
            },
            op=[[CHARACTER_EXISTS]],
            player=[[ANY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】코스트 0인 캐릭터가 있을 경우, 이번 배틀 동안, 상대는 코스트 5 이하인 캐릭터의 【블로커】를 발동할 수 없다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-101]],
    schema_version=1,
  })
end
