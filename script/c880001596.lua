-- AUTO-GENERATED: OP13-024 / 고든
-- rules_id=OP13-024 script_id=880001596 fingerprint=f54f959eb7cc0592e530dcfe8527695ee37334227f102521c2a5e167a7b290b3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait_any={
                [[음악]],
                [[FILM]],
              },
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 《음악》 또는 《FILM》 특징을 가진 카드 1장을 공개할 수 있다: 이번 턴 종료 시, 자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-024]],
    schema_version=1,
  })
end
