-- AUTO-GENERATED: OP13-034 / 브룩
-- rules_id=OP13-034 script_id=880001606 fingerprint=91705a5bbb7cc1c092f3c944038ac5c846160d80a39cbaf9b7a1083645dc7be0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
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
        source_text=[[【등장 시】자신의 리더가 《FILM》 또는 《밀짚모자 일당》 특징을 가진 경우, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-034]],
    schema_version=1,
  })
end
