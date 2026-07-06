-- AUTO-GENERATED: OP03-076 / 로브 루치
-- rules_id=OP03-076 script_id=880000442 fingerprint=e5696dcb359789b605712722ec078804aa64843d604ff50f3de986308f95e513
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-076]],
    compile_status=[[AUTO]],
    effects={
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
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신의 패 2장을 버릴 수 있다: 상대의 캐릭터가 KO 당했을 때, 이 리더를 액티브로 한다.]],
        timings={
          [[ON_OPPONENT_CHARACTER_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-076]],
    schema_version=1,
  })
end
