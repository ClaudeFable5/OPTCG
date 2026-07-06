-- AUTO-GENERATED: ST22-015 / 난 '흰 수염'이다아아!!!!
-- rules_id=ST22-015 script_id=880001972 fingerprint=279fa4ada9f28631e9f4619c651676660e179749ec5a9ab01ad4319fc7ce39de
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST22-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              name=[[에드워드 뉴게이트]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {},
              {
                {
                  count=1,
                  op=[[TAKE_LIFE_TO_HAND]],
                  player=[[YOU]],
                  position=[[TOP_OR_BOTTOM]],
                },
                {
                  amount=2000,
                  duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
                  op=[[MODIFY_POWER]],
                  selector={
                    count=1,
                    kind=[[LEADER]],
                    mode=[[UP_TO]],
                    owner=[[YOU]],
                  },
                  ["then"]=true,
                },
              },
            },
            player=[[YOU]],
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
        source_text=[[【메인】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 자신의 패에서 「에드워드 뉴게이트」를 1장까지 등장시킨다. 그 후, 자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다. 이 경우, 다음 상대의 턴 종료 시까지, 자신의 리더 1장까지의 파워 +2000.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST22-015]],
    schema_version=1,
  })
end
