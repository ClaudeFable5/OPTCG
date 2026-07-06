-- AUTO-GENERATED: OP13-016 / 몽키 D. 가프
-- rules_id=OP13-016 script_id=880001588 fingerprint=3dd4aa0c049051dc45b1dd63539a7c9a8b7c7532a3a50d006f4f69d92d5bec74
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                destination=[[HAND]],
                filter={
                  cost_gte=3,
                },
                look_count=4,
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
                names={
                  [[사보]],
                  [[포트거스 D. 에이스]],
                  [[몽키 D. 루피]],
                },
                op=[[LEADER_NAME_IS_ANY]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「사보」 또는 「포트거스 D. 에이스」 또는 「몽키 D. 루피」인 경우, 자신의 덱 위에서 4장을 보고, 코스트 3 이상인 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-016]],
    schema_version=1,
  })
end
