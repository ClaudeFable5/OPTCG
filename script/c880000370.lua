-- AUTO-GENERATED: OP03-004 / 쿠리엘
-- rules_id=OP03-004 script_id=880000370 fingerprint=c71dfaa2ce7fa77ce6133360565efc06b0bb454989f9ff0e26d76df9a1ad8d11
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[TURN_PLAYED]],
            op=[[CANNOT_ATTACK_LEADER]],
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
        source_text=[[등장한 턴 동안, 이 캐릭터는 리더를 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[RUSH]],
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
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-004]],
    schema_version=1,
  })
end
