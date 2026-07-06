-- AUTO-GENERATED: OP07-030 / 파파구
-- rules_id=OP07-030 script_id=880000884 fingerprint=b984aed3ccd85585e4c5959094851c80d0c43dd4af1fc77eda358cefa5848a39
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-030]],
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
            filter={
              name=[[케이미]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터인 「케이미」가 있을 경우, 이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-030]],
    schema_version=1,
  })
end
