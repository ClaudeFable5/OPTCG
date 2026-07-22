-- AUTO-GENERATED: OP14-011 / 바르톨로메오
-- rules_id=OP14-011 script_id=880002176 fingerprint=0bb5b630de5f0cef8f3c56e662ce76ec68ae63de581ebda13a8db66e3790afa3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-011]],
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
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】 이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-011]],
    schema_version=1,
  })
end
