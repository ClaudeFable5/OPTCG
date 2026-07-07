-- AUTO-GENERATED: P-056 / 롤로노아 조로
-- rules_id=P-056 script_id=880002050 fingerprint=aa51b148a1fccdabc7ae1b6471f8d8cafb503aa10ab61d879acea7f118c7744f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=5,
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
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】➁(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 코스트 5 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-056]],
    schema_version=1,
  })
end
