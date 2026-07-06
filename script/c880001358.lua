-- AUTO-GENERATED: OP11-024 / 알라딘
-- rules_id=OP11-024 script_id=880001358 fingerprint=515404938885c97179efa02d25222c0882ad40eb4f28cb372baf65779b4bb2cf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              trait_any={
                [[어인족]],
                [[인어족]],
              },
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 상대의 효과로 KO 당했을 때, 자신의 패 1장을 버리고, 자신의 두웅!! 1장을 레스트할 수 있다. 이 경우, 자신의 패에서 코스트 6 이하인 《어인족》 또는 《인어족》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-024]],
    schema_version=1,
  })
end
