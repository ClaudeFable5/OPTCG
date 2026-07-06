-- AUTO-GENERATED: OP11-021 / 징베
-- rules_id=OP11-021 script_id=880001355 fingerprint=9b3fc4eb2168e63ad0bb78b7439e8721ab3f63679bd7b49b20b69fc54529ac8c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-021]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                trait_any={
                  [[어인족]],
                  [[인어족]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=6,
            op=[[HAND_LTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 패가 6장 이하인 경우, 자신의 《어인족》 또는 《인어족》 특징을 가진 캐릭터 1장까지와 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-021]],
    schema_version=1,
  })
end
