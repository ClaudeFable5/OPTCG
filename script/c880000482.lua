-- AUTO-GENERATED: OP03-115 / 슈트로이젠
-- rules_id=OP03-115 script_id=880000482 fingerprint=002c03f42ebc1fc7bcacee2a8c419bf755fbb02409765f68f4500616922814ca
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-115]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=1,
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
            count=1,
            filter={
              has_trigger=true,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 【트리거】를 가진 카드 1장을 버릴 수 있다: 상대의 코스트 1 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-115]],
    schema_version=1,
  })
end
