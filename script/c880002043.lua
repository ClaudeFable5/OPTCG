-- AUTO-GENERATED: P-049 / 우솝
-- rules_id=P-049 script_id=880002043 fingerprint=401c5f67a45afa8c3f11007f68b57735025daa1a360f9ac00011ec3f74573b60
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=5,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[P-049]],
    schema_version=1,
  })
end
