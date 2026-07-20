-- AUTO-GENERATED: EB03-057 / 야마토
-- rules_id=EB03-057 script_id=880002160 fingerprint=609984ea88b248e3e77bb9a3cb85d85c8802478dbedfd45f23730a9967ab0c96
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-057]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                trait=[[와노쿠니]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 《와노쿠니》 특징을 가진 리더에게 레스트 상태인 두웅!!을 3장까지 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
            position=[[TOP]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】상대의 라이프 위에서 1장까지를 트래시로 보낸다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-057]],
    schema_version=1,
  })
end
