-- AUTO-GENERATED: OP03-077 / 샬롯 링링
-- rules_id=OP03-077 script_id=880000443 fingerprint=af9e509019f85c6cfcf52edbf5ac16ec240807ced0dbc243dbfed657aecbad38
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-077]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=1,
            op=[[LIFE_LTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】【어택 시】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 자신의 패 1장을 버릴 수 있다: 자신의 라이프가 1장 이하인 경우, 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-077]],
    schema_version=1,
  })
end
