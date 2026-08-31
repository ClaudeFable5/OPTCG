-- MANUAL: OP17-015 / 마르코 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-015]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REPLACE_LEAVE_FIELD]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_actions={
              {
                op=[[KO]],
                selector={
                  count=1,
                  kind=[[SELF]],
                  mode=[[ALL]],
                  owner=[[YOU]],
                },
              },
            },
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터가 상대의 효과로 필드를 벗어날 경우, 대신 이 캐릭터를 KO할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            source=[[TRASH]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 패에서 『흰 수염 해적단』을 포함한 특징을 가진 카드 1장을 버릴 수 있다：이 캐릭터 카드를 트래시에서 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-015]],
    schema_version=1,
  })
end
