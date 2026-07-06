-- AUTO-GENERATED: OP09-030 / 트라팔가 로
-- rules_id=OP09-030 script_id=880001125 fingerprint=432f5d53e3edf5ff3a10884369fbde724c21ea44c5e2c2ec757627e8e1799da8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              name_neq=[[트라팔가 로]],
              trait=[[ODYSSEY]],
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
            op=[[RETURN_OWN_CARD_TO_HAND]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 자신의 패에서 「트라팔가 로」 이외의 코스트 3 이하인 《ODYSSEY》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-030]],
    schema_version=1,
  })
end
