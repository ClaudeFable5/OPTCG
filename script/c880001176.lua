-- AUTO-GENERATED: OP09-080 / 사우전드 써니 호
-- rules_id=OP09-080 script_id=880001176 fingerprint=93cf7e6e997622506be43be370d22a27d60fd59eb98afc8c0dc2fbf77e4677ad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-080]],
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
            trait=[[밀짚모자 일당]],
          },
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】이 스테이지를 레스트할 수 있다: 자신의 《밀짚모자 일당》 특징을 가진 캐릭터가 상대의 효과로 필드를 벗어났을 때, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_OWN_TRAIT_CHARACTER_LEFT_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-080]],
    schema_version=1,
  })
end
