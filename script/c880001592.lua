-- AUTO-GENERATED: OP13-020 / 주먹 운석
-- rules_id=OP13-020 script_id=880001592 fingerprint=62efb6f7824c7bc98024b3d73d30935c780f2d1b4a6ad85825b59903fdb26b76
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-020]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-5000,
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
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -5000.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-020]],
    schema_version=1,
  })
end
