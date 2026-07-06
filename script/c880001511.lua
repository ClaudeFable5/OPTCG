-- AUTO-GENERATED: OP12-058 / …난 흰 수염을 왕으로 만든다.
-- rules_id=OP12-058 script_id=880001511 fingerprint=59d3cd2eae12f71a9aa989429e8d8c2b8fb92b84c2e9d6c705bfbaffdb8f8674
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-058]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            filter={
              card_type=[[CHARACTER]],
              cost_lte=9,
              trait_contains=[[흰 수염 해적단]],
            },
            look_count=1,
            op=[[PLAY_FROM_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_TOP]],
            rest_order=[[KEEP]],
            rested=false,
            select_count=1,
            select_mode=[[UP_TO]],
          },
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 자신의 덱 위에서 1장을 공개하고 그 카드가 코스트 9 이하인 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터 카드인 경우, 등장시킬 수 있다. 등장시킨 경우, 이번 턴 동안, 그 캐릭터는 【속공】을 얻는다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-058]],
    schema_version=1,
  })
end
