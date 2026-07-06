-- AUTO-GENERATED: OP07-040 / 크로커다일
-- rules_id=OP07-040 script_id=880000895 fingerprint=82939a6cd559a1b29981dfead76036af510ddcc50b11dde574edbff64405bbc0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-040]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 코스트 2 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-040]],
    schema_version=1,
  })
end
