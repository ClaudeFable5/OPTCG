-- AUTO-GENERATED: OP12-066 / 카르네
-- rules_id=OP12-066 script_id=880001519 fingerprint=e0271682a84416fe3525ef18953e024e0c91ae67e4ac7116008a30dc59ddf33f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-066]],
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
        source_text=[[자신의 트래시에 이벤트가 4장 이상인 경우, 이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-066]],
    schema_version=1,
  })
end
