-- AUTO-GENERATED: OP08-044 / 킹듀
-- rules_id=OP08-044 script_id=880001020 fingerprint=57ee6d70774616199ec5b8795aba2516fea3d53b69be09dd67764c9d747494f6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-044]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=2,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 2장을 공개할 수 있다: 이번 턴 동안, 이 캐릭터의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-044]],
    schema_version=1,
  })
end
