-- AUTO-GENERATED: P-004 / 크로커다일
-- rules_id=P-004 script_id=880002008 fingerprint=6e635330e20368a253691bb6dfa2e674e23ca4fcbe6c3e2f629764b253c3821c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-004]],
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
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트하고 어택 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-004]],
    schema_version=1,
  })
end
