-- AUTO-GENERATED: OP01-075 / 파시피스타
-- rules_id=OP01-075 script_id=880000198 fingerprint=8957d947dce864b7d5375787f35586258685fb991786e206f1d451d5a53b85d3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-075]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            op=[[ALLOW_UNLIMITED_DECK_COPIES]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰 상, 이 카드는 덱에 몇 장이든 넣을 수 있다.]],
        timings={
          [[RULE]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-075]],
    schema_version=1,
  })
end
