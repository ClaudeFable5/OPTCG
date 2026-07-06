-- AUTO-GENERATED: OP12-041 / 상디
-- rules_id=OP12-041 script_id=880001494 fingerprint=38c82a5ef1aa6a814651bf8dfa3d3c30ac6636b2f9f0b63eac9222bbd735af1a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-041]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              base_cost_lte=3,
              card_type=[[EVENT]],
              trait=[[밀짚모자 일당]],
            },
            mode=[[UP_TO]],
            op=[[ACTIVATE_CARD_EFFECT]],
            player=[[YOU]],
            source_zone=[[HAND]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-1: 자신의 패에서 원래 코스트가 3 이하인 《밀짚모자 일당》 특징을 가진 이벤트를 1장까지 발동한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
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
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-041]],
    schema_version=1,
  })
end
