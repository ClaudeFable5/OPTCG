-- AUTO-GENERATED: OP11-036 / 마다라
-- rules_id=OP11-036 script_id=880001370 fingerprint=0f941d8c0a11bb7dfe6b1bc6db4444b6cc3b5bffe84f5c9f24a3e25f8018eaad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  trait=[[해왕류]],
                },
                {
                  name=[[시라호시]],
                },
              },
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            name=[[시라호시]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「시라호시」인 경우, 자신의 덱 위에서 5장을 보고, 《해왕류》 특징을 가진 카드 또는 「시라호시」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-036]],
    schema_version=1,
  })
end
