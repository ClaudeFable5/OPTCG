-- MANUAL: OP16-107 / 지저스 바제스 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-107]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[OWNER_HAND]],
            mode=[[UP_TO]],
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】 상대의 라이프 위에서 1장까지를 소유자의 패에 넣는다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】 자신의 패 1장을 버릴 수 있다：이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-107]],
    schema_version=1,
  })
end
