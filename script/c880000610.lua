-- AUTO-GENERATED: OP04-118 / 네펠타리 비비
-- rules_id=OP04-118 script_id=880000610 fingerprint=4a32890a701560aea0c36c81f2dca6948e3708f0425d1dfb91cb7b4c1e8b14c5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=0,
              filter={
                color=[[RED]],
                cost_gte=3,
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터 이외의 자신의 코스트 3 이상의 모든 적색 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-118]],
    schema_version=1,
  })
end
