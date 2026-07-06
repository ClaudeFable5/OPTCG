-- AUTO-GENERATED: OP06-076 / 살인귀 카마조
-- rules_id=OP06-076 script_id=880000810 fingerprint=206f070b8791bca65c9c5cd06881a019e5ae80072ddee2557687e329873feb66
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-076]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 상대의 코스트 2 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-076]],
    schema_version=1,
  })
end
