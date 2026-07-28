-- AUTO-GENERATED: EB04-024 / 테라코타
-- rules_id=EB04-024 script_id=880002445 fingerprint=0ae7d603186242338bb8bdc80f56873124a5d8994ab23110097a4c7e27d57851
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-024]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[UNBLOCKABLE]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                trait=[[알라바스타 왕국]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 레스트로 하고, 자신의 패 1장을 버릴 수 있다: 자신의 《알라바스타 왕국》 특징을 가진 캐릭터 1장까지는 이번 턴 동안 【언블로커블】을 얻는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-024]],
    schema_version=1,
  })
end
