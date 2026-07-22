-- AUTO-GENERATED: OP14-022 / 우솝
-- rules_id=OP14-022 script_id=880002187 fingerprint=90d48440bfd6d7cf202e9b20662217feb8c29d2d792e3734b1bb0d0b23ea0abe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[FILM]],
              [[밀짚모자 일당]],
            },
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 리더가 《FILM》이나 《밀짚모자 일당》 특징을 가진 경우, 자신의 두웅!! 2장까지를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-022]],
    schema_version=1,
  })
end
