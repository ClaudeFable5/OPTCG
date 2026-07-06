-- AUTO-GENERATED: ST05-005 / 카리나
-- rules_id=ST05-005 script_id=880001787 fingerprint=0a5fd98a097cbf6f5614756a7bb57d1f26570026ebe72370512d5fb4f6787334
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST05-005]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LT_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            filter={
              trait=[[FILM]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이 캐릭터를 레스트 하고, 자신의 패에서 《FILM》 특징을 가진 카드 1장을 트래시로 보낼 수 있다: 상대 필드의 두웅!! 수가 자신 필드의 두웅!! 수보다 많을 경우, 두웅!! 덱에서 두웅!!을 2장까지 레스트 상태로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST05-005]],
    schema_version=1,
  })
end
