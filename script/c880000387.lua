-- AUTO-GENERATED: OP03-021 / 크로
-- rules_id=OP03-021 script_id=880000387 fingerprint=99e6a04088a205c1adbef519a9511626b202b1a1f1a8321b54ef6a344df6c146
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-021]],
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
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[REST_DON]],
          },
          {
            count=2,
            filter={
              trait=[[이스트 블루]],
            },
            kinds={
              [[CHARACTER]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】3(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 자신의 《이스트 블루》 특징을 가진 캐릭터 2장을 레스트할 수 있다: 이 리더를 액티브로 하고, 상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-021]],
    schema_version=1,
  })
end
