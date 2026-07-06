-- AUTO-GENERATED: OP04-110 / 파운드
-- rules_id=OP04-110 script_id=880000602 fingerprint=176b5c1656b94ff263e3636d3bf660987b088a4333446f9f8ab14e32e4706888
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-110]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_LIFE]],
            player=[[OPPONENT]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 코스트 3 이하인 캐릭터를 1장까지 상대의 라이프 맨 위나 아래에 앞면으로 더한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP04-110]],
    schema_version=1,
  })
end
