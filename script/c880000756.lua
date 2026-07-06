-- AUTO-GENERATED: OP06-022 / 야마토
-- rules_id=OP06-022 script_id=880000756 fingerprint=449ef4eb0d74c895e3abcc15be50f0e33323bc653be351889f1a8cc93fb97c02
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-022]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】상대의 라이프가 3장 이하인 경우, 자신의 캐릭터 1장에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={
      [[DOUBLE_ATTACK]],
    },
    rules_id=[[OP06-022]],
    schema_version=1,
  })
end
