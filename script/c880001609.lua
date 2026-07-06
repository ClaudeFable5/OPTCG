-- AUTO-GENERATED: OP13-037 / 롤로노아 조로
-- rules_id=OP13-037 script_id=880001609 fingerprint=d1d20325d11ba3de59d22632b8194990fa68a7eec301c7fabebf1556b2741890
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-037]],
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
        source_text=[[【등장 시】자신의 리더가 《FILM》 또는 《밀짚모자 일당》 특징을 가진 경우, 자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】이 캐릭터를 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-037]],
    schema_version=1,
  })
end
