-- AUTO-GENERATED: OP13-104 / 코즈키 히요리
-- rules_id=OP13-104 script_id=880001676 fingerprint=31c9a289e2f48f9ed71bb30d43f1064ced33418a8be1db1998a534f64845e149
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-104]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패 1장을 버릴 수 있다: 자신의 리더가 다색인 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP13-104]],
    schema_version=1,
  })
end
