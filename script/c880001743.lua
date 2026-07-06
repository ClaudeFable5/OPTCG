-- AUTO-GENERATED: ST02-014 / X 드레이크
-- rules_id=ST02-014 script_id=880001743 fingerprint=a60d6718065a47b17921d638338670c3953e364c24a5327535e6aeaaf3555d0d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST02-014]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                trait_any={
                  [[초신성]],
                  [[해군]],
                },
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[SELF_STATE_IS]],
            state=[[RESTED]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!x1】【자신의 턴 동안】이 캐릭터가 레스트 상태일 경우, 자신의 《초신성》 또는 《해군》 특징을 가진 리더와 캐릭터 파워 +1000.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST02-014]],
    schema_version=1,
  })
end
