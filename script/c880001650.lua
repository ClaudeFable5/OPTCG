-- AUTO-GENERATED: OP13-078 / 오로 잭슨 호
-- rules_id=OP13-078 script_id=880001650 fingerprint=3634e62d735fd8f2a5016a4a53ac54715fbdfd93360b6b8909fd9c54ffb51038
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[EVENT_TARGET_TRAIT_CONTAINS]],
            trait=[[로저 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【턴 1회】자신의 『로저 해적단』을 포함한 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어났을 때, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_OWN_TRAIT_CHARACTER_LEFT_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-078]],
    schema_version=1,
  })
end
