-- AUTO-GENERATED: EB04-043 / 카쿠
-- rules_id=EB04-043 script_id=880002464 fingerprint=f4851638efcd04f6029ca7736123112462bbdf461ec0dec7f70858438c0356cb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                count=3,
                op=[[RETURN_TRASH_TO_DECK_BOTTOM]],
                order=[[CHOOSE]],
              },
            },
            selector={
              count=1,
              filter={
                base_cost_lte=5,
                color=[[BLACK]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 원래 코스트 5 이하인 흑색 캐릭터가 상대의 효과로 KO될 경우, 대신 자신의 트래시에서 카드 3장을 원하는 순서대로 덱 맨 아래에 놓을 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 2장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-043]],
    schema_version=1,
  })
end
