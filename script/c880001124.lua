-- AUTO-GENERATED: OP09-029 / 토니토니 쵸파
-- rules_id=OP09-029 script_id=880001124 fingerprint=a9ef89ee70c2a72c93d1824fad24beeb6808023535f63bdb122b5c1d8bebb5b8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=4,
                trait=[[ODYSSEY]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 코스트 4 이하인 《ODYSSEY》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-029]],
    schema_version=1,
  })
end
