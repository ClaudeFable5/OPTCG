-- MANUAL: OP16-039 / 고무고무 트윈 제트 피스톨 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-039]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            actions={
              {
                op=[[REST]],
                selector={
                  count=2,
                  filter={
                    cost_lte=3,
                  },
                  kind=[[CHARACTER]],
                  mode=[[UP_TO]],
                  owner=[[OPPONENT]],
                },
              },
            },
            conditions={
              {
                op=[[LEADER_HAS_TRAIT]],
                player=[[YOU]],
                trait=[[임펠 다운]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】 자신의 「몽키 D. 루피」 1장까지는 이번 턴 동안 【더블 어택】을 얻는다. 그 후, 자신의 리더가 특징 《임펠 다운》을 가질 경우, 상대의 코스트 3 이하인 캐릭터 2장까지를 레스트로 한다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】 상대의 리더를 레스트로 한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-039]],
    schema_version=1,
  })
end
