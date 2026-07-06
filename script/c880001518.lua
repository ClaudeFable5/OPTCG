-- AUTO-GENERATED: OP12-065 / 엠포리오 이반코프
-- rules_id=OP12-065 script_id=880001518 fingerprint=5bd4a2bd6bb23e79ee6e5bb58fbecfa3f1eb64b0ad763d88556dc6ae5cb4e1a3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
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
            count=4,
            filter={
              card_type=[[EVENT]],
            },
            op=[[TRASH_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에 이벤트가 4장 이상인 경우, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[EVENT]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 트래시에서 이벤트를 1장까지 패에 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-065]],
    schema_version=1,
  })
end
