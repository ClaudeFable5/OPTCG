-- AUTO-GENERATED: OP04-004 / 카루
-- rules_id=OP04-004 script_id=880000494 fingerprint=2c1d9f1b7e0c9d068589359df2b152dc1247559fb44ce89693b1e465229ae5bb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            per_target=true,
            player=[[YOU]],
            selector={
              count=0,
              filter={
                trait=[[알라바스타 왕국]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트할 수 있다: 자신의 《알라바스타 왕국》 특징을 가진 모든 캐릭터에게 레스트 상태인 두웅!!을 1장씩까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-004]],
    schema_version=1,
  })
end
