-- AUTO-GENERATED: OP09-034 / 페로나
-- rules_id=OP09-034 script_id=880001129 fingerprint=68c32a4d9a2f8fdbc02c3c7de53956d98806fd23192aa93cb046db12541a8f7d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  trait=[[스릴러 바크 해적단]],
                },
                {
                  name=[[쥬라큘 미호크]],
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
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 《스릴러 바크 해적단》 특징을 가진 카드 또는 「쥬라큘 미호크」를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌리고 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-034]],
    schema_version=1,
  })
end
