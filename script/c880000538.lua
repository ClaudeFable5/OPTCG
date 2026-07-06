-- AUTO-GENERATED: OP04-046 / 퀸
-- rules_id=OP04-046 script_id=880000538 fingerprint=5478a5f021492cec3acfad92c8d8e92b02dd023234d6cb24ef55934596fc0825
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  name=[[익사이트 탄]],
                },
                {
                  name=[[빙귀]],
                },
              },
            },
            look_count=7,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=2,
            select_mode=[[UP_TO]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《백수 해적단》 특징을 가진 경우, 자신의 덱 위에서 7장을 보고, 「익사이트 탄」 또는 「빙귀」를 합계 2장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-046]],
    schema_version=1,
  })
end
