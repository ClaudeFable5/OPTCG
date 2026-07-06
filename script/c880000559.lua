-- AUTO-GENERATED: OP04-067 / 미스 메리크리스마스(드로피)
-- rules_id=OP04-067 script_id=880000559 fingerprint=d20e7235931e72487eeddaf6db4b9de21a8d813cef7d2cd6630ce05ad2427d70
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP04-067]],
    schema_version=1,
  })
end
