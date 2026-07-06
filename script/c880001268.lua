-- AUTO-GENERATED: OP10-053 / 비안
-- rules_id=OP10-053 script_id=880001268 fingerprint=33bc633d3052aed0f0128f98639188c06bfb8cfb8358e49064293f50e5c03c1e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-053]],
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
              name_neq=[[비안]],
              trait=[[톤타타족]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[「비안」 이외의 자신의 《톤타타족》 특징을 가진 캐릭터가 있을 경우, 이 캐릭터는 【블로커】를 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-053]],
    schema_version=1,
  })
end
