-- AUTO-GENERATED: OP15-032 / 브룩
-- rules_id=OP15-032 script_id=880002334 fingerprint=a158064dfa0ee091684e520c91ac640afa3e0f3abf308d42b0c09ea89f75225c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-032]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=1,
            mode=[[UP_TO]],
            op=[[REST_CARD_OR_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 카드 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                base_cost_lte=8,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 원래 코스트 8 이하인 캐릭터 1장까지를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-032]],
    schema_version=1,
  })
end
