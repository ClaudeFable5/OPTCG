-- AUTO-GENERATED: EB04-038 / 로시난테 & 로
-- rules_id=EB04-038 script_id=880002459 fingerprint=4b13345bc6c455e379fc2b91ba6695fc5885902d5aecde16fca61be29c92b9d9
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-038]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            name=[[트라팔가 로]],
            op=[[ADD_NAME_ALIAS]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            duration=[[RULE]],
            name=[[돈키호테 로시난테]],
            op=[[ADD_NAME_ALIAS]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 이 카드는 카드명을 「트라팔가 로」와 「돈키호테 로시난테」로도 취급한다.]],
        timings={
          [[RULE]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 필드의 두웅!!이 상대의 필드의 두웅!! 수 이하인 경우, 카드를 1장 뽑는다. 그 후, 두웅!! 덱에서 두웅!! 1장까지를 액티브로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB04-038]],
    schema_version=1,
  })
end
