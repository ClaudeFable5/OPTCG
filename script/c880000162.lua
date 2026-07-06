-- AUTO-GENERATED: OP01-039 / 킬러
-- rules_id=OP01-039 script_id=880000162 fingerprint=31bb2d49701950078b72c137213ecce8631bab64520992e0d404123a8e6184f3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-039]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=3,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【블록 시】자신의 캐릭터가 3장 이상인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_BLOCK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP01-039]],
    schema_version=1,
  })
end
