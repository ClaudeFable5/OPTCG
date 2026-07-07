-- AUTO-GENERATED: P-003 / 유스타스 키드
-- rules_id=P-003 script_id=880002007 fingerprint=861b89b3189b44f791e0df19cf61df23a338bc41fc09346eaa3749fc42be8098
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[DOUBLE_ATTACK]],
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
        source_text=[[【두웅!!×2】이 캐릭터는 【더블 어택】을 얻는다.
(이 카드가 주는 대미지는 2가 된다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-003]],
    schema_version=1,
  })
end
