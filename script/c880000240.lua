-- AUTO-GENERATED: OP01-117 / 시프스 혼
-- rules_id=OP01-117 script_id=880000240 fingerprint=bae2ee2b85bdef677bf2ebf13da17fe89676839e4af7bb5bce5c69dc52f65220
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-117]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=6,
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
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 두웅!!-1(자신 필드의 두웅!!을 지정된 수 만큼 두웅!! 덱으로 되돌릴 수 있다): 상대의 코스트 6 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-117]],
    schema_version=1,
  })
end
