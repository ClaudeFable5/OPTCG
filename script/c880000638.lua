-- AUTO-GENERATED: OP05-026 / 사키스
-- rules_id=OP05-026 script_id=880000638 fingerprint=6a7e652e8944371aaebaa12962c71ffc8528839e7dde8601d43f33e48a75d7da
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-026]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              cost_gte=3,
            },
            kinds={
              [[CHARACTER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【어택 시】【턴 1회】자신의 코스트 3 이상인 캐릭터 1장을 레스트할 수 있다: 이 캐릭터를 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-026]],
    schema_version=1,
  })
end
